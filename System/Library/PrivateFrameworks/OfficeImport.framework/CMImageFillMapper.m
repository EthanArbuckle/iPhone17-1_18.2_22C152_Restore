@interface CMImageFillMapper
- (BOOL)isCropped;
- (CGRect)uncroppedBox;
- (CMImageFillMapper)initWithOadFill:(id)a3 bounds:(CGRect)a4 parent:(id)a5;
- (id)blipAtIndex:(unsigned int)a3;
- (id)convertMetafileToPdf:(id)a3 state:(id)a4;
- (id)mainSubBlip;
- (id)mapImageFill:(id)a3 withState:(id)a4;
- (void)mapAt:(id)a3 withState:(id)a4;
- (void)mapImageFillAt:(id)a3 toStyle:(id)a4 withState:(id)a5;
- (void)mapNonImageFillAt:(id)a3 toStyle:(id)a4 withState:(id)a5;
@end

@implementation CMImageFillMapper

- (CMImageFillMapper)initWithOadFill:(id)a3 bounds:(CGRect)a4 parent:(id)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v12 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CMImageFillMapper;
  v13 = [(CMMapper *)&v16 initWithParent:a5];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->mFill, a3);
    v14->mBounds.origin.CGFloat x = x;
    v14->mBounds.origin.CGFloat y = y;
    v14->mBounds.size.CGFloat width = width;
    v14->mBounds.size.CGFloat height = height;
  }

  return v14;
}

- (void)mapNonImageFillAt:(id)a3 toStyle:(id)a4 withState:(id)a5
{
  id v14 = a3;
  id v8 = a4;
  id v9 = a5;
  if (self->mFill)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v10 = [(OADFill *)self->mFill color];
        v11 = +[CMColorProperty nsColorFromOADColor:v10 state:v9];

        id v12 = +[CMColorProperty cssStringFromTSUColor:v11];
        [v8 appendPropertyForName:0x26EC19198 stringWithColons:v12];
        goto LABEL_5;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v11 = +[CMColorProperty cssStringFromOADGradientFill:self->mFill state:v9];
        if (v11)
        {
          [v8 appendPropertyForName:0x26EC191B8 stringWithColons:v11];
          goto LABEL_6;
        }
        id v12 = +[CMColorProperty nsColorFromOADFill:self->mFill state:v9];
        v13 = +[CMColorProperty cssStringFromTSUColor:v12];
        [v8 appendPropertyForName:0x26EC19198 stringWithColons:v13];

LABEL_5:
LABEL_6:

        goto LABEL_7;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v11 = [(CMImageFillMapper *)self mapImageFill:v14 withState:v9];
        if (v11)
        {
          id v12 = [NSString stringWithFormat:@":url(%@);", v11];
          [v8 appendPropertyForName:0x26EC191B8 stringWithColons:v12];
          goto LABEL_5;
        }
      }
    }
  }
LABEL_7:
}

- (BOOL)isCropped
{
  v2 = self->mFill;
  if ([(OADFill *)v2 isSourceRectOverridden])
  {
    v3 = [(OADFill *)v2 sourceRect];
    v4 = v3;
    BOOL v9 = 0;
    if (v3)
    {
      [v3 left];
      if (v5 != 0.0
        || ([v4 right], v6 != 0.0)
        || ([v4 top], v7 != 0.0)
        || ([v4 bottom], v8 != 0.0))
      {
        BOOL v9 = 1;
      }
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (id)mapImageFill:(id)a3 withState:(id)a4
{
  id v5 = a4;
  float v6 = [(CMMapper *)self archiver];
  float v7 = [v6 cachedPathForDrawable:self->mFill];
  if (v7)
  {
    id v8 = v7;
  }
  else
  {
    BOOL v9 = [(CMImageFillMapper *)self mainSubBlip];
    v10 = v9;
    if (v9 && ([v9 load] & 1) != 0)
    {
      uint64_t v11 = [v10 type];
      [v10 data];
      if ((v11 & 0xFFFFFFFE) == 4) {
        id v12 = {;
      }
        v13 = [(CMImageFillMapper *)self convertMetafileToPdf:v12 state:v5];
      }
      else {
        v13 = {;
      }
      }
      objc_msgSend(v6, "addResourceForDrawable:withType:drawable:", v13, +[CMArchiveManager blipTypeToResourceType:](CMArchiveManager, "blipTypeToResourceType:", v11), self->mFill);
      id v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v8 = 0;
    }
  }
  return v8;
}

- (id)mainSubBlip
{
  if ([(OADFill *)self->mFill isBlipRefOverridden])
  {
    v3 = [(OADFill *)self->mFill blipRef];
    v4 = [v3 blip];
    if (v4
      || (uint64_t v6 = [v3 index], (int)v6 >= 1)
      && ([(CMImageFillMapper *)self blipAtIndex:v6],
          (v4 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v5 = [v4 mainSubBlip];
    }
    else
    {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (id)blipAtIndex:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = [(CMMapper *)self root];
  int v6 = [v5 conformsToProtocol:&unk_26ECDAAE8];

  if (v6)
  {
    float v7 = [(CMMapper *)self root];
    id v8 = [v7 blipAtIndex:v3];
  }
  else
  {
    id v8 = 0;
  }
  return v8;
}

- (CGRect)uncroppedBox
{
  if ([(CMImageFillMapper *)self isCropped])
  {
    uint64_t v3 = [(OADFill *)self->mFill sourceRect];
    p_mBounds = &self->mBounds;
    double width = p_mBounds->size.width;
    [v3 left];
    float v7 = v6;
    [v3 right];
    float v9 = v8;
    double height = p_mBounds->size.height;
    [v3 top];
    float v12 = v11;
    [v3 bottom];
    float v14 = v13;
    [v3 left];
    float v16 = v15;
    [v3 top];
    double v17 = width / (float)((float)(1.0 - v7) - v9);
    double v18 = height / (float)((float)(1.0 - v12) - v14);
    double x = v17 * (float)-v16;
    double y = v18 * (float)-v20;
  }
  else
  {
    double x = self->mBounds.origin.x;
    double y = self->mBounds.origin.y;
    double v17 = self->mBounds.size.width;
    double v18 = self->mBounds.size.height;
  }
  double v22 = x;
  double v23 = y;
  double v24 = v17;
  double v25 = v18;
  result.size.double height = v25;
  result.size.double width = v24;
  result.origin.double y = v23;
  result.origin.double x = v22;
  return result;
}

- (id)convertMetafileToPdf:(id)a3 state:(id)a4
{
  v4 = +[MFConverter play:frame:colorMap:fillMap:](MFConverter, "play:frame:colorMap:fillMap:", a3, 0, 0, self->mBounds.origin.x, self->mBounds.origin.y, self->mBounds.size.width, self->mBounds.size.height);
  return v4;
}

- (void)mapImageFillAt:(id)a3 toStyle:(id)a4 withState:(id)a5
{
  id v10 = a3;
  id v8 = a4;
  float v9 = [(CMImageFillMapper *)self mapImageFill:v10 withState:a5];
  if (v9) {
    [(CMMapper *)self addAttribute:0x26EC19158 toNode:v10 value:v9];
  }
  else {
    [v8 appendPropertyForName:0x26EC191D8 stringWithColons:@":1px solid black;"];
  }
}

- (void)mapAt:(id)a3 withState:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (self->mFill)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v7 = [(CMImageFillMapper *)self mapImageFill:v8 withState:v6];
      }
    }
  }
}

- (void).cxx_destruct
{
}

@end