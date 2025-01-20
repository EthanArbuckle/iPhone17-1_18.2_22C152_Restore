@interface _BEWKWebViewPendingFontRegistration
- (BEStyleManaging)styleManager;
- (id)fontRegistrationHandler;
- (void)setFontRegistrationHandler:(id)a3;
- (void)setStyleManager:(id)a3;
@end

@implementation _BEWKWebViewPendingFontRegistration

- (BEStyleManaging)styleManager
{
  return self->_styleManager;
}

- (void)setStyleManager:(id)a3
{
}

- (id)fontRegistrationHandler
{
  return self->_fontRegistrationHandler;
}

- (void)setFontRegistrationHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fontRegistrationHandler, 0);

  objc_storeStrong((id *)&self->_styleManager, 0);
}

@end