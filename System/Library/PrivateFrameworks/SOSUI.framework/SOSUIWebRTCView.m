@interface SOSUIWebRTCView
- (BOOL)resetAndReturnError:(id *)a3;
- (WKWebView)webView;
- (_TtC5SOSUI15SOSUIWebRTCView)initWithCoder:(id)a3;
- (_TtC5SOSUI15SOSUIWebRTCView)initWithFrame:(CGRect)a3;
- (_TtC5SOSUI16SOSUIWebRTCState)state;
- (_TtP5SOSUI19SOSUIWebRTCDelegate_)delegate;
- (void)dealloc;
- (void)endVideoPreviewWithCompletionHandler:(id)a3;
- (void)endVideoStreamWithCompletionHandler:(id)a3;
- (void)flipCameraWithCompletionHandler:(id)a3;
- (void)getCapabilitiesWithCompletionHandler:(id)a3;
- (void)goToErrorWithRetryable:(BOOL)a3 completionHandler:(id)a4;
- (void)networkInterfacesDidChangeWithCompletionHandler:(id)a3;
- (void)pauseVideoWithCompletionHandler:(id)a3;
- (void)pauseVideoWithPausedString:(NSString *)a3 completionHandler:(id)a4;
- (void)setDebugConnection:(BOOL)a3 completionHandler:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setFrameRate:(double)a3 completionHandler:(id)a4;
- (void)setIceRestartRetryCount:(double)a3 completionHandler:(id)a4;
- (void)setIceRestartTimeout:(double)a3 completionHandler:(id)a4;
- (void)setMaximumBitrate:(double)a3 completionHandler:(id)a4;
- (void)setMinimumBitrate:(double)a3 completionHandler:(id)a4;
- (void)setPausedString:(NSString *)a3 completionHandler:(id)a4;
- (void)setPoorConnectionGracePeriod:(double)a3 completionHandler:(id)a4;
- (void)setPoorConnectionThreshold:(double)a3 completionHandler:(id)a4;
- (void)setState:(id)a3;
- (void)setVideoPreference:(int64_t)a3 completionHandler:(id)a4;
- (void)setWebView:(id)a3;
- (void)setZoomLevelWithZoom:(double)a3 completionHandler:(id)a4;
- (void)startVideoPreviewWithCameraFacing:(int64_t)a3 completionHandler:(id)a4;
- (void)startVideoPreviewWithCompletionHandler:(id)a3;
- (void)startVideoStreamWithEndpoint:(NSString *)a3 completionHandler:(id)a4;
- (void)startVideoStreamWithEndpoint:(NSString *)a3 token:(NSString *)a4 completionHandler:(id)a5;
- (void)startVideoStreamWithEndpoint:(NSString *)a3 token:(NSString *)a4 trickle:(BOOL)a5 completionHandler:(id)a6;
- (void)toggleTorchWithCompletionHandler:(id)a3;
- (void)torchOffWithCompletionHandler:(id)a3;
- (void)torchOnWithCompletionHandler:(id)a3;
- (void)unpauseVideoWithCompletionHandler:(id)a3;
- (void)useFrontCameraWithCompletionHandler:(id)a3;
- (void)useRearCameraWithCompletionHandler:(id)a3;
- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5;
- (void)webView:(id)a3 didFinishNavigation:(id)a4;
- (void)webView:(id)a3 didReceiveAuthenticationChallenge:(id)a4 completionHandler:(id)a5;
- (void)webView:(id)a3 requestMediaCapturePermissionForOrigin:(id)a4 initiatedByFrame:(id)a5 type:(int64_t)a6 decisionHandler:(id)a7;
@end

@implementation SOSUIWebRTCView

- (_TtC5SOSUI16SOSUIWebRTCState)state
{
  v2 = (id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5SOSUI15SOSUIWebRTCView_state);
  swift_beginAccess();
  return (_TtC5SOSUI16SOSUIWebRTCState *)*v2;
}

- (void)setState:(id)a3
{
  v4 = (void **)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5SOSUI15SOSUIWebRTCView_state);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  id v6 = a3;
}

- (WKWebView)webView
{
  v2 = (id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5SOSUI15SOSUIWebRTCView_webView);
  swift_beginAccess();
  return (WKWebView *)*v2;
}

- (void)setWebView:(id)a3
{
  v4 = (void **)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5SOSUI15SOSUIWebRTCView_webView);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  id v6 = a3;
}

- (_TtP5SOSUI19SOSUIWebRTCDelegate_)delegate
{
  v2 = (char *)self + OBJC_IVAR____TtC5SOSUI15SOSUIWebRTCView_delegate;
  swift_beginAccess();
  v3 = (void *)MEMORY[0x261167390](v2);
  return (_TtP5SOSUI19SOSUIWebRTCDelegate_ *)v3;
}

- (void)setDelegate:(id)a3
{
}

- (_TtC5SOSUI15SOSUIWebRTCView)initWithCoder:(id)a3
{
  return (_TtC5SOSUI15SOSUIWebRTCView *)SOSUIWebRTCView.init(coder:)(a3);
}

- (void)dealloc
{
  v2 = self;
  SOSUIWebRTCView.__deallocating_deinit();
}

- (void).cxx_destruct
{
  sub_25B6BF054((uint64_t)self + OBJC_IVAR____TtC5SOSUI15SOSUIWebRTCView_delegate);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5SOSUI15SOSUIWebRTCView_onNavigationFinished);
  sub_25B6BF07C(v3);
}

- (BOOL)resetAndReturnError:(id *)a3
{
  v4 = self;
  SOSUIWebRTCView.reset()();

  if (v5)
  {
    if (a3)
    {
      id v6 = (void *)sub_25B6D2910();

      id v7 = v6;
      *a3 = v6;
    }
    else
    {
    }
  }
  return v5 == 0;
}

- (void)webView:(id)a3 requestMediaCapturePermissionForOrigin:(id)a4 initiatedByFrame:(id)a5 type:(int64_t)a6 decisionHandler:(id)a7
{
  v11 = _Block_copy(a7);
  v12 = (void (*)(void *, uint64_t))v11[2];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  v16 = self;
  v12(v11, 1);
  _Block_release(v11);
}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  v4 = *(void (**)(id))((char *)&self->super.super.super.isa
                                 + OBJC_IVAR____TtC5SOSUI15SOSUIWebRTCView_onNavigationFinished);
  if (v4)
  {
    if (a4)
    {
      id v7 = a3;
      id v8 = a4;
      v9 = self;
      sub_25B6C15D8((uint64_t)v4);
      v4(v8);
      sub_25B6BF07C((uint64_t)v4);
    }
    else
    {
      __break(1u);
    }
  }
}

- (void)webView:(id)a3 didReceiveAuthenticationChallenge:(id)a4 completionHandler:(id)a5
{
  id v8 = (void (**)(void *, uint64_t, void))_Block_copy(a5);
  v9 = *(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & (uint64_t)self->super.super.super.isa) + 0xD0);
  id v10 = a3;
  id v11 = a4;
  id v14 = self;
  v12 = (void *)v9();
  if (v12)
  {
    uint64_t v13 = (uint64_t)objc_msgSend(v12, sel_serverAuthenticationChallengeWithChallenge_, v11);
    swift_unknownObjectRelease();
  }
  else
  {
    uint64_t v13 = 1;
  }
  v8[2](v8, v13, 0);
  _Block_release(v8);
}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5
{
  id v8 = _Block_copy(a5);
  _Block_copy(v8);
  id v9 = a3;
  id v10 = a4;
  id v11 = self;
  sub_25B6C11FC(v10, (uint64_t)v11, (uint64_t)v8);
  _Block_release(v8);
  _Block_release(v8);
}

- (void)pauseVideoWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A508960);
  MEMORY[0x270FA5388](v5 - 8);
  id v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_25B6D2AC0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  id v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_26A508F40;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_26A508F48;
  v12[5] = v11;
  uint64_t v13 = self;
  sub_25B6BE5C0((uint64_t)v7, (uint64_t)&unk_26A508F50, (uint64_t)v12);
  swift_release();
}

- (void)pauseVideoWithPausedString:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A508960);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  id v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_25B6D2AC0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_26A508F20;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_26A508F28;
  v14[5] = v13;
  id v15 = a3;
  v16 = self;
  sub_25B6BE5C0((uint64_t)v9, (uint64_t)&unk_26A508F30, (uint64_t)v14);
  swift_release();
}

- (void)unpauseVideoWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A508960);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_25B6D2AC0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  id v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_26A508F00;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_26A508F08;
  v12[5] = v11;
  uint64_t v13 = self;
  sub_25B6BE5C0((uint64_t)v7, (uint64_t)&unk_26A508F10, (uint64_t)v12);
  swift_release();
}

- (void)useFrontCameraWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A508960);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_25B6D2AC0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  id v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_26A508EE0;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_26A508EE8;
  v12[5] = v11;
  uint64_t v13 = self;
  sub_25B6BE5C0((uint64_t)v7, (uint64_t)&unk_26A508EF0, (uint64_t)v12);
  swift_release();
}

- (void)useRearCameraWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A508960);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_25B6D2AC0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  id v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_26A508EC0;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_26A508EC8;
  v12[5] = v11;
  uint64_t v13 = self;
  sub_25B6BE5C0((uint64_t)v7, (uint64_t)&unk_26A508ED0, (uint64_t)v12);
  swift_release();
}

- (void)startVideoPreviewWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A508960);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_25B6D2AC0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  id v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_26A508EA0;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_26A508EA8;
  v12[5] = v11;
  uint64_t v13 = self;
  sub_25B6BE5C0((uint64_t)v7, (uint64_t)&unk_26A508EB0, (uint64_t)v12);
  swift_release();
}

- (void)startVideoPreviewWithCameraFacing:(int64_t)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A508960);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  id v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_25B6D2AC0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_26A508E80;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_26A508E88;
  v14[5] = v13;
  id v15 = self;
  sub_25B6BE5C0((uint64_t)v9, (uint64_t)&unk_26A508E90, (uint64_t)v14);
  swift_release();
}

- (void)startVideoStreamWithEndpoint:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A508960);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  id v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_25B6D2AC0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_26A508E60;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_26A508E68;
  v14[5] = v13;
  id v15 = a3;
  uint64_t v16 = self;
  sub_25B6BE5C0((uint64_t)v9, (uint64_t)&unk_26A508E70, (uint64_t)v14);
  swift_release();
}

- (void)startVideoStreamWithEndpoint:(NSString *)a3 token:(NSString *)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A508960);
  MEMORY[0x270FA5388](v9 - 8);
  id v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_25B6D2AC0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  id v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_26A508E40;
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_26A508E48;
  v16[5] = v15;
  uint64_t v17 = a3;
  v18 = a4;
  v19 = self;
  sub_25B6BE5C0((uint64_t)v11, (uint64_t)&unk_26A508E50, (uint64_t)v16);
  swift_release();
}

- (void)startVideoStreamWithEndpoint:(NSString *)a3 token:(NSString *)a4 trickle:(BOOL)a5 completionHandler:(id)a6
{
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A508960);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = _Block_copy(a6);
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = a3;
  *(void *)(v15 + 24) = a4;
  *(unsigned char *)(v15 + 32) = a5;
  *(void *)(v15 + 40) = v14;
  *(void *)(v15 + 48) = self;
  uint64_t v16 = sub_25B6D2AC0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v13, 1, 1, v16);
  uint64_t v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_26A508E20;
  v17[5] = v15;
  v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_26A508E28;
  v18[5] = v17;
  v19 = a3;
  uint64_t v20 = a4;
  v21 = self;
  sub_25B6BE5C0((uint64_t)v13, (uint64_t)&unk_26A508E30, (uint64_t)v18);
  swift_release();
}

- (void)endVideoStreamWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A508960);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_25B6D2AC0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_26A508E00;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_26A508E08;
  v12[5] = v11;
  uint64_t v13 = self;
  sub_25B6BE5C0((uint64_t)v7, (uint64_t)&unk_26A508E10, (uint64_t)v12);
  swift_release();
}

- (void)flipCameraWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A508960);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_25B6D2AC0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_26A508DE0;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_26A508DE8;
  v12[5] = v11;
  uint64_t v13 = self;
  sub_25B6BE5C0((uint64_t)v7, (uint64_t)&unk_26A508DF0, (uint64_t)v12);
  swift_release();
}

- (void)torchOnWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A508960);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_25B6D2AC0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_26A508DC0;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_26A508DC8;
  v12[5] = v11;
  uint64_t v13 = self;
  sub_25B6BE5C0((uint64_t)v7, (uint64_t)&unk_26A508DD0, (uint64_t)v12);
  swift_release();
}

- (void)torchOffWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A508960);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_25B6D2AC0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_26A508DA0;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_26A508DA8;
  v12[5] = v11;
  uint64_t v13 = self;
  sub_25B6BE5C0((uint64_t)v7, (uint64_t)&unk_26A508DB0, (uint64_t)v12);
  swift_release();
}

- (void)toggleTorchWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A508960);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_25B6D2AC0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_26A508D80;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_26A508D88;
  v12[5] = v11;
  uint64_t v13 = self;
  sub_25B6BE5C0((uint64_t)v7, (uint64_t)&unk_26A508D90, (uint64_t)v12);
  swift_release();
}

- (void)setZoomLevelWithZoom:(double)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A508960);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = swift_allocObject();
  *(double *)(v11 + 16) = a3;
  *(void *)(v11 + 24) = v10;
  *(void *)(v11 + 32) = self;
  uint64_t v12 = sub_25B6D2AC0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_26A508D60;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_26A508D68;
  v14[5] = v13;
  uint64_t v15 = self;
  sub_25B6BE5C0((uint64_t)v9, (uint64_t)&unk_26A508D70, (uint64_t)v14);
  swift_release();
}

- (void)endVideoPreviewWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A508960);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_25B6D2AC0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_26A508D40;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_26A508D48;
  v12[5] = v11;
  uint64_t v13 = self;
  sub_25B6BE5C0((uint64_t)v7, (uint64_t)&unk_26A508D50, (uint64_t)v12);
  swift_release();
}

- (void)getCapabilitiesWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A508960);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_25B6D2AC0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_26A508D20;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_26A508D28;
  v12[5] = v11;
  uint64_t v13 = self;
  sub_25B6BE5C0((uint64_t)v7, (uint64_t)&unk_26A508D30, (uint64_t)v12);
  swift_release();
}

- (void)setPoorConnectionThreshold:(double)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A508960);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = swift_allocObject();
  *(double *)(v11 + 16) = a3;
  *(void *)(v11 + 24) = v10;
  *(void *)(v11 + 32) = self;
  uint64_t v12 = sub_25B6D2AC0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_26A508D00;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_26A508D08;
  v14[5] = v13;
  uint64_t v15 = self;
  sub_25B6BE5C0((uint64_t)v9, (uint64_t)&unk_26A508D10, (uint64_t)v14);
  swift_release();
}

- (void)setPoorConnectionGracePeriod:(double)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A508960);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = swift_allocObject();
  *(double *)(v11 + 16) = a3;
  *(void *)(v11 + 24) = v10;
  *(void *)(v11 + 32) = self;
  uint64_t v12 = sub_25B6D2AC0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_26A508CE0;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_26A508CE8;
  v14[5] = v13;
  uint64_t v15 = self;
  sub_25B6BE5C0((uint64_t)v9, (uint64_t)&unk_26A508CF0, (uint64_t)v14);
  swift_release();
}

- (void)setIceRestartTimeout:(double)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A508960);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = swift_allocObject();
  *(double *)(v11 + 16) = a3;
  *(void *)(v11 + 24) = v10;
  *(void *)(v11 + 32) = self;
  uint64_t v12 = sub_25B6D2AC0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_26A508CC0;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_26A508CC8;
  v14[5] = v13;
  uint64_t v15 = self;
  sub_25B6BE5C0((uint64_t)v9, (uint64_t)&unk_26A508CD0, (uint64_t)v14);
  swift_release();
}

- (void)setIceRestartRetryCount:(double)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A508960);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = swift_allocObject();
  *(double *)(v11 + 16) = a3;
  *(void *)(v11 + 24) = v10;
  *(void *)(v11 + 32) = self;
  uint64_t v12 = sub_25B6D2AC0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_26A508CA0;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_26A508CA8;
  v14[5] = v13;
  uint64_t v15 = self;
  sub_25B6BE5C0((uint64_t)v9, (uint64_t)&unk_26A508CB0, (uint64_t)v14);
  swift_release();
}

- (void)setMinimumBitrate:(double)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A508960);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = swift_allocObject();
  *(double *)(v11 + 16) = a3;
  *(void *)(v11 + 24) = v10;
  *(void *)(v11 + 32) = self;
  uint64_t v12 = sub_25B6D2AC0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_26A508C80;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_26A508C88;
  v14[5] = v13;
  uint64_t v15 = self;
  sub_25B6BE5C0((uint64_t)v9, (uint64_t)&unk_26A508C90, (uint64_t)v14);
  swift_release();
}

- (void)setMaximumBitrate:(double)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A508960);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = swift_allocObject();
  *(double *)(v11 + 16) = a3;
  *(void *)(v11 + 24) = v10;
  *(void *)(v11 + 32) = self;
  uint64_t v12 = sub_25B6D2AC0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_26A508C60;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_26A508C68;
  v14[5] = v13;
  uint64_t v15 = self;
  sub_25B6BE5C0((uint64_t)v9, (uint64_t)&unk_26A508C70, (uint64_t)v14);
  swift_release();
}

- (void)setPausedString:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A508960);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_25B6D2AC0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_26A508C40;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_26A508C48;
  v14[5] = v13;
  uint64_t v15 = a3;
  uint64_t v16 = self;
  sub_25B6BE5C0((uint64_t)v9, (uint64_t)&unk_26A508C50, (uint64_t)v14);
  swift_release();
}

- (void)setDebugConnection:(BOOL)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A508960);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = swift_allocObject();
  *(unsigned char *)(v11 + 16) = a3;
  *(void *)(v11 + 24) = v10;
  *(void *)(v11 + 32) = self;
  uint64_t v12 = sub_25B6D2AC0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_26A508C20;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_26A508C28;
  v14[5] = v13;
  uint64_t v15 = self;
  sub_25B6BE5C0((uint64_t)v9, (uint64_t)&unk_26A508C30, (uint64_t)v14);
  swift_release();
}

- (void)setVideoPreference:(int64_t)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A508960);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_25B6D2AC0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_26A508C00;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_26A508C08;
  v14[5] = v13;
  uint64_t v15 = self;
  sub_25B6BE5C0((uint64_t)v9, (uint64_t)&unk_26A508C10, (uint64_t)v14);
  swift_release();
}

- (void)setFrameRate:(double)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A508960);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = swift_allocObject();
  *(double *)(v11 + 16) = a3;
  *(void *)(v11 + 24) = v10;
  *(void *)(v11 + 32) = self;
  uint64_t v12 = sub_25B6D2AC0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_26A508BE0;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_26A508BE8;
  v14[5] = v13;
  uint64_t v15 = self;
  sub_25B6BE5C0((uint64_t)v9, (uint64_t)&unk_26A508BF0, (uint64_t)v14);
  swift_release();
}

- (void)goToErrorWithRetryable:(BOOL)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A508960);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = swift_allocObject();
  *(unsigned char *)(v11 + 16) = a3;
  *(void *)(v11 + 24) = v10;
  *(void *)(v11 + 32) = self;
  uint64_t v12 = sub_25B6D2AC0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_26A508BC0;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_26A508BC8;
  v14[5] = v13;
  uint64_t v15 = self;
  sub_25B6BE5C0((uint64_t)v9, (uint64_t)&unk_26A508BD0, (uint64_t)v14);
  swift_release();
}

- (void)networkInterfacesDidChangeWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A508960);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_25B6D2AC0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_26A508B80;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_26A508B90;
  v12[5] = v11;
  uint64_t v13 = self;
  sub_25B6BE5C0((uint64_t)v7, (uint64_t)&unk_26A508BA0, (uint64_t)v12);
  swift_release();
}

- (_TtC5SOSUI15SOSUIWebRTCView)initWithFrame:(CGRect)a3
{
  result = (_TtC5SOSUI15SOSUIWebRTCView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end