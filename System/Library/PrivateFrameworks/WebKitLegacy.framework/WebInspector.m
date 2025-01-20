@interface WebInspector
- (BOOL)isDebuggingJavaScript;
- (BOOL)isJavaScriptProfilingEnabled;
- (BOOL)isOpen;
- (BOOL)isProfilingJavaScript;
- (BOOL)isTimelineProfilingEnabled;
- (WebInspector)initWithInspectedWebView:(id)a3;
- (void)attach:(id)a3;
- (void)close:(id)a3;
- (void)dealloc;
- (void)detach:(id)a3;
- (void)evaluateInFrontend:(id)a3 script:(id)a4;
- (void)inspectedWebViewClosed;
- (void)releaseFrontend;
- (void)setFrontend:(id)a3;
- (void)setTimelineProfilingEnabled:(BOOL)a3;
- (void)showConsole:(id)a3;
- (void)showWindow;
- (void)startDebuggingJavaScript:(id)a3;
- (void)stopDebuggingJavaScript:(id)a3;
- (void)toggleDebuggingJavaScript:(id)a3;
@end

@implementation WebInspector

- (WebInspector)initWithInspectedWebView:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)WebInspector;
  result = [(WebInspector *)&v5 init];
  if (result) {
    result->_inspectedWebView = (WebView *)a3;
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)WebInspector;
  [(WebInspector *)&v3 dealloc];
}

- (void)inspectedWebViewClosed
{
  self->_inspectedWebView = 0;
}

- (void)showWindow
{
  inspectedWebView = self->_inspectedWebView;
  if (inspectedWebView)
  {
    [inspectedWebView page];
    if (v3) {
      WebCore::InspectorController::show(*(WebCore::InspectorController **)(v3 + 80));
    }
  }
}

- (void)showConsole:(id)a3
{
  [(WebInspector *)self showWindow];
  frontend = self->_frontend;
  [(WebInspectorFrontend *)frontend showConsole];
}

- (BOOL)isDebuggingJavaScript
{
  frontend = self->_frontend;
  if (frontend) {
    LOBYTE(frontend) = [(WebInspectorFrontend *)frontend isDebuggingEnabled];
  }
  return (char)frontend;
}

- (void)toggleDebuggingJavaScript:(id)a3
{
  [(WebInspector *)self showWindow];
  uint64_t v4 = [(WebInspector *)self isDebuggingJavaScript] ^ 1;
  frontend = self->_frontend;
  [(WebInspectorFrontend *)frontend setDebuggingEnabled:v4];
}

- (void)startDebuggingJavaScript:(id)a3
{
  frontend = self->_frontend;
  if (frontend) {
    [(WebInspectorFrontend *)frontend setDebuggingEnabled:1];
  }
}

- (void)stopDebuggingJavaScript:(id)a3
{
  frontend = self->_frontend;
  if (frontend) {
    [(WebInspectorFrontend *)frontend setDebuggingEnabled:0];
  }
}

- (BOOL)isProfilingJavaScript
{
  return 0;
}

- (BOOL)isJavaScriptProfilingEnabled
{
  return 0;
}

- (BOOL)isTimelineProfilingEnabled
{
  frontend = self->_frontend;
  if (frontend) {
    LOBYTE(frontend) = [(WebInspectorFrontend *)frontend isTimelineProfilingEnabled];
  }
  return (char)frontend;
}

- (void)setTimelineProfilingEnabled:(BOOL)a3
{
  frontend = self->_frontend;
  if (frontend) {
    [(WebInspectorFrontend *)frontend setTimelineProfilingEnabled:a3];
  }
}

- (BOOL)isOpen
{
  return self->_frontend != 0;
}

- (void)close:(id)a3
{
}

- (void)attach:(id)a3
{
}

- (void)detach:(id)a3
{
}

- (void)evaluateInFrontend:(id)a3 script:(id)a4
{
  inspectedWebView = self->_inspectedWebView;
  if (inspectedWebView)
  {
    [inspectedWebView page];
    if (v9)
    {
      v6 = (WebCore::InspectorController *)*((void *)v9 + 10);
      MEMORY[0x1E4E442D0](&v9, a4);
      WebCore::InspectorController::evaluateForTestInFrontend(v6, (const WTF::String *)&v9);
      v8 = v9;
      v9 = 0;
      if (v8)
      {
        if (*(_DWORD *)v8 == 2) {
          WTF::StringImpl::destroy(v8, v7);
        }
        else {
          *(_DWORD *)v8 -= 2;
        }
      }
    }
  }
}

- (void)setFrontend:(id)a3
{
  self->_frontend = (WebInspectorFrontend *)a3;
}

- (void)releaseFrontend
{
  self->_frontend = 0;
}

@end