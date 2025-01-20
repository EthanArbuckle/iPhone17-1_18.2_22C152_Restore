@interface XpcSubscriptionServerDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC33iCloudSubscriptionOptimizerDaemon29XpcSubscriptionServerDelegate)init;
- (void)dealloc;
@end

@implementation XpcSubscriptionServerDelegate

- (_TtC33iCloudSubscriptionOptimizerDaemon29XpcSubscriptionServerDelegate)init
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for XpcSubscriptionServerDelegate();
  v2 = [(XpcSubscriptionServerDelegate *)&v5 init];
  if (qword_26AF370A8 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_22A59A3C8();
  __swift_project_value_buffer(v3, (uint64_t)qword_26AF37090);
  sub_22A59A378();
  return v2;
}

- (void)dealloc
{
  uint64_t v2 = qword_26AF370A8;
  uint64_t v3 = self;
  if (v2 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_22A59A3C8();
  __swift_project_value_buffer(v4, (uint64_t)qword_26AF37090);
  sub_22A59A378();
  v5.receiver = v3;
  v5.super_class = (Class)type metadata accessor for XpcSubscriptionServerDelegate();
  [(XpcSubscriptionServerDelegate *)&v5 dealloc];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_22A597D70(v7);

  return v9 & 1;
}

@end