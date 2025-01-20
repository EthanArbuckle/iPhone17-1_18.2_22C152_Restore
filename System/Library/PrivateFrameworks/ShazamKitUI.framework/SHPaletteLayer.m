@interface SHPaletteLayer
- (SHPalette)palette;
- (SHPaletteLayer)init;
- (SHPaletteLayer)initWithCoder:(id)a3;
- (SHPaletteLayer)initWithPalette:(id)a3;
- (void)setup;
@end

@implementation SHPaletteLayer

- (SHPaletteLayer)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SHPaletteLayer;
  v3 = [(SHPaletteLayer *)&v7 initWithCoder:a3];
  if (v3)
  {
    uint64_t v4 = +[SHPalette default];
    palette = v3->_palette;
    v3->_palette = (SHPalette *)v4;

    [(SHPaletteLayer *)v3 setup];
  }
  return v3;
}

- (SHPaletteLayer)init
{
  v3 = +[SHPalette default];
  uint64_t v4 = [(SHPaletteLayer *)self initWithPalette:v3];

  return v4;
}

- (SHPaletteLayer)initWithPalette:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SHPaletteLayer;
  v6 = [(SHPaletteLayer *)&v9 init];
  objc_super v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_palette, a3);
    [(SHPaletteLayer *)v7 setup];
  }

  return v7;
}

- (void)setup
{
  v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  NSStringFromSelector(a2);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v2 raise:v3, @"You must override %@ in a subclass", v4 format];
}

- (SHPalette)palette
{
  return self->_palette;
}

- (void).cxx_destruct
{
}

@end