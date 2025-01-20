@interface TCMessagePlaceholderInfo
- (BOOL)isInUse;
- (TCMessagePlaceholderInfo)init;
- (id)key;
- (void)dealloc;
- (void)setInUse:(BOOL)a3;
@end

@implementation TCMessagePlaceholderInfo

- (TCMessagePlaceholderInfo)init
{
  v5.receiver = self;
  v5.super_class = (Class)TCMessagePlaceholderInfo;
  v2 = [(TCMessagePlaceholderInfo *)&v5 init];
  if (v2)
  {
    id v3 = objc_alloc((Class)NSNumber);
    ++dword_5733A0;
    v2->mKey = [v3 initWithInt:];
    v2->mInUse = 0;
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TCMessagePlaceholderInfo;
  [(TCMessagePlaceholderInfo *)&v3 dealloc];
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

@end