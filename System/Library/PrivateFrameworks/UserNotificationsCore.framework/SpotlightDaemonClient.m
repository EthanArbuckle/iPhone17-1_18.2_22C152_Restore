@interface SpotlightDaemonClient
- (_TtC21UserNotificationsCoreP33_2EBB79DBAE553364D10B28CEFE20CBF021SpotlightDaemonClient)init;
- (void)searchableItemsDidUpdate:(id)a3;
@end

@implementation SpotlightDaemonClient

- (void)searchableItemsDidUpdate:(id)a3
{
  sub_2608DED7C(0, (unint64_t *)&qword_26B3F8150);
  uint64_t v4 = sub_260A84D70();
  v5 = self;
  sub_2609A6A8C(v4);

  swift_bridgeObjectRelease();
}

- (_TtC21UserNotificationsCoreP33_2EBB79DBAE553364D10B28CEFE20CBF021SpotlightDaemonClient)init
{
  v3 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtC21UserNotificationsCoreP33_2EBB79DBAE553364D10B28CEFE20CBF021SpotlightDaemonClient_handler);
  uint64_t v4 = (objc_class *)type metadata accessor for SpotlightDaemonClient();
  void *v3 = 0;
  v3[1] = 0;
  v6.receiver = self;
  v6.super_class = v4;
  return [(SpotlightDaemonClient *)&v6 init];
}

- (void).cxx_destruct
{
  sub_2609477D4(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC21UserNotificationsCoreP33_2EBB79DBAE553364D10B28CEFE20CBF021SpotlightDaemonClient_handler));
}

@end