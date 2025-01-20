@interface THTextWrapCookie
- (NSArray)floatingWrappables;
- (THTextWrapCookie)init;
- (TSWPColumn)column;
- (TSWPLayoutTarget)target;
- (void)addFloatingWrappable:(id)a3;
- (void)dealloc;
- (void)setColumn:(id)a3;
- (void)setTarget:(id)a3;
@end

@implementation THTextWrapCookie

- (THTextWrapCookie)init
{
  v4.receiver = self;
  v4.super_class = (Class)THTextWrapCookie;
  v2 = [(THTextWrapCookie *)&v4 init];
  if (v2) {
    v2->_floatingWrappables = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THTextWrapCookie;
  [(THTextWrapCookie *)&v3 dealloc];
}

- (void)addFloatingWrappable:(id)a3
{
  if ([a3 wrapType])
  {
    floatingWrappables = self->_floatingWrappables;
    [(NSMutableArray *)floatingWrappables addObject:a3];
  }
}

- (TSWPColumn)column
{
  return self->_column;
}

- (void)setColumn:(id)a3
{
}

- (TSWPLayoutTarget)target
{
  return self->_target;
}

- (void)setTarget:(id)a3
{
  self->_target = (TSWPLayoutTarget *)a3;
}

- (NSArray)floatingWrappables
{
  return &self->_floatingWrappables->super;
}

@end