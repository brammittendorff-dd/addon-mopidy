#!/usr/bin/with-contenv bashio
# ==============================================================================
# Community Hass.io Add-ons: Mopidy
# Install user configured/requested packages
# ==============================================================================
if bashio::config.has_value 'system_packages'; then
    apt update \
        || bashio::exit.nok 'Failed updating Alpine packages repository indexes'

    for package in $(bashio::config 'system_packages'); do
        apt install -y "$package" \
            || bashio::exit.nok "Failed installing package ${package}"
    done
fi
