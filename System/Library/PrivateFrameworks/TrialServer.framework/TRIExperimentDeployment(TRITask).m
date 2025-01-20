@interface TRIExperimentDeployment(TRITask)
- (BOOL)hasDeploymentId;
- (id)shortDesc;
- (id)taskTag;
@end

@implementation TRIExperimentDeployment(TRITask)

- (id)shortDesc
{
  id v2 = [NSString alloc];
  v3 = [a1 experimentId];
  v4 = (void *)[v2 initWithFormat:@"%@.%d", v3, objc_msgSend(a1, "deploymentId")];

  return v4;
}

- (id)taskTag
{
  id v2 = NSString;
  v3 = [a1 experimentId];
  if ([a1 hasDeploymentId])
  {
    v4 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(a1, "deploymentId"));
    v5 = [v2 stringWithFormat:@"%@.%@", v3, v4];
  }
  else
  {
    v5 = [v2 stringWithFormat:@"%@.%@", v3, @"_"];
  }

  return v5;
}

- (BOOL)hasDeploymentId
{
  return [a1 deploymentId] != -1;
}

@end