@interface SUSegmentedControlAppearance
+ (id)defaultBarAppearance;
+ (id)defaultOptionsAppearanceForTintStyle:(int64_t)a3;
- (UIImage)optionsBackgroundImage;
- (id)_newDividerImageKeyWithLeftState:(unint64_t)a3 rightState:(unint64_t)a4 barMetrics:(int64_t)a5;
- (id)backgroundImageForState:(unint64_t)a3 barMetrics:(int64_t)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dividerImageForLeftSegmentState:(unint64_t)a3 rightSegmentState:(unint64_t)a4 barMetrics:(int64_t)a5;
- (id)titleTextAttributesForState:(unint64_t)a3;
- (void)dealloc;
- (void)setBackgroundImage:(id)a3 forState:(unint64_t)a4 barMetrics:(int64_t)a5;
- (void)setDividerImage:(id)a3 forLeftSegmentState:(unint64_t)a4 rightSegmentState:(unint64_t)a5 barMetrics:(int64_t)a6;
- (void)setOptionsBackgroundImage:(id)a3;
- (void)setTitleTextAttributes:(id)a3 forState:(unint64_t)a4;
- (void)styleSegmentedControl:(id)a3;
@end

@implementation SUSegmentedControlAppearance

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SUSegmentedControlAppearance;
  [(SUSegmentedControlAppearance *)&v3 dealloc];
}

+ (id)defaultBarAppearance
{
  id v2 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  objc_msgSend(v2, "setBackgroundImage:forState:barMetrics:", objc_msgSend(MEMORY[0x263F1C6B0], "imageNamed:inBundle:", @"UISegmentBarButton", v3), 0, 0);
  objc_msgSend(v2, "setBackgroundImage:forState:barMetrics:", objc_msgSend(MEMORY[0x263F1C6B0], "imageNamed:inBundle:", @"UISegmentBarButtonHighlighted", v3), 4, 0);
  objc_msgSend(v2, "setDividerImage:forLeftSegmentState:rightSegmentState:barMetrics:", objc_msgSend(MEMORY[0x263F1C6B0], "imageNamed:inBundle:", @"UISegmentBarDivider", v3), 0, 0, 0);
  objc_msgSend(v2, "setDividerImage:forLeftSegmentState:rightSegmentState:barMetrics:", objc_msgSend(MEMORY[0x263F1C6B0], "imageNamed:inBundle:", @"UISegmentBarDividerHighlighted", v3), 0, 4, 0);
  objc_msgSend(v2, "setBackgroundImage:forState:barMetrics:", objc_msgSend(MEMORY[0x263F1C6B0], "imageNamed:inBundle:", @"UISegmentBarMiniButton", v3), 0, 1);
  objc_msgSend(v2, "setBackgroundImage:forState:barMetrics:", objc_msgSend(MEMORY[0x263F1C6B0], "imageNamed:inBundle:", @"UISegmentBarMiniButtonHighlighted", v3), 4, 1);
  objc_msgSend(v2, "setDividerImage:forLeftSegmentState:rightSegmentState:barMetrics:", objc_msgSend(MEMORY[0x263F1C6B0], "imageNamed:inBundle:", @"UISegmentBarMiniDivider", v3), 0, 0, 1);
  objc_msgSend(v2, "setDividerImage:forLeftSegmentState:rightSegmentState:barMetrics:", objc_msgSend(MEMORY[0x263F1C6B0], "imageNamed:inBundle:", @"UISegmentBarMiniDividerHighlighted", v3), 0, 4, 1);
  id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v5 = [MEMORY[0x263F1C550] colorWithWhite:0.784313725 alpha:1.0];
  uint64_t v6 = *MEMORY[0x263F1C240];
  [v4 setObject:v5 forKey:*MEMORY[0x263F1C240]];
  id v7 = +[SUUIAppearance _defaultShadowWithColor:offset:](SUUIAppearance, "_defaultShadowWithColor:offset:", [MEMORY[0x263F1C550] blackColor], 0.0, -1.0);
  uint64_t v8 = *MEMORY[0x263F1C280];
  [v4 setObject:v7 forKey:*MEMORY[0x263F1C280]];
  [v2 setTitleTextAttributes:v4 forState:0];

  id v9 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  objc_msgSend(v9, "setObject:forKey:", objc_msgSend(MEMORY[0x263F1C550], "colorWithWhite:alpha:", 0.87, 1.0), v6);
  objc_msgSend(v9, "setObject:forKey:", +[SUUIAppearance _defaultShadowWithColor:offset:](SUUIAppearance, "_defaultShadowWithColor:offset:", objc_msgSend(MEMORY[0x263F1C550], "colorWithWhite:alpha:", 0.11, 1.0), 0.0, -1.0), v8);
  [v2 setTitleTextAttributes:v9 forState:4];

  return v2;
}

+ (id)defaultOptionsAppearanceForTintStyle:(int64_t)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  if (a3 == 1)
  {
    objc_msgSend(v4, "setBackgroundImage:forState:barMetrics:", objc_msgSend(MEMORY[0x263F1C6B0], "imageNamed:inBundle:", @"UISegmentOptionsDarkButton", v5), 0, 0);
    objc_msgSend(v4, "setBackgroundImage:forState:barMetrics:", objc_msgSend(MEMORY[0x263F1C6B0], "imageNamed:inBundle:", @"UISegmentOptionsDarkButtonSelected", v5), 4, 0);
    objc_msgSend(v4, "setDividerImage:forLeftSegmentState:rightSegmentState:barMetrics:", objc_msgSend(MEMORY[0x263F1C6B0], "imageNamed:inBundle:", @"UISegmentOptionsDarkDivider", v5), 0, 0, 0);
    objc_msgSend(v4, "setDividerImage:forLeftSegmentState:rightSegmentState:barMetrics:", objc_msgSend(MEMORY[0x263F1C6B0], "imageNamed:inBundle:", @"UISegmentOptionsDarkDividerSelected", v5), 0, 4, 0);
    objc_msgSend(v4, "setDividerImage:forLeftSegmentState:rightSegmentState:barMetrics:", objc_msgSend(MEMORY[0x263F1C6B0], "imageNamed:inBundle:", @"UISegmentOptionsDarkDividerSelected", v5), 4, 0, 0);
    objc_msgSend(v4, "setOptionsBackgroundImage:", objc_msgSend(MEMORY[0x263F1C6B0], "imageNamed:inBundle:", @"UISegmentOptionsDarkBackground", v5));
    id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    uint64_t v7 = [MEMORY[0x263F1C550] colorWithWhite:0.823529412 alpha:1.0];
    uint64_t v8 = *MEMORY[0x263F1C240];
    [v6 setObject:v7 forKey:*MEMORY[0x263F1C240]];
    id v9 = +[SUUIAppearance _defaultShadowWithColor:offset:](SUUIAppearance, "_defaultShadowWithColor:offset:", [MEMORY[0x263F1C550] colorWithWhite:0.0 alpha:0.35], 0.0, -1.0);
    uint64_t v10 = *MEMORY[0x263F1C280];
    [v6 setObject:v9 forKey:*MEMORY[0x263F1C280]];
    [v4 setTitleTextAttributes:v6 forState:0];

    id v11 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    objc_msgSend(v11, "setObject:forKey:", objc_msgSend(MEMORY[0x263F1C550], "colorWithWhite:alpha:", 1.0, 1.0), v8);
    v12 = (void *)MEMORY[0x263F1C550];
    double v13 = 0.8;
    double v14 = 0.0;
  }
  else
  {
    objc_msgSend(v4, "setBackgroundImage:forState:barMetrics:", objc_msgSend(MEMORY[0x263F1C6B0], "imageNamed:inBundle:", @"UISegmentOptionsButton", v5), 0, 0);
    objc_msgSend(v4, "setBackgroundImage:forState:barMetrics:", objc_msgSend(MEMORY[0x263F1C6B0], "imageNamed:inBundle:", @"UISegmentOptionsButtonSelected", v5), 4, 0);
    objc_msgSend(v4, "setDividerImage:forLeftSegmentState:rightSegmentState:barMetrics:", objc_msgSend(MEMORY[0x263F1C6B0], "imageNamed:inBundle:", @"UISegmentOptionsDivider", v5), 0, 0, 0);
    objc_msgSend(v4, "setDividerImage:forLeftSegmentState:rightSegmentState:barMetrics:", objc_msgSend(MEMORY[0x263F1C6B0], "imageNamed:inBundle:", @"UISegmentOptionsDividerSelected", v5), 0, 4, 0);
    objc_msgSend(v4, "setDividerImage:forLeftSegmentState:rightSegmentState:barMetrics:", objc_msgSend(MEMORY[0x263F1C6B0], "imageNamed:inBundle:", @"UISegmentOptionsDividerSelected", v5), 4, 0, 0);
    objc_msgSend(v4, "setOptionsBackgroundImage:", objc_msgSend(MEMORY[0x263F1C6B0], "imageNamed:inBundle:", @"UISegmentOptionsBackground", v5));
    id v15 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    uint64_t v16 = [MEMORY[0x263F1C550] colorWithWhite:0.39 alpha:1.0];
    uint64_t v17 = *MEMORY[0x263F1C240];
    [v15 setObject:v16 forKey:*MEMORY[0x263F1C240]];
    id v18 = +[SUUIAppearance _defaultShadowWithColor:offset:](SUUIAppearance, "_defaultShadowWithColor:offset:", [MEMORY[0x263F1C550] colorWithWhite:0.93 alpha:1.0], 0.0, 1.0);
    uint64_t v10 = *MEMORY[0x263F1C280];
    [v15 setObject:v18 forKey:*MEMORY[0x263F1C280]];
    [v4 setTitleTextAttributes:v15 forState:0];

    id v11 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    objc_msgSend(v11, "setObject:forKey:", objc_msgSend(MEMORY[0x263F1C550], "colorWithWhite:alpha:", 1.0, 1.0), v17);
    v12 = (void *)MEMORY[0x263F1C550];
    double v14 = 0.42;
    double v13 = 1.0;
  }
  objc_msgSend(v11, "setObject:forKey:", +[SUUIAppearance _defaultShadowWithColor:offset:](SUUIAppearance, "_defaultShadowWithColor:offset:", objc_msgSend(v12, "colorWithWhite:alpha:", v14, v13), 0.0, -1.0), v10);
  [v4 setTitleTextAttributes:v11 forState:4];

  return v4;
}

- (id)backgroundImageForState:(unint64_t)a3 barMetrics:(int64_t)a4
{
  return [(SUControlAppearance *)self->_backgroundImages imageForState:a3 barMetrics:a4];
}

- (id)dividerImageForLeftSegmentState:(unint64_t)a3 rightSegmentState:(unint64_t)a4 barMetrics:(int64_t)a5
{
  id v6 = [(SUSegmentedControlAppearance *)self _newDividerImageKeyWithLeftState:a3 rightState:a4 barMetrics:a5];
  id v7 = (id)[(NSMutableDictionary *)self->_dividerImages objectForKey:v6];

  return v7;
}

- (void)setBackgroundImage:(id)a3 forState:(unint64_t)a4 barMetrics:(int64_t)a5
{
  backgroundImages = self->_backgroundImages;
  if (!backgroundImages)
  {
    backgroundImages = objc_alloc_init(SUControlAppearance);
    self->_backgroundImages = backgroundImages;
  }

  [(SUControlAppearance *)backgroundImages setImage:a3 forState:a4 barMetrics:a5];
}

- (void)setDividerImage:(id)a3 forLeftSegmentState:(unint64_t)a4 rightSegmentState:(unint64_t)a5 barMetrics:(int64_t)a6
{
  id v8 = [(SUSegmentedControlAppearance *)self _newDividerImageKeyWithLeftState:a4 rightState:a5 barMetrics:a6];
  dividerImages = self->_dividerImages;
  id v10 = v8;
  if (a3)
  {
    if (!dividerImages)
    {
      dividerImages = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      self->_dividerImages = dividerImages;
    }
    [(NSMutableDictionary *)dividerImages setObject:a3 forKey:v10];
  }
  else
  {
    -[NSMutableDictionary removeObjectForKey:](dividerImages, "removeObjectForKey:");
  }
}

- (void)styleSegmentedControl:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  backgroundImages = self->_backgroundImages;
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __54__SUSegmentedControlAppearance_styleSegmentedControl___block_invoke;
  v35[3] = &unk_264814F98;
  v35[4] = a3;
  [(SUControlAppearance *)backgroundImages enumerateImagesUsingBlock:v35];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  obuint64_t j = self->_dividerImages;
  uint64_t v6 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v31 objects:v37 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v32 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        id v11 = (void *)[v10 componentsSeparatedByString:@":"];
        if ([v11 count] == 3)
        {
          uint64_t v12 = objc_msgSend((id)objc_msgSend(v11, "objectAtIndex:", 0), "integerValue");
          uint64_t v13 = objc_msgSend((id)objc_msgSend(v11, "objectAtIndex:", 1), "integerValue");
          uint64_t v14 = objc_msgSend((id)objc_msgSend(v11, "objectAtIndex:", 2), "integerValue");
          char v15 = objc_opt_respondsToSelector();
          uint64_t v16 = [(NSMutableDictionary *)self->_dividerImages objectForKey:v10];
          if (v15) {
            [a3 _setDividerImage:v16 forLeftSegmentState:v12 rightSegmentState:v13 barMetrics:v14];
          }
          else {
            [a3 setDividerImage:v16 forLeftSegmentState:v12 rightSegmentState:v13 barMetrics:v14];
          }
        }
      }
      uint64_t v7 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v31 objects:v37 count:16];
    }
    while (v7);
  }
  if (objc_opt_respondsToSelector()) {
    [a3 _setOptionsBackgroundImage:self->_optionsBackgroundImage];
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  titleTextAttributes = self->_titleTextAttributes;
  uint64_t v18 = [(NSMutableDictionary *)titleTextAttributes countByEnumeratingWithState:&v27 objects:v36 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v28;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v28 != v20) {
          objc_enumerationMutation(titleTextAttributes);
        }
        v22 = *(void **)(*((void *)&v27 + 1) + 8 * j);
        char v23 = objc_opt_respondsToSelector();
        uint64_t v24 = [(NSMutableDictionary *)self->_titleTextAttributes objectForKey:v22];
        uint64_t v25 = [v22 integerValue];
        if (v23) {
          [a3 _setTitleTextAttributes:v24 forState:v25];
        }
        else {
          [a3 setTitleTextAttributes:v24 forState:v25];
        }
      }
      uint64_t v19 = [(NSMutableDictionary *)titleTextAttributes countByEnumeratingWithState:&v27 objects:v36 count:16];
    }
    while (v19);
  }
}

uint64_t __54__SUSegmentedControlAppearance_styleSegmentedControl___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  char v8 = objc_opt_respondsToSelector();
  id v9 = *(void **)(a1 + 32);
  if (v8)
  {
    [v9 _setBackgroundImage:a3 forState:a2 barMetrics:0];
    id v10 = *(void **)(a1 + 32);
    return [v10 _setBackgroundImage:a4 forState:a2 barMetrics:1];
  }
  else
  {
    [v9 setBackgroundImage:a3 forState:a2 barMetrics:0];
    uint64_t v12 = *(void **)(a1 + 32);
    return [v12 setBackgroundImage:a4 forState:a2 barMetrics:1];
  }
}

- (void)setTitleTextAttributes:(id)a3 forState:(unint64_t)a4
{
  uint64_t v6 = [objc_alloc(NSNumber) initWithInteger:a4];
  titleTextAttributes = self->_titleTextAttributes;
  id v9 = (id)v6;
  if (a3)
  {
    if (!titleTextAttributes) {
      self->_titleTextAttributes = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    }
    char v8 = (void *)[a3 copy];
    [(NSMutableDictionary *)self->_titleTextAttributes setObject:v8 forKey:v9];
  }
  else
  {
    -[NSMutableDictionary removeObjectForKey:](titleTextAttributes, "removeObjectForKey:");
  }
}

- (id)titleTextAttributesForState:(unint64_t)a3
{
  id v4 = (void *)[objc_alloc(NSNumber) initWithInteger:a3];
  id v5 = (id)[(NSMutableDictionary *)self->_titleTextAttributes objectForKey:v4];

  return v5;
}

- (id)_newDividerImageKeyWithLeftState:(unint64_t)a3 rightState:(unint64_t)a4 barMetrics:(int64_t)a5
{
  return (id)objc_msgSend([NSString alloc], "initWithFormat:", @"%lu:%lu:%ld", a3, a4, a5);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5[1] = [(SUControlAppearance *)self->_backgroundImages copyWithZone:a3];
  v5[2] = [(NSMutableDictionary *)self->_dividerImages mutableCopyWithZone:a3];
  v5[3] = self->_optionsBackgroundImage;
  v5[4] = [(NSMutableDictionary *)self->_titleTextAttributes mutableCopyWithZone:a3];
  return v5;
}

- (UIImage)optionsBackgroundImage
{
  return self->_optionsBackgroundImage;
}

- (void)setOptionsBackgroundImage:(id)a3
{
}

@end