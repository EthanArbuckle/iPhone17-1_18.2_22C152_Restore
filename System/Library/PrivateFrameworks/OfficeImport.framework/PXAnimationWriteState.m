@interface PXAnimationWriteState
- (BOOL)hasMainSeqTimeNodeId;
- (OCXWriteState)writeState;
- (PXAnimationWriteState)initWithWriteState:(id)a3 file:(id)a4;
- (TCXmlPrefixStreamWriter)file;
- (unint64_t)mainSeqTimeNodeId;
- (unint64_t)newCommonTimeNodeDataId;
- (void)setFile:(id)a3;
- (void)setMainSeqTimeNodeId:(unint64_t)a3;
- (void)setWriteState:(id)a3;
@end

@implementation PXAnimationWriteState

- (PXAnimationWriteState)initWithWriteState:(id)a3 file:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXAnimationWriteState;
  v9 = [(PXAnimationWriteState *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->mWriteState, a3);
    objc_storeStrong((id *)&v10->mFile, a4);
    v10->mCommonTimeNodeDataId = 0;
  }

  return v10;
}

- (unint64_t)newCommonTimeNodeDataId
{
  unint64_t v2 = self->mCommonTimeNodeDataId + 1;
  self->mCommonTimeNodeDataId = v2;
  return v2;
}

- (BOOL)hasMainSeqTimeNodeId
{
  return self->mHasMainSeqTimeNodeId;
}

- (void)setMainSeqTimeNodeId:(unint64_t)a3
{
  self->mHasMainSeqTimeNodeId = 1;
  self->mMainSeqTimeNodeId = a3;
}

- (unint64_t)mainSeqTimeNodeId
{
  return self->mMainSeqTimeNodeId;
}

- (OCXWriteState)writeState
{
  return self->mWriteState;
}

- (void)setWriteState:(id)a3
{
}

- (TCXmlPrefixStreamWriter)file
{
  return self->mFile;
}

- (void)setFile:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mFile, 0);
  objc_storeStrong((id *)&self->mWriteState, 0);
}

@end