@interface SXJSONSubscribeAction
+ (Class)classForProtocolProperty:(id)a3 withValue:(id)a4;
@end

@implementation SXJSONSubscribeAction

+ (Class)classForProtocolProperty:(id)a3 withValue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isEqualToString:@"inAppPurchaseIdKey"]
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v8 = objc_opt_class();
  }
  else
  {
    if ([v6 isEqualToString:@"postPurchaseAction"])
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v9 = [v7 objectForKey:@"type"];
        v10 = +[SXClassFactory classForBaseClass:objc_opt_class() type:v9];

        goto LABEL_9;
      }
    }
    v12.receiver = a1;
    v12.super_class = (Class)&OBJC_METACLASS___SXJSONSubscribeAction;
    uint64_t v8 = objc_msgSendSuper2(&v12, sel_classForProtocolProperty_withValue_, v6, v7);
  }
  v10 = (void *)v8;
LABEL_9:

  return (Class)v10;
}

@end