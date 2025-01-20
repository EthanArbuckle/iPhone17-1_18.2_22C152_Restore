@interface PDAnimationCacheState
- (BOOL)isValid:(id)a3;
- (PDAnimationCacheState)init;
- (id)mediaNodeMap;
@end

@implementation PDAnimationCacheState

- (PDAnimationCacheState)init
{
  v6.receiver = self;
  v6.super_class = (Class)PDAnimationCacheState;
  v2 = [(PDAnimationCacheState *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(OITSUNoCopyDictionary);
    mMediaNodeMap = v2->mMediaNodeMap;
    v2->mMediaNodeMap = v3;
  }
  return v2;
}

- (BOOL)isValid:(id)a3
{
  return 1;
}

- (id)mediaNodeMap
{
  return self->mMediaNodeMap;
}

- (void).cxx_destruct
{
}

@end