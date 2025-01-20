@interface NAFlatMapEnumerator
- (NAFlatMapEnumerator)initWithEnumerator:(id)a3 map:(id)a4;
- (NSEnumerator)enumerator;
- (id)allObjects;
- (id)map;
- (id)nextObject;
@end

@implementation NAFlatMapEnumerator

- (NAFlatMapEnumerator)initWithEnumerator:(id)a3 map:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)NAFlatMapEnumerator;
  v9 = [(NAFlatMapEnumerator *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_enumerator, a3);
    uint64_t v11 = [v8 copy];
    id map = v10->_map;
    v10->_id map = (id)v11;
  }
  return v10;
}

- (id)nextObject
{
  v3 = [(NAFlatMapEnumerator *)self map];
  v4 = [(NAFlatMapEnumerator *)self enumerator];
  v5 = [v4 nextObject];
  v6 = ((void (**)(void, void *))v3)[2](v3, v5);

  return v6;
}

- (id)allObjects
{
  v3 = [(NAFlatMapEnumerator *)self enumerator];
  v4 = [v3 allObjects];
  v5 = [(NAFlatMapEnumerator *)self map];
  v6 = objc_msgSend(v4, "na_map:", v5);

  return v6;
}

- (NSEnumerator)enumerator
{
  return self->_enumerator;
}

- (id)map
{
  return self->_map;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_map, 0);
  objc_storeStrong((id *)&self->_enumerator, 0);
}

@end