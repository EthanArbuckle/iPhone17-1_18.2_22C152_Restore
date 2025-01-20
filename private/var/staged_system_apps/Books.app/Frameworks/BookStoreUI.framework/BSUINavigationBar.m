@interface BSUINavigationBar
- (UIView)largeTitleView;
- (id)accessibilityElements;
- (void)pushNavigationItem:(id)a3 animated:(BOOL)a4;
@end

@implementation BSUINavigationBar

- (void)pushNavigationItem:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [(BSUINavigationBar *)self delegate];
  v8 = BUProtocolCast();

  if (objc_opt_respondsToSelector()) {
    char v9 = [v8 shouldHideNavigationItemBackgroundDuringTransition:v6] ^ 1;
  }
  else {
    char v9 = 0;
  }
  unsigned __int8 v10 = [v6 _backgroundHidden];
  if (v9 & 1) != 0 || (v10)
  {
    v11.receiver = self;
    v11.super_class = (Class)BSUINavigationBar;
    [(BSUINavigationBar *)&v11 pushNavigationItem:v6 animated:v4];
  }
  else
  {
    [v6 _setBackgroundHidden:1];
    v11.receiver = self;
    v11.super_class = (Class)BSUINavigationBar;
    [(BSUINavigationBar *)&v11 pushNavigationItem:v6 animated:v4];
    [v6 _setBackgroundHidden:0];
  }
}

- (id)accessibilityElements
{
  v17.receiver = self;
  v17.super_class = (Class)BSUINavigationBar;
  v2 = [(BSUINavigationBar *)&v17 accessibilityElements];
  id v3 = [v2 mutableCopy];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = v3;
  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        char v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        unsigned __int8 v10 = [v9 accessibilityIdentifier];
        unsigned int v11 = [v10 isEqualToString:@"ToggleSidebar"];

        if (v11)
        {
          [v4 removeObject:v9];
          [v4 insertObject:v9 atIndex:0];
          goto LABEL_11;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v13 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (UIView)largeTitleView
{
  return self->_largeTitleView;
}

- (void).cxx_destruct
{
}

@end