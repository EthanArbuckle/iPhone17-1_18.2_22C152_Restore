@interface MusicStoreCollectionSongsRequest
+ (BOOL)supportsSecureCoding;
+ (MPPropertySet)allSupportedItemProperties;
+ (MPPropertySet)allSupportedSectionProperties;
- (MPIdentifierSet)collectionIdentifiers;
- (MusicStoreCollectionSongsRequest)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)newOperationWithResponseHandler:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setCollectionIdentifiers:(id)a3;
@end

@implementation MusicStoreCollectionSongsRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MusicStoreCollectionSongsRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MusicStoreCollectionSongsRequest;
  v5 = [(MusicStoreCollectionSongsRequest *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MusicStoreCollectionSongsRequestCollectionIdentifiers"];
    collectionIdentifiers = v5->_collectionIdentifiers;
    v5->_collectionIdentifiers = (MPIdentifierSet *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MusicStoreCollectionSongsRequest;
  id v4 = a3;
  [(MusicStoreCollectionSongsRequest *)&v5 encodeWithCoder:v4];
  [v4 encodeObject:self->_collectionIdentifiers forKey:@"MusicStoreCollectionSongsRequestCollectionIdentifiers" v5.receiver, v5.super_class];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MusicStoreCollectionSongsRequest;
  id v4 = [(MusicStoreCollectionSongsRequest *)&v7 copyWithZone:a3];
  objc_super v5 = v4;
  if (v4) {
    objc_storeStrong(v4 + 1, self->_collectionIdentifiers);
  }
  return v5;
}

- (id)newOperationWithResponseHandler:(id)a3
{
  id v4 = a3;
  objc_super v5 = [MusicStoreCollectionSongsRequestOperation alloc];
  id v6 = [(MusicStoreCollectionSongsRequest *)self copy];
  objc_super v7 = [(MusicStoreCollectionSongsRequestOperation *)v5 initWithRequest:v6 responseHandler:v4];

  return v7;
}

+ (MPPropertySet)allSupportedSectionProperties
{
  return (MPPropertySet *)+[MPModelStoreBrowseContentItemBuilder allSupportedProperties];
}

+ (MPPropertySet)allSupportedItemProperties
{
  return (MPPropertySet *)+[MPStoreModelSongBuilder allSupportedProperties];
}

- (MPIdentifierSet)collectionIdentifiers
{
  return self->_collectionIdentifiers;
}

- (void)setCollectionIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end