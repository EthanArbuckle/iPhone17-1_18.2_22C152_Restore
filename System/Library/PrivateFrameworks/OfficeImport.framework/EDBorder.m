@interface EDBorder
+ (id)borderWithType:(int)a3 color:(id)a4 diagonalType:(int)a5 resources:(id)a6;
+ (id)borderWithType:(int)a3 color:(id)a4 resources:(id)a5;
+ (id)borderWithType:(int)a3 colorReference:(id)a4 diagonalType:(int)a5 resources:(id)a6;
+ (id)borderWithType:(int)a3 colorReference:(id)a4 resources:(id)a5;
+ (id)borderWithType:(int)a3 resources:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToBorder:(id)a3;
- (EDBorder)initWithResources:(id)a3;
- (id)color;
- (id)colorReference;
- (id)description;
- (int)diagonalType;
- (int)type;
- (unint64_t)hash;
- (void)setDiagonalType:(int)a3;
- (void)setType:(int)a3;
@end

@implementation EDBorder

+ (id)borderWithType:(int)a3 colorReference:(id)a4 resources:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  v9 = [a1 borderWithType:v6 resources:a5];
  v10 = (void *)v9[3];
  v9[3] = v8;

  return v9;
}

+ (id)borderWithType:(int)a3 resources:(id)a4
{
  id v5 = a4;
  uint64_t v6 = (_DWORD *)[objc_alloc((Class)objc_opt_class()) initWithResources:v5];
  v6[4] = a3;

  return v6;
}

- (EDBorder)initWithResources:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)EDBorder;
  id v5 = [(EDBorder *)&v8 init];
  uint64_t v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->mResources, v4);
    v6->mType = 0;
    v6->mDiagonalType = 0;
  }

  return v6;
}

+ (id)borderWithType:(int)a3 colorReference:(id)a4 diagonalType:(int)a5 resources:(id)a6
{
  v7 = [a1 borderWithType:*(void *)&a3 colorReference:a4 resources:a6];
  v7[8] = a5;
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (EDBorder *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(EDBorder *)self isEqualToBorder:v5];

  return v6;
}

- (BOOL)isEqualToBorder:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->mType == *((_DWORD *)v4 + 4) && self->mDiagonalType == *((_DWORD *)v4 + 8))
  {
    mColorReference = self->mColorReference;
    if (mColorReference == (EDColorReference *)v5[3]) {
      char v7 = 1;
    }
    else {
      char v7 = -[EDColorReference isEqual:](mColorReference, "isEqual:");
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (int)type
{
  return self->mType;
}

- (id)color
{
  return [(EDColorReference *)self->mColorReference color];
}

- (id)colorReference
{
  return self->mColorReference;
}

- (int)diagonalType
{
  return self->mDiagonalType;
}

+ (id)borderWithType:(int)a3 color:(id)a4 resources:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [a1 borderWithType:v6 resources:v9];
  v11 = [[EDColorReference alloc] initWithColor:v8 resources:v9];
  v12 = (void *)v10[3];
  v10[3] = v11;

  return v10;
}

+ (id)borderWithType:(int)a3 color:(id)a4 diagonalType:(int)a5 resources:(id)a6
{
  char v7 = [a1 borderWithType:*(void *)&a3 color:a4 resources:a6];
  v7[8] = a5;
  return v7;
}

- (unint64_t)hash
{
  int v2 = (self->mDiagonalType << 8) + (self->mType << 16);
  return [(EDColorReference *)self->mColorReference hash] + v2;
}

- (void)setType:(int)a3
{
  self->mType = a3;
}

- (void)setDiagonalType:(int)a3
{
  self->mDiagonalType = a3;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)EDBorder;
  int v2 = [(EDBorder *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mColorReference, 0);
  objc_destroyWeak((id *)&self->mResources);
}

@end