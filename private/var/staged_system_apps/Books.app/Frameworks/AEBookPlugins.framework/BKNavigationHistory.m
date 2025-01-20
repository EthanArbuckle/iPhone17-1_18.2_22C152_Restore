@interface BKNavigationHistory
- (BOOL)isAtTopOfStack;
- (NSMutableArray)stack;
- (id)allObjects;
- (id)currentEntity;
- (id)description;
- (id)nextEntity;
- (id)previousEntity;
- (id)recursiveDescription;
- (int64_t)cursor;
- (void)_trim;
- (void)add:(id)a3;
- (void)rewind;
- (void)setCursor:(int64_t)a3;
- (void)setStack:(id)a3;
- (void)skip;
- (void)truncateHistory;
@end

@implementation BKNavigationHistory

- (NSMutableArray)stack
{
  stack = self->_stack;
  if (!stack)
  {
    v4 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v5 = self->_stack;
    self->_stack = v4;

    stack = self->_stack;
  }

  return stack;
}

- (BOOL)isAtTopOfStack
{
  id v3 = [(BKNavigationHistory *)self cursor];
  v4 = [(BKNavigationHistory *)self stack];
  LOBYTE(v3) = v3 == [v4 count];

  return (char)v3;
}

- (void)_trim
{
  for (i = self; ; self = i)
  {
    unint64_t v3 = [(BKNavigationHistory *)self cursor];
    v4 = [(BKNavigationHistory *)i stack];
    id v5 = [v4 count];

    if (v3 >= (unint64_t)v5) {
      break;
    }
    v6 = [(BKNavigationHistory *)i stack];
    [v6 removeLastObject];
  }
}

- (void)add:(id)a3
{
  id v7 = a3;
  if (![(BKNavigationHistory *)self isAtTopOfStack]) {
    [(BKNavigationHistory *)self truncateHistory];
  }
  v4 = v7;
  if (v7)
  {
    id v5 = [(BKNavigationHistory *)self stack];
    [v5 addObject:v7];

    v6 = [(BKNavigationHistory *)self stack];
    -[BKNavigationHistory setCursor:](self, "setCursor:", [v6 count]);

    v4 = v7;
  }
}

- (id)nextEntity
{
  unint64_t v3 = [(BKNavigationHistory *)self cursor];
  v4 = [(BKNavigationHistory *)self stack];
  id v5 = [v4 count];

  if (v3 >= (unint64_t)v5)
  {
    id v7 = 0;
  }
  else
  {
    v6 = [(BKNavigationHistory *)self stack];
    id v7 = [v6 objectAtIndex:v3];
  }

  return v7;
}

- (id)currentEntity
{
  unsigned int v3 = [(BKNavigationHistory *)self isAtTopOfStack];
  v4 = (char *)[(BKNavigationHistory *)self cursor] - (v3 ^ 1);
  id v5 = [(BKNavigationHistory *)self stack];
  v6 = (char *)[v5 count];

  if (v4 >= v6)
  {
    v8 = 0;
  }
  else
  {
    id v7 = [(BKNavigationHistory *)self stack];
    v8 = [v7 objectAtIndex:v4];
  }

  return v8;
}

- (id)previousEntity
{
  unsigned int v3 = [(BKNavigationHistory *)self isAtTopOfStack];
  int64_t v4 = [(BKNavigationHistory *)self cursor];
  uint64_t v5 = -2;
  if (v3) {
    uint64_t v5 = -1;
  }
  unint64_t v6 = v4 + v5;
  id v7 = [(BKNavigationHistory *)self stack];
  id v8 = [v7 count];

  if (v6 >= (unint64_t)v8)
  {
    v10 = 0;
  }
  else
  {
    v9 = [(BKNavigationHistory *)self stack];
    v10 = [v9 objectAtIndex:v6];
  }

  return v10;
}

- (void)rewind
{
  unsigned int v3 = (char *)[(BKNavigationHistory *)self cursor] - 1;

  [(BKNavigationHistory *)self setCursor:v3];
}

- (void)skip
{
  unsigned int v3 = (char *)[(BKNavigationHistory *)self cursor] + 1;

  [(BKNavigationHistory *)self setCursor:v3];
}

- (void)truncateHistory
{
  [(BKNavigationHistory *)self rewind];

  [(BKNavigationHistory *)self _trim];
}

- (id)allObjects
{
  return self->_stack;
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  int64_t v4 = [(BKNavigationHistory *)self stack];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@: %p>(Element Count: %d; Cursor: %d)",
    v3,
    self,
    [v4 count],
  uint64_t v5 = [(BKNavigationHistory *)self cursor]);

  return v5;
}

- (id)recursiveDescription
{
  uint64_t v3 = objc_opt_class();
  int64_t v4 = [(BKNavigationHistory *)self stack];
  id v5 = [v4 count];
  int64_t v6 = [(BKNavigationHistory *)self cursor];
  id v7 = [(BKNavigationHistory *)self stack];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@: %p>(Element Count: %d; Cursor: %d) ; %@",
    v3,
    self,
    v5,
    v6,
  id v8 = v7);

  return v8;
}

- (void)setStack:(id)a3
{
}

- (int64_t)cursor
{
  return self->_cursor;
}

- (void)setCursor:(int64_t)a3
{
  self->_cursor = a3;
}

- (void).cxx_destruct
{
}

@end