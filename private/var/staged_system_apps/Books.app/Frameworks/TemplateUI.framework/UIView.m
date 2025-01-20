@interface UIView
- (NSDictionary)tui_hostedSubviewsMap;
- (id)tui_querySectionUID;
- (id)tui_querySectionUUID;
- (void)setTui_hostedSubviewsMap:(id)a3;
@end

@implementation UIView

- (void)setTui_hostedSubviewsMap:(id)a3
{
}

- (NSDictionary)tui_hostedSubviewsMap
{
  return (NSDictionary *)objc_getAssociatedObject(self, off_2DECA0);
}

- (id)tui_querySectionUUID
{
  v2 = [(UIView *)self tui_renderViewHost];
  v3 = [v2 tui_querySectionUUID];

  return v3;
}

- (id)tui_querySectionUID
{
  v2 = [(UIView *)self tui_renderViewHost];
  v3 = [v2 tui_querySectionUID];

  return v3;
}

@end