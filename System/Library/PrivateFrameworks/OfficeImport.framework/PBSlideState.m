@interface PBSlideState
- (PBSlideState)init;
- (id)buildOrderMap;
- (unsigned)generateGroupId;
- (void)addBuild:(id)a3 order:(unsigned int)a4;
- (void)reset;
@end

@implementation PBSlideState

- (PBSlideState)init
{
  v6.receiver = self;
  v6.super_class = (Class)PBSlideState;
  v2 = [(PBSlideState *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    mBuildOrderMap = v2->mBuildOrderMap;
    v2->mBuildOrderMap = v3;

    v2->mCurrentGroupId = 0;
  }
  return v2;
}

- (void)reset
{
  self->mCurrentGroupId = 0;
}

- (void)addBuild:(id)a3 order:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  if (v6)
  {
    id v12 = v6;
    while (1)
    {
      mBuildOrderMap = self->mBuildOrderMap;
      v8 = [NSNumber numberWithUnsignedInt:v4];
      v9 = [(NSMutableDictionary *)mBuildOrderMap objectForKey:v8];

      if (!v9) {
        break;
      }
      uint64_t v4 = (v4 + 1);
    }
    v10 = self->mBuildOrderMap;
    v11 = [NSNumber numberWithUnsignedInt:v4];
    [(NSMutableDictionary *)v10 setObject:v12 forKey:v11];

    id v6 = v12;
  }
}

- (id)buildOrderMap
{
  return self->mBuildOrderMap;
}

- (unsigned)generateGroupId
{
  unsigned int mCurrentGroupId = self->mCurrentGroupId;
  self->unsigned int mCurrentGroupId = mCurrentGroupId + 1;
  return mCurrentGroupId;
}

- (void).cxx_destruct
{
}

@end