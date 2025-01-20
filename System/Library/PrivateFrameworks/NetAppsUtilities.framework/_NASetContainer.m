@interface _NASetContainer
+ (id)containerWithObject:(id)a3 atIndex:(unint64_t)a4 comparator:(id)a5 hashGenerator:(id)a6;
- (BOOL)isEqual:(id)a3;
- (id)comparator;
- (id)hashGenerator;
- (id)object;
- (unint64_t)hash;
- (unint64_t)index;
- (void)setComparator:(id)a3;
- (void)setHashGenerator:(id)a3;
- (void)setIndex:(unint64_t)a3;
- (void)setObject:(id)a3;
@end

@implementation _NASetContainer

+ (id)containerWithObject:(id)a3 atIndex:(unint64_t)a4 comparator:(id)a5 hashGenerator:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a3;
  v12 = objc_alloc_init(_NASetContainer);
  [(_NASetContainer *)v12 setObject:v11];

  [(_NASetContainer *)v12 setIndex:a4];
  [(_NASetContainer *)v12 setComparator:v10];

  [(_NASetContainer *)v12 setHashGenerator:v9];
  return v12;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (_NASetContainer *)a3;
  if (v4 == self)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(_NASetContainer *)v4 object];
      v6 = [(_NASetContainer *)self comparator];
      if (v6)
      {
        v7 = [(_NASetContainer *)self comparator];
        v8 = [(_NASetContainer *)self object];
        char v9 = ((uint64_t (**)(void, void *, void *))v7)[2](v7, v8, v5);
      }
      else
      {
        v7 = [(_NASetContainer *)self object];
        char v9 = [v7 isEqual:v5];
      }
    }
    else
    {
      char v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  v3 = [(_NASetContainer *)self hashGenerator];
  if (v3)
  {
    v4 = [(_NASetContainer *)self hashGenerator];
    v5 = [(_NASetContainer *)self object];
    unint64_t v6 = ((uint64_t (**)(void, void *))v4)[2](v4, v5);
  }
  else
  {
    v4 = [(_NASetContainer *)self object];
    unint64_t v6 = [v4 hash];
  }

  return v6;
}

- (id)object
{
  return self->_object;
}

- (void)setObject:(id)a3
{
}

- (unint64_t)index
{
  return self->_index;
}

- (void)setIndex:(unint64_t)a3
{
  self->_index = a3;
}

- (id)comparator
{
  return self->_comparator;
}

- (void)setComparator:(id)a3
{
}

- (id)hashGenerator
{
  return self->_hashGenerator;
}

- (void)setHashGenerator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_hashGenerator, 0);
  objc_storeStrong(&self->_comparator, 0);
  objc_storeStrong(&self->_object, 0);
}

@end