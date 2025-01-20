@interface NSObject(MainThreadMessaging)
- (uint64_t)mf_performOnewaySelectorInMainThread:()MainThreadMessaging withObject:withObject:;
@end

@implementation NSObject(MainThreadMessaging)

- (uint64_t)mf_performOnewaySelectorInMainThread:()MainThreadMessaging withObject:withObject:
{
  uint64_t v12 = a5;
  uint64_t v13 = a4;
  v8 = objc_msgSend(a1, "methodSignatureForSelector:");
  if (!v8) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"MainThread.m", 24, @"Couldn't find signature for target %p selector %@", a1, NSStringFromSelector(a3));
  }
  unint64_t v9 = [v8 numberOfArguments];
  v10 = (void *)[MEMORY[0x1E4F1CA18] invocationWithMethodSignature:v8];
  [v10 retainArguments];
  [v10 setTarget:a1];
  [v10 setSelector:a3];
  if (v9 >= 3)
  {
    [v10 setArgument:&v13 atIndex:2];
    if (v9 != 3) {
      [v10 setArgument:&v12 atIndex:3];
    }
  }
  return [v10 performSelectorOnMainThread:sel_invoke withObject:0 waitUntilDone:0];
}

@end