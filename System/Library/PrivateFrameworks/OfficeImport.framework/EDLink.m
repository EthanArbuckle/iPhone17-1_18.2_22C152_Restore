@interface EDLink
+ (id)linkWithType:(int)a3;
- (EDLink)initWithType:(int)a3;
- (id)description;
- (id)externalNames;
- (int)type;
- (void)setType:(int)a3;
@end

@implementation EDLink

+ (id)linkWithType:(int)a3
{
  v3 = (void *)[objc_alloc((Class)objc_opt_class()) initWithType:*(void *)&a3];
  return v3;
}

- (EDLink)initWithType:(int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)EDLink;
  result = [(EDLink *)&v5 init];
  if (result) {
    result->mType = a3;
  }
  return result;
}

- (int)type
{
  return self->mType;
}

- (id)externalNames
{
  mExternalNames = self->mExternalNames;
  if (!mExternalNames)
  {
    v4 = objc_alloc_init(EDCollection);
    objc_super v5 = self->mExternalNames;
    self->mExternalNames = v4;

    mExternalNames = self->mExternalNames;
  }
  return mExternalNames;
}

- (void)setType:(int)a3
{
  self->mType = a3;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)EDLink;
  v2 = [(EDLink *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
}

@end