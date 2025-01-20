@interface GQWrapPointSet
- (GQWrapPointSet)init;
- (void)dealloc;
@end

@implementation GQWrapPointSet

- (GQWrapPointSet)init
{
  v3.receiver = self;
  v3.super_class = (Class)GQWrapPointSet;
  if ([(GQWrapPointSet *)&v3 init]) {
    operator new();
  }
  return 0;
}

- (void)dealloc
{
  mWrapPointSet = (void **)self->mWrapPointSet;
  if (mWrapPointSet)
  {
    sub_9FBC((uint64_t)self->mWrapPointSet, mWrapPointSet[1]);
    operator delete();
  }
  v3.receiver = self;
  v3.super_class = (Class)GQWrapPointSet;
  [(GQWrapPointSet *)&v3 dealloc];
}

@end