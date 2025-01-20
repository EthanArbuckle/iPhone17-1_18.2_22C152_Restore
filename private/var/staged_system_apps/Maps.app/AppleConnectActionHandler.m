@interface AppleConnectActionHandler
+ (void)performAction:(id)a3 inContext:(id)a4;
@end

@implementation AppleConnectActionHandler

+ (void)performAction:(id)a3 inContext:(id)a4
{
  [a4 chrome:a3];
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  +[MapsAppleConnectAuthViewController presentAppleConnectAuthControllerFrom:v4 withProxyURL:0];
}

@end