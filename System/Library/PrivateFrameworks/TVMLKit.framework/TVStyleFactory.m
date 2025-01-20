@interface TVStyleFactory
+ (void)_registerDefaultStyles;
+ (void)initialize;
+ (void)registerStyle:(id)a3 withType:(int64_t)a4 inherited:(BOOL)a5;
@end

@implementation TVStyleFactory

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    +[TVStyleFactory _registerDefaultStyles];
  }
}

+ (void)registerStyle:(id)a3 withType:(int64_t)a4 inherited:(BOOL)a5
{
  BOOL v5 = a5;
  if ((unint64_t)(a4 - 1) >= 8) {
    int64_t v6 = 3;
  }
  else {
    int64_t v6 = a4 - 1;
  }
  [MEMORY[0x263F4B4E8] registerStyle:a3 aliasName:0 withType:v6 inherited:v5];
}

+ (void)_registerDefaultStyles
{
  v14[4] = *MEMORY[0x263EF8340];
  [MEMORY[0x263F4B4E8] unregisterStyles];
  [MEMORY[0x263F4B4E8] registerStyle:@"background-color" aliasName:0 withType:4 inherited:0];
  [MEMORY[0x263F4B4E8] registerStyle:@"border-color" aliasName:0 withType:4 inherited:0];
  [MEMORY[0x263F4B4E8] registerStyle:@"border-radius" withType:8 inherited:0];
  [MEMORY[0x263F4B4E8] registerStyle:@"color" aliasName:0 withType:4 inherited:1];
  [MEMORY[0x263F4B4E8] registerStyle:@"column-count" aliasName:0 withType:0 inherited:0];
  [MEMORY[0x263F4B4E8] registerStyle:@"row-count" aliasName:0 withType:0 inherited:0];
  [MEMORY[0x263F4B4E8] registerStyle:@"font-family" aliasName:0 withType:3 inherited:1];
  [MEMORY[0x263F4B4E8] registerStyle:@"font-size" aliasName:0 withType:2 inherited:1];
  [MEMORY[0x263F4B4E8] registerStyle:@"font-weight" aliasName:0 withType:3 inherited:1];
  [MEMORY[0x263F4B4E8] registerStyle:@"font-stretch" aliasName:0 withType:3 inherited:1];
  [MEMORY[0x263F4B4E8] registerStyle:@"height" aliasName:*MEMORY[0x263F4B378] withType:2 inherited:0];
  [MEMORY[0x263F4B4E8] registerStyle:@"max-height" aliasName:0 withType:2 inherited:0];
  [MEMORY[0x263F4B4E8] registerStyle:@"max-width" aliasName:0 withType:2 inherited:0];
  [MEMORY[0x263F4B4E8] registerStyle:@"min-height" aliasName:0 withType:2 inherited:0];
  [MEMORY[0x263F4B4E8] registerStyle:@"min-width" aliasName:0 withType:2 inherited:0];
  [MEMORY[0x263F4B4E8] registerStyle:@"text-align" aliasName:0 withType:3 inherited:1];
  [MEMORY[0x263F4B4E8] registerStyle:@"text-shadow" aliasName:0 withType:9 inherited:1];
  [MEMORY[0x263F4B4E8] registerStyle:@"transform" aliasName:0 withType:6 inherited:0];
  [MEMORY[0x263F4B4E8] registerStyle:@"width" aliasName:*MEMORY[0x263F4B380] withType:2 inherited:0];
  [MEMORY[0x263F4B4E8] registerStyle:@"text-transform" aliasName:0 withType:3 inherited:0];
  [MEMORY[0x263F4B4E8] registerStyle:@"tv-overflow" withType:3 inherited:0];
  [MEMORY[0x263F4B4E8] registerStyle:@"line-height" withType:2 inherited:1];
  v2 = (void *)MEMORY[0x263F4B4E8];
  v14[0] = @"border-top-width";
  v14[1] = @"border-left-width";
  v14[2] = @"border-bottom-width";
  v14[3] = @"border-right-width";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:4];
  [v2 registerEdgeInsetStyle:@"border-width" aliasName:0 withPositionStyleNames:v3 inherited:0];

  v4 = (void *)MEMORY[0x263F4B4E8];
  v13[0] = @"margin-top";
  v13[1] = @"margin-left";
  v13[2] = @"margin-bottom";
  v13[3] = @"margin-right";
  BOOL v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:4];
  [v4 registerEdgeInsetStyle:@"margin" aliasName:0 withPositionStyleNames:v5 inherited:0];

  int64_t v6 = (void *)MEMORY[0x263F4B4E8];
  v12[0] = @"padding-top";
  v12[1] = @"padding-left";
  v12[2] = @"padding-bottom";
  v12[3] = @"padding-right";
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:4];
  [v6 registerEdgeInsetStyle:@"padding" aliasName:@"itml-padding" withPositionStyleNames:v7 inherited:0];

  v8 = (void *)MEMORY[0x263F4B4E8];
  v11[0] = @"tv-scrollable-bounds-inset-top";
  v11[1] = @"tv-scrollable-bounds-inset-left";
  v11[2] = @"tv-scrollable-bounds-inset-bottom";
  v11[3] = @"tv-scrollable-bounds-inset-right";
  v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:4];
  [v8 registerEdgeInsetStyle:@"tv-scrollable-bounds-inset" aliasName:0 withPositionStyleNames:v9 inherited:0];

  [MEMORY[0x263F4B4E8] registerStyle:@"padding-top" aliasName:@"itml-top-padding" withType:1 inherited:0];
  [MEMORY[0x263F4B4E8] registerStyle:@"padding-left" aliasName:@"itml-left-padding" withType:1 inherited:0];
  [MEMORY[0x263F4B4E8] registerStyle:@"padding-bottom" aliasName:@"itml-bottom-padding" withType:1 inherited:0];
  [MEMORY[0x263F4B4E8] registerStyle:@"padding-right" aliasName:@"itml-right-padding" withType:1 inherited:0];
  [MEMORY[0x263F4B4E8] registerStyle:@"tv-background-highlight-style" withType:3 inherited:0];
  [MEMORY[0x263F4B4E8] registerStyle:@"tv-background-highlight-color" withType:4 inherited:0];
  [MEMORY[0x263F4B4E8] registerStyle:@"tv-focus-margin" aliasName:0 withType:7 inherited:0];
  [MEMORY[0x263F4B4E8] registerStyle:@"tv-img-upscale-factor" aliasName:0 withType:1 inherited:0];
  [MEMORY[0x263F4B4E8] registerStyle:@"tv-accepts-focus" aliasName:0 withType:3 inherited:0];
  [MEMORY[0x263F4B4E8] registerStyle:@"tv-align" aliasName:*MEMORY[0x263F4B360] withType:3 inherited:1];
  [MEMORY[0x263F4B4E8] registerStyle:@"tv-border-continuous" aliasName:0 withType:3 inherited:0];
  [MEMORY[0x263F4B4E8] registerStyle:@"tv-content-align" aliasName:@"itml-content-align" withType:3 inherited:1];
  [MEMORY[0x263F4B4E8] registerStyle:@"tv-focus-align" aliasName:0 withType:3 inherited:0];
  [MEMORY[0x263F4B4E8] registerStyle:@"tv-focus-size-increase" aliasName:0 withType:0 inherited:0];
  [MEMORY[0x263F4B4E8] registerStyle:@"tv-focus-transform" aliasName:0 withType:6 inherited:0];
  [MEMORY[0x263F4B4E8] registerStyle:@"tv-highlight-color" aliasName:@"itml-highlight-color" withType:4 inherited:0];
  [MEMORY[0x263F4B4E8] registerStyle:@"tv-img-treatment" aliasName:*MEMORY[0x263F4B370] withType:3 inherited:0];
  [MEMORY[0x263F4B4E8] registerStyle:@"tv-index-display" aliasName:0 withType:3 inherited:0];
  [MEMORY[0x263F4B4E8] registerStyle:@"tv-interitem-spacing" aliasName:@"itml-interitem-spacing" withType:2 inherited:0];
  [MEMORY[0x263F4B4E8] registerStyle:@"tv-line-spacing" aliasName:@"itml-line-spacing" withType:2 inherited:0];
  [MEMORY[0x263F4B4E8] registerStyle:@"tv-minimum-scale-factor" aliasName:@"itml-minimum-scale-factor" withType:1 inherited:0];
  [MEMORY[0x263F4B4E8] registerStyle:@"tv-placeholder" aliasName:@"itml-placeholder" withType:3 inherited:0];
  [MEMORY[0x263F4B4E8] registerStyle:@"tv-position" aliasName:*MEMORY[0x263F4B368] withType:3 inherited:0];
  [MEMORY[0x263F4B4E8] registerStyle:@"tv-progress-style" aliasName:0 withType:3 inherited:0];
  [MEMORY[0x263F4B4E8] registerStyle:@"tv-rating-style" aliasName:@"itml-rating-style" withType:3 inherited:0];
  [MEMORY[0x263F4B4E8] registerStyle:@"tv-search-style" aliasName:0 withType:3 inherited:0];
  [MEMORY[0x263F4B4E8] registerStyle:@"tv-shadow" aliasName:0 withType:9 inherited:0];
  [MEMORY[0x263F4B4E8] registerStyle:@"tv-text-highlight-style" aliasName:@"itml-text-hightlight-style" withType:3 inherited:0];
  [MEMORY[0x263F4B4E8] registerStyle:@"tv-highlight-style" aliasName:0 withType:3 inherited:0];
  [MEMORY[0x263F4B4E8] registerStyle:@"tv-scroll-mode" aliasName:0 withType:3 inherited:0];
  [MEMORY[0x263F4B4E8] registerStyle:@"tv-text-hyphenation-factor" aliasName:0 withType:1 inherited:1];
  [MEMORY[0x263F4B4E8] registerStyle:@"tv-text-max-lines" aliasName:*MEMORY[0x263F4B3A0] withType:0 inherited:0];
  uint64_t v10 = *MEMORY[0x263F4B3A8];
  [MEMORY[0x263F4B4E8] registerStyle:@"tv-text-style" aliasName:*MEMORY[0x263F4B3A8] withType:3 inherited:1];
  [MEMORY[0x263F4B4E8] registerStyle:@"tv-tint-color" aliasName:@"itml-tint-color" withType:4 inherited:1];
  [MEMORY[0x263F4B4E8] registerStyle:@"tv-dark-tint-color" aliasName:0 withType:4 inherited:1];
  [MEMORY[0x263F4B4E8] registerStyle:@"tv-tint-color2" aliasName:@"itml-tint-color2" withType:4 inherited:1];
  [MEMORY[0x263F4B4E8] registerStyle:@"tv-transition" aliasName:*MEMORY[0x263F4B3B0] withType:3 inherited:0];
  [MEMORY[0x263F4B4E8] registerStyle:@"tv-transition-interval" aliasName:*MEMORY[0x263F4B3B8] withType:1 inherited:0];
  [MEMORY[0x263F4B4E8] registerStyle:@"tv-visual-effect" aliasName:@"itml-visual-effect" withType:3 inherited:0];
  [MEMORY[0x263F4B4E8] registerStyle:@"tv-column-color" aliasName:0 withType:4 inherited:1];
  [MEMORY[0x263F4B4E8] registerStyle:@"tv-column-padding" aliasName:0 withType:1 inherited:0];
  [MEMORY[0x263F4B4E8] registerStyle:@"tv-layer-flip-mode" aliasName:0 withType:3 inherited:0];
  [MEMORY[0x263F4B4E8] registerStyle:@"tv-symbol-point-size" aliasName:0 withType:2 inherited:0];
  [MEMORY[0x263F4B4E8] registerStyle:@"tv-symbol-weight" aliasName:0 withType:3 inherited:0];
  [MEMORY[0x263F4B4E8] registerStyle:@"tv-symbol-scale" aliasName:0 withType:3 inherited:0];
  [MEMORY[0x263F4B4E8] registerStyle:@"tv-symbol-text-style" aliasName:v10 withType:3 inherited:0];
  [MEMORY[0x263F4B4E8] registerHiddenStyle:@"tv-hidden"];
  [MEMORY[0x263F4B4E8] registerStyle:@"tv-group" aliasName:0 withType:3 inherited:0];
  [MEMORY[0x263F4B4E8] registerStyle:@"tv-max-lines" aliasName:0 withType:0 inherited:0];
}

@end