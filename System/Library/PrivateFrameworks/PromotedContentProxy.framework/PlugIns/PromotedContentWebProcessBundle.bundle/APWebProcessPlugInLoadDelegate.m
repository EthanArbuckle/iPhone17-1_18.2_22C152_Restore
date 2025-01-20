@interface APWebProcessPlugInLoadDelegate
- (APWebProcessDelegate)webProcessDelegate;
- (APWebProcessDiagnosticJSO)webProcessDiagnosticJSO;
- (APWebProcessMRAIDJSO)webProcessMRAIDJSO;
- (APWebProcessVideoAdJSO)webProcessVideoAdJSO;
- (JSContext)currentJSContext;
- (NSNumber)maximumRequestCount;
- (NSNumber)webViewProcessMaxRequestCount;
- (NSString)advertisingIdentifier;
- (NSString)webViewProcessAdIdentifier;
- (id)webProcessPlugInBrowserContextController:(id)a3 frame:(id)a4 willSendRequestForResource:(unint64_t)a5 request:(id)a6 redirectResponse:(id)a7;
- (void)actionDidFailWithErrorDescription:(id)a3;
- (void)contentSizeDidChange:(id)a3;
- (void)creativeStateDidChange:(int64_t)a3;
- (void)creativeVisibilityDidChange:(BOOL)a3;
- (void)resetSession;
- (void)resetVideoTagPlaytime;
- (void)setAdvertisingIdentifier:(id)a3;
- (void)setCurrentJSContext:(id)a3;
- (void)setExpandedWidth:(double)a3 andHeight:(double)a4;
- (void)setMaximumRequestCount:(id)a3;
- (void)setWebProcessDelegate:(id)a3;
- (void)setWebProcessDiagnosticJSO:(id)a3;
- (void)setWebProcessMRAIDJSO:(id)a3;
- (void)setWebProcessVideoAdJSO:(id)a3;
- (void)setWebViewProcessAdIdentifier:(id)a3;
- (void)setWebViewProcessAdIdentifier:(id)a3 maxRequestCount:(id)a4;
- (void)setWebViewProcessMaxRequestCount:(id)a3;
- (void)webProcessDiagnosticJSOStatusReported:(id)a3 status:(id)a4;
- (void)webProcessMRAIDJSODidCallClose;
- (void)webProcessMRAIDJSODidCallCreateCalendarEvent:(id)a3;
- (void)webProcessMRAIDJSODidCallExpand:(id)a3 withMaximumWidth:(double)a4 andHeight:(double)a5;
- (void)webProcessMRAIDJSODidCallOpen:(id)a3;
- (void)webProcessPlugInBrowserContextController:(id)a3 didFinishDocumentLoadForFrame:(id)a4;
- (void)webProcessPlugInBrowserContextController:(id)a3 globalObjectIsAvailableForFrame:(id)a4 inScriptWorld:(id)a5;
- (void)webProcessVideoAdJSOAudioMuted:(float)a3;
- (void)webProcessVideoAdJSOAudioUnmuted:(float)a3 volume:(float)a4;
- (void)webProcessVideoAdJSOCreativeViewLoaded;
- (void)webProcessVideoAdJSOExitFullScreenTapped:(float)a3 volume:(float)a4;
- (void)webProcessVideoAdJSOFullScreenTapped:(float)a3 volume:(float)a4;
- (void)webProcessVideoAdJSOMediaPlaybackFailedWithErrorDescription:(id)a3;
- (void)webProcessVideoAdJSOMoreInfoTapped:(float)a3 volume:(float)a4;
- (void)webProcessVideoAdJSOPlayCompletedWithVolume:(float)a3;
- (void)webProcessVideoAdJSOPlayPaused:(float)a3 volume:(float)a4;
- (void)webProcessVideoAdJSOPlayProgressed:(float)a3 volume:(float)a4;
- (void)webProcessVideoAdJSOPlayResumed:(float)a3 volume:(float)a4;
- (void)webProcessVideoAdJSOPlayStarted:(float)a3 volume:(float)a4;
- (void)webProcessVideoAdJSOSkipAdTapped:(float)a3 volume:(float)a4;
- (void)webProcessVideoAdJSOVideoTapped:(float)a3 volume:(float)a4;
- (void)webProcessVideoAdJSOViewabilityChanged:(BOOL)a3 playTime:(float)a4 volume:(float)a5;
- (void)webProcessVideoAdJSOVolumeChanged:(float)a3 playTime:(float)a4;
@end

@implementation APWebProcessPlugInLoadDelegate

- (id)webProcessPlugInBrowserContextController:(id)a3 frame:(id)a4 willSendRequestForResource:(unint64_t)a5 request:(id)a6 redirectResponse:(id)a7
{
  id v8 = a6;
  v9 = [v8 URL];
  v10 = [v9 host];
  unsigned __int8 v11 = +[APProxyURLUtilities shouldProxyRequestToHost:v10];

  if ((v11 & 1) == 0)
  {
    id v12 = v8;
    goto LABEL_26;
  }
  id v12 = [v8 copy];
  v13 = [v8 URL];
  v14 = [v13 videoAdIdentifier];

  +[APProxyURLUtilities changeSchemeTo:2 * (v14 != 0) forUrlRequest:v12];
  v15 = [(APWebProcessPlugInLoadDelegate *)self advertisingIdentifier];
  v16 = [v12 adIdentifier];
  if (v16) {
    [(APWebProcessPlugInLoadDelegate *)self setAdvertisingIdentifier:v16];
  }
  v17 = [v12 maximumRequestCount];
  if (v17) {
    [(APWebProcessPlugInLoadDelegate *)self setMaximumRequestCount:v17];
  }
  uint64_t v18 = [(APWebProcessPlugInLoadDelegate *)self advertisingIdentifier];
  if (!v18)
  {
    if (v16) {
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  v19 = (void *)v18;
  v20 = [(APWebProcessPlugInLoadDelegate *)self maximumRequestCount];
  if (!v20)
  {

    if (v16)
    {
LABEL_13:
      if (v17) {
        goto LABEL_16;
      }
    }
LABEL_14:
    v21 = [(APWebProcessPlugInLoadDelegate *)self webViewProcessAdIdentifier];
    [(APWebProcessPlugInLoadDelegate *)self setAdvertisingIdentifier:v21];

    v19 = [(APWebProcessPlugInLoadDelegate *)self webViewProcessMaxRequestCount];
    [(APWebProcessPlugInLoadDelegate *)self setMaximumRequestCount:v19];
    goto LABEL_15;
  }

LABEL_15:
LABEL_16:
  if ([v15 length])
  {
    v22 = [(APWebProcessPlugInLoadDelegate *)self advertisingIdentifier];
    unsigned __int8 v23 = [v22 isEqualToString:v15];

    if ((v23 & 1) == 0) {
      [(APWebProcessPlugInLoadDelegate *)self resetSession];
    }
  }
  if (!v16)
  {
    v24 = [(APWebProcessPlugInLoadDelegate *)self advertisingIdentifier];

    if (v24)
    {
      v25 = [(APWebProcessPlugInLoadDelegate *)self advertisingIdentifier];
      [v12 setAdIdentifier:v25];
    }
  }
  if (!v17)
  {
    v26 = [(APWebProcessPlugInLoadDelegate *)self maximumRequestCount];

    if (v26)
    {
      v27 = [(APWebProcessPlugInLoadDelegate *)self maximumRequestCount];
      [v12 setMaximumRequestCount:v27];
    }
  }

LABEL_26:

  return v12;
}

- (void)webProcessPlugInBrowserContextController:(id)a3 globalObjectIsAvailableForFrame:(id)a4 inScriptWorld:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v9 = [(APWebProcessPlugInLoadDelegate *)self currentJSContext];

  if (!v9)
  {
    v10 = [v7 jsContextForWorld:v8];
    [(APWebProcessPlugInLoadDelegate *)self setCurrentJSContext:v10];

    unsigned __int8 v11 = objc_alloc_init(APWebProcessMRAIDJSO);
    [(APWebProcessPlugInLoadDelegate *)self setWebProcessMRAIDJSO:v11];

    id v12 = [(APWebProcessPlugInLoadDelegate *)self webProcessMRAIDJSO];
    [v12 setDelegate:self];

    v13 = [(APWebProcessPlugInLoadDelegate *)self webProcessMRAIDJSO];
    v14 = [(APWebProcessPlugInLoadDelegate *)self currentJSContext];
    [v14 setObject:v13 forKeyedSubscript:@"mraid"];

    v15 = objc_alloc_init(APWebProcessDiagnosticJSO);
    [(APWebProcessPlugInLoadDelegate *)self setWebProcessDiagnosticJSO:v15];

    v16 = [(APWebProcessPlugInLoadDelegate *)self webProcessDiagnosticJSO];
    [v16 setDelegate:self];

    v17 = [(APWebProcessPlugInLoadDelegate *)self webProcessDiagnosticJSO];
    uint64_t v18 = [(APWebProcessPlugInLoadDelegate *)self currentJSContext];
    [v18 setObject:v17 forKeyedSubscript:@"diagnosticUtility"];

    v19 = [(APWebProcessPlugInLoadDelegate *)self webProcessDelegate];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_72D0;
    v20[3] = &unk_103D0;
    v20[4] = self;
    [v19 webProcessVideoAdJSOGetVideoInfo:v20];
  }
}

- (void)webProcessPlugInBrowserContextController:(id)a3 didFinishDocumentLoadForFrame:(id)a4
{
  id v4 = [(APWebProcessPlugInLoadDelegate *)self webProcessDelegate];
  [v4 webProcessPlugInBrowserContextControllerGlobalObjectIsAvailableForFrame];
}

- (void)webProcessDiagnosticJSOStatusReported:(id)a3 status:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(APWebProcessPlugInLoadDelegate *)self webProcessDelegate];
  [v8 webProcessDiagnosticJSOStatusReported:v7 status:v6];
}

- (void)webProcessVideoAdJSOMediaPlaybackFailedWithErrorDescription:(id)a3
{
  id v4 = a3;
  id v5 = [(APWebProcessPlugInLoadDelegate *)self webProcessDelegate];
  [v5 webProcessVideoAdJSOMediaPlaybackFailedWithErrorDescription:v4];
}

- (void)webProcessVideoAdJSOCreativeViewLoaded
{
  id v2 = [(APWebProcessPlugInLoadDelegate *)self webProcessDelegate];
  [v2 webProcessVideoAdJSOCreativeViewLoaded];
}

- (void)webProcessVideoAdJSOPlayStarted:(float)a3 volume:(float)a4
{
  id v8 = [(APWebProcessPlugInLoadDelegate *)self webProcessDelegate];
  *(float *)&double v6 = a3;
  *(float *)&double v7 = a4;
  [v8 webProcessVideoAdJSODidCallPlayStarted:v6 volume:v7];
}

- (void)webProcessVideoAdJSOPlayResumed:(float)a3 volume:(float)a4
{
  id v8 = [(APWebProcessPlugInLoadDelegate *)self webProcessDelegate];
  *(float *)&double v6 = a3;
  *(float *)&double v7 = a4;
  [v8 webProcessVideoAdJSODidCallPlayResumed:v6 volume:v7];
}

- (void)webProcessVideoAdJSOPlayPaused:(float)a3 volume:(float)a4
{
  id v8 = [(APWebProcessPlugInLoadDelegate *)self webProcessDelegate];
  *(float *)&double v6 = a3;
  *(float *)&double v7 = a4;
  [v8 webProcessVideoAdJSODidCallPlayPaused:v6 volume:v7];
}

- (void)webProcessVideoAdJSOPlayProgressed:(float)a3 volume:(float)a4
{
  id v8 = [(APWebProcessPlugInLoadDelegate *)self webProcessDelegate];
  *(float *)&double v6 = a3;
  *(float *)&double v7 = a4;
  [v8 webProcessVideoAdJSODidCallPlayProgressed:v6 volume:v7];
}

- (void)webProcessVideoAdJSOPlayCompletedWithVolume:(float)a3
{
  id v5 = [(APWebProcessPlugInLoadDelegate *)self webProcessDelegate];
  *(float *)&double v4 = a3;
  [v5 webProcessVideoAdJSODidCallPlayCompletedWithVolume:v4];
}

- (void)webProcessVideoAdJSOViewabilityChanged:(BOOL)a3 playTime:(float)a4 volume:(float)a5
{
  BOOL v7 = a3;
  id v10 = [(APWebProcessPlugInLoadDelegate *)self webProcessDelegate];
  *(float *)&double v8 = a4;
  *(float *)&double v9 = a5;
  [v10 webProcessVideoAdJSODidCallViewabilityChanged:v7 playTime:v8 volume:v9];
}

- (void)webProcessVideoAdJSOVolumeChanged:(float)a3 playTime:(float)a4
{
  id v8 = [(APWebProcessPlugInLoadDelegate *)self webProcessDelegate];
  *(float *)&double v6 = a3;
  *(float *)&double v7 = a4;
  [v8 webProcessVideoAdJSODidCallVolumeChanged:v6 playTime:v7];
}

- (void)webProcessVideoAdJSOAudioMuted:(float)a3
{
  id v5 = [(APWebProcessPlugInLoadDelegate *)self webProcessDelegate];
  *(float *)&double v4 = a3;
  [v5 webProcessVideoAdJSODidCallAudioMuted:v4];
}

- (void)webProcessVideoAdJSOAudioUnmuted:(float)a3 volume:(float)a4
{
  id v8 = [(APWebProcessPlugInLoadDelegate *)self webProcessDelegate];
  *(float *)&double v6 = a3;
  *(float *)&double v7 = a4;
  [v8 webProcessVideoAdJSODidCallAudioUnmuted:v6 volume:v7];
}

- (void)webProcessVideoAdJSOMoreInfoTapped:(float)a3 volume:(float)a4
{
  id v8 = [(APWebProcessPlugInLoadDelegate *)self webProcessDelegate];
  *(float *)&double v6 = a3;
  *(float *)&double v7 = a4;
  [v8 webProcessVideoAdJSODidCallMoreInfoTapped:v6 volume:v7];
}

- (void)webProcessVideoAdJSOVideoTapped:(float)a3 volume:(float)a4
{
  id v8 = [(APWebProcessPlugInLoadDelegate *)self webProcessDelegate];
  *(float *)&double v6 = a3;
  *(float *)&double v7 = a4;
  [v8 webProcessVideoAdJSODidCallVideoTapped:v6 volume:v7];
}

- (void)webProcessVideoAdJSOSkipAdTapped:(float)a3 volume:(float)a4
{
  id v8 = [(APWebProcessPlugInLoadDelegate *)self webProcessDelegate];
  *(float *)&double v6 = a3;
  *(float *)&double v7 = a4;
  [v8 webProcessVideoAdJSODidCallSkipAdTapped:v6 volume:v7];
}

- (void)webProcessVideoAdJSOFullScreenTapped:(float)a3 volume:(float)a4
{
  id v8 = [(APWebProcessPlugInLoadDelegate *)self webProcessDelegate];
  *(float *)&double v6 = a3;
  *(float *)&double v7 = a4;
  [v8 webProcessVideoAdJSODidCallFullScreenTapped:v6 volume:v7];
}

- (void)webProcessVideoAdJSOExitFullScreenTapped:(float)a3 volume:(float)a4
{
  id v8 = [(APWebProcessPlugInLoadDelegate *)self webProcessDelegate];
  *(float *)&double v6 = a3;
  *(float *)&double v7 = a4;
  [v8 webProcessVideoAdJSODidCallExitFullScreenTapped:v6 volume:v7];
}

- (void)webProcessMRAIDJSODidCallClose
{
  id v2 = [(APWebProcessPlugInLoadDelegate *)self webProcessDelegate];
  [v2 webProcessMRAIDJSODidCallClose];
}

- (void)webProcessMRAIDJSODidCallExpand:(id)a3 withMaximumWidth:(double)a4 andHeight:(double)a5
{
  id v8 = a3;
  id v9 = [(APWebProcessPlugInLoadDelegate *)self webProcessDelegate];
  [v9 webProcessMRAIDJSODidCallExpand:v8 withMaximumWidth:a4 andHeight:a5];
}

- (void)webProcessMRAIDJSODidCallOpen:(id)a3
{
  id v4 = a3;
  id v5 = [(APWebProcessPlugInLoadDelegate *)self webProcessDelegate];
  [v5 webProcessMRAIDJSODidCallOpen:v4];
}

- (void)webProcessMRAIDJSODidCallCreateCalendarEvent:(id)a3
{
  id v4 = a3;
  id v5 = [(APWebProcessPlugInLoadDelegate *)self webProcessDelegate];
  [v5 webProcessMRAIDJSODidCallCreateCalendarEvent:v4];
}

- (void)creativeStateDidChange:(int64_t)a3
{
  id v5 = [(APWebProcessPlugInLoadDelegate *)self webProcessMRAIDJSO];

  if (v5)
  {
    id v6 = [(APWebProcessPlugInLoadDelegate *)self webProcessMRAIDJSO];
    [v6 setState:a3];
  }
}

- (void)creativeVisibilityDidChange:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(APWebProcessPlugInLoadDelegate *)self webProcessMRAIDJSO];

  if (v5)
  {
    id v6 = [(APWebProcessPlugInLoadDelegate *)self webProcessMRAIDJSO];
    [v6 setViewable:v3];
  }
}

- (void)contentSizeDidChange:(id)a3
{
  id v6 = a3;
  id v4 = [(APWebProcessPlugInLoadDelegate *)self webProcessVideoAdJSO];

  if (v4)
  {
    id v5 = [(APWebProcessPlugInLoadDelegate *)self webProcessVideoAdJSO];
    [v5 contentSizeDidChange:v6];
  }
}

- (void)setExpandedWidth:(double)a3 andHeight:(double)a4
{
  double v7 = [(APWebProcessPlugInLoadDelegate *)self webProcessMRAIDJSO];

  if (v7)
  {
    id v8 = [(APWebProcessPlugInLoadDelegate *)self webProcessMRAIDJSO];
    objc_msgSend(v8, "setExpandedSize:", a3, a4);
  }
}

- (void)actionDidFailWithErrorDescription:(id)a3
{
  id v6 = a3;
  id v4 = [(APWebProcessPlugInLoadDelegate *)self webProcessMRAIDJSO];

  if (v4)
  {
    id v5 = [(APWebProcessPlugInLoadDelegate *)self webProcessMRAIDJSO];
    [v5 actionDidFailWithErrorDescription:v6];
  }
}

- (void)resetVideoTagPlaytime
{
  BOOL v3 = [(APWebProcessPlugInLoadDelegate *)self webProcessMRAIDJSO];

  if (v3)
  {
    id v4 = [(APWebProcessPlugInLoadDelegate *)self webProcessMRAIDJSO];
    [v4 resetVideoTagPlaytime];
  }
}

- (void)resetSession
{
  if (qword_16FC0 != -1) {
    dispatch_once(&qword_16FC0, &stru_103F0);
  }
  BOOL v3 = (void *)qword_16FC8;
  if (os_log_type_enabled((os_log_t)qword_16FC8, OS_LOG_TYPE_INFO))
  {
    id v4 = v3;
    id v5 = [(APWebProcessPlugInLoadDelegate *)self advertisingIdentifier];
    int v6 = 138543362;
    double v7 = v5;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "Resetting session %{public}@", (uint8_t *)&v6, 0xCu);
  }
  [(APWebProcessPlugInLoadDelegate *)self setCurrentJSContext:0];
  [(APWebProcessPlugInLoadDelegate *)self setAdvertisingIdentifier:0];
  [(APWebProcessPlugInLoadDelegate *)self setMaximumRequestCount:0];
  [(APWebProcessPlugInLoadDelegate *)self setWebProcessMRAIDJSO:0];
  [(APWebProcessPlugInLoadDelegate *)self setWebProcessVideoAdJSO:0];
}

- (void)setWebViewProcessAdIdentifier:(id)a3 maxRequestCount:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if (v7) {
    [(APWebProcessPlugInLoadDelegate *)self setWebViewProcessAdIdentifier:v7];
  }
  if (v6) {
    [(APWebProcessPlugInLoadDelegate *)self setWebViewProcessMaxRequestCount:v6];
  }
}

- (APWebProcessDelegate)webProcessDelegate
{
  return self->_webProcessDelegate;
}

- (void)setWebProcessDelegate:(id)a3
{
}

- (JSContext)currentJSContext
{
  return self->_currentJSContext;
}

- (void)setCurrentJSContext:(id)a3
{
}

- (APWebProcessDiagnosticJSO)webProcessDiagnosticJSO
{
  return self->_webProcessDiagnosticJSO;
}

- (void)setWebProcessDiagnosticJSO:(id)a3
{
}

- (APWebProcessMRAIDJSO)webProcessMRAIDJSO
{
  return self->_webProcessMRAIDJSO;
}

- (void)setWebProcessMRAIDJSO:(id)a3
{
}

- (APWebProcessVideoAdJSO)webProcessVideoAdJSO
{
  return self->_webProcessVideoAdJSO;
}

- (void)setWebProcessVideoAdJSO:(id)a3
{
}

- (NSString)advertisingIdentifier
{
  return self->_advertisingIdentifier;
}

- (void)setAdvertisingIdentifier:(id)a3
{
}

- (NSNumber)maximumRequestCount
{
  return self->_maximumRequestCount;
}

- (void)setMaximumRequestCount:(id)a3
{
}

- (NSString)webViewProcessAdIdentifier
{
  return self->_webViewProcessAdIdentifier;
}

- (void)setWebViewProcessAdIdentifier:(id)a3
{
}

- (NSNumber)webViewProcessMaxRequestCount
{
  return self->_webViewProcessMaxRequestCount;
}

- (void)setWebViewProcessMaxRequestCount:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webViewProcessMaxRequestCount, 0);
  objc_storeStrong((id *)&self->_webViewProcessAdIdentifier, 0);
  objc_storeStrong((id *)&self->_maximumRequestCount, 0);
  objc_storeStrong((id *)&self->_advertisingIdentifier, 0);
  objc_storeStrong((id *)&self->_webProcessVideoAdJSO, 0);
  objc_storeStrong((id *)&self->_webProcessMRAIDJSO, 0);
  objc_storeStrong((id *)&self->_webProcessDiagnosticJSO, 0);
  objc_storeStrong((id *)&self->_currentJSContext, 0);

  objc_storeStrong((id *)&self->_webProcessDelegate, 0);
}

@end