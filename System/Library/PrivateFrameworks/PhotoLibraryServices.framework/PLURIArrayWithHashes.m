@interface PLURIArrayWithHashes
- (BOOL)isUpdate;
- (NSMutableArray)attributeValues;
- (NSMutableArray)relationshipValues;
- (PLURIArrayWithHashes)init;
- (__CFArray)hashes;
- (__CFArray)uris;
- (id)description;
- (id)initForUpdates:(BOOL)a3;
- (unint64_t)count;
- (void)setAttributeValues:(id)a3;
- (void)setHashes:(__CFArray *)a3;
- (void)setRelationshipValues:(id)a3;
- (void)setUris:(__CFArray *)a3;
@end

@implementation PLURIArrayWithHashes

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relationshipValues, 0);
  objc_storeStrong((id *)&self->_attributeValues, 0);
}

- (void)setRelationshipValues:(id)a3
{
}

- (NSMutableArray)relationshipValues
{
  return self->_relationshipValues;
}

- (void)setAttributeValues:(id)a3
{
}

- (NSMutableArray)attributeValues
{
  return self->_attributeValues;
}

- (void)setHashes:(__CFArray *)a3
{
  self->_hashes = a3;
}

- (__CFArray)hashes
{
  return self->_hashes;
}

- (void)setUris:(__CFArray *)a3
{
  self->_uris = a3;
}

- (__CFArray)uris
{
  return self->_uris;
}

- (BOOL)isUpdate
{
  return self->_attributeValues && self->_relationshipValues != 0;
}

- (unint64_t)count
{
  return CFArrayGetCount(self->_uris);
}

- (id)description
{
  v2 = (__CFString *)CFCopyDescription(self->_uris);
  return v2;
}

- (id)initForUpdates:(BOOL)a3
{
  BOOL v3 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PLURIArrayWithHashes;
  v4 = [(PLURIArrayWithHashes *)&v10 init];
  if (v4)
  {
    v4->_uris = CFArrayCreateMutable(0, 1000, &initForUpdates__uriArrayCallbacks);
    v4->_hashes = CFArrayCreateMutable(0, 1000, &initForUpdates__hashesArrayCallbacks);
    if (v3)
    {
      v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      attributeValues = v4->_attributeValues;
      v4->_attributeValues = v5;

      v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      relationshipValues = v4->_relationshipValues;
      v4->_relationshipValues = v7;
    }
  }
  return v4;
}

- (PLURIArrayWithHashes)init
{
  return (PLURIArrayWithHashes *)[(PLURIArrayWithHashes *)self initForUpdates:0];
}

@end