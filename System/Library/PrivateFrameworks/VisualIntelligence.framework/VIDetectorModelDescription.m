@interface VIDetectorModelDescription
- (CGSize)inputImageSize;
- (NSArray)modelOutputs;
- (NSString)modelID;
- (NSURL)modelURL;
- (VIDetectorModelDescription)initWithModelURL:(id)a3 modelID:(id)a4 modelOutputs:(id)a5 inputImageSize:(CGSize)a6;
@end

@implementation VIDetectorModelDescription

- (VIDetectorModelDescription)initWithModelURL:(id)a3 modelID:(id)a4 modelOutputs:(id)a5 inputImageSize:(CGSize)a6
{
  CGFloat height = a6.height;
  CGFloat width = a6.width;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v20.receiver = self;
  v20.super_class = (Class)VIDetectorModelDescription;
  v15 = [(VIDetectorModelDescription *)&v20 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_modelURL, a3);
    objc_storeStrong((id *)&v16->_modelID, a4);
    uint64_t v17 = [v14 copy];
    modelOutputs = v16->_modelOutputs;
    v16->_modelOutputs = (NSArray *)v17;

    v16->_inputImageSize.CGFloat width = width;
    v16->_inputImageSize.CGFloat height = height;
  }

  return v16;
}

- (NSURL)modelURL
{
  return self->_modelURL;
}

- (NSString)modelID
{
  return self->_modelID;
}

- (NSArray)modelOutputs
{
  return self->_modelOutputs;
}

- (CGSize)inputImageSize
{
  double width = self->_inputImageSize.width;
  double height = self->_inputImageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelOutputs, 0);
  objc_storeStrong((id *)&self->_modelID, 0);
  objc_storeStrong((id *)&self->_modelURL, 0);
}

@end