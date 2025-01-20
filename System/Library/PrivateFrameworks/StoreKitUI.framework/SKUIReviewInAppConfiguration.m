@interface SKUIReviewInAppConfiguration
- (BOOL)isNativeVisionApp;
- (BOOL)isSandboxed;
- (NSString)customDescription;
- (NSString)itemID;
- (NSString)title;
- (SKUIClientContext)clientContext;
- (UIImage)icon;
- (UIViewController)viewController;
- (void)setClientContext:(id)a3;
- (void)setCustomDescription:(id)a3;
- (void)setIcon:(id)a3;
- (void)setIsNativeVisionApp:(BOOL)a3;
- (void)setItemID:(id)a3;
- (void)setSandboxed:(BOOL)a3;
- (void)setTitle:(id)a3;
- (void)setViewController:(id)a3;
@end

@implementation SKUIReviewInAppConfiguration

- (NSString)itemID
{
  return self->_itemID;
}

- (void)setItemID:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (UIViewController)viewController
{
  return self->_viewController;
}

- (void)setViewController:(id)a3
{
}

- (SKUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(id)a3
{
}

- (NSString)customDescription
{
  return self->_customDescription;
}

- (void)setCustomDescription:(id)a3
{
}

- (UIImage)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
}

- (BOOL)isSandboxed
{
  return self->_sandboxed;
}

- (void)setSandboxed:(BOOL)a3
{
  self->_sandboxed = a3;
}

- (BOOL)isNativeVisionApp
{
  return self->_isNativeVisionApp;
}

- (void)setIsNativeVisionApp:(BOOL)a3
{
  self->_isNativeVisionApp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_customDescription, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_itemID, 0);
}

@end