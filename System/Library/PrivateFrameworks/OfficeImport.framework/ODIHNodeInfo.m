@interface ODIHNodeInfo
- (BOOL)connectToVerticalSide;
- (ODIHNodeInfo)init;
- (ODIHRange)xRange;
- (float)xOffsetRelativeToParent;
- (int)extraRowsBetweenParentAndSelf;
- (int)row;
- (int)treeDepth;
- (void)addToXOffsetRelativeToParent:(float)a3;
- (void)dealloc;
- (void)setConnectToVerticalSide:(BOOL)a3;
- (void)setExtraRowsBetweenParentAndSelf:(int)a3;
- (void)setRow:(int)a3;
- (void)setTreeDepth:(int)a3;
- (void)setXOffsetRelativeToParent:(float)a3;
- (void)setXRange:(ODIHRange)a3;
- (void)xRanges;
@end

@implementation ODIHNodeInfo

- (ODIHNodeInfo)init
{
  v4.receiver = self;
  v4.super_class = (Class)ODIHNodeInfo;
  v2 = [(ODIHNodeInfo *)&v4 init];
  if (v2)
  {
    *(void *)&v2->mTreeDepth = -1;
    v2->mExtraRowsBetweenParentAndSelf = 0;
    v2->mXRange = 0;
    v2->mConnectToVerticalSide = 0;
    operator new();
  }
  return 0;
}

- (void)dealloc
{
  mXRanges = (void **)self->mXRanges;
  if (mXRanges)
  {
    objc_super v4 = *mXRanges;
    if (*mXRanges)
    {
      mXRanges[1] = v4;
      operator delete(v4);
    }
    MEMORY[0x23EC997B0](mXRanges, 0x20C40960023A9);
  }
  v5.receiver = self;
  v5.super_class = (Class)ODIHNodeInfo;
  [(ODIHNodeInfo *)&v5 dealloc];
}

- (ODIHRange)xRange
{
  float mMid = self->mXRange.mMid;
  float mLength = self->mXRange.mLength;
  result.float mLength = mLength;
  result.float mMid = mMid;
  return result;
}

- (void)setXRange:(ODIHRange)a3
{
  self->mXRange = a3;
}

- (int)treeDepth
{
  return self->mTreeDepth;
}

- (void)setTreeDepth:(int)a3
{
  self->mTreeDepth = a3;
}

- (int)row
{
  return self->mRow;
}

- (void)setRow:(int)a3
{
  self->mRow = a3;
}

- (BOOL)connectToVerticalSide
{
  return self->mConnectToVerticalSide;
}

- (void)setConnectToVerticalSide:(BOOL)a3
{
  self->mConnectToVerticalSide = a3;
}

- (int)extraRowsBetweenParentAndSelf
{
  return self->mExtraRowsBetweenParentAndSelf;
}

- (void)setExtraRowsBetweenParentAndSelf:(int)a3
{
  self->mExtraRowsBetweenParentAndSelf = a3;
}

- (float)xOffsetRelativeToParent
{
  return self->mXOffsetRelativeToParent;
}

- (void)setXOffsetRelativeToParent:(float)a3
{
  self->mXOffsetRelativeToParent = a3;
}

- (void)addToXOffsetRelativeToParent:(float)a3
{
  self->mXOffsetRelativeToParent = self->mXOffsetRelativeToParent + a3;
}

- (void)xRanges
{
  return self->mXRanges;
}

@end