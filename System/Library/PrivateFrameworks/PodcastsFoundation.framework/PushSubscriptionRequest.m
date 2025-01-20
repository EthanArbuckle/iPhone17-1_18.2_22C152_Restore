@interface PushSubscriptionRequest
- (NSDictionary)parameters;
- (_TtC18PodcastsFoundation23PushSubscriptionRequest)init;
- (_TtC18PodcastsFoundation23PushSubscriptionRequest)initWithEndpointURL:(id)a3 action:(id)a4 apnsToken:(id)a5;
- (id)buildURLRequestAndReturnError:(id *)a3;
@end

@implementation PushSubscriptionRequest

- (_TtC18PodcastsFoundation23PushSubscriptionRequest)initWithEndpointURL:(id)a3 action:(id)a4 apnsToken:(id)a5
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v8 = sub_1ACE74F28();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1ACE74E98();
  uint64_t v12 = sub_1ACE761B8();
  uint64_t v14 = v13;
  id v15 = a5;
  uint64_t v16 = sub_1ACE74F88();
  uint64_t v18 = v17;

  (*(void (**)(char *, char *, uint64_t))(v9 + 16))((char *)self + OBJC_IVAR____TtC18PodcastsFoundation23PushSubscriptionRequest_endpointURL, v11, v8);
  v19 = (uint64_t *)((char *)self + OBJC_IVAR____TtC18PodcastsFoundation23PushSubscriptionRequest_action);
  uint64_t *v19 = v12;
  v19[1] = v14;
  v20 = (uint64_t *)((char *)self + OBJC_IVAR____TtC18PodcastsFoundation23PushSubscriptionRequest_apnsToken);
  uint64_t *v20 = v16;
  v20[1] = v18;
  v23.receiver = self;
  v23.super_class = ObjectType;
  v21 = [(PushSubscriptionRequest *)&v23 init];
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return v21;
}

- (NSDictionary)parameters
{
  v2 = self;
  PushSubscriptionRequest.parameters.getter();

  v3 = (void *)sub_1ACE75FC8();
  swift_bridgeObjectRelease();
  return (NSDictionary *)v3;
}

- (id)buildURLRequestAndReturnError:(id *)a3
{
  uint64_t v4 = sub_1ACE74898();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = self;
  PushSubscriptionRequest.buildURLRequest()((uint64_t)v7);

  uint64_t v9 = (void *)sub_1ACE74818();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v9;
}

- (_TtC18PodcastsFoundation23PushSubscriptionRequest)init
{
  result = (_TtC18PodcastsFoundation23PushSubscriptionRequest *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC18PodcastsFoundation23PushSubscriptionRequest_endpointURL;
  uint64_t v4 = sub_1ACE74F28();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  uint64_t v5 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC18PodcastsFoundation23PushSubscriptionRequest_apnsToken);
  unint64_t v6 = *(void *)&self->_anon_0[OBJC_IVAR____TtC18PodcastsFoundation23PushSubscriptionRequest_apnsToken];
  sub_1ACA50850(v5, v6);
}

@end