@interface PMBackgroundMapper
- (CGRect)slideRect;
- (PMBackgroundMapper)initWithOadBackground:(id)a3 parent:(id)a4;
- (void)mapAt:(id)a3 withState:(id)a4;
@end

@implementation PMBackgroundMapper

- (PMBackgroundMapper)initWithOadBackground:(id)a3 parent:(id)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PMBackgroundMapper;
  v8 = [(CMMapper *)&v11 initWithParent:a4];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->mBackground, a3);
  }

  return v9;
}

- (void)mapAt:(id)a3 withState:(id)a4
{
  id v21 = a3;
  id v6 = a4;
  [(PMBackgroundMapper *)self slideRect];
  if (self->mBackground)
  {
    double v11 = v7;
    double v12 = v8;
    double v13 = v9;
    double v14 = v10;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = [(OADBackground *)self->mBackground fill];
      v16 = objc_alloc_init(CMDrawableStyle);
      v17 = -[CMImageFillMapper initWithOadFill:bounds:parent:]([CMImageFillMapper alloc], "initWithOadFill:bounds:parent:", v15, self, v11, v12, v13, v14);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && ([v15 technique],
            v18 = objc_claimAutoreleasedReturnValue(),
            objc_opt_class(),
            char isKindOfClass = objc_opt_isKindOfClass(),
            v18,
            (isKindOfClass & 1) != 0))
      {
        v20 = +[OIXMLElement elementWithType:9];
        [(CMImageFillMapper *)v17 mapImageFillAt:v20 toStyle:v16 withState:v6];
      }
      else
      {
        v20 = +[OIXMLElement elementWithType:3];
        [(CMImageFillMapper *)v17 mapNonImageFillAt:v21 toStyle:v16 withState:v6];
      }
      -[CMStyle appendPositionInfoFromRect:](v16, "appendPositionInfoFromRect:", v11, v12, v13, v14);
      [(CMStyle *)v16 appendPropertyForName:0x26EC07038 stringValue:0x26EC0F218];
      [(CMMapper *)self addStyleUsingGlobalCacheTo:v20 style:v16];
      [v21 addChild:v20];
    }
  }
}

- (CGRect)slideRect
{
  v2 = [(CMMapper *)self root];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v2 slideSize];
    double v4 = v3;
    double v6 = v5;
    double v7 = 0.0;
    double v8 = 0.0;
  }
  else
  {
    double v7 = *MEMORY[0x263F001A8];
    double v8 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v4 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v6 = *(double *)(MEMORY[0x263F001A8] + 24);
  }

  double v9 = v7;
  double v10 = v8;
  double v11 = v4;
  double v12 = v6;
  result.size.height = v12;
  result.size.width = v11;
  result.origin.y = v10;
  result.origin.x = v9;
  return result;
}

- (void).cxx_destruct
{
}

@end