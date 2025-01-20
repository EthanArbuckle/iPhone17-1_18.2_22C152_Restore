@interface NSInvocation(TSUAdditions)
+ (void)tsu_invocationWithBlock:()TSUAdditions;
@end

@implementation NSInvocation(TSUAdditions)

+ (void)tsu_invocationWithBlock:()TSUAdditions
{
  id v6 = (id)[a3 copy];
  v4 = objc_msgSend(a1, "invocationWithMethodSignature:", objc_msgSend(a1, "methodSignatureForSelector:", sel_tsu_executeBlock_));
  [v4 setTarget:a1];
  [v4 setSelector:sel_tsu_executeBlock_];
  [v4 setArgument:&v6 atIndex:2];
  [v4 retainArguments];

  return v4;
}

@end