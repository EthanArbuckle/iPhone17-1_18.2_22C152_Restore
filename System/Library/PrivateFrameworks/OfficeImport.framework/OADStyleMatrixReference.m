@interface OADStyleMatrixReference
+ (OADStyleMatrixReference)styleMatrixReferenceWithMatrixIndex:(unint64_t)a3 color:(id)a4;
- (OADStyleMatrixReference)initWithMatrixIndex:(unint64_t)a3 color:(id)a4;
- (id)color;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)matrixIndex;
- (void)setColor:(id)a3;
- (void)setMatrixIndex:(unint64_t)a3;
@end

@implementation OADStyleMatrixReference

- (void)setMatrixIndex:(unint64_t)a3
{
  self->mMatrixIndex = a3;
}

- (void)setColor:(id)a3
{
}

- (unint64_t)matrixIndex
{
  return self->mMatrixIndex;
}

- (id)color
{
  return self->mColor;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_alloc_init((Class)objc_opt_class());
  v5[1] = self->mMatrixIndex;
  id v6 = [(OADColor *)self->mColor copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  return v5;
}

- (OADStyleMatrixReference)initWithMatrixIndex:(unint64_t)a3 color:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)OADStyleMatrixReference;
  v8 = [(OADStyleMatrixReference *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->mMatrixIndex = a3;
    objc_storeStrong((id *)&v8->mColor, a4);
  }

  return v9;
}

+ (OADStyleMatrixReference)styleMatrixReferenceWithMatrixIndex:(unint64_t)a3 color:(id)a4
{
  id v5 = a4;
  id v6 = [[OADStyleMatrixReference alloc] initWithMatrixIndex:a3 color:v5];

  return v6;
}

- (id)description
{
  v3 = +[OITSUDescription descriptionWithObject:self class:objc_opt_class()];
  objc_msgSend(v3, "addField:format:", @"MatrixIndex", @"%ld", self->mMatrixIndex);
  v4 = [(OADColor *)self->mColor description];
  [v3 addField:@"Color" value:v4];

  id v5 = [v3 descriptionString];

  return v5;
}

- (void).cxx_destruct
{
}

@end