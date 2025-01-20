@interface EDPatternFill
+ (id)patternFillWithType:(int)a3 foreColor:(id)a4 backColor:(id)a5 resources:(id)a6;
+ (id)patternFillWithType:(int)a3 foreColor:(id)a4 resources:(id)a5;
+ (id)patternFillWithType:(int)a3 foreColorReference:(id)a4 backColorReference:(id)a5 resources:(id)a6;
+ (id)patternFillWithType:(int)a3 resources:(id)a4;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPatternFill:(id)a3;
- (EDPatternFill)initWithResources:(id)a3;
- (EDPatternFill)initWithType:(int)a3 foreColor:(id)a4 backColor:(id)a5 resources:(id)a6;
- (EDPatternFill)initWithType:(int)a3 foreColorReference:(id)a4 backColorReference:(id)a5 resources:(id)a6;
- (id)backColor;
- (id)backColorReference;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)foreColor;
- (id)foreColorReference;
- (int)type;
- (unint64_t)hash;
- (void)setBackColor:(id)a3;
- (void)setBackColorReference:(id)a3;
- (void)setForeColor:(id)a3;
- (void)setForeColorReference:(id)a3;
- (void)setType:(int)a3;
@end

@implementation EDPatternFill

- (EDPatternFill)initWithResources:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)EDPatternFill;
  result = [(EDFill *)&v4 initWithResources:a3];
  if (result) {
    result->mType = 0;
  }
  return result;
}

- (void)setType:(int)a3
{
  self->mType = a3;
}

- (void)setForeColorReference:(id)a3
{
  v5 = (EDColorReference *)a3;
  if (self->mForeColorReference != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->mForeColorReference, a3);
    v5 = v6;
  }
}

- (void)setBackColorReference:(id)a3
{
  v5 = (EDColorReference *)a3;
  if (self->mBackColorReference != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->mBackColorReference, a3);
    v5 = v6;
  }
}

- (BOOL)isEqual:(id)a3
{
  objc_super v4 = (EDPatternFill *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(EDPatternFill *)self isEqualToPatternFill:v5];

  return v6;
}

- (BOOL)isEqualToPatternFill:(id)a3
{
  objc_super v4 = (EDColorReference **)a3;
  mForeColorReference = self->mForeColorReference;
  BOOL v7 = (mForeColorReference == v4[4] || -[EDColorReference isEqual:](mForeColorReference, "isEqual:"))
    && ((mBackColorReference = self->mBackColorReference, mBackColorReference == v4[3])
     || -[EDColorReference isEqual:](mBackColorReference, "isEqual:"))
    && self->mType == *((_DWORD *)v4 + 4);

  return v7;
}

- (int)type
{
  return self->mType;
}

- (id)foreColor
{
  return [(EDColorReference *)self->mForeColorReference color];
}

- (id)backColor
{
  return [(EDColorReference *)self->mBackColorReference color];
}

+ (id)patternFillWithType:(int)a3 foreColorReference:(id)a4 backColorReference:(id)a5 resources:(id)a6
{
  uint64_t v8 = *(void *)&a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = (void *)[objc_alloc((Class)a1) initWithType:v8 foreColorReference:v10 backColorReference:v11 resources:v12];

  return v13;
}

- (EDPatternFill)initWithType:(int)a3 foreColorReference:(id)a4 backColorReference:(id)a5 resources:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = [(EDPatternFill *)self initWithResources:v12];
  v14 = v13;
  if (v13)
  {
    v13->mType = a3;
    [(EDPatternFill *)v13 setBackColorReference:v11];
    [(EDPatternFill *)v14 setForeColorReference:v10];
  }

  return v14;
}

- (EDPatternFill)initWithType:(int)a3 foreColor:(id)a4 backColor:(id)a5 resources:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v24.receiver = self;
  v24.super_class = (Class)EDPatternFill;
  v13 = [(EDFill *)&v24 initWithResources:v12];
  v14 = v13;
  if (v13)
  {
    v13->mType = a3;
    v15 = [EDColorReference alloc];
    id WeakRetained = objc_loadWeakRetained((id *)&v14->super.mResources);
    uint64_t v17 = [(EDColorReference *)v15 initWithColor:v11 resources:WeakRetained];
    mBackColorReference = v14->mBackColorReference;
    v14->mBackColorReference = (EDColorReference *)v17;

    v19 = [EDColorReference alloc];
    id v20 = objc_loadWeakRetained((id *)&v14->super.mResources);
    uint64_t v21 = [(EDColorReference *)v19 initWithColor:v10 resources:v20];
    mForeColorReference = v14->mForeColorReference;
    v14->mForeColorReference = (EDColorReference *)v21;
  }
  return v14;
}

- (void)setForeColor:(id)a3
{
  id v8 = a3;
  objc_super v4 = [EDColorReference alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->super.mResources);
  BOOL v6 = [(EDColorReference *)v4 initWithColor:v8 resources:WeakRetained];
  mForeColorReference = self->mForeColorReference;
  self->mForeColorReference = v6;
}

- (void)setBackColor:(id)a3
{
  id v8 = a3;
  objc_super v4 = [EDColorReference alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->super.mResources);
  BOOL v6 = [(EDColorReference *)v4 initWithColor:v8 resources:WeakRetained];
  mBackColorReference = self->mBackColorReference;
  self->mBackColorReference = v6;
}

+ (id)patternFillWithType:(int)a3 resources:(id)a4
{
  v5 = [a1 fillWithResources:a4];
  v5[4] = a3;
  return v5;
}

+ (id)patternFillWithType:(int)a3 foreColor:(id)a4 resources:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  v9 = [a1 patternFillWithType:v6 resources:a5];
  [v9 setForeColor:v8];

  return v9;
}

+ (id)patternFillWithType:(int)a3 foreColor:(id)a4 backColor:(id)a5 resources:(id)a6
{
  uint64_t v8 = *(void *)&a3;
  id v10 = a5;
  id v11 = [a1 patternFillWithType:v8 foreColor:a4 resources:a6];
  [v11 setBackColor:v10];

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)EDPatternFill;
  objc_super v4 = [(EDFill *)&v10 copyWithZone:a3];
  uint64_t v5 = [(EDColorReference *)self->mBackColorReference copy];
  uint64_t v6 = (void *)v4[3];
  v4[3] = v5;

  uint64_t v7 = [(EDColorReference *)self->mForeColorReference copy];
  uint64_t v8 = (void *)v4[4];
  v4[4] = v7;

  return v4;
}

- (unint64_t)hash
{
  int v3 = self->mType << 16;
  unint64_t v4 = ([(EDColorReference *)self->mBackColorReference hash] << 8) + v3;
  return v4 + [(EDColorReference *)self->mForeColorReference hash];
}

- (BOOL)isEmpty
{
  return self->mType == 0;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)EDPatternFill;
  v2 = [(EDFill *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mForeColorReference, 0);
  objc_storeStrong((id *)&self->mBackColorReference, 0);
}

- (id)foreColorReference
{
  return self->mForeColorReference;
}

- (id)backColorReference
{
  return self->mBackColorReference;
}

@end