@interface MTUIBitmapHandView
+ (id)partInfoWithName:(id)a3;
+ (id)partInfoWithName:(id)a3 offset:(CGPoint)a4 maintainsOrientation:(BOOL)a5;
- (MTUIBitmapHandView)initWithBundle:(id)a3 resourcePath:(id)a4 partInfoList:(id)a5 rotationalCenter:(CGPoint)a6;
- (MTUIBitmapHandView)initWithImage:(id)a3 rotationalCenter:(CGPoint)a4;
@end

@implementation MTUIBitmapHandView

+ (id)partInfoWithName:(id)a3
{
  return (id)objc_msgSend(a1, "partInfoWithName:offset:maintainsOrientation:", a3, 0, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
}

+ (id)partInfoWithName:(id)a3 offset:(CGPoint)a4 maintainsOrientation:(BOOL)a5
{
  BOOL v5 = a5;
  double y = a4.y;
  double x = a4.x;
  v15[3] = *MEMORY[0x263EF8340];
  v15[0] = a3;
  v14[0] = @"MTUIBitmapClockHandPartNameKey";
  v14[1] = @"MTUIBitmapClockHandPartOffsetKey";
  v8 = (void *)MEMORY[0x263F08D40];
  id v9 = a3;
  v10 = objc_msgSend(v8, "valueWithCGPoint:", x, y);
  v15[1] = v10;
  v14[2] = @"MTUIBitmapClockHandPartMaintainsOrientationKey";
  v11 = [NSNumber numberWithBool:v5];
  v15[2] = v11;
  v12 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:3];

  return v12;
}

- (MTUIBitmapHandView)initWithBundle:(id)a3 resourcePath:(id)a4 partInfoList:(id)a5 rotationalCenter:(CGPoint)a6
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  id v55 = a3;
  id v54 = a4;
  id v9 = a5;
  v64.receiver = self;
  v64.super_class = (Class)MTUIBitmapHandView;
  double x = *MEMORY[0x263F001A8];
  double y = *(double *)(MEMORY[0x263F001A8] + 8);
  double width = *(double *)(MEMORY[0x263F001A8] + 16);
  double height = *(double *)(MEMORY[0x263F001A8] + 24);
  v14 = -[MTUIBitmapHandView initWithFrame:](&v64, sel_initWithFrame_, *MEMORY[0x263F001A8], y, width, height);
  v15 = v14;
  if (v14)
  {
    p_isa = (id *)&v14->super.super.super.isa;
    id v53 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v9, "count"));
    v50 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v9, "count"));
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    id v48 = v9;
    obuint64_t j = v9;
    uint64_t v16 = [obj countByEnumeratingWithState:&v60 objects:v66 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v61;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v61 != v18) {
            objc_enumerationMutation(obj);
          }
          v20 = *(void **)(*((void *)&v60 + 1) + 8 * i);
          v21 = [v20 objectForKeyedSubscript:@"MTUIBitmapClockHandPartNameKey"];
          v22 = [v54 stringByAppendingPathComponent:v21];

          id v23 = objc_alloc(MEMORY[0x263F1C6D0]);
          v24 = [MEMORY[0x263F1C6B0] imageNamed:v22 inBundle:v55];
          v25 = (void *)[v23 initWithImage:v24];

          [v53 addObject:v25];
          [p_isa addSubview:v25];
          [v25 frame];
          double v27 = v26;
          double v29 = v28;
          v30 = [v20 objectForKeyedSubscript:@"MTUIBitmapClockHandPartOffsetKey"];
          [v30 CGPointValue];
          double v32 = v31;
          double v34 = v33;

          objc_msgSend(v25, "setFrame:", v32, v34, v27, v29);
          v35 = [v20 objectForKeyedSubscript:@"MTUIBitmapClockHandPartMaintainsOrientationKey"];
          LODWORD(v30) = [v35 BOOLValue];

          if (v30) {
            [v50 addObject:v25];
          }
        }
        uint64_t v17 = [obj countByEnumeratingWithState:&v60 objects:v66 count:16];
      }
      while (v17);
    }

    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id v36 = v53;
    uint64_t v37 = [v36 countByEnumeratingWithState:&v56 objects:v65 count:16];
    if (v37)
    {
      uint64_t v38 = v37;
      uint64_t v39 = *(void *)v57;
      id v9 = v48;
      do
      {
        for (uint64_t j = 0; j != v38; ++j)
        {
          if (*(void *)v57 != v39) {
            objc_enumerationMutation(v36);
          }
          [*(id *)(*((void *)&v56 + 1) + 8 * j) frame];
          v70.origin.double x = v41;
          v70.origin.double y = v42;
          v70.size.double width = v43;
          v70.size.double height = v44;
          v68.origin.double x = x;
          v68.origin.double y = y;
          v68.size.double width = width;
          v68.size.double height = height;
          CGRect v69 = CGRectUnion(v68, v70);
          double x = v69.origin.x;
          double y = v69.origin.y;
          double width = v69.size.width;
          double height = v69.size.height;
        }
        uint64_t v38 = [v36 countByEnumeratingWithState:&v56 objects:v65 count:16];
      }
      while (v38);
    }
    else
    {
      id v9 = v48;
    }

    v15 = (MTUIBitmapHandView *)p_isa;
    objc_msgSend(p_isa, "setBounds:", x, y, width, height);
    v45 = [p_isa layer];
    objc_msgSend(v45, "setAnchorPoint:", a6.x, a6.y);

    objc_storeStrong(p_isa + 51, v53);
    if ([v50 count]) {
      objc_storeStrong(p_isa + 52, v50);
    }
    v46 = p_isa;
  }
  return v15;
}

- (MTUIBitmapHandView)initWithImage:(id)a3 rotationalCenter:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  double v8 = *MEMORY[0x263F001A8];
  double v9 = *(double *)(MEMORY[0x263F001A8] + 8);
  [v7 size];
  v20.receiver = self;
  v20.super_class = (Class)MTUIBitmapHandView;
  v12 = -[MTUIBitmapHandView initWithFrame:](&v20, sel_initWithFrame_, v8, v9, v10, v11);
  if (v12)
  {
    v13 = (NSArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v14 = (void *)[objc_alloc(MEMORY[0x263F1C6D0]) initWithImage:v7];
    v15 = [v14 layer];
    [v15 setAllowsEdgeAntialiasing:1];

    [(NSArray *)v13 addObject:v14];
    [(MTUIBitmapHandView *)v12 addSubview:v14];
    uint64_t v16 = [(MTUIBitmapHandView *)v12 layer];
    objc_msgSend(v16, "setAnchorPoint:", x, y);

    partViews = v12->_partViews;
    v12->_partViews = v13;

    uint64_t v18 = v12;
  }

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_partViewsMaintainingOrientation, 0);

  objc_storeStrong((id *)&self->_partViews, 0);
}

@end