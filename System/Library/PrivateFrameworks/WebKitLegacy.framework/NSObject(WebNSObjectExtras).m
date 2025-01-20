@interface NSObject(WebNSObjectExtras)
+ (id)_webkit_invokeOnMainThread;
- (id)_webkit_invokeOnMainThread;
@end

@implementation NSObject(WebNSObjectExtras)

+ (id)_webkit_invokeOnMainThread
{
  v1 = (void *)CFMakeCollectable([[WebMainThreadInvoker alloc] initWithTarget:a1]);
  return v1;
}

- (id)_webkit_invokeOnMainThread
{
  v1 = (void *)CFMakeCollectable([[WebMainThreadInvoker alloc] initWithTarget:a1]);
  return v1;
}

@end