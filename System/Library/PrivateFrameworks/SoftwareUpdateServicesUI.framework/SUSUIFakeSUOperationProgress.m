@interface SUSUIFakeSUOperationProgress
- (BOOL)isDone;
- (double)timeRemaining;
- (float)normalizedPercentComplete;
- (float)percentComplete;
- (id)phase;
@end

@implementation SUSUIFakeSUOperationProgress

- (id)phase
{
  return @"Blah";
}

- (float)percentComplete
{
  return 1.0;
}

- (float)normalizedPercentComplete
{
  return 1.0;
}

- (double)timeRemaining
{
  return -1.0;
}

- (BOOL)isDone
{
  return 1;
}

@end