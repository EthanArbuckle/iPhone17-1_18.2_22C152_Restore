@interface PDAnimation
+ (TCEnumerationMap)entranceSubTypeMap;
+ (TCEnumerationMap)exitSubTypeMap;
- (PDAnimation)init;
- (id)addRootTimeNode;
- (id)buildMap;
- (id)description;
- (id)rootTimeNode;
- (void)setBuildMap:(id)a3;
@end

@implementation PDAnimation

- (PDAnimation)init
{
  v3.receiver = self;
  v3.super_class = (Class)PDAnimation;
  return [(PDAnimation *)&v3 init];
}

- (id)addRootTimeNode
{
  mRootTimeNode = self->mRootTimeNode;
  if (!mRootTimeNode)
  {
    v4 = objc_alloc_init(PDRootTimeNode);
    v5 = self->mRootTimeNode;
    self->mRootTimeNode = v4;

    mRootTimeNode = self->mRootTimeNode;
  }
  return mRootTimeNode;
}

- (void)setBuildMap:(id)a3
{
}

+ (TCEnumerationMap)entranceSubTypeMap
{
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_49, 0, &dword_238A75000);
  }
  if (+[PDAnimation entranceSubTypeMap]::onceToken != -1) {
    dispatch_once(&+[PDAnimation entranceSubTypeMap]::onceToken, &__block_literal_global_100);
  }
  v2 = (void *)+[PDAnimation entranceSubTypeMap]::sEntranceSubTypeMap;
  return (TCEnumerationMap *)v2;
}

void __33__PDAnimation_entranceSubTypeMap__block_invoke()
{
  v0 = [[TCEnumerationMap alloc] initWithStructs:&+[PDAnimation entranceSubTypeMap]::PDEntranceAnimSubTypeMap count:54 caseSensitive:1];
  v1 = (void *)+[PDAnimation entranceSubTypeMap]::sEntranceSubTypeMap;
  +[PDAnimation entranceSubTypeMap]::sEntranceSubTypeMap = (uint64_t)v0;
}

+ (TCEnumerationMap)exitSubTypeMap
{
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_782, 0, &dword_238A75000);
  }
  if (+[PDAnimation exitSubTypeMap]::onceToken != -1) {
    dispatch_once(&+[PDAnimation exitSubTypeMap]::onceToken, &__block_literal_global_784);
  }
  v2 = (void *)+[PDAnimation exitSubTypeMap]::sExitSubTypeMap;
  return (TCEnumerationMap *)v2;
}

void __29__PDAnimation_exitSubTypeMap__block_invoke()
{
  v0 = [[TCEnumerationMap alloc] initWithStructs:&+[PDAnimation exitSubTypeMap]::PDExitAnimSubTypeMap count:54 caseSensitive:1];
  v1 = (void *)+[PDAnimation exitSubTypeMap]::sExitSubTypeMap;
  +[PDAnimation exitSubTypeMap]::sExitSubTypeMap = (uint64_t)v0;
}

- (id)rootTimeNode
{
  return self->mRootTimeNode;
}

- (id)buildMap
{
  return self->mBuildMap;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)PDAnimation;
  v2 = [(PDAnimation *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mBuildMap, 0);
  objc_storeStrong((id *)&self->mRootTimeNode, 0);
}

@end