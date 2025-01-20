@interface VUIDeviceMediaLibrary
- (BOOL)didFailUpdateCloudLibrary;
- (BOOL)isInitialUpdateInProgress;
- (BOOL)isUpdating;
- (void)updateProgressWithCompletionHandler:(id)a3;
@end

@implementation VUIDeviceMediaLibrary

- (BOOL)isUpdating
{
  return 0;
}

- (BOOL)isInitialUpdateInProgress
{
  return 0;
}

- (BOOL)didFailUpdateCloudLibrary
{
  return 0;
}

- (void)updateProgressWithCompletionHandler:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (!v3)
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"The %@ parameter must not be nil.", @"completionHandler" format];
    id v3 = 0;
  }
  (*((void (**)(float))v3 + 2))(1.0);
}

@end