@interface TSTTableStylePreset
- (BOOL)isEqual:(id)a3;
- (BOOL)isThemeEquivalent:(id)a3;
- (NSString)presetKind;
- (TSTTableStyleNetwork)styleNetwork;
- (TSTTableStylePreset)initWithContext:(id)a3;
- (TSTTableStylePreset)initWithStyleNetwork:(id)a3 index:(unint64_t)a4;
- (id)p_documentRoot;
- (id)referencedStyles;
- (id)styleNetworkInStylesheet:(id)a3;
- (id)swatchImage;
- (unint64_t)hash;
- (unint64_t)index;
- (void)dealloc;
- (void)drawSwatchInRect:(CGRect)a3 inContext:(CGContext *)a4;
- (void)replaceReferencedStylesUsingBlock:(id)a3;
- (void)setIndex:(unint64_t)a3;
- (void)setStyleNetwork:(id)a3;
@end

@implementation TSTTableStylePreset

- (unint64_t)index
{
  return self->mIndex;
}

- (void)setIndex:(unint64_t)a3
{
  self->mIndex = a3;
}

- (void)setStyleNetwork:(id)a3
{
  [(TSPObject *)self willModify];
  v5 = (TSTTableStyleNetwork *)[a3 copy];

  self->mStyleNetwork = v5;
  unint64_t mIndex = self->mIndex;
  if (mIndex != [(TSTTableStyleNetwork *)v5 presetIndex])
  {
    v7 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v8 = [NSString stringWithUTF8String:"-[TSTTableStylePreset setStyleNetwork:]"];
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTTableStylePreset.mm"), 64, @"expected equality between %s and %s", "mIndex", "mStyleNetwork.presetIndex");
  }
}

- (TSTTableStyleNetwork)styleNetwork
{
  id v2 = [(TSTTableStyleNetwork *)self->mStyleNetwork copy];

  return (TSTTableStyleNetwork *)v2;
}

- (id)p_documentRoot
{
  id v2 = [(TSPObject *)self context];

  return [(TSPObjectContext *)v2 documentRoot];
}

- (TSTTableStylePreset)initWithStyleNetwork:(id)a3 index:(unint64_t)a4
{
  v12.receiver = self;
  v12.super_class = (Class)TSTTableStylePreset;
  v6 = -[TSPObject initWithContext:](&v12, sel_initWithContext_, [a3 context]);
  v7 = v6;
  if (v6)
  {
    v6->unint64_t mIndex = a4;
    uint64_t v8 = (TSTTableStyleNetwork *)[a3 copy];
    v7->mStyleNetwork = v8;
    if ([(TSTTableStyleNetwork *)v8 presetIndex] != a4)
    {
      v9 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v10 = [NSString stringWithUTF8String:"-[TSTTableStylePreset initWithStyleNetwork:index:]"];
      objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTTableStylePreset.mm"), 87, @"expected equality between %s and %s", "index", "mStyleNetwork.presetIndex");
    }
  }
  return v7;
}

- (TSTTableStylePreset)initWithContext:(id)a3
{
  v3 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a3);
  uint64_t v4 = [NSString stringWithUTF8String:"-[TSTTableStylePreset initWithContext:]"];
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTTableStylePreset.mm"), 95, @"Should always be intialized with a network and a index");
  return 0;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSTTableStylePreset;
  [(TSTTableStylePreset *)&v3 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  uint64_t v4 = TSUDynamicCast();
  BOOL result = 0;
  if (v4)
  {
    v5 = (void *)v4;
    unint64_t v6 = [(TSTTableStylePreset *)self index];
    if (v6 == [v5 index]
      && -[TSTTableStyleNetwork isEqual:](-[TSTTableStylePreset styleNetwork](self, "styleNetwork"), "isEqual:", [v5 styleNetwork]))
    {
      return 1;
    }
  }
  return result;
}

- (unint64_t)hash
{
  objc_super v3 = (objc_class *)objc_opt_class();
  return self->mIndex + [NSStringFromClass(v3) hash];
}

- (BOOL)isThemeEquivalent:(id)a3
{
  return a3 == self;
}

- (NSString)presetKind
{
  return (NSString *)String;
}

- (id)swatchImage
{
  return 0;
}

- (id)styleNetworkInStylesheet:(id)a3
{
  if (self->mStyleNetwork) {
    return self->mStyleNetwork;
  }
  else {
    return +[TSTTableStyleNetwork networkFromStylesheet:a3 presetIndex:self->mIndex];
  }
}

- (void)drawSwatchInRect:(CGRect)a3 inContext:(CGContext *)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  mStyleNetwork = self->mStyleNetwork;
  if (!mStyleNetwork) {
    mStyleNetwork = -[TSTTableStylePreset styleNetworkInStylesheet:](self, "styleNetworkInStylesheet:", objc_msgSend(-[TSTTableStylePreset p_documentRoot](self, "p_documentRoot"), "stylesheet"));
  }
  id v11 = [(TSSStyle *)[(TSTTableStyleNetwork *)mStyleNetwork headerRowCellStyle] valueForProperty:898];

  objc_msgSend(v11, "drawSwatchInRect:inContext:", a4, x, y, width, height);
}

- (id)referencedStyles
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  objc_super v3 = (void *)[MEMORY[0x263EFF9C0] set];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [(TSTTableStylePreset *)self styleNetwork];
  uint64_t v5 = [(TSTTableStyleNetwork *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [v3 addObject:*(void *)(*((void *)&v10 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [(TSTTableStyleNetwork *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
  return v3;
}

- (void)replaceReferencedStylesUsingBlock:(id)a3
{
  uint64_t v5 = [(TSTTableStyleNetwork *)self->mStyleNetwork tableStyle];
  objc_opt_class();
  (*((void (**)(id, TSTTableStyle *))a3 + 2))(a3, v5);
  uint64_t v6 = TSUDynamicCast();
  if ((TSTTableStyle *)v6 != v5) {
    [(TSTTableStyleNetwork *)self->mStyleNetwork setTableStyle:v6];
  }
  uint64_t v7 = 0;
  do
  {
    id v8 = [(TSTTableStyleNetwork *)self->mStyleNetwork cellStyleForTableArea:v7];
    objc_opt_class();
    (*((void (**)(id, id))a3 + 2))(a3, v8);
    uint64_t v9 = TSUDynamicCast();
    if ((id)v9 != v8) {
      [(TSTTableStyleNetwork *)self->mStyleNetwork setCellStyle:v9 forTableArea:v7];
    }
    id v10 = [(TSTTableStyleNetwork *)self->mStyleNetwork textStyleForTableArea:v7];
    objc_opt_class();
    (*((void (**)(id, id))a3 + 2))(a3, v10);
    uint64_t v11 = TSUDynamicCast();
    if ((id)v11 != v10) {
      [(TSTTableStyleNetwork *)self->mStyleNetwork setTextStyle:v11 forTableArea:v7];
    }
    uint64_t v7 = (v7 + 1);
  }
  while (v7 != 4);
  long long v12 = [(TSTTableStyleNetwork *)self->mStyleNetwork tableNameStyle];
  objc_opt_class();
  (*((void (**)(id, TSWPParagraphStyle *))a3 + 2))(a3, v12);
  uint64_t v13 = TSUDynamicCast();
  if ((TSWPParagraphStyle *)v13 != v12) {
    [(TSTTableStyleNetwork *)self->mStyleNetwork setTableNameStyle:v13];
  }
  v14 = [(TSTTableStyleNetwork *)self->mStyleNetwork tableNameShapeStyle];
  objc_opt_class();
  (*((void (**)(id, TSWPShapeStyle *))a3 + 2))(a3, v14);
  uint64_t v15 = TSUDynamicCast();
  if ((TSWPShapeStyle *)v15 != v14)
  {
    uint64_t v16 = v15;
    mStyleNetwork = self->mStyleNetwork;
    [(TSTTableStyleNetwork *)mStyleNetwork setTableNameShapeStyle:v16];
  }
}

@end