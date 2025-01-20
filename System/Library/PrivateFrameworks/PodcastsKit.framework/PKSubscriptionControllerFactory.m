@interface PKSubscriptionControllerFactory
+ (id)platformInstance;
- (PKSubscriptionControllerFactory)init;
@end

@implementation PKSubscriptionControllerFactory

+ (id)platformInstance
{
  if (sub_23F0BF520())
  {
    type metadata accessor for MediaAPISubscriptionController();
    v2 = (void *)swift_allocObject();
    sub_23F0BF590();
    swift_allocObject();
    v2[2] = sub_23F0BF580();
  }
  else
  {
    v2 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for MediaRemoteSubscriptionController()), sel_init);
  }
  return v2;
}

- (PKSubscriptionControllerFactory)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SubscriptionControllerFactory();
  return [(PKSubscriptionControllerFactory *)&v3 init];
}

@end