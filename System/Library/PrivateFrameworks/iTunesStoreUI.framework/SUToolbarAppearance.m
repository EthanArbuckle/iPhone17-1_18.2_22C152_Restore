@interface SUToolbarAppearance
+ (id)defaultToolbarAppearance;
- (UIColor)tintColor;
- (id)backgroundImageForPosition:(int64_t)a3 barMetrics:(int64_t)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)shadowImageForPosition:(int64_t)a3;
- (void)dealloc;
- (void)enumerateBackgroundImagesUsingBlock:(id)a3;
- (void)enumerateShadowImagesUsingBlock:(id)a3;
- (void)setBackgroundImage:(id)a3 forPosition:(int64_t)a4 barMetrics:(int64_t)a5;
- (void)setShadowImage:(id)a3 forPosition:(int64_t)a4;
- (void)setTintColor:(id)a3;
- (void)styleToolbar:(id)a3;
@end

@implementation SUToolbarAppearance

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SUToolbarAppearance;
  [(SUToolbarAppearance *)&v3 dealloc];
}

+ (id)defaultToolbarAppearance
{
  v2 = objc_alloc_init(SUToolbarAppearance);
  uint64_t v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  -[SUToolbarAppearance setBackgroundImage:forPosition:barMetrics:](v2, "setBackgroundImage:forPosition:barMetrics:", [MEMORY[0x263F1C6B0] imageNamed:@"UIBottomBarDefaultBackground" inBundle:v3], 0, 0);
  -[SUToolbarAppearance setBackgroundImage:forPosition:barMetrics:](v2, "setBackgroundImage:forPosition:barMetrics:", [MEMORY[0x263F1C6B0] imageNamed:@"UIBottomBarMiniDefaultBackground" inBundle:v3], 0, 1);

  return v2;
}

- (id)backgroundImageForPosition:(int64_t)a3 barMetrics:(int64_t)a4
{
  v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"%ld:%ld", a3, a4);
  id v6 = (id)[(NSMutableDictionary *)self->_backgroundImages objectForKey:v5];

  return v6;
}

- (void)enumerateBackgroundImagesUsingBlock:(id)a3
{
  backgroundImages = self->_backgroundImages;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __59__SUToolbarAppearance_enumerateBackgroundImagesUsingBlock___block_invoke;
  v4[3] = &unk_2648150F0;
  v4[4] = a3;
  [(NSMutableDictionary *)backgroundImages enumerateKeysAndObjectsUsingBlock:v4];
}

uint64_t __59__SUToolbarAppearance_enumerateBackgroundImagesUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)[a2 componentsSeparatedByString:@":"];
  uint64_t result = [v3 count];
  if (result == 2)
  {
    objc_msgSend((id)objc_msgSend(v3, "objectAtIndex:", 0), "integerValue");
    objc_msgSend((id)objc_msgSend(v3, "objectAtIndex:", 1), "integerValue");
    v5 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
    return v5();
  }
  return result;
}

- (void)enumerateShadowImagesUsingBlock:(id)a3
{
  shadowImages = self->_shadowImages;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __55__SUToolbarAppearance_enumerateShadowImagesUsingBlock___block_invoke;
  v4[3] = &unk_264815118;
  v4[4] = a3;
  [(NSMutableDictionary *)shadowImages enumerateKeysAndObjectsUsingBlock:v4];
}

uint64_t __55__SUToolbarAppearance_enumerateShadowImagesUsingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = [a2 integerValue];
  id v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);

  return v6(v4, a3, v5);
}

- (void)setBackgroundImage:(id)a3 forPosition:(int64_t)a4 barMetrics:(int64_t)a5
{
  uint64_t v7 = objc_msgSend([NSString alloc], "initWithFormat:", @"%ld:%ld", a4, a5);
  backgroundImages = self->_backgroundImages;
  id v9 = (id)v7;
  if (a3)
  {
    if (!backgroundImages)
    {
      backgroundImages = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      self->_backgroundImages = backgroundImages;
    }
    [(NSMutableDictionary *)backgroundImages setObject:a3 forKey:v9];
  }
  else
  {
    -[NSMutableDictionary removeObjectForKey:](backgroundImages, "removeObjectForKey:");
  }
}

- (void)setShadowImage:(id)a3 forPosition:(int64_t)a4
{
  uint64_t v6 = [objc_alloc(NSNumber) initWithInteger:a4];
  shadowImages = self->_shadowImages;
  id v8 = (id)v6;
  if (a3)
  {
    if (!shadowImages)
    {
      shadowImages = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      self->_shadowImages = shadowImages;
    }
    [(NSMutableDictionary *)shadowImages setObject:a3 forKey:v8];
  }
  else
  {
    -[NSMutableDictionary removeObjectForKey:](shadowImages, "removeObjectForKey:");
  }
}

- (id)shadowImageForPosition:(int64_t)a3
{
  uint64_t v4 = (void *)[objc_alloc(NSNumber) initWithInteger:a3];
  id v5 = (id)[(NSMutableDictionary *)self->_shadowImages objectForKey:v4];

  return v5;
}

- (void)styleToolbar:(id)a3
{
  [a3 setTintColor:self->_tintColor];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __36__SUToolbarAppearance_styleToolbar___block_invoke;
  v6[3] = &unk_264815140;
  v6[4] = a3;
  [(SUToolbarAppearance *)self enumerateBackgroundImagesUsingBlock:v6];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __36__SUToolbarAppearance_styleToolbar___block_invoke_2;
  v5[3] = &unk_264815168;
  v5[4] = a3;
  [(SUToolbarAppearance *)self enumerateShadowImagesUsingBlock:v5];
}

uint64_t __36__SUToolbarAppearance_styleToolbar___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 32) setBackgroundImage:a2 forToolbarPosition:a3 barMetrics:a4];
}

uint64_t __36__SUToolbarAppearance_styleToolbar___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setShadowImage:a2 forToolbarPosition:a3];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5[1] = [(NSMutableDictionary *)self->_backgroundImages mutableCopyWithZone:a3];
  v5[2] = [(NSMutableDictionary *)self->_shadowImages mutableCopyWithZone:a3];
  v5[3] = self->_tintColor;
  return v5;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(id)a3
{
}

@end