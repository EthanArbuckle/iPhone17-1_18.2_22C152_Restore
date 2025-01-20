@interface WMTableCellMapper
- (WMTableCellMapper)initWithWDTableCell:(id)a3 atIndex:(unsigned int)a4 parent:(id)a5;
- (id)tableMapper;
- (unsigned)colSpan;
- (void)mapAt:(id)a3 withState:(id)a4;
- (void)mapCellStyleAt:(id)a3;
@end

@implementation WMTableCellMapper

- (WMTableCellMapper)initWithWDTableCell:(id)a3 atIndex:(unsigned int)a4 parent:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v9 = a3;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)WMTableCellMapper;
  v11 = [(CMMapper *)&v19 initWithParent:v10];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->mWdTableCell, a3);
    v13 = [v9 properties];
    v12->double mWidth = (double)(int)[v13 width];

    v12->mHeight = 0.0;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v10 height];
      v12->mHeight = v14;
    }
    v15 = [(WMTableCellMapper *)v12 tableMapper];
    v16 = [v15 columnInfo];
    double mWidth = v12->mWidth;
    *(float *)&double mWidth = mWidth;
    v12->mColSpan = [v16 columnSpan:v6 at:mWidth];
  }
  return v12;
}

- (id)tableMapper
{
  v2 = [(CMMapper *)self parent];
  if (v2)
  {
    do
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      uint64_t v3 = [v2 parent];

      v2 = (void *)v3;
    }
    while (v3);
  }
  return v2;
}

- (void)mapAt:(id)a3 withState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[OIXMLElement elementWithType:19];
  [v6 addChild:v8];
  id v9 = v8;

  if (self->mColSpan >= 2)
  {
    id v10 = objc_msgSend(NSString, "stringWithFormat:", @"%d", self->mColSpan);
    v11 = +[OIXMLAttribute attributeWithName:@"colspan" stringValue:v10];
    [v9 addAttribute:v11];
  }
  [(WMTableCellMapper *)self mapCellStyleAt:v9];
  id v19 = v9;
  if (self->mWidth > 0.0)
  {
    id v19 = +[OIXMLElement elementWithType:3];
    objc_msgSend(v9, "addChild:");
    v12 = objc_alloc_init(WMStyle);
    v13 = v12;
    double mWidth = self->mWidth;
    double v15 = self->mLeftPadding + self->mRightPadding;
    if (mWidth <= v15) {
      double v15 = 0.0;
    }
    [(CMStyle *)v12 appendPropertyForName:0x26EC19498 length:2 unit:mWidth - v15];
    v16 = [(WMStyle *)v13 cssStyleString];
    [(CMMapper *)self addAttribute:0x26EBFB938 toNode:v19 value:v16];
  }
  v17 = [(WDTableCell *)self->mWdTableCell text];
  v18 = [[WMSectionContentMapper alloc] initWithWDText:v17 parent:self];
  [(WMSectionContentMapper *)v18 mapAt:v19 withState:v7];
}

- (void)mapCellStyleAt:(id)a3
{
  id v14 = a3;
  v4 = objc_alloc_init(WMTableCellStyle);
  v5 = [(WDTableCell *)self->mWdTableCell row];
  id v6 = [v5 table];
  id v7 = [v6 properties];
  if ([v7 isBaseStyleOverridden])
  {
    v8 = [v7 baseStyle];
    [(WMTableCellStyle *)v4 addTableCellStyleProperties:v8];
  }
  id v9 = [(WDTableCell *)self->mWdTableCell properties];
  [(WMTableCellStyle *)v4 addTableCellProperties:v9];

  [(WMTableCellStyle *)v4 leftPadding];
  self->mLeftPadding = v10;
  [(WMTableCellStyle *)v4 rightPadding];
  self->mRightPadding = v11;
  v12 = [(WMTableCellMapper *)self tableMapper];
  v13 = [v12 insideBorders];
  if (v13) {
    [(CMStyle *)v4 addProperty:v13 forKey:0x26EC196B8];
  }
  if (self->mHeight > 0.0) {
    -[CMStyle appendPropertyForName:length:unit:](v4, "appendPropertyForName:length:unit:", 0x26EC07B38, 2);
  }
  [(CMMapper *)self addStyleUsingGlobalCacheTo:v14 style:v4];
}

- (unsigned)colSpan
{
  return self->mColSpan;
}

- (void).cxx_destruct
{
}

@end