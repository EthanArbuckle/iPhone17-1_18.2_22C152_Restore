@interface PXAppleMusicCurationInfo
- (NSArray)performerNames;
- (PXAppleMusicCurationInfo)init;
- (PXAppleMusicCurationInfo)initWithPerformerNames:(id)a3;
@end

@implementation PXAppleMusicCurationInfo

- (void).cxx_destruct
{
}

- (NSArray)performerNames
{
  return self->_performerNames;
}

- (PXAppleMusicCurationInfo)initWithPerformerNames:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXAppleMusicCurationInfo;
  v5 = [(PXAppleMusicCurationInfo *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    performerNames = v5->_performerNames;
    v5->_performerNames = (NSArray *)v6;
  }
  return v5;
}

- (PXAppleMusicCurationInfo)init
{
  return [(PXAppleMusicCurationInfo *)self initWithPerformerNames:MEMORY[0x1E4F1CBF0]];
}

@end