@interface PKCollectionSpecialization
- (PKCollectionSpecialization)initWithCollection:(id)a3;
- (const)params;
- (id)collection;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (void)dealloc;
@end

@implementation PKCollectionSpecialization

- (PKCollectionSpecialization)initWithCollection:(id)a3
{
  id v5 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKCollectionSpecialization;
  v6 = [(PKCollectionSpecialization *)&v8 init];
  if (v6)
  {
    objc_storeStrong((id *)&v6->_collection, a3);
    operator new();
  }

  return 0;
}

- (void)dealloc
{
  params = self->_params;
  if (params)
  {

    MEMORY[0x230FA8A40](params, 0x80C40B8603338);
  }
  v4.receiver = self;
  v4.super_class = (Class)PKCollectionSpecialization;
  [(PKCollectionSpecialization *)&v4 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  collection = self->_collection;

  return (id)[v4 initWithCollection:collection];
}

- (id)debugDescription
{
  if ([(PKCollectionSpecialization *)self conformsToProtocol:&unk_26E267C38])
  {
    v3 = [(PKCollectionSpecialization *)self userCodableDictionary];
    id v4 = NSString;
    v8.receiver = self;
    v8.super_class = (Class)PKCollectionSpecialization;
    id v5 = [(PKCollectionSpecialization *)&v8 description];
    v6 = [v4 stringWithFormat:@"%@ %@", v5, v3];
  }
  else
  {
    v6 = [(PK_ipp_collection_t *)self->_collection debugDescription];
  }

  return v6;
}

- (id)collection
{
  return self->_collection;
}

- (const)params
{
  return self->_params;
}

- (void).cxx_destruct
{
}

@end