@interface EDRun
+ (id)runWithCharIndex:(unint64_t)a3 font:(id)a4 effects:(id)a5 resources:(id)a6;
+ (id)runWithCharIndex:(unint64_t)a3 font:(id)a4 resources:(id)a5;
+ (id)runWithCharIndex:(unint64_t)a3 fontIndex:(unint64_t)a4 effects:(id)a5 resources:(id)a6;
+ (id)runWithCharIndex:(unint64_t)a3 fontIndex:(unint64_t)a4 resources:(id)a5;
+ (id)runWithResources:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToRun:(id)a3;
- (EDRun)initWithCharIndex:(unint64_t)a3 font:(id)a4 effects:(id)a5 resources:(id)a6;
- (EDRun)initWithCharIndex:(unint64_t)a3 font:(id)a4 resources:(id)a5;
- (EDRun)initWithCharIndex:(unint64_t)a3 fontIndex:(unint64_t)a4 effects:(id)a5 resources:(id)a6;
- (EDRun)initWithCharIndex:(unint64_t)a3 fontIndex:(unint64_t)a4 resources:(id)a5;
- (EDRun)initWithResources:(id)a3;
- (NSString)description;
- (id)effects;
- (id)font;
- (int64_t)key;
- (unint64_t)charIndex;
- (unint64_t)fontIndex;
- (unint64_t)hash;
- (void)adjustIndex:(unint64_t)a3;
- (void)setCharIndex:(unint64_t)a3;
- (void)setFont:(id)a3;
- (void)setFontIndex:(unint64_t)a3;
@end

@implementation EDRun

+ (id)runWithCharIndex:(unint64_t)a3 fontIndex:(unint64_t)a4 resources:(id)a5
{
  id v7 = a5;
  v8 = (void *)[objc_alloc((Class)objc_opt_class()) initWithCharIndex:a3 fontIndex:a4 resources:v7];

  return v8;
}

- (EDRun)initWithCharIndex:(unint64_t)a3 fontIndex:(unint64_t)a4 resources:(id)a5
{
  result = [(EDRun *)self initWithResources:a5];
  if (result)
  {
    result->mCharIndex = a3;
    result->mFontIndex = a4;
  }
  return result;
}

- (EDRun)initWithResources:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EDRun;
  v5 = [(EDRun *)&v9 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->mResources, v4);
    v6->mCharIndex = 0;
    v6->mFontIndex = 0;
    mEffects = v6->mEffects;
    v6->mEffects = 0;
  }
  return v6;
}

- (int64_t)key
{
  return self->mCharIndex;
}

- (unint64_t)charIndex
{
  return self->mCharIndex;
}

- (id)font
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  id v4 = [WeakRetained fonts];

  v5 = [v4 objectAtIndex:self->mFontIndex];

  return v5;
}

+ (id)runWithCharIndex:(unint64_t)a3 font:(id)a4 resources:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  objc_super v9 = (void *)[objc_alloc((Class)objc_opt_class()) initWithCharIndex:a3 font:v7 resources:v8];

  return v9;
}

- (EDRun)initWithCharIndex:(unint64_t)a3 font:(id)a4 resources:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v10 = [(EDRun *)self initWithResources:v9];
  v11 = v10;
  if (v10)
  {
    v10->mCharIndex = a3;
    [(EDRun *)v10 setFont:v8];
  }

  return v11;
}

- (void)setFont:(id)a3
{
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  v5 = [WeakRetained fonts];

  self->mFontIndex = [v5 addOrEquivalentObject:v6];
}

- (unint64_t)fontIndex
{
  return self->mFontIndex;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (EDRun *)a3;
  v5 = (objc_object **)v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && TCObjectEqual((objc_object *)self->mEffects, v5[4])
      && [(EDRun *)self isEqualToRun:v5];

  return v6;
}

- (BOOL)isEqualToRun:(id)a3
{
  return self->mFontIndex == *((void *)a3 + 3) && self->mCharIndex == *((void *)a3 + 2);
}

- (EDRun)initWithCharIndex:(unint64_t)a3 font:(id)a4 effects:(id)a5 resources:(id)a6
{
  id v11 = a5;
  v12 = [(EDRun *)self initWithCharIndex:a3 font:a4 resources:a6];
  v13 = v12;
  if (v12) {
    objc_storeStrong((id *)&v12->mEffects, a5);
  }

  return v13;
}

+ (id)runWithResources:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithResources:v3];

  return v4;
}

+ (id)runWithCharIndex:(unint64_t)a3 font:(id)a4 effects:(id)a5 resources:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  v12 = (void *)[objc_alloc((Class)objc_opt_class()) initWithCharIndex:a3 font:v9 effects:v10 resources:v11];

  return v12;
}

- (unint64_t)hash
{
  unint64_t v2 = (self->mFontIndex << 8) + (self->mCharIndex << 16);
  return v2 + [(NSArray *)self->mEffects count];
}

- (void)adjustIndex:(unint64_t)a3
{
  self->mCharIndex += a3;
}

- (void)setCharIndex:(unint64_t)a3
{
  self->mCharIndex = a3;
}

- (id)effects
{
  return self->mEffects;
}

- (NSString)description
{
  v4.receiver = self;
  v4.super_class = (Class)EDRun;
  unint64_t v2 = [(EDRun *)&v4 description];
  return (NSString *)v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mEffects, 0);
  objc_destroyWeak((id *)&self->mResources);
}

- (EDRun)initWithCharIndex:(unint64_t)a3 fontIndex:(unint64_t)a4 effects:(id)a5 resources:(id)a6
{
  id v11 = a5;
  v12 = [(EDRun *)self initWithCharIndex:a3 fontIndex:a4 resources:a6];
  v13 = v12;
  if (v12) {
    objc_storeStrong((id *)&v12->mEffects, a5);
  }

  return v13;
}

+ (id)runWithCharIndex:(unint64_t)a3 fontIndex:(unint64_t)a4 effects:(id)a5 resources:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  id v11 = (void *)[objc_alloc((Class)objc_opt_class()) initWithCharIndex:a3 fontIndex:a4 effects:v9 resources:v10];

  return v11;
}

- (void)setFontIndex:(unint64_t)a3
{
  self->mFontIndex = a3;
}

@end