@interface IdentifyUserIntentHandler
- (_TtC20SiriIdentityInternal25IdentifyUserIntentHandler)init;
- (void)confirmUserIdentify:(UserIdentifyIntent *)a3 completion:(id)a4;
- (void)handleUserIdentify:(UserIdentifyIntent *)a3 completion:(id)a4;
- (void)resolveIdentityForUserIdentify:(UserIdentifyIntent *)a3 withCompletion:(id)a4;
@end

@implementation IdentifyUserIntentHandler

- (void)resolveIdentityForUserIdentify:(UserIdentifyIntent *)a3 withCompletion:(id)a4
{
}

- (void)confirmUserIdentify:(UserIdentifyIntent *)a3 completion:(id)a4
{
}

- (void)handleUserIdentify:(UserIdentifyIntent *)a3 completion:(id)a4
{
}

- (_TtC20SiriIdentityInternal25IdentifyUserIntentHandler)init
{
  return (_TtC20SiriIdentityInternal25IdentifyUserIntentHandler *)IdentifyUserIntentHandler.init()();
}

@end