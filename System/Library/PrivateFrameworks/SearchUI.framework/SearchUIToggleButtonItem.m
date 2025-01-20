@interface SearchUIToggleButtonItem
- (BOOL)allowsContextMenu;
- (id)offStateImage;
- (id)offStateTitle;
- (id)onStateImage;
- (id)onStateTitle;
- (id)toggledTitle;
- (id)untoggledTitle;
- (void)buttonPressed;
@end

@implementation SearchUIToggleButtonItem

- (void)buttonPressed
{
  [(SearchUIButtonItem *)self setStatus:[(SearchUIButtonItem *)self status] == 0];
  id v3 = [(SearchUIButtonItem *)self delegate];
  [v3 stateDidChangeForButtonItem:self];
}

- (id)offStateTitle
{
  id v3 = [(SearchUIButtonItem *)self sfButtonItem];
  v4 = [v3 toggleButtonConfiguration];
  v5 = [v4 untoggledTitle];
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [(SearchUIToggleButtonItem *)self untoggledTitle];
  }
  v8 = v7;

  return v8;
}

- (id)untoggledTitle
{
  v4.receiver = self;
  v4.super_class = (Class)SearchUIToggleButtonItem;
  v2 = [(SearchUIButtonItem *)&v4 offStateTitle];
  return v2;
}

- (id)onStateTitle
{
  id v3 = [(SearchUIButtonItem *)self sfButtonItem];
  objc_super v4 = [v3 toggleButtonConfiguration];
  v5 = [v4 toggledTitle];
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [(SearchUIToggleButtonItem *)self toggledTitle];
  }
  v8 = v7;

  return v8;
}

- (id)toggledTitle
{
  v4.receiver = self;
  v4.super_class = (Class)SearchUIToggleButtonItem;
  v2 = [(SearchUIButtonItem *)&v4 onStateTitle];
  return v2;
}

- (id)offStateImage
{
  id v3 = [(SearchUIButtonItem *)self sfButtonItem];
  objc_super v4 = [v3 toggleButtonConfiguration];
  v5 = [v4 untoggledImage];
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)SearchUIToggleButtonItem;
    id v7 = [(SearchUIButtonItem *)&v10 offStateImage];
  }
  v8 = v7;

  return v8;
}

- (id)onStateImage
{
  id v3 = [(SearchUIButtonItem *)self sfButtonItem];
  objc_super v4 = [v3 toggleButtonConfiguration];
  v5 = [v4 toggledImage];
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)SearchUIToggleButtonItem;
    id v7 = [(SearchUIButtonItem *)&v10 onStateImage];
  }
  v8 = v7;

  return v8;
}

- (BOOL)allowsContextMenu
{
  return 0;
}

@end