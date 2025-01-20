@interface NotificationPendingResponse
- (BOOL)isNotificationPending;
- (NSString)debugDescription;
- (NSString)description;
- (_TtC33iCloudSubscriptionOptimizerClient27NotificationPendingResponse)init;
- (id)error;
- (id)maxDelayTimestampMillis;
@end

@implementation NotificationPendingResponse

- (BOOL)isNotificationPending
{
  return (self->responseError[OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient27NotificationPendingResponse_maxDelayTsMillis] & 1) == 0
      && *(Class *)((char *)&self->super.super.isa
                  + OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient27NotificationPendingResponse_responseError) == 0;
}

- (id)maxDelayTimestampMillis
{
  if (self->responseError[OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient27NotificationPendingResponse_maxDelayTsMillis]) {
    id v2 = 0;
  }
  else {
    id v2 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithLongLong_, *(Class *)((char *)&self->super.super.isa+ OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient27NotificationPendingResponse_maxDelayTsMillis));
  }
  return v2;
}

- (id)error
{
  id v2 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient27NotificationPendingResponse_responseError);
  if (v2)
  {
    id v3 = v2;
    v4 = (void *)sub_228AACF30();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (NSString)description
{
  id v2 = self;
  sub_228A9E6E8();

  id v3 = (void *)sub_228AAD650();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (NSString)debugDescription
{
  id v2 = self;
  id v3 = [(NotificationPendingResponse *)v2 description];
  sub_228AAD660();

  v4 = (void *)sub_228AAD650();
  swift_bridgeObjectRelease();
  return (NSString *)v4;
}

- (_TtC33iCloudSubscriptionOptimizerClient27NotificationPendingResponse)init
{
  result = (_TtC33iCloudSubscriptionOptimizerClient27NotificationPendingResponse *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient27NotificationPendingResponse_responseError));
}

@end