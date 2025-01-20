@interface MCDGlyph
+ (id)glyphFactory:(id)a3 pointSize:(double)a4 weight:(int64_t)a5 scale:(int64_t)a6;
+ (id)imageNamed:(id)a3 ofSize:(double)a4;
@end

@implementation MCDGlyph

+ (id)glyphFactory:(id)a3 pointSize:(double)a4 weight:(int64_t)a5 scale:(int64_t)a6
{
  v9 = (void *)MEMORY[0x263F82818];
  id v10 = a3;
  v11 = [v9 configurationWithPointSize:a5 weight:a6 scale:a4];
  v12 = (void *)MEMORY[0x263F827E8];
  v13 = [MEMORY[0x263F82DA0] _currentTraitCollection];
  v14 = [v12 systemImageNamed:v10 compatibleWithTraitCollection:v13];

  v15 = [v14 imageWithSymbolConfiguration:v11];

  return v15;
}

+ (id)imageNamed:(id)a3 ofSize:(double)a4
{
  return +[MCDGlyph glyphFactory:a3 pointSize:4 weight:0 scale:a4];
}

@end