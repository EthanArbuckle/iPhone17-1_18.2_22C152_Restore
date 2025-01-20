@interface PMTableMapper
- (PMTableMapper)initWithOadTable:(id)a3 bounds:(id)a4 parent:(id)a5;
- (float)columnWidthAtIndex:(unint64_t)a3 state:(id)a4;
- (id)cellStyle;
- (id)defaultCellFillForRow:(unint64_t)a3 withState:(id)a4;
- (id)defaultCellFillWithState:(id)a3;
- (id)grid;
- (id)tableBorderStyle;
- (unint64_t)rowCount;
- (void)mapAt:(id)a3 withState:(id)a4;
- (void)mapColumnGridAt:(id)a3 withState:(id)a4;
- (void)mapTablePropertiesWithState:(id)a3;
@end

@implementation PMTableMapper

- (PMTableMapper)initWithOadTable:(id)a3 bounds:(id)a4 parent:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)PMTableMapper;
  v12 = [(CMMapper *)&v19 initWithParent:v11];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->mTable, a3);
    v14 = objc_alloc_init(CMTableGridInfo);
    mGrid = v13->mGrid;
    v13->mGrid = v14;

    v16 = objc_alloc_init(CMDrawableStyle);
    mStyle = v13->mStyle;
    v13->mStyle = v16;

    objc_storeStrong((id *)&v13->mBounds, a4);
  }

  return v13;
}

- (void)mapAt:(id)a3 withState:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  v7 = +[OIXMLElement elementWithType:18];
  [v12 addChild:v7];
  mStyle = self->mStyle;
  [(OADOrientedBounds *)self->mBounds bounds];
  -[CMDrawableStyle addPositionProperties:](mStyle, "addPositionProperties:");
  [(PMTableMapper *)self mapTablePropertiesWithState:v6];
  [(PMTableMapper *)self mapColumnGridAt:v7 withState:v6];
  unint64_t v9 = [(OADTable *)self->mTable rowCount];
  if (v9)
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      id v11 = [[PMTableRowMapper alloc] initWithOadTable:self->mTable rowIndex:i parent:self];
      [(PMTableRowMapper *)v11 mapAt:v7 withState:v6];
    }
  }
  [(CMMapper *)self addStyleUsingGlobalCacheTo:v7 style:self->mStyle];
}

- (void)mapTablePropertiesWithState:(id)a3
{
  id v10 = a3;
  v4 = [(OADTable *)self->mTable tableProperties];
  v5 = [v4 style];
  id v6 = [v5 background];

  v7 = [v6 fill];

  if (v7)
  {
    v8 = [v6 fill];
    unint64_t v9 = +[CMColorProperty nsColorFromOADFill:v8 state:v10];

    if (v9) {
      [(CMStyle *)self->mStyle appendPropertyForName:0x26EC19198 color:v9];
    }
  }
  [(CMStyle *)self->mStyle appendPropertyForName:0x26EC193D8 intValue:0];
  [(CMStyle *)self->mStyle appendPropertyForName:0x26EC190F8 intValue:0];
  [(CMStyle *)self->mStyle appendPropertyForName:0x26EC190D8 intValue:0];
}

- (void)mapColumnGridAt:(id)a3 withState:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  v7 = [(OADTable *)self->mTable grid];
  for (unint64_t i = 0; i < [v7 columnCount]; ++i)
  {
    unint64_t v9 = +[OIXMLElement elementWithType:2];
    id v10 = objc_alloc_init(CMStyle);
    [(PMTableMapper *)self columnWidthAtIndex:i state:v6];
    [(CMStyle *)v10 appendPropertyForName:0x26EBFB8D8 length:1 unit:v11];
    [(CMMapper *)self addStyleUsingGlobalCacheTo:v9 style:v10 embedStyle:1];
    [v12 addChild:v9];
  }
}

- (float)columnWidthAtIndex:(unint64_t)a3 state:(id)a4
{
  v5 = [(OADTable *)self->mTable grid];
  id v6 = v5;
  if (v5)
  {
    v7 = [v5 columnAtIndex:a3];
    [v7 width];
    float v9 = v8;
  }
  else
  {
    float v9 = 0.0;
  }

  return v9;
}

- (unint64_t)rowCount
{
  return [(OADTable *)self->mTable rowCount];
}

- (id)tableBorderStyle
{
  v2 = [(OADTable *)self->mTable tableProperties];
  v3 = [v2 style];
  v4 = [v3 wholeTableStyle];
  v5 = [v4 cellStyle];
  id v6 = [v5 borderStyle];

  return v6;
}

- (id)defaultCellFillForRow:(unint64_t)a3 withState:(id)a4
{
  id v6 = a4;
  v7 = [(OADTable *)self->mTable tableProperties];
  float v8 = [v7 style];
  float v9 = v8;
  if (!v8)
  {
    v16 = 0;
    goto LABEL_24;
  }
  id v10 = [v8 background];
  float v11 = [v10 fill];

  if (!v11)
  {
    if (a3 || ![v7 firstRow])
    {
      if ([v7 bandRow])
      {
        if ((a3 & 1) == [v7 firstRow]) {
          [v9 band1HorzStyle];
        }
        else {
        v31 = [v9 wholeTableStyle];
        }
        v32 = [v31 cellStyle];
        uint64_t v33 = [v32 fill];
      }
      else
      {
        v31 = [v9 wholeTableStyle];
        v32 = [v31 cellStyle];
        uint64_t v33 = [v32 fill];
      }
      v14 = (void *)v33;

      uint64_t v15 = +[CMColorProperty nsColorFromOADFill:v14 state:v6];
      goto LABEL_22;
    }
    goto LABEL_5;
  }
  if (!a3 && [v7 firstRow])
  {
LABEL_5:
    id v12 = [v9 firstRowStyle];
    v13 = [v12 cellStyle];
    v14 = [v13 fill];

    uint64_t v15 = +[CMColorProperty nsColorFromOADFill:v14 state:v6];
LABEL_22:
    v16 = (void *)v15;

    goto LABEL_23;
  }
  if ([v7 bandRow])
  {
    unsigned __int8 v17 = [v7 firstRow];
    v18 = +[CMColorProperty nsColorFromOADFill:v11 state:v6];
    v14 = v18;
    if ((a3 ^ v17)) {
      float v19 = 0.2;
    }
    else {
      float v19 = 0.4;
    }
    [v18 redComponent];
    double v21 = v20;
    [v14 greenComponent];
    double v23 = v22;
    [v14 blueComponent];
    double v25 = v24;
    [v14 alphaComponent];
    float v26 = v21;
    float v27 = v23;
    float v28 = v25;
    float v30 = v29;
    uint64_t v15 = +[OITSUColor colorWithRed:(float)((float)(1.0 - v19) + (float)(v26 * v19)) green:(float)((float)(1.0 - v19) + (float)(v27 * v19)) blue:(float)((float)(1.0 - v19) + (float)(v28 * v19)) alpha:v30];
    goto LABEL_22;
  }
  v16 = +[CMColorProperty nsColorFromOADFill:v11 state:v6];
LABEL_23:

LABEL_24:
  return v16;
}

- (id)grid
{
  return self->mGrid;
}

- (id)defaultCellFillWithState:(id)a3
{
  id v4 = a3;
  v5 = [(PMTableMapper *)self cellStyle];
  id v6 = v5;
  if (v5)
  {
    v7 = [v5 fill];
    float v8 = +[CMColorProperty nsColorFromOADFill:v7 state:v4];
  }
  else
  {
    float v8 = 0;
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mBounds, 0);
  objc_storeStrong((id *)&self->mGrid, 0);
  objc_storeStrong((id *)&self->mStyle, 0);
  objc_storeStrong((id *)&self->mTable, 0);
}

- (id)cellStyle
{
  v2 = [(OADTable *)self->mTable tableProperties];
  v3 = v2;
  if (v2)
  {
    id v4 = [v2 style];
    v5 = v4;
    if (v4)
    {
      id v6 = [v4 wholeTableStyle];
      v7 = v6;
      if (v6)
      {
        float v8 = [v6 cellStyle];
      }
      else
      {
        float v8 = 0;
      }
    }
    else
    {
      float v8 = 0;
    }
  }
  else
  {
    float v8 = 0;
  }

  return v8;
}

@end