@interface NSURLConnection(SafariCoreExtras)
+ (WBSAsynchronousRequestHelper)safari_sendAsynchronousRequest:()SafariCoreExtras queue:completionHandler:;
@end

@implementation NSURLConnection(SafariCoreExtras)

+ (WBSAsynchronousRequestHelper)safari_sendAsynchronousRequest:()SafariCoreExtras queue:completionHandler:
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [[WBSAsynchronousRequestHelper alloc] initWithRequest:v9 queue:v8 completionHandler:v7];

  [(WBSAsynchronousRequestHelper *)v10 sendRequest];
  return v10;
}

@end