@interface PBFontEntity
- (PBFontEntity)initWithName:(id)a3 charSet:(int)a4 type:(int)a5 family:(int)a6;
- (id)faceName;
- (int)charSet;
- (int)family;
- (int)type;
@end

@implementation PBFontEntity

- (PBFontEntity)initWithName:(id)a3 charSet:(int)a4 type:(int)a5 family:(int)a6
{
  id v10 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PBFontEntity;
  v11 = [(PBFontEntity *)&v15 init];
  if (v11)
  {
    uint64_t v12 = [[NSString alloc] initWithString:v10];
    mFaceName = v11->mFaceName;
    v11->mFaceName = (NSString *)v12;

    v11->mCharSet = a4;
    v11->mType = a5;
    v11->mFamily = a6;
  }

  return v11;
}

- (id)faceName
{
  return self->mFaceName;
}

- (int)charSet
{
  return self->mCharSet;
}

- (int)type
{
  return self->mType;
}

- (int)family
{
  return self->mFamily;
}

- (void).cxx_destruct
{
}

@end