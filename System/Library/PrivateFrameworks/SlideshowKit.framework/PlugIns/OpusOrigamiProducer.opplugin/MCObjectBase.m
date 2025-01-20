@interface MCObjectBase
+ (void)initialize;
- (BOOL)isSnapshot;
- (id)imprint;
- (id)snapshot;
- (void)dealloc;
@end

@implementation MCObjectBase

+ (void)initialize
{
  if (!sEmptySet) {
    sEmptySet = (uint64_t)objc_alloc_init((Class)NSSet);
  }
  if (!sEmptyArray) {
    sEmptyArray = (uint64_t)objc_alloc_init((Class)NSArray);
  }
  if (!sEmptyDictionary) {
    sEmptyDictionary = (uint64_t)objc_alloc_init((Class)NSDictionary);
  }
}

- (void)dealloc
{
  [(MCObjectBase *)self demolish];
  v3.receiver = self;
  v3.super_class = (Class)MCObjectBase;
  [(MCObjectBase *)&v3 dealloc];
}

- (BOOL)isSnapshot
{
  return 0;
}

- (id)imprint
{
  return 0;
}

- (id)snapshot
{
  id v3 = objc_alloc_init((Class)objc_opt_class());
  [(MCObjectBase *)self _copySelfToSnapshot:v3];
  return v3;
}

@end