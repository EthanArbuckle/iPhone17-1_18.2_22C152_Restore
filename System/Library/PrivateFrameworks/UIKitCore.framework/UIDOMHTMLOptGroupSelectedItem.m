@interface UIDOMHTMLOptGroupSelectedItem
- (BOOL)isGroup;
- (BOOL)selected;
- (DOMHTMLOptGroupElement)_node;
- (UIDOMHTMLOptGroupSelectedItem)initWithHTMLOptGroupNode:(id)a3;
- (id)node;
- (void)dealloc;
- (void)set_node:(id)a3;
@end

@implementation UIDOMHTMLOptGroupSelectedItem

- (UIDOMHTMLOptGroupSelectedItem)initWithHTMLOptGroupNode:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)UIDOMHTMLOptGroupSelectedItem;
  v4 = [(UIDOMHTMLOptGroupSelectedItem *)&v7 init];
  v5 = v4;
  if (v4) {
    [(UIDOMHTMLOptGroupSelectedItem *)v4 set_node:a3];
  }
  return v5;
}

- (id)node
{
  return self->_node;
}

- (BOOL)selected
{
  return 0;
}

- (BOOL)isGroup
{
  return 1;
}

- (void)dealloc
{
  [(UIDOMHTMLOptGroupSelectedItem *)self set_node:0];
  v3.receiver = self;
  v3.super_class = (Class)UIDOMHTMLOptGroupSelectedItem;
  [(UIDOMHTMLOptGroupSelectedItem *)&v3 dealloc];
}

- (DOMHTMLOptGroupElement)_node
{
  return self->_node;
}

- (void)set_node:(id)a3
{
}

@end