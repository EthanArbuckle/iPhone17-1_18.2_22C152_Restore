@interface NSInvocation(MailExtensions)
+ (void)mf_invocationWithSelector:()MailExtensions target:;
+ (void)mf_invocationWithSelector:()MailExtensions target:object1:object2:;
+ (void)mf_invocationWithSelector:()MailExtensions target:object:;
- (uint64_t)mf_shouldLogInvocation;
@end

@implementation NSInvocation(MailExtensions)

+ (void)mf_invocationWithSelector:()MailExtensions target:object:
{
  uint64_t v7 = a5;
  v5 = objc_msgSend(a1, "mf_invocationWithSelector:target:");
  if ((unint64_t)objc_msgSend((id)objc_msgSend(v5, "methodSignature"), "numberOfArguments") >= 3) {
    [v5 setArgument:&v7 atIndex:2];
  }
  return v5;
}

+ (void)mf_invocationWithSelector:()MailExtensions target:
{
  uint64_t v7 = objc_msgSend(a4, "methodSignatureForSelector:");
  if (!v7) {
    return 0;
  }
  v8 = (void *)[a1 invocationWithMethodSignature:v7];
  [v8 retainArguments];
  [v8 setSelector:a3];
  [v8 setTarget:a4];
  return v8;
}

+ (void)mf_invocationWithSelector:()MailExtensions target:object1:object2:
{
  uint64_t v8 = a6;
  v6 = objc_msgSend(a1, "mf_invocationWithSelector:target:object:");
  if ((unint64_t)objc_msgSend((id)objc_msgSend(v6, "methodSignature"), "numberOfArguments") >= 4) {
    [v6 setArgument:&v8 atIndex:3];
  }
  return v6;
}

- (uint64_t)mf_shouldLogInvocation
{
  return 0;
}

@end