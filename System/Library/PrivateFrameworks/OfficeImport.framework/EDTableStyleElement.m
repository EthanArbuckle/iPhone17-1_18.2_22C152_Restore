@interface EDTableStyleElement
+ (id)tableStyleElementWithResources:(id)a3;
- (EDTableStyleElement)initWithResources:(id)a3;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)differentialStyle;
- (int)type;
- (int64_t)key;
- (unsigned)bandSize;
- (void)setBandSize:(unsigned int)a3;
- (void)setDifferentialStyle:(id)a3;
- (void)setDifferentialStyleWithIndex:(unint64_t)a3;
- (void)setType:(int)a3;
@end

@implementation EDTableStyleElement

- (EDTableStyleElement)initWithResources:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EDTableStyleElement;
  v5 = [(EDTableStyleElement *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 differentialStyles];
    mDifferentialStyles = v5->mDifferentialStyles;
    v5->mDifferentialStyles = (EDCollection *)v6;

    *(void *)&v5->mType = 0xFFFFFFFF00000000;
  }

  return v5;
}

- (void)setType:(int)a3
{
  self->mType = a3;
}

- (void)setDifferentialStyleWithIndex:(unint64_t)a3
{
  id v4 = [(EDCollection *)self->mDifferentialStyles objectAtIndex:a3];
  -[EDTableStyleElement setDifferentialStyle:](self, "setDifferentialStyle:");
}

- (void)setDifferentialStyle:(id)a3
{
  v5 = (EDDifferentialStyle *)a3;
  mDifferentialStyle = self->mDifferentialStyle;
  p_mDifferentialStyle = &self->mDifferentialStyle;
  if (mDifferentialStyle != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_mDifferentialStyle, a3);
    v5 = v8;
  }
}

- (int64_t)key
{
  return self->mType;
}

- (unsigned)bandSize
{
  return self->mBandSize;
}

- (id)differentialStyle
{
  return self->mDifferentialStyle;
}

+ (id)tableStyleElementWithResources:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithResources:v3];

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = v4;
  if (v4)
  {
    objc_storeStrong((id *)v4 + 1, self->mDifferentialStyles);
    v5[2] = *(void *)&self->mType;
    uint64_t v6 = [(EDDifferentialStyle *)self->mDifferentialStyle copy];
    v7 = (void *)v5[3];
    v5[3] = v6;

    v8 = v5;
  }

  return v5;
}

- (int)type
{
  return self->mType;
}

- (void)setBandSize:(unsigned int)a3
{
  self->mBandSize = a3;
}

- (NSString)description
{
  v4.receiver = self;
  v4.super_class = (Class)EDTableStyleElement;
  v2 = [(EDTableStyleElement *)&v4 description];
  return (NSString *)v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mDifferentialStyle, 0);
  objc_storeStrong((id *)&self->mDifferentialStyles, 0);
}

@end