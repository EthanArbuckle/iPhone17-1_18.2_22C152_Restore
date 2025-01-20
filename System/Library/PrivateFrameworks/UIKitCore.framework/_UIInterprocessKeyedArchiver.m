@interface _UIInterprocessKeyedArchiver
- (BOOL)_ui_isInterprocess;
@end

@implementation _UIInterprocessKeyedArchiver

- (BOOL)_ui_isInterprocess
{
  return 1;
}

@end