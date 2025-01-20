@interface GPMessagesAppHelper
+ (int)hostPID;
@end

@implementation GPMessagesAppHelper

+ (int)hostPID
{
  v2 = +[_MSMessageAppContext activeExtensionContext];
  if (objc_opt_respondsToSelector())
  {
    if (v2)
    {
      [v2 balloonHostAuditToken:0, 0];
      int v3 = v5;
    }
    else
    {
      int v3 = 0;
    }
  }
  else
  {
    int v3 = -1;
  }

  return v3;
}

@end