@interface CRLUSDRenderingExtension.APIEndpointCoordinator.APIEndpoint
- (void)didTeardownCoreRERendererForUUID:(id)a3;
- (void)getExtensionProcessIDWithResponse:(id)a3;
- (void)makeCoreRERendererProxyForUUID:(id)a3 delegateProxy:(id)a4 flags:(unint64_t)a5 response:(id)a6;
@end

@implementation CRLUSDRenderingExtension.APIEndpointCoordinator.APIEndpoint

- (void)getExtensionProcessIDWithResponse:(id)a3
{
  v3 = (void (**)(void *, id))_Block_copy(a3);
  v4 = self;
  swift_retain();
  id v5 = [v4 processInfo];
  id v6 = [v5 processIdentifier];

  v3[2](v3, v6);
  _Block_release(v3);

  swift_release();
}

- (void)makeCoreRERendererProxyForUUID:(id)a3 delegateProxy:(id)a4 flags:(unint64_t)a5 response:(id)a6
{
  uint64_t v10 = sub_100015F58(&qword_100094C30);
  __chkstk_darwin(v10 - 8);
  v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = _Block_copy(a6);
  uint64_t v14 = sub_10005E720();
  uint64_t v16 = v15;
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v13;
  uint64_t v18 = sub_10005E880();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v12, 1, 1, v18);
  sub_10005E860();
  swift_unknownObjectRetain_n();
  swift_retain_n();
  swift_bridgeObjectRetain();
  swift_retain();
  uint64_t v19 = sub_10005E850();
  v20 = (void *)swift_allocObject();
  v20[2] = v19;
  v20[3] = &protocol witness table for MainActor;
  v20[4] = self;
  v20[5] = v14;
  v20[6] = v16;
  v20[7] = a4;
  v20[8] = a5;
  v20[9] = sub_10005BA68;
  v20[10] = v17;
  sub_1000364B4((uint64_t)v12, (uint64_t)&unk_100095728, (uint64_t)v20);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_unknownObjectRelease();
}

- (void)didTeardownCoreRERendererForUUID:(id)a3
{
  uint64_t v3 = sub_100015F58(&qword_100094C30);
  __chkstk_darwin(v3 - 8);
  id v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10005E720();
  uint64_t v8 = v7;
  uint64_t v9 = sub_10005E880();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v5, 1, 1, v9);
  uint64_t v10 = swift_allocObject();
  swift_weakInit();
  sub_10005E860();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  uint64_t v11 = sub_10005E850();
  v12 = (void *)swift_allocObject();
  v12[2] = v11;
  v12[3] = &protocol witness table for MainActor;
  v12[4] = v10;
  v12[5] = v6;
  v12[6] = v8;
  swift_release();
  sub_100036660((uint64_t)v5, (uint64_t)&unk_100095718, (uint64_t)v12);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
}

@end