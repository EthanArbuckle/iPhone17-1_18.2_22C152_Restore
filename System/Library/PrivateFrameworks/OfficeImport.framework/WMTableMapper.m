@interface WMTableMapper
+ (BOOL)isTableDeleted:(id)a3;
- (WMTableMapper)initWithWDTable:(id)a3 parent:(id)a4;
- (id)columnInfo;
- (id)copyColumnInfo;
- (id)copyStopArrayForRow:(unint64_t)a3;
- (id)insideBorders;
- (void)mapAt:(id)a3 withState:(id)a4;
- (void)setInsideBorders:(id)a3;
@end

@implementation WMTableMapper

- (WMTableMapper)initWithWDTable:(id)a3 parent:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)WMTableMapper;
  v9 = [(CMMapper *)&v21 initWithParent:v8];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->mWdTable, a3);
    v11 = [WMTableStyle alloc];
    v12 = [v7 properties];
    uint64_t v13 = [(WMTableStyle *)v11 initWithWDTableProperties:v12];
    mStyle = v10->mStyle;
    v10->mStyle = (WMTableStyle *)v13;

    uint64_t v15 = [(CMStyle *)v10->mStyle propertyForName:0x26EC19698];
    mInsideBorders = v10->mInsideBorders;
    v10->mInsideBorders = (WMBordersProperty *)v15;

    v17 = [(CMStyle *)v10->mStyle properties];
    [v17 removeObjectForKey:0x26EC19698];

    uint64_t v18 = [(WMTableMapper *)v10 copyColumnInfo];
    mColumnInfo = v10->mColumnInfo;
    v10->mColumnInfo = (WMTableColumnInfo *)v18;
  }
  return v10;
}

- (id)copyColumnInfo
{
  unint64_t v3 = [(WDTable *)self->mWdTable rowCount];
  if (!v3) {
    return 0;
  }
  unint64_t v4 = v3;
  id v5 = [(WMTableMapper *)self copyStopArrayForRow:0];
  if (!v5) {
    return 0;
  }
  v6 = v5;
  id v7 = [[WMTableColumnInfo alloc] initWithStopArray:v5];
  if (v4 < 2)
  {
    id v9 = v6;
  }
  else
  {
    for (uint64_t i = 1; i != v4; ++i)
    {
      id v9 = [(WMTableMapper *)self copyStopArrayForRow:i];

      [(WMTableColumnInfo *)v7 mergeStopArray:v9];
      v6 = v9;
    }
  }

  return v7;
}

- (id)copyStopArrayForRow:(unint64_t)a3
{
  unint64_t v3 = [(WDTable *)self->mWdTable rowAt:a3];
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
    unint64_t v5 = 0;
    float v6 = 0.0;
    while ([v3 cellCount] > v5)
    {
      id v7 = [v3 cellAt:v5];
      id v8 = [v7 properties];
      float v6 = v6 + (float)(int)[v8 width];

      *(float *)&double v9 = v6;
      v10 = [NSNumber numberWithFloat:v9];
      [v4 addObject:v10];

      ++v5;
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)mapAt:(id)a3 withState:(id)a4
{
  id v30 = a3;
  id v6 = a4;
  if (!+[WMTableMapper isTableDeleted:self->mWdTable])
  {
    uint64_t v7 = MEMORY[0x23EC9A170]();
    id v8 = [(WDTable *)self->mWdTable properties];
    v29 = v8;
    if ([v8 isHorizontalPositionOverridden]) {
      uint64_t v9 = [v8 horizontalPosition];
    }
    else {
      uint64_t v9 = 0;
    }
    float v10 = (float)v9;
    if ([v8 isLeftDistanceFromTextOverridden]) {
      float v10 = v10 - (float)[v8 leftDistanceFromText];
    }
    if ([v8 isHorizontalAnchorOverridden]
      && [v8 horizontalAnchor] == 2)
    {
      [v6 leftMargin];
      float v10 = v10 - v11;
    }
    [(CMStyle *)self->mStyle appendPropertyForName:0x26EC07B58 length:2 unit:v10];
    v12 = +[OIXMLElement elementWithType:18];
    uint64_t v13 = [(CMMapper *)self archiver];
    int v14 = [v13 progressiveMappingIsPausedOnPath:0];

    if (v14) {
      [v30 addChild:v12];
    }
    v28 = [(WMStyle *)self->mStyle cssStyleString];
    [(CMMapper *)self addAttribute:0x26EBFB938 toNode:v12 value:v28];
    uint64_t v15 = [(CMMapper *)self archiver];
    [v15 pauseProgressiveMappingOnPath:0];
    char v27 = v14;

    unint64_t v16 = [(WDTable *)self->mWdTable rowCount];
    v17 = (void *)v7;
    if (v16)
    {
      uint64_t v18 = 0;
      for (uint64_t i = 0; i != v16; ++i)
      {
        v20 = [(WDTable *)self->mWdTable rowAt:i];

        objc_super v21 = [[WMTableRowMapper alloc] initWithWDTableRow:v20 parent:self];
        [(WMTableRowMapper *)v21 mapAt:v12 withState:v6];

        uint64_t v18 = v20;
      }
    }
    else
    {
      v20 = 0;
    }
    v22 = v17;
    if ((v27 & 1) == 0)
    {
      v23 = [(CMMapper *)self archiver];
      [v23 restartProgressiveMappingOnPath:0];

      v24 = [(CMMapper *)self archiver];
      [v24 pushCssToPath:0];

      v25 = [(CMMapper *)self archiver];
      v26 = [v12 XMLString];
      [v25 pushText:v26 toPath:0];
    }
  }
}

+ (BOOL)isTableDeleted:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [v3 rowCount];
  if (v4)
  {
    BOOL v5 = 0;
    for (i = 0; i != v4; BOOL v5 = i >= v4)
    {
      uint64_t v7 = [v3 rowAt:i];
      BOOL v8 = +[WMTableRowMapper isTableRowDeleted:v7];

      if (!v8) {
        break;
      }
      ++i;
    }
  }
  else
  {
    BOOL v5 = 1;
  }

  return v5;
}

- (id)columnInfo
{
  return self->mColumnInfo;
}

- (id)insideBorders
{
  return self->mInsideBorders;
}

- (void)setInsideBorders:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mColumnInfo, 0);
  objc_storeStrong((id *)&self->mStyle, 0);
  objc_storeStrong((id *)&self->mInsideBorders, 0);
  objc_storeStrong((id *)&self->mWdTable, 0);
}

@end