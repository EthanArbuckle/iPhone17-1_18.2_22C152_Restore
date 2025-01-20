@interface InAppMessageContextProvider
- (BOOL)allowsModalMessageDisplay;
- (_TtC16NewsSubscriptionP33_2BC9D414A52E1C4290962E677FF5534227InAppMessageContextProvider)init;
- (id)contextPropertyWithName:(id)a3;
- (id)viewControllerForModalPresentation;
@end

@implementation InAppMessageContextProvider

- (id)contextPropertyWithName:(id)a3
{
  return 0;
}

- (BOOL)allowsModalMessageDisplay
{
  return 1;
}

- (id)viewControllerForModalPresentation
{
  v3 = self;
  v4 = self;
  id v5 = objc_msgSend(v3, sel_sharedApplication);
  id v6 = objc_msgSend(v5, sel_key_window);

  if (v6)
  {
    v7 = (_TtC16NewsSubscriptionP33_2BC9D414A52E1C4290962E677FF5534227InAppMessageContextProvider *)objc_msgSend(v6, sel_rootViewController);

    if (v7)
    {
      id v6 = (id)sub_1BFBD4A28();

      v4 = v7;
    }
    else
    {
      id v6 = 0;
    }
  }

  return v6;
}

- (_TtC16NewsSubscriptionP33_2BC9D414A52E1C4290962E677FF5534227InAppMessageContextProvider)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(InAppMessageContextProvider *)&v3 init];
}

@end