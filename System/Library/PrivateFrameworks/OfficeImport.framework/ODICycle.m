@interface ODICycle
+ (BOOL)map1NodeWithState:(id)a3;
+ (BOOL)map2NodeWithState:(id)a3;
+ (BOOL)mapIdentifier:(id)a3 state:(id)a4;
+ (CGRect)boundingBoxWithIsTight:(BOOL)a3 state:(id)a4;
+ (CGRect)mapGSpaceWithState:(id)a3;
+ (CGRect)nodeBoundsWithIndex:(unsigned int)a3 state:(id)a4;
+ (CGSize)nodeSizeWithState:(id)a3;
+ (unint64_t)nodeCountWithState:(id)a3;
+ (void)mapWithState:(id)a3;
@end

@implementation ODICycle

+ (BOOL)mapIdentifier:(id)a3 state:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (([v5 isEqualToString:@"cycle1"] & 1) != 0
    || ([v5 isEqualToString:@"cycle2"] & 1) != 0
    || ([v5 isEqualToString:@"cycle8"] & 1) != 0)
  {
    v7 = off_264D605A0;
  }
  else if ([v5 isEqualToString:@"cycle3"])
  {
    v7 = off_264D605A8;
  }
  else if ([v5 isEqualToString:@"cycle4"])
  {
    v7 = off_264D605B0;
  }
  else if ([v5 isEqualToString:@"cycle5"])
  {
    v7 = off_264D605B8;
  }
  else if ([v5 isEqualToString:@"cycle6"])
  {
    v7 = off_264D605C0;
  }
  else if ([v5 isEqualToString:@"cycle7"])
  {
    v7 = off_264D605C8;
  }
  else if ([v5 isEqualToString:@"chart3"])
  {
    v7 = off_264D60598;
  }
  else
  {
    if (![v5 isEqualToString:@"gear1"])
    {
      BOOL v8 = 0;
      goto LABEL_6;
    }
    v7 = off_264D605D0;
  }
  [(__objc2_class *)*v7 mapWithState:v6];
  BOOL v8 = 1;
LABEL_6:

  return v8;
}

+ (void)mapWithState:(id)a3
{
  id v13 = a3;
  unint64_t v4 = objc_msgSend(a1, "nodeCountWithState:");
  [v13 setPointCount:v4];
  if (v4 == 2)
  {
    char v5 = [a1 map2NodeWithState:v13];
LABEL_5:
    if (v5) {
      goto LABEL_10;
    }
    goto LABEL_6;
  }
  if (v4 == 1)
  {
    char v5 = [a1 map1NodeWithState:v13];
    goto LABEL_5;
  }
LABEL_6:
  [a1 mapGSpaceWithState:v13];
  objc_msgSend(v13, "setLogicalBounds:");
  id v6 = [v13 diagram];
  v7 = [v6 documentPoint];
  BOOL v8 = [v7 children];

  if (v4)
  {
    unint64_t v9 = 0;
    unint64_t v10 = 0;
    do
    {
      v11 = [v8 objectAtIndex:v9];
      [v13 setPointIndex:v10];
      [a1 mapNode:v11 index:v10 state:v13];
      v12 = [v11 siblingTransition];
      [a1 mapTransition:v12 index:v10 state:v13];

      unint64_t v9 = (v10 + 1);
      unint64_t v10 = v9;
    }
    while (v4 > v9);
  }

LABEL_10:
}

+ (unint64_t)nodeCountWithState:(id)a3
{
  v3 = [a3 diagram];
  unint64_t v4 = [v3 documentPoint];
  char v5 = [v4 children];
  unint64_t v6 = [v5 count];

  return v6;
}

+ (CGSize)nodeSizeWithState:(id)a3
{
  double v3 = *MEMORY[0x263F001B0];
  double v4 = *(double *)(MEMORY[0x263F001B0] + 8);
  result.height = v4;
  result.width = v3;
  return result;
}

+ (CGRect)boundingBoxWithIsTight:(BOOL)a3 state:(id)a4
{
  id v6 = a4;
  if (a3) {
    double v7 = ODIRegularPolygonBounds([a1 nodeCountWithState:v6], 1.0, -90.0);
  }
  else {
    double v7 = TSURectWithCenterAndSize(*MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8), 2.0);
  }
  CGFloat v11 = v7;
  CGFloat v12 = v8;
  CGFloat v13 = v9;
  CGFloat v14 = v10;
  [a1 nodeSizeWithState:v6];
  CGFloat v16 = v15 * -0.5;
  CGFloat v18 = v17 * -0.5;
  v27.origin.CGFloat x = v11;
  v27.origin.CGFloat y = v12;
  v27.size.CGFloat width = v13;
  v27.size.CGFloat height = v14;
  CGRect v28 = CGRectInset(v27, v16, v18);
  CGFloat x = v28.origin.x;
  CGFloat y = v28.origin.y;
  CGFloat width = v28.size.width;
  CGFloat height = v28.size.height;

  double v23 = x;
  double v24 = y;
  double v25 = width;
  double v26 = height;
  result.size.CGFloat height = v26;
  result.size.CGFloat width = v25;
  result.origin.CGFloat y = v24;
  result.origin.CGFloat x = v23;
  return result;
}

+ (CGRect)nodeBoundsWithIndex:(unsigned int)a3 state:(id)a4
{
  id v6 = a4;
  unint64_t v7 = [a1 nodeCountWithState:v6];
  [a1 nodeSizeWithState:v6];
  double v9 = v8;
  *(float *)&double v8 = (double)(2 * a3) * 3.14159265 / (double)v7 + -1.57079633;
  __float2 v10 = __sincosf_stret(*(float *)&v8);
  double v11 = TSURectWithCenterAndSize(v10.__cosval, v10.__sinval, v9);
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

  double v18 = v11;
  double v19 = v13;
  double v20 = v15;
  double v21 = v17;
  result.size.CGFloat height = v21;
  result.size.CGFloat width = v20;
  result.origin.CGFloat y = v19;
  result.origin.CGFloat x = v18;
  return result;
}

+ (CGRect)mapGSpaceWithState:(id)a3
{
  double v3 = *MEMORY[0x263F001A8];
  double v4 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v5 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v6 = *(double *)(MEMORY[0x263F001A8] + 24);
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

+ (BOOL)map1NodeWithState:(id)a3
{
  return 0;
}

+ (BOOL)map2NodeWithState:(id)a3
{
  return 0;
}

@end