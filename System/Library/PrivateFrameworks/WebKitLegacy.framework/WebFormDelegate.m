@interface WebFormDelegate
+ (id)_sharedWebFormDelegate;
- (BOOL)textField:(id)a3 doCommandBySelector:(SEL)a4 inFrame:(id)a5;
- (void)frame:(id)a3 sourceFrame:(id)a4 willSubmitForm:(id)a5 withValues:(id)a6 submissionListener:(id)a7;
@end

@implementation WebFormDelegate

+ (id)_sharedWebFormDelegate
{
  id result = (id)sharedDelegate_1;
  if (!sharedDelegate_1)
  {
    id result = objc_alloc_init(WebFormDelegate);
    sharedDelegate_1 = (uint64_t)result;
  }
  return result;
}

- (BOOL)textField:(id)a3 doCommandBySelector:(SEL)a4 inFrame:(id)a5
{
  return 0;
}

- (void)frame:(id)a3 sourceFrame:(id)a4 willSubmitForm:(id)a5 withValues:(id)a6 submissionListener:(id)a7
{
}

@end