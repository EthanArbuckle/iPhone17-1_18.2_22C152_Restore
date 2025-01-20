@interface MOObjectZipper
- (BOOL)hasNextObjectPair;
- (BOOL)nextObjectPairWithHandler:(id)a3;
- (MOObjectZipper)initWithObjects:(id)a3 others:(id)a4 comparator:(id)a5;
- (NSArray)objects;
- (NSArray)others;
@end

@implementation MOObjectZipper

- (MOObjectZipper)initWithObjects:(id)a3 others:(id)a4 comparator:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v25.receiver = self;
  v25.super_class = (Class)MOObjectZipper;
  v11 = [(MOObjectZipper *)&v25 init];
  if (v11)
  {
    v12 = [v8 sortedArrayUsingComparator:v10];

    v13 = [v9 sortedArrayUsingComparator:v10];

    uint64_t v14 = [v12 objectEnumerator];
    objectEnumerator = v11->objectEnumerator;
    v11->objectEnumerator = (NSEnumerator *)v14;

    uint64_t v16 = [v13 objectEnumerator];
    otherEnumerator = v11->otherEnumerator;
    v11->otherEnumerator = (NSEnumerator *)v16;

    uint64_t v18 = [(NSEnumerator *)v11->objectEnumerator nextObject];
    id object = v11->object;
    v11->id object = (id)v18;

    uint64_t v20 = [(NSEnumerator *)v11->otherEnumerator nextObject];
    id other = v11->other;
    v11->id other = (id)v20;

    id v22 = objc_retainBlock(v10);
    id objectComparator = v11->objectComparator;
    v11->id objectComparator = v22;

    id v8 = v12;
    id v9 = v13;
  }

  return v11;
}

- (BOOL)nextObjectPairWithHandler:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (self->object && self->other)
  {
    (*((void (**)(id))v4 + 2))(v4);
    uint64_t v6 = (*((uint64_t (**)(void))self->objectComparator + 2))();
    uint64_t v7 = 16;
    if (v6 == -1)
    {
      uint64_t v7 = 8;
      uint64_t v8 = 24;
    }
    else
    {
      uint64_t v8 = 32;
    }
    id v9 = [*(id *)((char *)&self->super.isa + v7) nextObject];
    id v10 = *(Class *)((char *)&self->super.isa + v8);
    *(Class *)((char *)&self->super.isa + v8) = v9;

    BOOL v11 = [(MOObjectZipper *)self hasNextObjectPair];
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)hasNextObjectPair
{
  return self->object && self->other != 0;
}

- (NSArray)objects
{
  return self->_objects;
}

- (NSArray)others
{
  return self->_others;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_others, 0);
  objc_storeStrong((id *)&self->_objects, 0);
  objc_storeStrong(&self->objectComparator, 0);
  objc_storeStrong(&self->other, 0);
  objc_storeStrong(&self->object, 0);
  objc_storeStrong((id *)&self->otherEnumerator, 0);

  objc_storeStrong((id *)&self->objectEnumerator, 0);
}

@end