@interface VFXExportOperation
- (BOOL)succeded;
- (float)progress;
- (id)error;
@end

@implementation VFXExportOperation

- (id)error
{
  return 0;
}

- (BOOL)succeded
{
  return 1;
}

- (float)progress
{
  return 0.0;
}

@end