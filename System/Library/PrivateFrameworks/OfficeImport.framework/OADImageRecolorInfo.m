@interface OADImageRecolorInfo
- (BOOL)isEqual:(id)a3;
- (OADImageRecolorInfo)initWithColors:(id)a3 fills:(id)a4;
- (id)colors;
- (id)description;
- (id)fills;
- (unint64_t)hash;
@end

@implementation OADImageRecolorInfo

- (OADImageRecolorInfo)initWithColors:(id)a3 fills:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)OADImageRecolorInfo;
  v9 = [(OADImageRecolorInfo *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->mColors, a3);
    objc_storeStrong((id *)&v10->mFills, a4);
  }

  return v10;
}

- (id)colors
{
  return self->mColors;
}

- (id)fills
{
  return self->mFills;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSDictionary *)self->mColors hash];
  return [(NSDictionary *)self->mFills hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = v4;
    mColors = self->mColors;
    if (mColors == (NSDictionary *)v5[1] || -[NSDictionary isEqualToDictionary:](mColors, "isEqualToDictionary:"))
    {
      mFills = self->mFills;
      if (mFills == (NSDictionary *)v5[2]) {
        char v8 = 1;
      }
      else {
        char v8 = -[NSDictionary isEqualToDictionary:](mFills, "isEqualToDictionary:");
      }
    }
    else
    {
      char v8 = 0;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)OADImageRecolorInfo;
  v2 = [(OADImageRecolorInfo *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mFills, 0);
  objc_storeStrong((id *)&self->mColors, 0);
}

@end