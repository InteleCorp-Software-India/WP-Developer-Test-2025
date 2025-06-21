<?php
/**
 * Plugin Name: Filter Hook Challenge
 * Description: Append a custom message to post content using `the_content` filter.
 */

add_filter('the_content', 'append_custom_message_to_content');

function append_custom_message_to_content($content) {
    if (is_single()) {
        $content .= '<p><em>Thank you for reading!</em></p>';
    }
    return $content;
}
