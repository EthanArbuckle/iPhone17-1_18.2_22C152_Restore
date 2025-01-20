@interface UIStoryboardPopoverSegueTemplate
- (NSArray)passthroughViews;
- (UIBarButtonItem)anchorBarButtonItem;
- (UIStoryboardPopoverSegueTemplate)initWithCoder:(id)a3;
- (UIView)anchorView;
- (id)segueWithDestinationViewController:(id)a3;
- (unint64_t)permittedArrowDirections;
- (void)encodeWithCoder:(id)a3;
- (void)setAnchorBarButtonItem:(id)a3;
- (void)setAnchorView:(id)a3;
- (void)setPassthroughViews:(id)a3;
- (void)setPermittedArrowDirections:(unint64_t)a3;
@end

@implementation UIStoryboardPopoverSegueTemplate

- (UIStoryboardPopoverSegueTemplate)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)UIStoryboardPopoverSegueTemplate;
  v5 = [(UIStoryboardSegueTemplate *)&v14 initWithCoder:v4];
  if (v5)
  {
    v5->_permittedArrowDirections = [v4 decodeIntegerForKey:@"UIPermittedArrowDirections"];
    v6 = [v4 decodeObjectForKey:@"UIPassthroughViews"];
    uint64_t v7 = [v6 copy];
    passthroughViews = v5->_passthroughViews;
    v5->_passthroughViews = (NSArray *)v7;

    uint64_t v9 = [v4 decodeObjectForKey:@"UIAnchorBarButtonItem"];
    anchorBarButtonItem = v5->_anchorBarButtonItem;
    v5->_anchorBarButtonItem = (UIBarButtonItem *)v9;

    uint64_t v11 = [v4 decodeObjectForKey:@"UIAnchorView"];
    anchorView = v5->_anchorView;
    v5->_anchorView = (UIView *)v11;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UIStoryboardPopoverSegueTemplate;
  id v4 = a3;
  [(UIStoryboardSegueTemplate *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_permittedArrowDirections, @"UIPermittedArrowDirections", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_passthroughViews forKey:@"UIPassthroughViews"];
  [v4 encodeObject:self->_anchorBarButtonItem forKey:@"UIAnchorBarButtonItem"];
  [v4 encodeObject:self->_anchorView forKey:@"UIAnchorView"];
}

- (id)segueWithDestinationViewController:(id)a3
{
  id v4 = a3;
  objc_super v5 = [UIStoryboardPopoverSegue alloc];
  v6 = [(UIStoryboardSegueTemplate *)self identifier];
  uint64_t v7 = [(UIStoryboardSegueTemplate *)self viewController];
  v8 = [(UIStoryboardSegue *)v5 initWithIdentifier:v6 source:v7 destination:v4];

  uint64_t v9 = [(UIStoryboardPopoverSegueTemplate *)self passthroughViews];
  [(UIStoryboardPopoverSegue *)v8 _setPassthroughViews:v9];

  [(UIStoryboardPopoverSegue *)v8 _setPermittedArrowDirections:[(UIStoryboardPopoverSegueTemplate *)self permittedArrowDirections]];
  v10 = [(UIStoryboardPopoverSegueTemplate *)self anchorBarButtonItem];
  [(UIStoryboardPopoverSegue *)v8 _setAnchorBarButtonItem:v10];

  uint64_t v11 = [(UIStoryboardPopoverSegueTemplate *)self anchorView];

  if (v11)
  {
    v12 = [(UIStoryboardPopoverSegueTemplate *)self anchorView];
    [(UIStoryboardPopoverSegue *)v8 _setAnchorView:v12];

    v13 = [(UIStoryboardPopoverSegueTemplate *)self anchorView];
    [v13 bounds];
    -[UIStoryboardPopoverSegue _setAnchorRect:](v8, "_setAnchorRect:");
  }
  return v8;
}

- (unint64_t)permittedArrowDirections
{
  return self->_permittedArrowDirections;
}

- (void)setPermittedArrowDirections:(unint64_t)a3
{
  self->_permittedArrowDirections = a3;
}

- (NSArray)passthroughViews
{
  return self->_passthroughViews;
}

- (void)setPassthroughViews:(id)a3
{
}

- (UIView)anchorView
{
  return self->_anchorView;
}

- (void)setAnchorView:(id)a3
{
}

- (UIBarButtonItem)anchorBarButtonItem
{
  return self->_anchorBarButtonItem;
}

- (void)setAnchorBarButtonItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anchorBarButtonItem, 0);
  objc_storeStrong((id *)&self->_anchorView, 0);
  objc_storeStrong((id *)&self->_passthroughViews, 0);
}

@end