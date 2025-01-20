@interface UIViewController_UITraitCollection
- (id)view;
@end

@implementation UIViewController_UITraitCollection

- (id)view
{
  v3 = objc_msgSend_tmlParent(self, a2, v2);
  v6 = objc_msgSend_view(v3, v4, v5);

  return v6;
}

@end