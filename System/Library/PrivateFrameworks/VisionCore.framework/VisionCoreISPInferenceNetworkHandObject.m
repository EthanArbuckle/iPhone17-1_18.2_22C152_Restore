@interface VisionCoreISPInferenceNetworkHandObject
- (VisionCoreISPInferenceNetworkHandObject)initWithANSTHand:(id)a3;
- (int64_t)chirality;
@end

@implementation VisionCoreISPInferenceNetworkHandObject

- (int64_t)chirality
{
  return self->_chirality;
}

- (VisionCoreISPInferenceNetworkHandObject)initWithANSTHand:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)VisionCoreISPInferenceNetworkHandObject;
  v5 = [(VisionCoreISPInferenceNetworkObject *)&v8 initWithANSTObject:v4];
  if (v5)
  {
    if ([v4 chirality] == 1)
    {
      uint64_t v6 = 1;
LABEL_6:
      v5->_chirality = v6;
      goto LABEL_7;
    }
    if ([v4 chirality] == 2)
    {
      uint64_t v6 = 2;
      goto LABEL_6;
    }
  }
LABEL_7:

  return v5;
}

@end