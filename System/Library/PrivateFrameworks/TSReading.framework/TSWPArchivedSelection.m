@interface TSWPArchivedSelection
- (TSWPArchivedSelection)initWithContext:(id)a3;
- (TSWPSelection)selection;
- (void)dealloc;
- (void)setSelection:(id)a3;
@end

@implementation TSWPArchivedSelection

- (TSWPArchivedSelection)initWithContext:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TSWPArchivedSelection;
  v3 = [(TSPObject *)&v5 initWithContext:a3];
  if (v3) {
    -[TSWPArchivedSelection setSelection:](v3, "setSelection:", -[TSWPSelection initWithRange:]([TSWPSelection alloc], "initWithRange:", 0, 0));
  }
  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSWPArchivedSelection;
  [(TSWPArchivedSelection *)&v3 dealloc];
}

- (void)setSelection:(id)a3
{
  [(TSPObject *)self willModify];
  id v5 = a3;

  self->_selection = (TSWPSelection *)a3;
}

- (TSWPSelection)selection
{
  return self->_selection;
}

@end