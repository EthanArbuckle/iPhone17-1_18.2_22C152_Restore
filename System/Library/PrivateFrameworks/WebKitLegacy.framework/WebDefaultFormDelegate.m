@interface WebDefaultFormDelegate
+ (id)sharedFormDelegate;
- (BOOL)textField:(id)a3 doCommandBySelector:(SEL)a4 inFrame:(id)a5;
- (void)frame:(id)a3 sourceFrame:(id)a4 willSubmitForm:(id)a5 withValues:(id)a6 submissionListener:(id)a7;
@end

@implementation WebDefaultFormDelegate

+ (id)sharedFormDelegate
{
  id result = (id)sharedFormDelegate_WebSharedDefaultFormDelegate;
  if (!sharedFormDelegate_WebSharedDefaultFormDelegate)
  {
    id result = objc_alloc_init(WebDefaultFormDelegate);
    sharedFormDelegate_WebSharedDefaultFormDelegate = (uint64_t)result;
  }
  return result;
}

- (BOOL)textField:(id)a3 doCommandBySelector:(SEL)a4 inFrame:(id)a5
{
  return 1;
}

- (void)frame:(id)a3 sourceFrame:(id)a4 willSubmitForm:(id)a5 withValues:(id)a6 submissionListener:(id)a7
{
}

@end