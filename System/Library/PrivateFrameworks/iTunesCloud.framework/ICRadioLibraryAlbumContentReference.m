@interface ICRadioLibraryAlbumContentReference
+ (BOOL)supportsSecureCoding;
- (ICRadioLibraryAlbumContentReference)initWithCoder:(id)a3;
- (NSNumber)representativeCloudIdentifier;
- (NSNumber)storeIdentifier;
- (NSString)albumName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)matchDictionaryWithSubscriptionStatus:(id)a3;
- (id)rawContentDictionaryWithSubscriptionStatus:(id)a3;
- (int64_t)contentType;
- (void)encodeWithCoder:(id)a3;
- (void)setAlbumName:(id)a3;
- (void)setRepresentativeCloudIdentifier:(id)a3;
- (void)setStoreIdentifier:(id)a3;
@end

@implementation ICRadioLibraryAlbumContentReference

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeIdentifier, 0);
  objc_storeStrong((id *)&self->_representativeCloudIdentifier, 0);

  objc_storeStrong((id *)&self->_albumName, 0);
}

- (void)setStoreIdentifier:(id)a3
{
}

- (NSNumber)storeIdentifier
{
  return self->_storeIdentifier;
}

- (void)setRepresentativeCloudIdentifier:(id)a3
{
}

- (NSNumber)representativeCloudIdentifier
{
  return self->_representativeCloudIdentifier;
}

- (void)setAlbumName:(id)a3
{
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ICRadioLibraryAlbumContentReference;
  id v4 = a3;
  [(ICRadioContentReference *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_albumName, @"an", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_representativeCloudIdentifier forKey:@"cid"];
  [v4 encodeObject:self->_storeIdentifier forKey:@"id"];
}

- (ICRadioLibraryAlbumContentReference)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ICRadioLibraryAlbumContentReference;
  objc_super v5 = [(ICRadioContentReference *)&v13 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"an"];
    albumName = v5->_albumName;
    v5->_albumName = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cid"];
    representativeCloudIdentifier = v5->_representativeCloudIdentifier;
    v5->_representativeCloudIdentifier = (NSNumber *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"id"];
    storeIdentifier = v5->_storeIdentifier;
    v5->_storeIdentifier = (NSNumber *)v10;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v13.receiver = self;
  v13.super_class = (Class)ICRadioLibraryAlbumContentReference;
  objc_super v5 = -[ICRadioContentReference copyWithZone:](&v13, sel_copyWithZone_);
  if (v5)
  {
    uint64_t v6 = [(NSString *)self->_albumName copyWithZone:a3];
    v7 = (void *)v5[1];
    v5[1] = v6;

    uint64_t v8 = [(NSNumber *)self->_representativeCloudIdentifier copyWithZone:a3];
    v9 = (void *)v5[2];
    v5[2] = v8;

    uint64_t v10 = [(NSNumber *)self->_storeIdentifier copyWithZone:a3];
    v11 = (void *)v5[3];
    v5[3] = v10;
  }
  return v5;
}

- (id)rawContentDictionaryWithSubscriptionStatus:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)ICRadioLibraryAlbumContentReference;
  id v4 = [(ICRadioContentReference *)&v10 rawContentDictionaryWithSubscriptionStatus:a3];
  objc_super v5 = (void *)[v4 mutableCopy];

  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:3];
  if ([(NSString *)self->_albumName length]) {
    [v6 setObject:self->_albumName forKey:@"album-name"];
  }
  representativeCloudIdentifier = self->_representativeCloudIdentifier;
  if (representativeCloudIdentifier) {
    [v6 setObject:representativeCloudIdentifier forKey:@"rep-cloud-id"];
  }
  storeIdentifier = self->_storeIdentifier;
  if (storeIdentifier) {
    [v6 setObject:storeIdentifier forKey:@"album-id"];
  }
  if ([v5 count]) {
    [v6 addEntriesFromDictionary:v5];
  }

  return v6;
}

- (id)matchDictionaryWithSubscriptionStatus:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CA60];
  id v5 = a3;
  uint64_t v6 = [v4 dictionaryWithCapacity:1];
  v7 = [(ICRadioLibraryAlbumContentReference *)self rawContentDictionaryWithSubscriptionStatus:v5];

  [v6 setObject:v7 forKey:@"library-album"];

  return v6;
}

- (int64_t)contentType
{
  return 1;
}

- (NSString)albumName
{
  if (self->_albumName) {
    return self->_albumName;
  }
  else {
    return (NSString *)&stru_1EF5F5C40;
  }
}

- (id)description
{
  v3 = NSString;
  id v4 = [(ICRadioLibraryAlbumContentReference *)self storeIdentifier];
  id v5 = [(ICRadioLibraryAlbumContentReference *)self representativeCloudIdentifier];
  uint64_t v6 = [(ICRadioLibraryAlbumContentReference *)self albumName];
  v7 = [v3 stringWithFormat:@"<ICRadioLibraryAlbumContentReference: %p adamID=%@ representativeItemCloudID=%@ albumName='%@'>", self, v4, v5, v6];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end