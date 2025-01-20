@interface NAFilterEnumerator
- (NAFilterEnumerator)initWithEnumerator:(id)a3 filter:(id)a4;
- (NSEnumerator)enumerator;
- (id)allObjects;
- (id)filter;
- (id)nextObject;
@end

@implementation NAFilterEnumerator

- (NAFilterEnumerator)initWithEnumerator:(id)a3 filter:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)NAFilterEnumerator;
  v9 = [(NAFilterEnumerator *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_enumerator, a3);
    uint64_t v11 = [v8 copy];
    id filter = v10->_filter;
    v10->_id filter = (id)v11;
  }
  return v10;
}

- (id)nextObject
{
  v3 = 0;
  while (1)
  {
    v4 = v3;
    v5 = [(NAFilterEnumerator *)self enumerator];
    v3 = [v5 nextObject];

    if (!v3) {
      break;
    }
    v6 = [(NAFilterEnumerator *)self filter];
    int v7 = ((uint64_t (**)(void, void *))v6)[2](v6, v3);

    if (v7)
    {
      id v8 = v3;
      break;
    }
  }

  return v3;
}

- (id)allObjects
{
  v3 = [(NAFilterEnumerator *)self enumerator];
  v4 = [v3 allObjects];
  v5 = [(NAFilterEnumerator *)self filter];
  v6 = objc_msgSend(v4, "na_filter:", v5);

  return v6;
}

- (NSEnumerator)enumerator
{
  return self->_enumerator;
}

- (id)filter
{
  return self->_filter;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_filter, 0);
  objc_storeStrong((id *)&self->_enumerator, 0);
}

@end