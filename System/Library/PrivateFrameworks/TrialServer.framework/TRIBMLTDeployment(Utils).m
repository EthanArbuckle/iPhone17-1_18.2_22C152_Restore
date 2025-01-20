@interface TRIBMLTDeployment(Utils)
- (id)shortDesc;
- (id)taskTag;
@end

@implementation TRIBMLTDeployment(Utils)

- (id)shortDesc
{
  id v2 = [NSString alloc];
  v3 = [a1 backgroundMLTaskId];
  v4 = (void *)[v2 initWithFormat:@"%@.%d", v3, objc_msgSend(a1, "deploymentId")];

  return v4;
}

- (id)taskTag
{
  id v2 = [NSString alloc];
  v3 = [a1 backgroundMLTaskId];
  v4 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(a1, "deploymentId"));
  v5 = (void *)[v2 initWithFormat:@"%@.%@", v3, v4];

  return v5;
}

@end