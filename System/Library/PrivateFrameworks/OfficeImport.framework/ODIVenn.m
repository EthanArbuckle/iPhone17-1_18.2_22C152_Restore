@interface ODIVenn
+ (BOOL)mapIdentifier:(id)a3 state:(id)a4;
+ (CGRect)mapGSpaceWithState:(id)a3;
+ (unint64_t)nodeCountWithState:(id)a3;
+ (void)mapWithState:(id)a3;
@end

@implementation ODIVenn

+ (BOOL)mapIdentifier:(id)a3 state:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 isEqualToString:@"venn1"])
  {
    v7 = off_264D605D8;
  }
  else
  {
    if (![v5 isEqualToString:@"venn3"])
    {
      BOOL v8 = 0;
      goto LABEL_7;
    }
    v7 = off_264D605E0;
  }
  [(__objc2_class *)*v7 mapWithState:v6];
  BOOL v8 = 1;
LABEL_7:

  return v8;
}

+ (void)mapWithState:(id)a3
{
  id v14 = a3;
  unint64_t v4 = objc_msgSend(a1, "nodeCountWithState:");
  id v5 = [v14 diagram];
  id v6 = [v5 documentPoint];
  v7 = [v6 children];

  if (v4 == 1)
  {
    objc_msgSend(v14, "setLogicalBounds:", 0.0, 0.0, 1.0, 1.0);
    BOOL v8 = +[ODIDrawable shapeGeometryForEllipse];
    v9 = +[ODIDrawable addShapeWithBounds:rotation:geometry:state:](ODIDrawable, "addShapeWithBounds:rotation:geometry:state:", v8, v14, 0.0, 0.0, 1.0, 1.0, 0.0);

    v10 = [v7 objectAtIndex:0];
    +[ODIDrawable mapStyleAndTextFromPoint:v10 shape:v9 state:v14];
  }
  else
  {
    [a1 mapGSpaceWithState:v14];
    objc_msgSend(v14, "setLogicalBounds:");
    if (v4)
    {
      unint64_t v11 = 0;
      unint64_t v12 = 0;
      do
      {
        v13 = [v7 objectAtIndex:v11];
        [a1 mapNode:v13 index:v12 state:v14];

        unint64_t v11 = (v12 + 1);
        unint64_t v12 = v11;
      }
      while (v4 > v11);
    }
  }
}

+ (unint64_t)nodeCountWithState:(id)a3
{
  v3 = [a3 diagram];
  unint64_t v4 = [v3 documentPoint];
  id v5 = [v4 children];
  unint64_t v6 = [v5 count];

  return v6;
}

+ (CGRect)mapGSpaceWithState:(id)a3
{
  double v3 = *MEMORY[0x263F001A8];
  double v4 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v5 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v6 = *(double *)(MEMORY[0x263F001A8] + 24);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

@end