@interface WebAdView
- (CGRect)frame;
- (id)webView:(id)a3 createWebViewWithConfiguration:(id)a4 forNavigationAction:(id)a5 windowFeatures:(id)a6;
- (void)dealloc;
- (void)setFrame:(CGRect)a3;
- (void)sizeCategoryChanged:(id)a3;
- (void)webProcessDiagnosticJSOStatusReported:(id)a3 status:(id)a4;
- (void)webProcessMRAIDJSODidCallClose;
- (void)webProcessMRAIDJSODidCallCreateCalendarEvent:(id)a3;
- (void)webProcessMRAIDJSODidCallExpand:(id)a3 withMaximumWidth:(double)a4 andHeight:(double)a5;
- (void)webProcessMRAIDJSODidCallOpen:(id)a3;
- (void)webProcessPlugInBrowserContextControllerGlobalObjectIsAvailableForFrame;
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
- (void)webProcessVideoAdJSOMediaPlaybackFailedWithErrorDescription:(id)a3;
- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5;
- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5;
- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5;
- (void)webView:(id)a3 didFinishNavigation:(id)a4;
- (void)webView:(id)a3 didStartProvisionalNavigation:(id)a4;
- (void)webViewWebContentProcessDidTerminate:(id)a3;
@end

@implementation WebAdView

- (id)webView:(id)a3 createWebViewWithConfiguration:(id)a4 forNavigationAction:(id)a5 windowFeatures:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = self;
  v15 = (void *)sub_1B5D35304(v12);

  return v15;
}

- (void)webView:(id)a3 didStartProvisionalNavigation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  _s17PromotedContentUI9WebAdViewC03webF0_29didStartProvisionalNavigationySo05WKWebF0C_So12WKNavigationCSgtF_0();
}

- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v11 = a5;
  id v10 = self;
  sub_1B5D431A8((uint64_t)v11, (uint64_t)"[PCUI] promoted content (%{public}@) failed provisional navigation at %{public}.8f", 82);
}

- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v11 = a5;
  id v10 = self;
  sub_1B5D431A8((uint64_t)v11, (uint64_t)"[PCUI] promoted content (%{public}@) failed navigation at %{public}.8f", 70);
}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  _s17PromotedContentUI9WebAdViewC03webF0_9didFinishySo05WKWebF0C_So12WKNavigationCSgtF_0(v6);
}

- (void)webViewWebContentProcessDidTerminate:(id)a3
{
  id v4 = a3;
  v5 = self;
  _s17PromotedContentUI9WebAdViewC03webfdB19ProcessDidTerminateyySo05WKWebF0CF_0();
}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5
{
  id v8 = _Block_copy(a5);
  _Block_copy(v8);
  id v9 = a3;
  id v10 = a4;
  id v11 = self;
  sub_1B5D43D80(v10, v11, (uint64_t)v8);
  _Block_release(v8);
  _Block_release(v8);
}

- (void)webProcessPlugInBrowserContextControllerGlobalObjectIsAvailableForFrame
{
  v2 = self;
  WebAdView.webProcessPlugInBrowserContextControllerGlobalObjectIsAvailableForFrame()();
}

- (void)webProcessDiagnosticJSOStatusReported:(id)a3 status:(id)a4
{
  sub_1B5DBAAF8();
  sub_1B5DBAAF8();
  v5 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___APPCPromotedContentView_promotedContent);
  id v6 = self;
  id v7 = objc_msgSend(v5, sel_diagnosticMetricHelper);
  id v8 = (void *)sub_1B5DBAAC8();
  id v9 = (id)sub_1B5DBAAC8();
  objc_msgSend(v7, sel_templateMetricWithName_argument_, v8, v9);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
}

- (void)webProcessMRAIDJSODidCallClose
{
  v2 = self;
  WebAdView.webProcessMRAIDJSODidCallClose()();
}

- (void)webProcessMRAIDJSODidCallExpand:(id)a3 withMaximumWidth:(double)a4 andHeight:(double)a5
{
  uint64_t v8 = sub_1B5DB9868();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  id v11 = (char *)&v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B5DB9828();
  id v12 = self;
  WebAdView.webProcessMRAIDJSODidCallExpand(_:withMaximumWidth:andHeight:)((uint64_t)v11, a4, a5);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)webProcessMRAIDJSODidCallCreateCalendarEvent:(id)a3
{
  uint64_t v4 = sub_1B5DBAA58();
  v5 = self;
  WebAdView.webProcessMRAIDJSODidCallCreateCalendarEvent(_:)((Swift::OpaquePointer)v4);

  swift_bridgeObjectRelease();
}

- (void)webProcessMRAIDJSODidCallOpen:(id)a3
{
  uint64_t v4 = sub_1B5DB9868();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  id v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B5DB9828();
  uint64_t v8 = self;
  WebAdView.webProcessMRAIDJSODidCallOpen(_:)((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)webProcessVideoAdJSOGetVideoInfo:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  _Block_copy(v4);
  uint64_t v5 = self;
  sub_1B5D6CB34((uint64_t)v5, (uint64_t)v4);
  _Block_release(v4);
  _Block_release(v4);
}

- (void)webProcessVideoAdJSOMediaPlaybackFailedWithErrorDescription:(id)a3
{
  sub_1B5DBAAF8();
  uint64_t v4 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___APPCPromotedContentView_promotedContent);
  uint64_t v5 = self;
  id v6 = objc_msgSend(v4, sel_diagnosticMetricHelper);
  id v7 = (id)sub_1B5DBAAC8();
  objc_msgSend(v6, sel_mediaPlaybackFailedWithReason_, v7);

  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
}

- (void)webProcessVideoAdJSOCreativeViewLoaded
{
  v2 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___APPCPromotedContentView_promotedContent);
  uint64_t v4 = self;
  id v3 = objc_msgSend(v2, sel_mediaMetricHelper);
  if (v3)
  {
    objc_msgSend(v3, sel_mediaLoaded);

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

- (void)webProcessVideoAdJSODidCallPlayStarted:(float)a3 volume:(float)a4
{
  uint64_t v4 = self;
  _s17PromotedContentUI9WebAdViewC015webProcessVideoE21JSODidCallPlayStarted_6volumeySf_SftF_0();
}

- (void)webProcessVideoAdJSODidCallPlayResumed:(float)a3 volume:(float)a4
{
  uint64_t v5 = self;
  sub_1B5D6D5B0((SEL *)&selRef_mediaPlayedAtPosition_, a3);
}

- (void)webProcessVideoAdJSODidCallPlayPaused:(float)a3 volume:(float)a4
{
  uint64_t v5 = self;
  sub_1B5D6D5B0((SEL *)&selRef_mediaPausedAtPosition_, a3);
}

- (void)webProcessVideoAdJSODidCallPlayProgressed:(float)a3 volume:(float)a4
{
  uint64_t v5 = self;
  _s17PromotedContentUI9WebAdViewC015webProcessVideoE24JSODidCallPlayProgressed_6volumeySf_SftF_0(a3);
}

- (void)webProcessVideoAdJSODidCallPlayCompletedWithVolume:(float)a3
{
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___APPCPromotedContentView_promotedContent);
  uint64_t v5 = self;
  id v4 = objc_msgSend(v3, sel_mediaMetricHelper);
  if (v4)
  {
    objc_msgSend(v4, sel_mediaFinished);

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

- (void)webProcessVideoAdJSODidCallViewabilityChanged:(BOOL)a3 playTime:(float)a4 volume:(float)a5
{
  id v6 = self;
  _s17PromotedContentUI9WebAdViewC015webProcessVideoE28JSODidCallViewabilityChanged_8playTime6volumeySb_S2ftF_0(a3);
}

- (void)webProcessVideoAdJSODidCallVolumeChanged:(float)a3 playTime:(float)a4
{
  uint64_t v5 = self;
  _s17PromotedContentUI9WebAdViewC015webProcessVideoE23JSODidCallVolumeChanged_8playTimeySf_SftF_0(a3);
}

- (void)webProcessVideoAdJSODidCallAudioMuted:(float)a3
{
  id v4 = self;
  WebAdView.webProcessVideoAdJSODidCallAudioMuted(_:)(a3);
}

- (void)webProcessVideoAdJSODidCallAudioUnmuted:(float)a3 volume:(float)a4
{
  uint64_t v5 = self;
  _s17PromotedContentUI9WebAdViewC015webProcessVideoE22JSODidCallAudioUnmuted_6volumeySf_SftF_0(a3);
}

- (void)webProcessVideoAdJSODidCallMoreInfoTapped:(float)a3 volume:(float)a4
{
  id v4 = self;
  _s17PromotedContentUI9WebAdViewC015webProcessVideoE24JSODidCallMoreInfoTapped_6volumeySf_SftF_0();
}

- (void)webProcessVideoAdJSODidCallVideoTapped:(float)a3 volume:(float)a4
{
  uint64_t v5 = self;
  _s17PromotedContentUI9WebAdViewC015webProcessVideoe10JSODidCallI6Tapped_6volumeySf_SftF_0(a3);
}

- (void)webProcessVideoAdJSODidCallSkipAdTapped:(float)a3 volume:(float)a4
{
  uint64_t v5 = self;
  sub_1B5D6D5B0((SEL *)&selRef_mediaSkippedAtPosition_, a3);
}

- (void)webProcessVideoAdJSODidCallFullScreenTapped:(float)a3 volume:(float)a4
{
  uint64_t v5 = self;
  sub_1B5D6E838((SEL *)&selRef_mediaExpandedAtPosition_fullScreen_, a3);
}

- (void)webProcessVideoAdJSODidCallExitFullScreenTapped:(float)a3 volume:(float)a4
{
  uint64_t v5 = self;
  sub_1B5D6E838((SEL *)&selRef_mediaContractedAtPosition_fullScreen_, a3);
}

- (void)dealloc
{
  v2 = self;
  WebAdView.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC17PromotedContentUI9WebAdView_unfairLock));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC17PromotedContentUI9WebAdView_navigationCoordinator);
}

- (CGRect)frame
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for WebAdView();
  [(APPCPromotedContentView *)&v6 frame];
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
  id v7 = self;
  sub_1B5DA72F0(x, y, width, height);
}

- (void)sizeCategoryChanged:(id)a3
{
  uint64_t v4 = sub_1B5DB9698();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  id v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B5DB9688();
  uint64_t v8 = self;
  sub_1B5DA798C();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

@end