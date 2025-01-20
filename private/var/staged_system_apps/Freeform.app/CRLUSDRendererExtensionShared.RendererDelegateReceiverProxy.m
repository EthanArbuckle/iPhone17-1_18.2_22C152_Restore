@interface CRLUSDRendererExtensionShared.RendererDelegateReceiverProxy
- (_TtCO8Freeform29CRLUSDRendererExtensionShared29RendererDelegateReceiverProxy)init;
- (void)rendererSharedTextureChangedXPC:(id)a3 deviceID:(unint64_t)a4 textureHandle:(id)a5 rendererFrameCountHandle:(id)a6 displayerFrameCountHandle:(id)a7 response:(id)a8;
- (void)rendererStateChanged:(id)a3 state:(id)a4;
- (void)rendererStateChangedWithAcknowledge:(id)a3 state:(id)a4 response:(id)a5;
@end

@implementation CRLUSDRendererExtensionShared.RendererDelegateReceiverProxy

- (void)rendererStateChanged:(id)a3 state:(id)a4
{
  uint64_t v6 = type metadata accessor for UUID();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  id v11 = a4;
  v12 = self;
  uint64_t v13 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v15 = v14;

  sub_1007C97F0(v10, v13, v15);
  sub_100510084(v13, v15);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
}

- (void)rendererStateChangedWithAcknowledge:(id)a3 state:(id)a4 response:(id)a5
{
  uint64_t v8 = type metadata accessor for UUID();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8, v10);
  v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = _Block_copy(a5);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  id v14 = a4;
  unint64_t v15 = self;
  uint64_t v16 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v18 = v17;

  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = v13;
  sub_1007C9DF4((uint64_t)v12, v16, v18, (uint64_t)sub_1007CFC70, v19);
  swift_release();
  sub_100510084(v16, v18);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
}

- (void)rendererSharedTextureChangedXPC:(id)a3 deviceID:(unint64_t)a4 textureHandle:(id)a5 rendererFrameCountHandle:(id)a6 displayerFrameCountHandle:(id)a7 response:(id)a8
{
  uint64_t v14 = type metadata accessor for UUID();
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14, v16);
  unint64_t v18 = (char *)&v25 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = _Block_copy(a8);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = v19;
  id v21 = a5;
  id v22 = a6;
  id v23 = a7;
  v24 = self;
  sub_1007CA70C((uint64_t)v18, a4, v21, v22, v23, (uint64_t)sub_1007CD66C, v20);

  swift_release();
  (*(void (**)(char *, uint64_t))(v15 + 8))(v18, v14);
}

- (_TtCO8Freeform29CRLUSDRendererExtensionShared29RendererDelegateReceiverProxy)init
{
  result = (_TtCO8Freeform29CRLUSDRendererExtensionShared29RendererDelegateReceiverProxy *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end