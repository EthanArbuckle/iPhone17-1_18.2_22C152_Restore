@interface ICRadioLibraryArtistContentReference
+ (BOOL)supportsSecureCoding;
- (ICRadioLibraryArtistContentReference)initWithCoder:(id)a3;
- (NSNumber)representativeCloudIdentifier;
- (NSNumber)storeIdentifier;
- (NSString)artistName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)matchDictionaryWithSubscriptionStatus:(id)a3;
- (id)rawContentDictionaryWithSubscriptionStatus:(id)a3;
- (int64_t)contentType;
- (void)encodeWithCoder:(id)a3;
- (void)setArtistName:(id)a3;
- (void)setRepresentativeCloudIdentifier:(id)a3;
- (void)setStoreIdentifier:(id)a3;
@end

@implementation ICRadioLibraryArtistContentReference

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeIdentifier, 0);
  objc_storeStrong((id *)&self->_representativeCloudIdentifier, 0);

  objc_storeStrong((id *)&self->_artistName, 0);
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

- (void)setArtistName:(id)a3
{
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ICRadioLibraryArtistContentReference;
  id v4 = a3;
  [(ICRadioContentReference *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_artistName, @"an", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_representativeCloudIdentifier forKey:@"cid"];
  [v4 encodeObject:self->_storeIdentifier forKey:@"id"];
}

- (ICRadioLibraryArtistContentReference)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ICRadioLibraryArtistContentReference;
  objc_super v5 = [(ICRadioContentReference *)&v13 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"an"];
    artistName = v5->_artistName;
    v5->_artistName = (NSString *)v6;

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
  v13.super_class = (Class)ICRadioLibraryArtistContentReference;
  objc_super v5 = -[ICRadioContentReference copyWithZone:](&v13, sel_copyWithZone_);
  if (v5)
  {
    uint64_t v6 = [(NSString *)self->_artistName copyWithZone:a3];
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
  v10.super_class = (Class)ICRadioLibraryArtistContentReference;
  id v4 = [(ICRadioContentReference *)&v10 rawContentDictionaryWithSubscriptionStatus:a3];
  objc_super v5 = (void *)[v4 mutableCopy];

  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:3];
  if ([(NSString *)self->_artistName length]) {
    [v6 setObject:self->_artistName forKey:@"artist-name"];
  }
  representativeCloudIdentifier = self->_representativeCloudIdentifier;
  if (representativeCloudIdentifier) {
    [v6 setObject:representativeCloudIdentifier forKey:@"rep-cloud-id"];
  }
  storeIdentifier = self->_storeIdentifier;
  if (storeIdentifier) {
    [v6 setObject:storeIdentifier forKey:@"artist-id"];
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
  uint64_t v6 = [v4 dictionaryWithCapacity:2];
  v7 = [(ICRadioLibraryArtistContentReference *)self rawContentDictionaryWithSubscriptionStatus:v5];

  [v6 setObject:v7 forKey:@"library-artist"];
  [v6 setObject:MEMORY[0x1E4F1CC38] forKey:@"use-artist"];

  return v6;
}

- (int64_t)contentType
{
  return 2;
}

- (NSString)artistName
{
  if (self->_artistName) {
    return self->_artistName;
  }
  else {
    return (NSString *)&stru_1EF5F5C40;
  }
}

- (id)description
{
  v3 = NSString;
  id v4 = [(ICRadioLibraryArtistContentReference *)self storeIdentifier];
  id v5 = [(ICRadioLibraryArtistContentReference *)self representativeCloudIdentifier];
  uint64_t v6 = [(ICRadioLibraryArtistContentReference *)self artistName];
  v7 = [v3 stringWithFormat:@"<ICRadioLibraryArtistContentReference: %p adamID=%@ representativeItemCloudID=%@ artistName='%@'>", self, v4, v5, v6];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end