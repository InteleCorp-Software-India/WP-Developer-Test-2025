<?php
/**
 * Plugin Name: WP Filter Hook Challenge
 * Description: Modify the_content using a filter to append a custom message.
 * Version: 1.0
 * Author: InteleCorp Software
 */

add_filter('the_content', 'wptask_append_custom_message');

function wptask_append_custom_message($content) {
    if (is_single() && is_main_query()) {
        $content .= '<p><em>This is your custom message.</em></p>';
    }
    return $content;
}
