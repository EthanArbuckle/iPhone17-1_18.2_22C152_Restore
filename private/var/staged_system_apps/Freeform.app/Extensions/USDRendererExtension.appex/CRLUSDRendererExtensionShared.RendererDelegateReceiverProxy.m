@interface CRLUSDRendererExtensionShared.RendererDelegateReceiverProxy
- (_TtCO20USDRendererExtension29CRLUSDRendererExtensionShared29RendererDelegateReceiverProxy)init;
- (void)rendererSharedTextureChangedXPC:(id)a3 deviceID:(unint64_t)a4 textureHandle:(id)a5 rendererFrameCountHandle:(id)a6 displayerFrameCountHandle:(id)a7 response:(id)a8;
- (void)rendererStateChanged:(id)a3 state:(id)a4;
- (void)rendererStateChangedWithAcknowledge:(id)a3 state:(id)a4 response:(id)a5;
@end

@implementation CRLUSDRendererExtensionShared.RendererDelegateReceiverProxy

- (void)rendererStateChanged:(id)a3 state:(id)a4
{
  uint64_t v6 = sub_10005DED0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10005DEB0();
  id v10 = a4;
  v11 = self;
  uint64_t v12 = sub_10005DE30();
  unint64_t v14 = v13;

  sub_100012DE8(v9, v12, v14);
  sub_100016114(v12, v14);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)rendererStateChangedWithAcknowledge:(id)a3 state:(id)a4 response:(id)a5
{
  uint64_t v8 = sub_10005DED0();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  sub_10005DEB0();
  id v13 = a4;
  unint64_t v14 = self;
  uint64_t v15 = sub_10005DE30();
  unint64_t v17 = v16;

  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = v12;
  sub_100013594((uint64_t)v11, v15, v17, (uint64_t)sub_100019F58, v18);
  swift_release();
  sub_100016114(v15, v17);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)rendererSharedTextureChangedXPC:(id)a3 deviceID:(unint64_t)a4 textureHandle:(id)a5 rendererFrameCountHandle:(id)a6 displayerFrameCountHandle:(id)a7 response:(id)a8
{
  uint64_t v14 = sub_10005DED0();
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  unint64_t v17 = (char *)&v24 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = _Block_copy(a8);
  sub_10005DEB0();
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = v18;
  id v20 = a5;
  id v21 = a6;
  id v22 = a7;
  v23 = self;
  sub_100014040((uint64_t)v17, a4, v20, v21, v22, (uint64_t)sub_100016DF0, v19);

  swift_release();
  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
}

- (_TtCO20USDRendererExtension29CRLUSDRendererExtensionShared29RendererDelegateReceiverProxy)init
{
  result = (_TtCO20USDRendererExtension29CRLUSDRendererExtensionShared29RendererDelegateReceiverProxy *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end