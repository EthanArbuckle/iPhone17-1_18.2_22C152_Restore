@interface VisionCoreSparseOpticalFlowResult
- (NSArray)dstPts;
- (NSArray)srcPts;
- (NSUUID)uuid;
- (VisionCoreSparseOpticalFlowResult)initWithQuadUUID:(id)a3 srcKeypoints:(id)a4 dstKeypoints:(id)a5;
@end

@implementation VisionCoreSparseOpticalFlowResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dstPts, 0);
  objc_storeStrong((id *)&self->_srcPts, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

- (NSArray)dstPts
{
  return self->_dstPts;
}

- (NSArray)srcPts
{
  return self->_srcPts;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (VisionCoreSparseOpticalFlowResult)initWithQuadUUID:(id)a3 srcKeypoints:(id)a4 dstKeypoints:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)VisionCoreSparseOpticalFlowResult;
  v12 = [(VisionCoreSparseOpticalFlowResult *)&v19 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_uuid, a3);
    uint64_t v14 = [v10 copy];
    srcPts = v13->_srcPts;
    v13->_srcPts = (NSArray *)v14;

    uint64_t v16 = [v11 copy];
    dstPts = v13->_dstPts;
    v13->_dstPts = (NSArray *)v16;
  }
  return v13;
}

@end