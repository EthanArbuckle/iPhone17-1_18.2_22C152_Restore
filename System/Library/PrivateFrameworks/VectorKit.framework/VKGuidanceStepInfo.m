@interface VKGuidanceStepInfo
- (NSString)roadName;
- (VKGuidanceStepInfo)initWithRoadName:(id)a3 point:(int)a4;
- (int)routePoint;
@end

@implementation VKGuidanceStepInfo

- (void).cxx_destruct
{
}

- (int)routePoint
{
  return self->_routePoint;
}

- (NSString)roadName
{
  return self->_roadName;
}

- (VKGuidanceStepInfo)initWithRoadName:(id)a3 point:(int)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)VKGuidanceStepInfo;
  v8 = [(VKGuidanceStepInfo *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_roadName, a3);
    v9->_routePoint = a4;
  }

  return v9;
}

@end