@interface TSLSearchTreeNode
- (TSLSearchTreeNode)initWithSplit:(unsigned __int16)a3;
- (id)collect;
- (id)description;
- (id)find:(unsigned __int16 *)a3;
- (void)dealloc;
- (void)traverse:(id)a3;
@end

@implementation TSLSearchTreeNode

- (TSLSearchTreeNode)initWithSplit:(unsigned __int16)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TSLSearchTreeNode;
  result = [(TSLSearchTreeNode *)&v5 init];
  if (result) {
    result->splitchar = a3;
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSLSearchTreeNode;
  [(TSLSearchTreeNode *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = (objc_class *)objc_opt_class();
  return +[NSString stringWithFormat:@"<%@:%p '%@' split %c low %p equal %p high %p>", NSStringFromClass(v3), self, self->value, self->splitchar, self->low, self->equal, self->high];
}

- (id)find:(unsigned __int16 *)a3
{
  if (self)
  {
    unsigned int v3 = *a3;
    do
    {
      unsigned int v4 = *((unsigned __int16 *)self + 4);
      if (v3 >= v4)
      {
        if (v3 <= v4)
        {
          self = (id)*((void *)self + 3);
          unsigned int v6 = a3[1];
          ++a3;
          unsigned int v3 = v6;
          if (!v6) {
            return self;
          }
          continue;
        }
        uint64_t v5 = 32;
      }
      else
      {
        uint64_t v5 = 16;
      }
      self = *(id *)((char *)self + v5);
    }
    while (self);
  }
  return self;
}

- (void)traverse:(id)a3
{
  -[TSLSearchTreeNode traverse:](self->low, "traverse:");
  if (self->splitchar) {
    [(TSLSearchTreeNode *)self->equal traverse:a3];
  }
  else {
    (*((void (**)(id, id))a3 + 2))(a3, self->value);
  }
  high = self->high;

  [(TSLSearchTreeNode *)high traverse:a3];
}

- (id)collect
{
  id v3 = +[NSMutableArray array];
  [v3 addObjectsFromArray:[self->low collect]];
  if (self->splitchar) {
    [v3 addObjectsFromArray:[self->equal collect]];
  }
  else {
    [v3 addObject:self->value];
  }
  [v3 addObjectsFromArray:[self collect]];
  return v3;
}

@end