@interface SUNavigationItem
- (SUNavigationItemDelegate)delegate;
- (UIBarButtonItem)secondaryLeftBarButtonItem;
- (void)setDelegate:(id)a3;
- (void)setLeftBarButtonItem:(id)a3;
- (void)setLeftBarButtonItem:(id)a3 animated:(BOOL)a4;
- (void)setLeftBarButtonItems:(id)a3;
- (void)setLeftBarButtonItems:(id)a3 animated:(BOOL)a4;
- (void)setSecondaryLeftBarButtonItem:(id)a3;
- (void)setSecondaryLeftBarButtonItem:(id)a3 animated:(BOOL)a4;
@end

@implementation SUNavigationItem

- (UIBarButtonItem)secondaryLeftBarButtonItem
{
  v2 = (void *)[(SUNavigationItem *)self leftBarButtonItems];
  result = (UIBarButtonItem *)[v2 count];
  if (result)
  {
    return (UIBarButtonItem *)[v2 objectAtIndex:0];
  }
  return result;
}

- (void)setSecondaryLeftBarButtonItem:(id)a3
{
}

- (void)setSecondaryLeftBarButtonItem:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  [(SUNavigationItem *)self setLeftItemsSupplementBackButton:1];
  uint64_t v7 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", a3, 0);

  [(SUNavigationItem *)self setLeftBarButtonItems:v7 animated:v4];
}

- (void)setLeftBarButtonItem:(id)a3
{
  [(SUNavigationItem *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v5 = [(SUNavigationItemDelegate *)[(SUNavigationItem *)self delegate] navigationItem:self willChangeLeftItem:[(SUNavigationItem *)self leftBarButtonItem] toNewItem:a3];
    if (v5)
    {
      -[SUNavigationItem setLeftBarButtonItem:](&v10, sel_setLeftBarButtonItem_, v5, v7, v8, v9.receiver, v9.super_class, self, SUNavigationItem);
      return;
    }
    v9.receiver = self;
    v9.super_class = (Class)SUNavigationItem;
    v6 = &v9;
  }
  else
  {
    uint64_t v7 = self;
    v8 = SUNavigationItem;
    v6 = (objc_super *)&v7;
  }
  -[objc_super setLeftBarButtonItem:](v6, sel_setLeftBarButtonItem_, a3, v7, v8, v9.receiver, v9.super_class, v10.receiver, v10.super_class);
}

- (void)setLeftBarButtonItems:(id)a3
{
  [(SUNavigationItem *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v5 = (void *)[(SUNavigationItemDelegate *)[(SUNavigationItem *)self delegate] navigationItem:self willChangeLeftItems:[(SUNavigationItem *)self leftBarButtonItems] toNewItems:a3];
    if (v5)
    {
      v6 = v5;
      if ([v5 count])
      {
        -[SUNavigationItem setLeftBarButtonItems:](&v11, sel_setLeftBarButtonItems_, v6, v8, v9, v10.receiver, v10.super_class, self, SUNavigationItem);
        return;
      }
    }
    v10.receiver = self;
    v10.super_class = (Class)SUNavigationItem;
    uint64_t v7 = &v10;
  }
  else
  {
    v8 = self;
    objc_super v9 = SUNavigationItem;
    uint64_t v7 = (objc_super *)&v8;
  }
  -[objc_super setLeftBarButtonItems:](v7, sel_setLeftBarButtonItems_, a3, v8, v9, v10.receiver, v10.super_class, v11.receiver, v11.super_class);
}

- (void)setLeftBarButtonItems:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  [(SUNavigationItem *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v7 = (void *)[(SUNavigationItemDelegate *)[(SUNavigationItem *)self delegate] navigationItem:self willChangeLeftItems:[(SUNavigationItem *)self leftBarButtonItems] toNewItems:a3];
    if (v7)
    {
      v8 = v7;
      if ([v7 count])
      {
        -[SUNavigationItem setLeftBarButtonItems:animated:](&v13, sel_setLeftBarButtonItems_animated_, v8, v4, v10, v11, v12.receiver, v12.super_class, self, SUNavigationItem);
        return;
      }
    }
    v12.receiver = self;
    v12.super_class = (Class)SUNavigationItem;
    objc_super v9 = &v12;
  }
  else
  {
    objc_super v10 = self;
    objc_super v11 = SUNavigationItem;
    objc_super v9 = (objc_super *)&v10;
  }
  -[objc_super setLeftBarButtonItems:animated:](v9, sel_setLeftBarButtonItems_animated_, a3, v4, v10, v11, v12.receiver, v12.super_class, v13.receiver, v13.super_class);
}

- (void)setLeftBarButtonItem:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  [(SUNavigationItem *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v7 = [(SUNavigationItemDelegate *)[(SUNavigationItem *)self delegate] navigationItem:self willChangeLeftItem:[(SUNavigationItem *)self leftBarButtonItem] toNewItem:a3];
    if (v7)
    {
      -[SUNavigationItem setLeftBarButtonItem:animated:](&v12, sel_setLeftBarButtonItem_animated_, v7, v4, v9, v10, v11.receiver, v11.super_class, self, SUNavigationItem);
      return;
    }
    v11.receiver = self;
    v11.super_class = (Class)SUNavigationItem;
    v8 = &v11;
  }
  else
  {
    objc_super v9 = self;
    objc_super v10 = SUNavigationItem;
    v8 = (objc_super *)&v9;
  }
  -[objc_super setLeftBarButtonItem:animated:](v8, sel_setLeftBarButtonItem_animated_, a3, v4, v9, v10, v11.receiver, v11.super_class, v12.receiver, v12.super_class);
}

- (SUNavigationItemDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (SUNavigationItemDelegate *)a3;
}

@end