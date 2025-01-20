@interface TCMessagePlaceholderInfo
- (BOOL)isInUse;
- (TCMessagePlaceholderInfo)init;
- (id)key;
- (void)setInUse:(BOOL)a3;
@end

@implementation TCMessagePlaceholderInfo

- (TCMessagePlaceholderInfo)init
{
  v7.receiver = self;
  v7.super_class = (Class)TCMessagePlaceholderInfo;
  v2 = [(TCMessagePlaceholderInfo *)&v7 init];
  if (v2)
  {
    id v3 = objc_alloc(NSNumber);
    ++-[TCMessagePlaceholderInfo init]::sKey;
    uint64_t v4 = objc_msgSend(v3, "initWithInt:");
    id mKey = v2->mKey;
    v2->id mKey = (id)v4;

    v2->mInUse = 0;
  }
  return v2;
}

- (id)key
{
  return self->mKey;
}

- (BOOL)isInUse
{
  return self->mInUse;
}

- (void)setInUse:(BOOL)a3
{
  self->mInUse = a3;
}

- (void).cxx_destruct
{
}

@end