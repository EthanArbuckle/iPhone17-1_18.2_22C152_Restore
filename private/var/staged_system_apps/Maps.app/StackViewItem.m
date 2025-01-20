@interface StackViewItem
- (NSNumber)horizontalSpacing;
- (StackViewItem)initWithView:(id)a3 horizontalSpacing:(id)a4;
- (UIView)view;
@end

@implementation StackViewItem

- (StackViewItem)initWithView:(id)a3 horizontalSpacing:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)StackViewItem;
  v9 = [(StackViewItem *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_view, a3);
    objc_storeStrong((id *)&v10->_horizontalSpacing, a4);
  }

  return v10;
}

- (UIView)view
{
  return self->_view;
}

- (NSNumber)horizontalSpacing
{
  return self->_horizontalSpacing;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_horizontalSpacing, 0);

  objc_storeStrong((id *)&self->_view, 0);
}

@end