@interface ODDForEach
- (ODDForEach)init;
- (id)description;
- (id)iteratorSpecification;
@end

@implementation ODDForEach

- (ODDForEach)init
{
  v6.receiver = self;
  v6.super_class = (Class)ODDForEach;
  v2 = [(ODDLayoutObjectList *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(ODDIteratorSpecification);
    mIteratorSpecification = v2->mIteratorSpecification;
    v2->mIteratorSpecification = v3;
  }
  return v2;
}

- (id)iteratorSpecification
{
  return self->mIteratorSpecification;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)ODDForEach;
  v2 = [(ODDLayoutObject *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
}

@end