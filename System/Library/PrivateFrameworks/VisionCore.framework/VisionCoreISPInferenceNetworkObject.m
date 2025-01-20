@interface VisionCoreISPInferenceNetworkObject
- (CGRect)boundingBox;
- (VisionCoreISPInferenceNetworkObject)initWithANSTObject:(id)a3;
- (unint64_t)confidence;
- (unint64_t)groupID;
@end

@implementation VisionCoreISPInferenceNetworkObject

- (unint64_t)confidence
{
  return self->_confidence;
}

- (CGRect)boundingBox
{
  double x = self->_boundingBox.origin.x;
  double y = self->_boundingBox.origin.y;
  double width = self->_boundingBox.size.width;
  double height = self->_boundingBox.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (unint64_t)groupID
{
  return self->_groupID;
}

- (VisionCoreISPInferenceNetworkObject)initWithANSTObject:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)VisionCoreISPInferenceNetworkObject;
  v5 = [(VisionCoreISPInferenceNetworkObject *)&v11 init];
  if (v5)
  {
    [v4 boundingBox];
    v5->_boundingBox.origin.double x = v6;
    v5->_boundingBox.origin.double y = v7;
    v5->_boundingBox.size.double width = v8;
    v5->_boundingBox.size.double height = v9;
    v5->_groupID = [v4 groupID];
    v5->_confidence = [v4 confidence];
  }

  return v5;
}

@end