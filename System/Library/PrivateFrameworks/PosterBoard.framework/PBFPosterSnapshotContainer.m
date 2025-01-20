@interface PBFPosterSnapshotContainer
- (PBFPosterSnapshotContainer)initWithPosterSnapshot:(id)a3 imageBlockSet:(CGImageBlockSet *)a4;
- (PRSPosterSnapshot)posterSnapshot;
- (void)dealloc;
@end

@implementation PBFPosterSnapshotContainer

- (PBFPosterSnapshotContainer)initWithPosterSnapshot:(id)a3 imageBlockSet:(CGImageBlockSet *)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PBFPosterSnapshotContainer;
  v8 = [(PBFPosterSnapshotContainer *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_posterSnapshot, a3);
    if (a4)
    {
      CGImageBlockSetRetain();
      v9->_imageBlockSet = a4;
    }
  }

  return v9;
}

- (void)dealloc
{
  if (self->_imageBlockSet) {
    CGImageBlockSetRelease();
  }
  v3.receiver = self;
  v3.super_class = (Class)PBFPosterSnapshotContainer;
  [(PBFPosterSnapshotContainer *)&v3 dealloc];
}

- (PRSPosterSnapshot)posterSnapshot
{
  return self->_posterSnapshot;
}

- (void).cxx_destruct
{
}

@end