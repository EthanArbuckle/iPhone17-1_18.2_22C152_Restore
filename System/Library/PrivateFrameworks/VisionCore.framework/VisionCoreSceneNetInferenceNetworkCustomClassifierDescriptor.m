@interface VisionCoreSceneNetInferenceNetworkCustomClassifierDescriptor
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)inputBlobName;
- (NSString)outputBlobName;
- (NSURL)labelsFileURL;
- (NSURL)modelFileURL;
- (VisionCoreSceneNetInferenceNetworkCustomClassifierDescriptor)initWithCoder:(id)a3;
- (VisionCoreSceneNetInferenceNetworkCustomClassifierDescriptor)initWithModelFileURL:(id)a3 labelsFileURL:(id)a4 inputBlobName:(id)a5 outputBlobName:(id)a6;
- (void)encodeWithCoder:(id)a3;
@end

@implementation VisionCoreSceneNetInferenceNetworkCustomClassifierDescriptor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputBlobName, 0);
  objc_storeStrong((id *)&self->_inputBlobName, 0);
  objc_storeStrong((id *)&self->_labelsFileURL, 0);
  objc_storeStrong((id *)&self->_modelFileURL, 0);
}

- (NSString)outputBlobName
{
  return self->_outputBlobName;
}

- (NSString)inputBlobName
{
  return self->_inputBlobName;
}

- (NSURL)labelsFileURL
{
  return self->_labelsFileURL;
}

- (NSURL)modelFileURL
{
  return self->_modelFileURL;
}

- (VisionCoreSceneNetInferenceNetworkCustomClassifierDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = [v4 decodeObjectOfClass:v5 forKey:@"modelFileURL"];
  v7 = [v4 decodeObjectOfClass:v5 forKey:@"labelsFileURL"];
  uint64_t v8 = objc_opt_class();
  v9 = [v4 decodeObjectOfClass:v8 forKey:@"inputBlobName"];
  v10 = [v4 decodeObjectOfClass:v8 forKey:@"outputBlobName"];

  v11 = [(VisionCoreSceneNetInferenceNetworkCustomClassifierDescriptor *)self initWithModelFileURL:v6 labelsFileURL:v7 inputBlobName:v9 outputBlobName:v10];
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  modelFileURL = self->_modelFileURL;
  id v5 = a3;
  [v5 encodeObject:modelFileURL forKey:@"modelFileURL"];
  [v5 encodeObject:self->_labelsFileURL forKey:@"labelsFileURL"];
  [v5 encodeObject:self->_inputBlobName forKey:@"inputBlobName"];
  [v5 encodeObject:self->_outputBlobName forKey:@"outputBlobName"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (VisionCoreSceneNetInferenceNetworkCustomClassifierDescriptor *)a3;
  if (v4 == self)
  {
    char v17 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      v6 = [(VisionCoreSceneNetInferenceNetworkCustomClassifierDescriptor *)self modelFileURL];
      v7 = [(VisionCoreSceneNetInferenceNetworkCustomClassifierDescriptor *)v5 modelFileURL];
      int v8 = [v6 isEqual:v7];

      if (!v8) {
        goto LABEL_9;
      }
      v9 = [(VisionCoreSceneNetInferenceNetworkCustomClassifierDescriptor *)self labelsFileURL];
      v10 = [(VisionCoreSceneNetInferenceNetworkCustomClassifierDescriptor *)v5 labelsFileURL];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_9;
      }
      v12 = [(VisionCoreSceneNetInferenceNetworkCustomClassifierDescriptor *)self inputBlobName];
      v13 = [(VisionCoreSceneNetInferenceNetworkCustomClassifierDescriptor *)v5 inputBlobName];
      int v14 = [v12 isEqualToString:v13];

      if (v14)
      {
        v15 = [(VisionCoreSceneNetInferenceNetworkCustomClassifierDescriptor *)self outputBlobName];
        v16 = [(VisionCoreSceneNetInferenceNetworkCustomClassifierDescriptor *)v5 outputBlobName];
        char v17 = [v15 isEqualToString:v16];
      }
      else
      {
LABEL_9:
        char v17 = 0;
      }
    }
    else
    {
      char v17 = 0;
    }
  }

  return v17;
}

- (VisionCoreSceneNetInferenceNetworkCustomClassifierDescriptor)initWithModelFileURL:(id)a3 labelsFileURL:(id)a4 inputBlobName:(id)a5 outputBlobName:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)VisionCoreSceneNetInferenceNetworkCustomClassifierDescriptor;
  v15 = [(VisionCoreSceneNetInferenceNetworkCustomClassifierDescriptor *)&v22 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_modelFileURL, a3);
    objc_storeStrong((id *)&v16->_labelsFileURL, a4);
    uint64_t v17 = [v13 copy];
    inputBlobName = v16->_inputBlobName;
    v16->_inputBlobName = (NSString *)v17;

    uint64_t v19 = [v14 copy];
    outputBlobName = v16->_outputBlobName;
    v16->_outputBlobName = (NSString *)v19;
  }
  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end