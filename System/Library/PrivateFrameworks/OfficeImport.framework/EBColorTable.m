@interface EBColorTable
+ (void)readWithState:(id)a3;
@end

@implementation EBColorTable

+ (void)readWithState:(id)a3
{
  id v3 = a3;
  XlColorTable::XlColorTable((XlColorTable *)v8);
  uint64_t v4 = objc_msgSend(v3, "xlReader", XlColorTable::init((XlColorTable *)v8));
  (*(void (**)(uint64_t, void *))(*(void *)v4 + 264))(v4, v8);
  v5 = [[EDColorsCollection alloc] initWithDefaultSetup:1];
  [(EDColorsCollection *)v5 addPalette:v8[1] paletteSize:v9 paletteX:v8[2] paletteXSize:v10];
  v6 = [v3 resources];
  [v6 setColors:v5];

  v7 = [v3 oaState];
  [v7 setColorPalette:v5];

  XlColorTable::~XlColorTable((XlColorTable *)v8);
}

@end