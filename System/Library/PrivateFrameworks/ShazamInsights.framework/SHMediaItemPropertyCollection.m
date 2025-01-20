@interface SHMediaItemPropertyCollection
+ (id)collectionWithArray:(id)a3 representingProperty:(id)a4;
- (NSSet)collection;
- (NSString)property;
- (SHMediaItemPropertyCollection)initWithArray:(id)a3 representingProperty:(id)a4;
@end

@implementation SHMediaItemPropertyCollection

+ (id)collectionWithArray:(id)a3 representingProperty:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithArray:v7 representingProperty:v6];

  return v8;
}

- (SHMediaItemPropertyCollection)initWithArray:(id)a3 representingProperty:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SHMediaItemPropertyCollection;
  v8 = [(SHMediaItemPropertyCollection *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [MEMORY[0x263EFFA08] setWithArray:v6];
    collection = v8->_collection;
    v8->_collection = (NSSet *)v9;

    objc_storeStrong((id *)&v8->_property, a4);
  }

  return v8;
}

- (NSSet)collection
{
  return self->_collection;
}

- (NSString)property
{
  return self->_property;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_property, 0);
  objc_storeStrong((id *)&self->_collection, 0);
}

@end