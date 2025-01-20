@interface UIDidTakeScreenshotAction
- (int64_t)UIActionType;
@end

@implementation UIDidTakeScreenshotAction

- (int64_t)UIActionType
{
  return 18;
}

@end