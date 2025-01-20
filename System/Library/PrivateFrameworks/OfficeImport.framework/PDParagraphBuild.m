@interface PDParagraphBuild
- (BOOL)isEqual:(id)a3;
- (BOOL)isReversedParagraphOrder;
- (PDParagraphBuild)init;
- (double)autoAdvanceTime;
- (id)addTimeNodeData;
- (id)timeNodeDataAtIndex:(unint64_t)a3;
- (id)timeNodeDataList;
- (int)buildLevel;
- (int)type;
- (unint64_t)hash;
- (unint64_t)timeNodeDataListCount;
- (void)setAutoAdvanceTime:(double)a3;
- (void)setBuildLevel:(int)a3;
- (void)setIsReversedParagraphOrder:(BOOL)a3;
- (void)setType:(int)a3;
@end

@implementation PDParagraphBuild

- (PDParagraphBuild)init
{
  v6.receiver = self;
  v6.super_class = (Class)PDParagraphBuild;
  v2 = [(PDBuild *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    mTimeNodeDataList = v2->mTimeNodeDataList;
    v2->mTimeNodeDataList = v3;

    v2->mType = 4;
  }
  return v2;
}

- (void)setAutoAdvanceTime:(double)a3
{
  self->mAutoAdvanceTime = a3;
}

- (void)setBuildLevel:(int)a3
{
  self->mBuildLevel = a3;
}

- (void)setIsReversedParagraphOrder:(BOOL)a3
{
  self->mIsReversedParagraphOrder = a3;
}

- (void)setType:(int)a3
{
  self->mType = a3;
}

- (unint64_t)timeNodeDataListCount
{
  return [(NSMutableArray *)self->mTimeNodeDataList count];
}

- (id)timeNodeDataAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->mTimeNodeDataList objectAtIndex:a3];
}

- (id)addTimeNodeData
{
  v3 = objc_alloc_init(PDTimeNode);
  [(NSMutableArray *)self->mTimeNodeDataList addObject:v3];
  return v3;
}

- (id)timeNodeDataList
{
  return self->mTimeNodeDataList;
}

- (double)autoAdvanceTime
{
  return self->mAutoAdvanceTime;
}

- (BOOL)isReversedParagraphOrder
{
  return self->mIsReversedParagraphOrder;
}

- (int)buildLevel
{
  return self->mBuildLevel;
}

- (int)type
{
  return self->mType;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  objc_super v6 = TSUDynamicCast(v5, (uint64_t)v4);
  v7 = v6;
  if (!v6) {
    goto LABEL_10;
  }
  double mAutoAdvanceTime = self->mAutoAdvanceTime;
  [v6 autoAdvanceTime];
  if (mAutoAdvanceTime != v9) {
    goto LABEL_10;
  }
  int mIsReversedParagraphOrder = self->mIsReversedParagraphOrder;
  if (mIsReversedParagraphOrder != [v7 isReversedParagraphOrder]) {
    goto LABEL_10;
  }
  int mBuildLevel = self->mBuildLevel;
  if (mBuildLevel != [v7 buildLevel]) {
    goto LABEL_10;
  }
  int mType = self->mType;
  if (mType != [v7 type]) {
    goto LABEL_10;
  }
  mTimeNodeDataList = self->mTimeNodeDataList;
  v14 = [v7 timeNodeDataList];
  LOBYTE(mTimeNodeDataList) = (mTimeNodeDataList != 0) ^ (v14 == 0);

  if ((mTimeNodeDataList & 1) == 0) {
    goto LABEL_10;
  }
  v15 = self->mTimeNodeDataList;
  if (!v15
    || ([v7 timeNodeDataList],
        v16 = objc_claimAutoreleasedReturnValue(),
        char v17 = [(NSMutableArray *)v15 isEqual:v16],
        v16,
        (v17 & 1) != 0))
  {

    v20.receiver = self;
    v20.super_class = (Class)PDParagraphBuild;
    BOOL v18 = [(PDBuild *)&v20 isEqual:v4];
  }
  else
  {
LABEL_10:

    BOOL v18 = 0;
  }

  return v18;
}

- (unint64_t)hash
{
  unint64_t v3 = ((unint64_t)self->mAutoAdvanceTime << 8)
     + ([(NSMutableArray *)self->mTimeNodeDataList count] << 16);
  uint64_t v4 = self->mType ^ self->mBuildLevel;
  v6.receiver = self;
  v6.super_class = (Class)PDParagraphBuild;
  return v3 + ([(PDBuild *)&v6 hash] ^ v4);
}

- (void).cxx_destruct
{
}

@end