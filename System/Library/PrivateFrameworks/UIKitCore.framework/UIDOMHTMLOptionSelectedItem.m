@interface UIDOMHTMLOptionSelectedItem
- (BOOL)isGroup;
- (BOOL)selected;
- (DOMHTMLOptionElement)_node;
- (UIDOMHTMLOptionSelectedItem)initWithHTMLOptionNode:(id)a3;
- (id)node;
- (void)dealloc;
- (void)setSelected:(BOOL)a3;
- (void)set_node:(id)a3;
- (void)unselect;
@end

@implementation UIDOMHTMLOptionSelectedItem

- (UIDOMHTMLOptionSelectedItem)initWithHTMLOptionNode:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UIDOMHTMLOptionSelectedItem;
  v4 = [(UIDOMHTMLOptionSelectedItem *)&v6 init];
  if (v4)
  {
    v4->_selected = [a3 selected];
    [(UIDOMHTMLOptionSelectedItem *)v4 set_node:a3];
  }
  return v4;
}

- (id)node
{
  return self->_node;
}

- (BOOL)selected
{
  return self->_selected;
}

- (BOOL)isGroup
{
  return 0;
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
  -[DOMHTMLOptionElement setSelected:](self->_node, "setSelected:");
}

- (void)unselect
{
  self->_selected = 0;
}

- (void)dealloc
{
  [(UIDOMHTMLOptionSelectedItem *)self set_node:0];
  v3.receiver = self;
  v3.super_class = (Class)UIDOMHTMLOptionSelectedItem;
  [(UIDOMHTMLOptionSelectedItem *)&v3 dealloc];
}

- (DOMHTMLOptionElement)_node
{
  return self->_node;
}

- (void)set_node:(id)a3
{
}

@end