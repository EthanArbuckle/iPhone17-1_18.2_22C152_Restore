@interface _UITabElement
+ (id)_searchElement;
- (BOOL)_isElement;
- (UIViewController)_viewController;
- (_UITabElement)initWithIdentifier:(id)a3 title:(id)a4 image:(id)a5;
- (void)_setViewController:(id)a3;
@end

@implementation _UITabElement

- (BOOL)_isElement
{
  return 1;
}

- (UIViewController)_viewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__viewController);
  return (UIViewController *)WeakRetained;
}

- (_UITabElement)initWithIdentifier:(id)a3 title:(id)a4 image:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)_UITabElement;
  return [(UITab *)&v6 initWithTitle:a4 image:a5 identifier:a3 viewControllerProvider:0];
}

- (void)_setViewController:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->__viewController);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->__viewController, obj);
    BOOL v6 = [(UITab *)self _isBridgedItem];
    v5 = obj;
    if (!v6)
    {
      [(UITab *)self _updateLinkedTabBarItem];
      v5 = obj;
    }
  }
}

+ (id)_searchElement
{
  v2 = [_UITabElement alloc];
  v3 = _UINSLocalizedStringWithDefaultValue(@"Search", @"Search");
  v4 = +[UIImage systemImageNamed:@"magnifyingglass"];
  v5 = [(_UITabElement *)v2 initWithIdentifier:@"com.apple.UIKit.Search" title:v3 image:v4];

  [(_UITab *)v5 _setTabBarPlacement:1];
  return v5;
}

- (void).cxx_destruct
{
}

@end