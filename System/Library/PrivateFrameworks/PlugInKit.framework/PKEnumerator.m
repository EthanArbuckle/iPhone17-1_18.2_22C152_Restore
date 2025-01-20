@interface PKEnumerator
+ (id)defaultFilter;
- (NSEnumerator)underlyingEnumerator;
- (PKEnumerator)init;
- (PKEnumerator)initWithNSEnumerator:(id)a3;
- (id)filter;
- (id)nextObject;
- (void)setFilter:(id)a3;
@end

@implementation PKEnumerator

+ (id)defaultFilter
{
  return &unk_1F0C15510;
}

- (PKEnumerator)init
{
  v8.receiver = self;
  v8.super_class = (Class)PKEnumerator;
  v2 = [(PKEnumerator *)&v8 init];
  v3 = v2;
  if (v2)
  {
    underlyingEnumerator = v2->_underlyingEnumerator;
    v2->_underlyingEnumerator = 0;

    uint64_t v5 = +[PKEnumerator defaultFilter];
    id filter = v3->_filter;
    v3->_id filter = (id)v5;
  }
  return v3;
}

- (PKEnumerator)initWithNSEnumerator:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKEnumerator;
  v6 = [(PKEnumerator *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_underlyingEnumerator, a3);
    uint64_t v8 = +[PKEnumerator defaultFilter];
    id filter = v7->_filter;
    v7->_id filter = (id)v8;
  }
  return v7;
}

- (void)setFilter:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if (!v4)
  {
    id v4 = +[PKEnumerator defaultFilter];
  }
  id v5 = (void *)MEMORY[0x1B3EBB710](v4);
  id filter = self->_filter;
  self->_id filter = v5;

  v7 = v8;
  if (!v8)
  {

    v7 = 0;
  }
}

- (id)nextObject
{
  v3 = 0;
  while (1)
  {
    id v4 = v3;
    id v5 = [(PKEnumerator *)self underlyingEnumerator];
    v3 = [v5 nextObject];

    if (!v3) {
      break;
    }
    v6 = [(PKEnumerator *)self filter];
    int v7 = ((uint64_t (**)(void, void *))v6)[2](v6, v3);

    if (v7)
    {
      id v8 = v3;
      goto LABEL_6;
    }
  }
  id v8 = 0;
LABEL_6:

  return v8;
}

- (id)filter
{
  return self->_filter;
}

- (NSEnumerator)underlyingEnumerator
{
  return self->_underlyingEnumerator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingEnumerator, 0);
  objc_storeStrong(&self->_filter, 0);
}

@end