@interface WMTableStyle
- (WMTableStyle)initWithWDTableProperties:(id)a3;
- (void)addTableProperties:(id)a3;
@end

@implementation WMTableStyle

- (WMTableStyle)initWithWDTableProperties:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WMTableStyle;
  v6 = [(CMStyle *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->mWdTableProperties, a3);
    [(WMTableStyle *)v7 addTableProperties:v5];
    v8 = v7;
  }

  return v7;
}

- (void)addTableProperties:(id)a3
{
  id v14 = a3;
  if (([v14 isTopBorderOverridden] & 1) != 0
    || ([v14 isLeftBorderOverridden] & 1) != 0
    || ([v14 isBottomBorderOverridden] & 1) != 0
    || [v14 isRightBorderOverridden])
  {
    v4 = objc_alloc_init(WMBordersProperty);
    if ([v14 isTopBorderOverridden])
    {
      id v5 = [v14 topBorder];
      [(WMBordersProperty *)v4 setBorder:v5 location:1];
    }
    if ([v14 isLeftBorderOverridden])
    {
      v6 = [v14 leftBorder];
      [(WMBordersProperty *)v4 setBorder:v6 location:2];
    }
    if ([v14 isBottomBorderOverridden])
    {
      v7 = [v14 bottomBorder];
      [(WMBordersProperty *)v4 setBorder:v7 location:3];
    }
    if ([v14 isRightBorderOverridden])
    {
      v8 = [v14 rightBorder];
      [(WMBordersProperty *)v4 setBorder:v8 location:4];
    }
    [(CMBordersProperty *)v4 adjustValues];
    [(CMStyle *)self addProperty:v4 forKey:@"outsideBoders"];
  }
  int v9 = [v14 isInsideHorizontalBorderOverridden];
  if (v9)
  {
    objc_super v10 = [v14 insideHorizontalBorder];
  }
  else
  {
    objc_super v10 = 0;
  }
  if ([v14 isInsideVerticalBorderOverridden])
  {
    v11 = [v14 insideVerticalBorder];
  }
  else
  {
    if (!v9) {
      goto LABEL_26;
    }
    v11 = 0;
  }
  v12 = objc_alloc_init(WMBordersProperty);
  v13 = v12;
  if (v10)
  {
    [(WMBordersProperty *)v12 setBorder:v10 location:1];
    [(WMBordersProperty *)v13 setBorder:v10 location:3];
  }
  if (v11)
  {
    [(WMBordersProperty *)v13 setBorder:v11 location:4];
    [(WMBordersProperty *)v13 setBorder:v11 location:2];
  }
  [(CMBordersProperty *)v13 adjustValues];
  [(CMStyle *)self addProperty:v13 forKey:0x26EC19698];

LABEL_26:
}

- (void).cxx_destruct
{
}

@end