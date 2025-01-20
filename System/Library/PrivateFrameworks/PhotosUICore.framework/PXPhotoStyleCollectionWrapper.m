@interface PXPhotoStyleCollectionWrapper
+ (id)macStyleCollections;
- (PXPhotoStyleCollectionWrapper)initWithCollection:(id)a3;
- (id)name;
- (id)styleElements;
@end

@implementation PXPhotoStyleCollectionWrapper

- (void).cxx_destruct
{
}

- (id)styleElements
{
}

PXPhotoStyleElementWrapper *__46__PXPhotoStyleCollectionWrapper_styleElements__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[PXPhotoStyleElementWrapper alloc] initWithPhotoStyleElement:v2];

  return v3;
}

- (id)name
{
  return [(PXPhotoStyleCollection *)self->_underlyingCollection name];
}

- (PXPhotoStyleCollectionWrapper)initWithCollection:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXPhotoStyleCollectionWrapper;
  v6 = [(PXPhotoStyleCollectionWrapper *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_underlyingCollection, a3);
  }

  return v7;
}

+ (id)macStyleCollections
{
}

PXPhotoStyleCollectionWrapper *__52__PXPhotoStyleCollectionWrapper_macStyleCollections__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[PXPhotoStyleCollectionWrapper alloc] initWithCollection:v2];

  return v3;
}

@end