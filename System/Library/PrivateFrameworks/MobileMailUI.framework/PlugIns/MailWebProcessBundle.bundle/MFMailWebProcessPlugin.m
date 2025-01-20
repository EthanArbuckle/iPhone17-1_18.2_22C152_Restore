@interface MFMailWebProcessPlugin
+ (void)initialize;
- (BOOL)isMailPrivacyProtectionAllowed;
- (MFMailWebProcessPlugin)init;
- (NSString)remoteContentNoProxySchemePrefix;
- (NSString)remoteContentProxySchemePrefix;
- (WKWebProcessPlugInController)controller;
- (void)setController:(id)a3;
- (void)webProcessPlugIn:(id)a3 didCreateBrowserContextController:(id)a4;
- (void)webProcessPlugIn:(id)a3 initializeWithObject:(id)a4;
- (void)webProcessPlugIn:(id)a3 willDestroyBrowserContextController:(id)a4;
@end

@implementation MFMailWebProcessPlugin

+ (void)initialize
{
  uint64_t v2 = objc_opt_class();
  if (v2 == objc_opt_class())
  {
    signal(30, (void (__cdecl *)(int))((char *)&dword_0 + 1));
    dispatch_source_t v3 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0x1EuLL, 0, (dispatch_queue_t)&_dispatch_main_q);
    v4 = (void *)qword_DB58;
    qword_DB58 = (uint64_t)v3;

    dispatch_source_set_event_handler((dispatch_source_t)qword_DB58, &stru_82F0);
    v5 = qword_DB58;
    dispatch_resume(v5);
  }
}

- (MFMailWebProcessPlugin)init
{
  v6.receiver = self;
  v6.super_class = (Class)MFMailWebProcessPlugin;
  uint64_t v2 = [(MFMailWebProcessPlugin *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[NSMapTable strongToStrongObjectsMapTable];
    pageControllersByContext = v2->_pageControllersByContext;
    v2->_pageControllersByContext = (NSMapTable *)v3;
  }
  return v2;
}

- (NSString)remoteContentProxySchemePrefix
{
  uint64_t v2 = [(WKWebProcessPlugInController *)self->_controller parameters];
  uint64_t v3 = [v2 valueForKey:@"remoteContentProxySchemePrefix"];

  return (NSString *)v3;
}

- (NSString)remoteContentNoProxySchemePrefix
{
  uint64_t v2 = [(WKWebProcessPlugInController *)self->_controller parameters];
  uint64_t v3 = [v2 valueForKey:@"remoteContentNoProxySchemePrefix"];

  return (NSString *)v3;
}

- (BOOL)isMailPrivacyProtectionAllowed
{
  uint64_t v2 = [(WKWebProcessPlugInController *)self->_controller parameters];
  uint64_t v3 = [v2 valueForKey:@"isMailPrivacyProtectionAllowed"];
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (void)webProcessPlugIn:(id)a3 initializeWithObject:(id)a4
{
}

- (void)webProcessPlugIn:(id)a3 didCreateBrowserContextController:(id)a4
{
  id v6 = a4;
  v5 = [[MFMailWebProcessPlugInPageController alloc] initWithPlugIn:self contextController:v6];
  [(NSMapTable *)self->_pageControllersByContext setObject:v5 forKey:v6];
}

- (void)webProcessPlugIn:(id)a3 willDestroyBrowserContextController:(id)a4
{
  id v6 = a4;
  v5 = -[NSMapTable objectForKey:](self->_pageControllersByContext, "objectForKey:");
  [v5 invalidate];
  [(NSMapTable *)self->_pageControllersByContext removeObjectForKey:v6];
}

- (WKWebProcessPlugInController)controller
{
  return self->_controller;
}

- (void)setController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controller, 0);
  objc_storeStrong((id *)&self->_pageControllersByContext, 0);
}

@end