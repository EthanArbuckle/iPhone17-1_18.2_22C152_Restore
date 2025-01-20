@interface PromotedContentWebView
- (CGRect)frame;
- (_TtC17PromotedContentUI22PromotedContentWebView)initWithCoder:(id)a3;
- (_TtC17PromotedContentUI22PromotedContentWebView)initWithFrame:(CGRect)a3 configuration:(id)a4;
- (void)dealloc;
- (void)didMoveToSuperview;
- (void)setFrame:(CGRect)a3;
- (void)webProcessDiagnosticJSOStatusReported:(id)a3 status:(id)a4;
- (void)webProcessMRAIDJSODidCallClose;
- (void)webProcessMRAIDJSODidCallCreateCalendarEvent:(id)a3;
- (void)webProcessMRAIDJSODidCallExpand:(id)a3 withMaximumWidth:(double)a4 andHeight:(double)a5;
- (void)webProcessMRAIDJSODidCallOpen:(id)a3;
- (void)webProcessPlugInBrowserContextControllerGlobalObjectIsAvailableForFrame;
- (void)webProcessPlugInDidCreateBrowserContextController;
- (void)webProcessPlugInWillDestroyBrowserContextController;
- (void)webProcessVideoAdJSOCreativeViewLoaded;
- (void)webProcessVideoAdJSODidCallAudioMuted:(float)a3;
- (void)webProcessVideoAdJSODidCallAudioUnmuted:(float)a3 volume:(float)a4;
- (void)webProcessVideoAdJSODidCallExitFullScreenTapped:(float)a3 volume:(float)a4;
- (void)webProcessVideoAdJSODidCallFullScreenTapped:(float)a3 volume:(float)a4;
- (void)webProcessVideoAdJSODidCallMoreInfoTapped:(float)a3 volume:(float)a4;
- (void)webProcessVideoAdJSODidCallPlayCompletedWithVolume:(float)a3;
- (void)webProcessVideoAdJSODidCallPlayPaused:(float)a3 volume:(float)a4;
- (void)webProcessVideoAdJSODidCallPlayProgressed:(float)a3 volume:(float)a4;
- (void)webProcessVideoAdJSODidCallPlayResumed:(float)a3 volume:(float)a4;
- (void)webProcessVideoAdJSODidCallPlayStarted:(float)a3 volume:(float)a4;
- (void)webProcessVideoAdJSODidCallSkipAdTapped:(float)a3 volume:(float)a4;
- (void)webProcessVideoAdJSODidCallVideoTapped:(float)a3 volume:(float)a4;
- (void)webProcessVideoAdJSODidCallViewabilityChanged:(BOOL)a3 playTime:(float)a4 volume:(float)a5;
- (void)webProcessVideoAdJSODidCallVolumeChanged:(float)a3 playTime:(float)a4;
- (void)webProcessVideoAdJSOGetVideoInfo:(id)a3;
@end

@implementation PromotedContentWebView

- (CGRect)frame
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for PromotedContentWebView();
  [(PromotedContentWebView *)&v6 frame];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = (objc_class *)type metadata accessor for PromotedContentWebView();
  v19.receiver = self;
  v19.super_class = v8;
  v9 = self;
  [(PromotedContentWebView *)&v19 frame];
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  v18.receiver = v9;
  v18.super_class = v8;
  -[PromotedContentWebView setFrame:](&v18, sel_setFrame_, x, y, width, height);
  sub_1B5DA985C(v11, v13, v15, v17);
}

- (void)didMoveToSuperview
{
  double v2 = self;
  sub_1B5DA9A20();
}

- (_TtC17PromotedContentUI22PromotedContentWebView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1B5DAB2D4();
}

- (void)dealloc
{
  double v2 = self;
  sub_1B5DBAD88();
  sub_1B5CEE190();
  id v3 = (void *)sub_1B5DBB018();
  sub_1B5DBA838();

  v4.receiver = v2;
  v4.super_class = (Class)type metadata accessor for PromotedContentWebView();
  [(PromotedContentWebView *)&v4 dealloc];
}

- (void).cxx_destruct
{
  sub_1B5CF6804((uint64_t)self + OBJC_IVAR____TtC17PromotedContentUI22PromotedContentWebView__processDelegate);
  swift_unknownObjectRelease();
  sub_1B5D2FA70((uint64_t)self + OBJC_IVAR____TtC17PromotedContentUI22PromotedContentWebView_remoteObjectInterface);
  swift_bridgeObjectRelease();
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC17PromotedContentUI22PromotedContentWebView_unfairLock);
}

- (_TtC17PromotedContentUI22PromotedContentWebView)initWithFrame:(CGRect)a3 configuration:(id)a4
{
  id v4 = a4;
  CGRect result = (_TtC17PromotedContentUI22PromotedContentWebView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)webProcessPlugInDidCreateBrowserContextController
{
  double v2 = self;
  sub_1B5DAA2E0();
}

- (void)webProcessPlugInWillDestroyBrowserContextController
{
  double v2 = self;
  sub_1B5DAA48C();
}

- (void)webProcessPlugInBrowserContextControllerGlobalObjectIsAvailableForFrame
{
}

- (void)webProcessMRAIDJSODidCallClose
{
}

- (void)webProcessDiagnosticJSOStatusReported:(id)a3 status:(id)a4
{
  sub_1B5DBAAF8();
  sub_1B5DBAAF8();
  v9 = self;
  double v5 = (void *)sub_1B5DA9634();
  if (v5)
  {
    objc_super v6 = v5;
    if (objc_msgSend(v5, sel_respondsToSelector_, sel_webProcessDiagnosticJSOStatusReported_status_))
    {
      v7 = (void *)sub_1B5DBAAC8();
      v8 = (void *)sub_1B5DBAAC8();
      objc_msgSend(v6, sel_webProcessDiagnosticJSOStatusReported_status_, v7, v8);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_unknownObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_unknownObjectRelease();
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
}

- (void)webProcessMRAIDJSODidCallExpand:(id)a3 withMaximumWidth:(double)a4 andHeight:(double)a5
{
  uint64_t v8 = sub_1B5DB9868();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  CGFloat v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B5DB9828();
  double v12 = self;
  CGFloat v13 = (void *)sub_1B5DA9634();
  if (v13)
  {
    double v14 = v13;
    if (objc_msgSend(v13, sel_respondsToSelector_, sel_webProcessMRAIDJSODidCallExpand_withMaximumWidth_andHeight_))
    {
      CGFloat v15 = (void *)sub_1B5DB9818();
      objc_msgSend(v14, sel_webProcessMRAIDJSODidCallExpand_withMaximumWidth_andHeight_, v15, a4, a5);

      swift_unknownObjectRelease();
    }
    else
    {

      swift_unknownObjectRelease();
    }
  }
  else
  {
  }
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)webProcessMRAIDJSODidCallCreateCalendarEvent:(id)a3
{
  sub_1B5DBAA58();
  id v4 = self;
  double v5 = (void *)sub_1B5DA9634();
  if (v5)
  {
    objc_super v6 = v5;
    if (objc_msgSend(v5, sel_respondsToSelector_, sel_webProcessMRAIDJSODidCallCreateCalendarEvent_))
    {
      id v7 = (id)sub_1B5DBAA38();
      objc_msgSend(v6, sel_webProcessMRAIDJSODidCallCreateCalendarEvent_, v7);

      swift_bridgeObjectRelease();
      swift_unknownObjectRelease();
    }
    else
    {

      swift_bridgeObjectRelease();
      swift_unknownObjectRelease();
    }
  }
  else
  {

    swift_bridgeObjectRelease();
  }
}

- (void)webProcessMRAIDJSODidCallOpen:(id)a3
{
  uint64_t v4 = sub_1B5DB9868();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  id v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B5DB9828();
  uint64_t v8 = self;
  uint64_t v9 = (void *)sub_1B5DA9634();
  if (v9)
  {
    uint64_t v10 = v9;
    if (objc_msgSend(v9, sel_respondsToSelector_, sel_webProcessMRAIDJSODidCallOpen_))
    {
      CGFloat v11 = (void *)sub_1B5DB9818();
      objc_msgSend(v10, sel_webProcessMRAIDJSODidCallOpen_, v11);

      swift_unknownObjectRelease();
    }
    else
    {

      swift_unknownObjectRelease();
    }
  }
  else
  {
  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)webProcessVideoAdJSOGetVideoInfo:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = self;
  id v7 = (void *)sub_1B5DA9634();
  if (v7)
  {
    uint64_t v8 = v7;
    if (objc_msgSend(v7, sel_respondsToSelector_, sel_webProcessVideoAdJSOGetVideoInfo_))
    {
      v10[4] = sub_1B5DAB1FC;
      v10[5] = v5;
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 1107296256;
      v10[2] = sub_1B5DAABB0;
      v10[3] = &unk_1F0EEDC78;
      uint64_t v9 = _Block_copy(v10);
      swift_retain();
      objc_msgSend(v8, sel_webProcessVideoAdJSOGetVideoInfo_, v9);
      _Block_release(v9);

      swift_release();
      swift_unknownObjectRelease();
      swift_release();
    }
    else
    {

      swift_release();
      swift_unknownObjectRelease();
    }
  }
  else
  {

    swift_release();
  }
}

- (void)webProcessVideoAdJSOCreativeViewLoaded
{
}

- (void)webProcessVideoAdJSODidCallPlayStarted:(float)a3 volume:(float)a4
{
}

- (void)webProcessVideoAdJSODidCallPlayResumed:(float)a3 volume:(float)a4
{
}

- (void)webProcessVideoAdJSODidCallPlayPaused:(float)a3 volume:(float)a4
{
}

- (void)webProcessVideoAdJSODidCallPlayProgressed:(float)a3 volume:(float)a4
{
}

- (void)webProcessVideoAdJSODidCallPlayCompletedWithVolume:(float)a3
{
}

- (void)webProcessVideoAdJSODidCallViewabilityChanged:(BOOL)a3 playTime:(float)a4 volume:(float)a5
{
  BOOL v7 = a3;
  uint64_t v12 = self;
  uint64_t v8 = (void *)sub_1B5DA9634();
  if (v8)
  {
    uint64_t v9 = v8;
    if (objc_msgSend(v8, sel_respondsToSelector_, sel_webProcessVideoAdJSODidCallViewabilityChanged_playTime_volume_))
    {
      *(float *)&double v10 = a4;
      *(float *)&double v11 = a5;
      objc_msgSend(v9, sel_webProcessVideoAdJSODidCallViewabilityChanged_playTime_volume_, v7, v10, v11);
    }

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

- (void)webProcessVideoAdJSODidCallVolumeChanged:(float)a3 playTime:(float)a4
{
}

- (void)webProcessVideoAdJSODidCallAudioMuted:(float)a3
{
}

- (void)webProcessVideoAdJSODidCallAudioUnmuted:(float)a3 volume:(float)a4
{
}

- (void)webProcessVideoAdJSODidCallMoreInfoTapped:(float)a3 volume:(float)a4
{
}

- (void)webProcessVideoAdJSODidCallVideoTapped:(float)a3 volume:(float)a4
{
}

- (void)webProcessVideoAdJSODidCallSkipAdTapped:(float)a3 volume:(float)a4
{
}

- (void)webProcessVideoAdJSODidCallFullScreenTapped:(float)a3 volume:(float)a4
{
}

- (void)webProcessVideoAdJSODidCallExitFullScreenTapped:(float)a3 volume:(float)a4
{
}

@end