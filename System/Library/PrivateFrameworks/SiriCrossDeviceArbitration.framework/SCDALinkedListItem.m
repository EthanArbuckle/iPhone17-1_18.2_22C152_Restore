@interface SCDALinkedListItem
- (SCDALinkedListItem)initWithObject:(id)a3;
- (SCDALinkedListItem)nextItem;
- (SCDALinkedListItem)previousItem;
- (id)object;
- (void)insertAfterItem:(id)a3;
- (void)insertBeforeItem:(id)a3;
- (void)removeFromList;
- (void)setNextItem:(id)a3;
- (void)setPreviousItem:(id)a3;
@end

@implementation SCDALinkedListItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextItem, 0);
  objc_storeStrong((id *)&self->_previousItem, 0);
  objc_storeStrong(&self->_object, 0);
}

- (void)setNextItem:(id)a3
{
}

- (SCDALinkedListItem)nextItem
{
  return self->_nextItem;
}

- (void)setPreviousItem:(id)a3
{
}

- (SCDALinkedListItem)previousItem
{
  return self->_previousItem;
}

- (id)object
{
  return self->_object;
}

- (void)removeFromList
{
  id v4 = [(SCDALinkedListItem *)self previousItem];
  v3 = [(SCDALinkedListItem *)self nextItem];
  [v4 setNextItem:v3];
  [(SCDALinkedListItem *)self setPreviousItem:0];
  [(SCDALinkedListItem *)self setNextItem:0];
  [v3 setPreviousItem:v4];
}

- (void)insertAfterItem:(id)a3
{
  v5 = (SCDALinkedListItem *)a3;
  id v4 = [(SCDALinkedListItem *)v5 nextItem];
  if (v5 != self && v4 != self)
  {
    [(SCDALinkedListItem *)v5 setNextItem:self];
    [(SCDALinkedListItem *)self setPreviousItem:v5];
    [(SCDALinkedListItem *)self setNextItem:v4];
    [(SCDALinkedListItem *)v4 setPreviousItem:self];
  }
}

- (void)insertBeforeItem:(id)a3
{
  v5 = (SCDALinkedListItem *)a3;
  id v4 = [(SCDALinkedListItem *)v5 previousItem];
  if (v5 != self && v4 != self)
  {
    [(SCDALinkedListItem *)v4 setNextItem:self];
    [(SCDALinkedListItem *)self setPreviousItem:v4];
    [(SCDALinkedListItem *)self setNextItem:v5];
    [(SCDALinkedListItem *)v5 setPreviousItem:self];
  }
}

- (SCDALinkedListItem)initWithObject:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SCDALinkedListItem;
  v6 = [(SCDALinkedListItem *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong(&v6->_object, a3);
  }

  return v7;
}

@end