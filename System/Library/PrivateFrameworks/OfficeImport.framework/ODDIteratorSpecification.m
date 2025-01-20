@interface ODDIteratorSpecification
- (ODDIteratorSpecification)init;
- (id)attributesList;
- (void)addAttributes:(id)a3;
@end

@implementation ODDIteratorSpecification

- (ODDIteratorSpecification)init
{
  v6.receiver = self;
  v6.super_class = (Class)ODDIteratorSpecification;
  v2 = [(ODDIteratorSpecification *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    mAttributesList = v2->mAttributesList;
    v2->mAttributesList = v3;
  }
  return v2;
}

- (id)attributesList
{
  return self->mAttributesList;
}

- (void)addAttributes:(id)a3
{
}

- (void).cxx_destruct
{
}

@end