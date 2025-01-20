@interface EngagementEventProvider
- (_TtC14NewsEngagement23EngagementEventProvider)init;
- (void)engagement:(id)a3 didUpdateEngagementRequest:(id)a4 placement:(id)a5 serviceType:(id)a6 completion:(id)a7;
- (void)engagement:(id)a3 didUpdateRequest:(id)a4 placement:(id)a5 serviceType:(id)a6;
- (void)engagement:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5;
- (void)engagement:(id)a3 handleEngagementRequest:(id)a4 completion:(id)a5;
@end

@implementation EngagementEventProvider

- (_TtC14NewsEngagement23EngagementEventProvider)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14NewsEngagement23EngagementEventProvider_observersStore) = (Class)MEMORY[0x1E4FBC868];
  uint64_t v4 = OBJC_IVAR____TtC14NewsEngagement23EngagementEventProvider_engagement;
  id v5 = objc_allocWithZone(MEMORY[0x1E4F4DC70]);
  v6 = self;
  *(Class *)((char *)&self->super.isa + v4) = (Class)objc_msgSend(v5, sel_init);

  v8.receiver = v6;
  v8.super_class = ObjectType;
  return [(EngagementEventProvider *)&v8 init];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14NewsEngagement23EngagementEventProvider_engagement);
}

- (void)engagement:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5
{
}

- (void)engagement:(id)a3 handleEngagementRequest:(id)a4 completion:(id)a5
{
}

- (void)engagement:(id)a3 didUpdateEngagementRequest:(id)a4 placement:(id)a5 serviceType:(id)a6 completion:(id)a7
{
  v10 = _Block_copy(a7);
  uint64_t v11 = sub_1BF93D220();
  v13 = v12;
  uint64_t v14 = sub_1BF93D220();
  uint64_t v16 = v15;
  id v17 = a3;
  id v18 = a4;
  v19 = self;
  sub_1BF90D644(a4, v11, v13, v14, v16);
  _Block_release(v10);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)engagement:(id)a3 didUpdateRequest:(id)a4 placement:(id)a5 serviceType:(id)a6
{
  uint64_t v9 = sub_1BF93D220();
  uint64_t v11 = v10;
  uint64_t v12 = sub_1BF93D220();
  uint64_t v14 = v13;
  id v15 = a3;
  id v16 = a4;
  id v17 = self;
  sub_1BF90D9FC(a4, v9, v11, v12, v14);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end