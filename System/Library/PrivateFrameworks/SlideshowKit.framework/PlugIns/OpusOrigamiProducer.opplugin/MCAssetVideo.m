@interface MCAssetVideo
- (BOOL)isInUse;
- (NSSet)slides;
- (void)addSlide:(id)a3;
- (void)demolish;
- (void)removeSlide:(id)a3;
@end

@implementation MCAssetVideo

- (void)demolish
{
  objc_sync_enter(self);
  mSlides = self->mSlides;
  if (mSlides)
  {
    [(NSMutableArray *)mSlides removeAllObjects];
  }
  self->mSlides = 0;
  objc_sync_exit(self);
  v4.receiver = self;
  v4.super_class = (Class)MCAssetVideo;
  [(MCAsset *)&v4 demolish];
}

- (BOOL)isInUse
{
  return self->mSlides != 0;
}

- (NSSet)slides
{
  objc_sync_enter(self);
  if (self->mSlides) {
    v3 = +[NSSet setWithArray:](NSSet, "setWithArray:");
  }
  else {
    v3 = (NSSet *)sEmptySet;
  }
  objc_sync_exit(self);
  return v3;
}

- (void)addSlide:(id)a3
{
  objc_sync_enter(self);
  mSlides = self->mSlides;
  if (!mSlides)
  {
    mSlides = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    self->mSlides = mSlides;
  }
  [(NSMutableArray *)mSlides addObject:a3];
  objc_sync_exit(self);
}

- (void)removeSlide:(id)a3
{
  objc_sync_enter(self);
  [(NSMutableArray *)self->mSlides removeObjectAtIndex:[(NSMutableArray *)self->mSlides indexOfObject:a3]];
  if (![(NSMutableArray *)self->mSlides count])
  {

    self->mSlides = 0;
  }
  objc_sync_exit(self);
}

@end