@interface MCAsset
- (BOOL)isInUse;
- (MCAsset)initWithImprint:(id)a3 andMontage:(id)a4;
- (NSString)path;
- (id)description;
- (id)imprint;
- (void)_copySelfToSnapshot:(id)a3;
- (void)demolish;
- (void)setPath:(id)a3;
@end

@implementation MCAsset

- (MCAsset)initWithImprint:(id)a3 andMontage:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)MCAsset;
  v5 = [(MCObject *)&v7 initWithImprint:a3 andMontage:a4];
  if (v5) {
    v5->mPath = (NSString *)[a3 objectForKey:@"path"];
  }
  return v5;
}

- (void)demolish
{
  self->mPath = 0;
  v3.receiver = self;
  v3.super_class = (Class)MCAsset;
  [(MCObject *)&v3 demolish];
}

- (id)imprint
{
  v7.receiver = self;
  v7.super_class = (Class)MCAsset;
  id v3 = [(MCObject *)&v7 imprint];
  v4 = v3;
  mPath = self->mPath;
  if (mPath) {
    [v3 setObject:mPath forKey:@"path"];
  }
  return v4;
}

- (BOOL)isInUse
{
  return 0;
}

- (void)_copySelfToSnapshot:(id)a3
{
  *((void *)a3 + 1) = self->super.mMontage;
  mPath = self->mPath;
  if (mPath) {
    *((void *)a3 + 3) = [(NSString *)mPath copy];
  }
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)MCAsset;
  return +[NSString stringWithFormat:@"%@: '%@'", [(MCAsset *)&v3 description], self->mPath];
}

- (NSString)path
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPath:(id)a3
{
}

@end