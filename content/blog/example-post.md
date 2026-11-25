+++
title = "Example blog post"
date = 2026-11-25
authors = ["Erik Jonkers"]
description = "A short description used for the page meta description."
draft = true # drafts are only rendered with `zola serve --drafts`

[taxonomies]
tags = ["announcement"]

[extra]
# image = "/images/blog/example.png"  # Optional share image (og:image).
# externalLink = "https://blog.rust-lang.org/..."  # Optional: list a post hosted elsewhere.
# source = "Rust Blog"  # Name of the external site, shown with externalLink.
+++

This first paragraph is the summary shown on the blog overview page.

<!-- more -->

Everything after the `<!-- more -->` marker is only shown on the post itself.

```rust
fn main() {
    println!("Hello, RustNL!");
}
```
