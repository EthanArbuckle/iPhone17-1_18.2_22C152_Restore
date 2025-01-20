@interface WebInspectorFrontend
- (BOOL)isDebuggingEnabled;
- (BOOL)isProfilingJavaScript;
- (BOOL)isTimelineProfilingEnabled;
- (WebInspectorFrontend)initWithFrontendClient:(NakedPtr<WebInspectorFrontendClient>)a3;
- (id).cxx_construct;
- (void)attach;
- (void)close;
- (void)detach;
- (void)setDebuggingEnabled:(BOOL)a3;
- (void)setTimelineProfilingEnabled:(BOOL)a3;
- (void)showConsole;
- (void)startProfilingJavaScript;
- (void)stopProfilingJavaScript;
@end

@implementation WebInspectorFrontend

- (WebInspectorFrontend)initWithFrontendClient:(NakedPtr<WebInspectorFrontendClient>)a3
{
  v5.receiver = self;
  v5.super_class = (Class)WebInspectorFrontend;
  result = [(WebInspectorFrontend *)&v5 init];
  if (result) {
    result->m_frontendClient.m_ptr = *(WebInspectorFrontendClient **)a3.m_ptr;
  }
  return result;
}

- (void)attach
{
}

- (void)detach
{
}

- (void)close
{
}

- (BOOL)isDebuggingEnabled
{
  return MEMORY[0x1F4171AC0](self->m_frontendClient.m_ptr, a2);
}

- (void)setDebuggingEnabled:(BOOL)a3
{
}

- (BOOL)isProfilingJavaScript
{
  return MEMORY[0x1F4171AD0](self->m_frontendClient.m_ptr, a2);
}

- (void)startProfilingJavaScript
{
}

- (void)stopProfilingJavaScript
{
}

- (BOOL)isTimelineProfilingEnabled
{
  return MEMORY[0x1F4171AE8](self->m_frontendClient.m_ptr, a2);
}

- (void)setTimelineProfilingEnabled:(BOOL)a3
{
}

- (void)showConsole
{
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

@end