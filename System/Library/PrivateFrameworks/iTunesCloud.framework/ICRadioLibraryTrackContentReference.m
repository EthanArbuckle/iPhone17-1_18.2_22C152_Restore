@interface ICRadioLibraryTrackContentReference
+ (BOOL)supportsSecureCoding;
- (ICRadioLibraryTrackContentReference)initWithCoder:(id)a3;
- (NSNumber)discCount;
- (NSNumber)discNumber;
- (NSNumber)duration;
- (NSNumber)fileSize;
- (NSNumber)isCompilation;
- (NSNumber)storeAdamIdentifier;
- (NSNumber)storeCloudIdentifier;
- (NSNumber)trackCount;
- (NSNumber)trackNumber;
- (NSNumber)year;
- (NSString)albumArtistName;
- (NSString)albumName;
- (NSString)artistName;
- (NSString)composerName;
- (NSString)containerID;
- (NSString)copyright;
- (NSString)description;
- (NSString)genreName;
- (NSString)kind;
- (NSString)name;
- (NSString)universalCloudLibraryID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)matchDictionaryWithSubscriptionStatus:(id)a3;
- (id)rawContentDictionaryWithSubscriptionStatus:(id)a3;
- (int64_t)contentType;
- (void)encodeWithCoder:(id)a3;
- (void)setAlbumArtistName:(id)a3;
- (void)setAlbumName:(id)a3;
- (void)setArtistName:(id)a3;
- (void)setCompilation:(id)a3;
- (void)setComposerName:(id)a3;
- (void)setContainerID:(id)a3;
- (void)setCopyright:(id)a3;
- (void)setDiscCount:(id)a3;
- (void)setDiscNumber:(id)a3;
- (void)setDuration:(id)a3;
- (void)setFileSize:(id)a3;
- (void)setGenreName:(id)a3;
- (void)setKind:(id)a3;
- (void)setName:(id)a3;
- (void)setStoreAdamIdentifier:(id)a3;
- (void)setStoreCloudIdentifier:(id)a3;
- (void)setTrackCount:(id)a3;
- (void)setTrackNumber:(id)a3;
- (void)setUniversalCloudLibraryID:(id)a3;
- (void)setYear:(id)a3;
@end

@implementation ICRadioLibraryTrackContentReference

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_universalCloudLibraryID, 0);
  objc_storeStrong((id *)&self->_year, 0);
  objc_storeStrong((id *)&self->_trackNumber, 0);
  objc_storeStrong((id *)&self->_trackCount, 0);
  objc_storeStrong((id *)&self->_storeCloudIdentifier, 0);
  objc_storeStrong((id *)&self->_storeAdamIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_kind, 0);
  objc_storeStrong((id *)&self->_duration, 0);
  objc_storeStrong((id *)&self->_compilation, 0);
  objc_storeStrong((id *)&self->_genreName, 0);
  objc_storeStrong((id *)&self->_fileSize, 0);
  objc_storeStrong((id *)&self->_discNumber, 0);
  objc_storeStrong((id *)&self->_discCount, 0);
  objc_storeStrong((id *)&self->_copyright, 0);
  objc_storeStrong((id *)&self->_composerName, 0);
  objc_storeStrong((id *)&self->_artistName, 0);
  objc_storeStrong((id *)&self->_albumName, 0);
  objc_storeStrong((id *)&self->_albumArtistName, 0);

  objc_storeStrong((id *)&self->_containerID, 0);
}

- (void)setUniversalCloudLibraryID:(id)a3
{
}

- (NSString)universalCloudLibraryID
{
  return self->_universalCloudLibraryID;
}

- (void)setYear:(id)a3
{
}

- (NSNumber)year
{
  return self->_year;
}

- (void)setTrackNumber:(id)a3
{
}

- (NSNumber)trackNumber
{
  return self->_trackNumber;
}

- (void)setTrackCount:(id)a3
{
}

- (NSNumber)trackCount
{
  return self->_trackCount;
}

- (void)setStoreCloudIdentifier:(id)a3
{
}

- (NSNumber)storeCloudIdentifier
{
  return self->_storeCloudIdentifier;
}

- (void)setStoreAdamIdentifier:(id)a3
{
}

- (NSNumber)storeAdamIdentifier
{
  return self->_storeAdamIdentifier;
}

- (void)setName:(id)a3
{
}

- (void)setKind:(id)a3
{
}

- (void)setDuration:(id)a3
{
}

- (NSNumber)duration
{
  return self->_duration;
}

- (void)setCompilation:(id)a3
{
}

- (NSNumber)isCompilation
{
  return self->_compilation;
}

- (void)setGenreName:(id)a3
{
}

- (void)setFileSize:(id)a3
{
}

- (NSNumber)fileSize
{
  return self->_fileSize;
}

- (void)setDiscNumber:(id)a3
{
}

- (NSNumber)discNumber
{
  return self->_discNumber;
}

- (void)setDiscCount:(id)a3
{
}

- (NSNumber)discCount
{
  return self->_discCount;
}

- (void)setCopyright:(id)a3
{
}

- (void)setComposerName:(id)a3
{
}

- (void)setArtistName:(id)a3
{
}

- (void)setAlbumName:(id)a3
{
}

- (void)setAlbumArtistName:(id)a3
{
}

- (void)setContainerID:(id)a3
{
}

- (NSString)containerID
{
  return self->_containerID;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ICRadioLibraryTrackContentReference;
  id v4 = a3;
  [(ICRadioContentReference *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_albumArtistName, @"albumArtist", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_albumName forKey:@"album"];
  [v4 encodeObject:self->_artistName forKey:@"artist"];
  [v4 encodeObject:self->_compilation forKey:@"compilation"];
  [v4 encodeObject:self->_composerName forKey:@"composer"];
  [v4 encodeObject:self->_copyright forKey:@"copyright"];
  [v4 encodeObject:self->_discCount forKey:@"discCount"];
  [v4 encodeObject:self->_discNumber forKey:@"discNumber"];
  [v4 encodeObject:self->_duration forKey:@"duration"];
  [v4 encodeObject:self->_fileSize forKey:@"fileSize"];
  [v4 encodeObject:self->_genreName forKey:@"genreName"];
  [v4 encodeObject:self->_kind forKey:@"kind"];
  [v4 encodeObject:self->_name forKey:@"name"];
  [v4 encodeObject:self->_storeCloudIdentifier forKey:@"cloudID"];
  [v4 encodeObject:self->_storeAdamIdentifier forKey:@"id"];
  [v4 encodeObject:self->_trackCount forKey:@"trackCount"];
  [v4 encodeObject:self->_trackNumber forKey:@"trackNumber"];
  [v4 encodeObject:self->_year forKey:@"year"];
  [v4 encodeObject:self->_containerID forKey:@"containerID"];
  [v4 encodeObject:self->_universalCloudLibraryID forKey:@"universalLibraryID"];
}

- (ICRadioLibraryTrackContentReference)initWithCoder:(id)a3
{
  id v4 = a3;
  v49.receiver = self;
  v49.super_class = (Class)ICRadioLibraryTrackContentReference;
  objc_super v5 = [(ICRadioContentReference *)&v49 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = [v4 decodeObjectOfClass:v6 forKey:@"albumArtist"];
    albumArtistName = v5->_albumArtistName;
    v5->_albumArtistName = (NSString *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:v6 forKey:@"album"];
    albumName = v5->_albumName;
    v5->_albumName = (NSString *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:v6 forKey:@"artist"];
    artistName = v5->_artistName;
    v5->_artistName = (NSString *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:v6 forKey:@"composer"];
    composerName = v5->_composerName;
    v5->_composerName = (NSString *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:v6 forKey:@"copyright"];
    copyright = v5->_copyright;
    v5->_copyright = (NSString *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:v6 forKey:@"genreName"];
    genreName = v5->_genreName;
    v5->_genreName = (NSString *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:v6 forKey:@"kind"];
    kind = v5->_kind;
    v5->_kind = (NSString *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:v6 forKey:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v21;

    uint64_t v23 = [v4 decodeObjectOfClass:v6 forKey:@"universalLibraryID"];
    universalCloudLibraryID = v5->_universalCloudLibraryID;
    v5->_universalCloudLibraryID = (NSString *)v23;

    uint64_t v25 = objc_opt_class();
    uint64_t v26 = [v4 decodeObjectOfClass:v25 forKey:@"compilation"];
    compilation = v5->_compilation;
    v5->_compilation = (NSNumber *)v26;

    uint64_t v28 = [v4 decodeObjectOfClass:v25 forKey:@"discCount"];
    discCount = v5->_discCount;
    v5->_discCount = (NSNumber *)v28;

    uint64_t v30 = [v4 decodeObjectOfClass:v25 forKey:@"discNumber"];
    discNumber = v5->_discNumber;
    v5->_discNumber = (NSNumber *)v30;

    uint64_t v32 = [v4 decodeObjectOfClass:v25 forKey:@"duration"];
    duration = v5->_duration;
    v5->_duration = (NSNumber *)v32;

    uint64_t v34 = [v4 decodeObjectOfClass:v25 forKey:@"fileSize"];
    fileSize = v5->_fileSize;
    v5->_fileSize = (NSNumber *)v34;

    uint64_t v36 = [v4 decodeObjectOfClass:v25 forKey:@"cloudID"];
    storeCloudIdentifier = v5->_storeCloudIdentifier;
    v5->_storeCloudIdentifier = (NSNumber *)v36;

    uint64_t v38 = [v4 decodeObjectOfClass:v25 forKey:@"id"];
    storeAdamIdentifier = v5->_storeAdamIdentifier;
    v5->_storeAdamIdentifier = (NSNumber *)v38;

    uint64_t v40 = [v4 decodeObjectOfClass:v25 forKey:@"trackCount"];
    trackCount = v5->_trackCount;
    v5->_trackCount = (NSNumber *)v40;

    uint64_t v42 = [v4 decodeObjectOfClass:v25 forKey:@"trackNumber"];
    trackNumber = v5->_trackNumber;
    v5->_trackNumber = (NSNumber *)v42;

    uint64_t v44 = [v4 decodeObjectOfClass:v25 forKey:@"year"];
    year = v5->_year;
    v5->_year = (NSNumber *)v44;

    uint64_t v46 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"containerID"];
    containerID = v5->_containerID;
    v5->_containerID = (NSString *)v46;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v47.receiver = self;
  v47.super_class = (Class)ICRadioLibraryTrackContentReference;
  objc_super v5 = -[ICRadioContentReference copyWithZone:](&v47, sel_copyWithZone_);
  if (v5)
  {
    uint64_t v6 = [(NSString *)self->_albumArtistName copyWithZone:a3];
    uint64_t v7 = (void *)v5[2];
    v5[2] = v6;

    uint64_t v8 = [(NSString *)self->_albumName copyWithZone:a3];
    uint64_t v9 = (void *)v5[3];
    v5[3] = v8;

    uint64_t v10 = [(NSString *)self->_artistName copyWithZone:a3];
    uint64_t v11 = (void *)v5[4];
    v5[4] = v10;

    uint64_t v12 = [(NSNumber *)self->_compilation copyWithZone:a3];
    uint64_t v13 = (void *)v5[11];
    v5[11] = v12;

    uint64_t v14 = [(NSString *)self->_composerName copyWithZone:a3];
    uint64_t v15 = (void *)v5[5];
    v5[5] = v14;

    uint64_t v16 = [(NSString *)self->_copyright copyWithZone:a3];
    uint64_t v17 = (void *)v5[6];
    v5[6] = v16;

    uint64_t v18 = [(NSNumber *)self->_discCount copyWithZone:a3];
    uint64_t v19 = (void *)v5[7];
    v5[7] = v18;

    uint64_t v20 = [(NSNumber *)self->_discNumber copyWithZone:a3];
    uint64_t v21 = (void *)v5[8];
    v5[8] = v20;

    uint64_t v22 = [(NSNumber *)self->_duration copyWithZone:a3];
    uint64_t v23 = (void *)v5[12];
    v5[12] = v22;

    uint64_t v24 = [(NSNumber *)self->_fileSize copyWithZone:a3];
    uint64_t v25 = (void *)v5[9];
    v5[9] = v24;

    uint64_t v26 = [(NSString *)self->_genreName copyWithZone:a3];
    v27 = (void *)v5[10];
    v5[10] = v26;

    uint64_t v28 = [(NSString *)self->_kind copyWithZone:a3];
    v29 = (void *)v5[13];
    v5[13] = v28;

    uint64_t v30 = [(NSString *)self->_name copyWithZone:a3];
    v31 = (void *)v5[14];
    v5[14] = v30;

    uint64_t v32 = [(NSNumber *)self->_storeAdamIdentifier copyWithZone:a3];
    v33 = (void *)v5[15];
    v5[15] = v32;

    uint64_t v34 = [(NSNumber *)self->_storeCloudIdentifier copyWithZone:a3];
    v35 = (void *)v5[16];
    v5[16] = v34;

    uint64_t v36 = [(NSNumber *)self->_trackCount copyWithZone:a3];
    v37 = (void *)v5[17];
    v5[17] = v36;

    uint64_t v38 = [(NSNumber *)self->_trackNumber copyWithZone:a3];
    v39 = (void *)v5[18];
    v5[18] = v38;

    uint64_t v40 = [(NSNumber *)self->_year copyWithZone:a3];
    v41 = (void *)v5[19];
    v5[19] = v40;

    uint64_t v42 = [(NSString *)self->_containerID copyWithZone:a3];
    v43 = (void *)v5[1];
    v5[1] = v42;

    uint64_t v44 = [(NSString *)self->_universalCloudLibraryID copyWithZone:a3];
    v45 = (void *)v5[20];
    v5[20] = v44;
  }
  return v5;
}

- (id)rawContentDictionaryWithSubscriptionStatus:(id)a3
{
  v20.receiver = self;
  v20.super_class = (Class)ICRadioLibraryTrackContentReference;
  id v4 = [(ICRadioContentReference *)&v20 rawContentDictionaryWithSubscriptionStatus:a3];
  objc_super v5 = (void *)[v4 mutableCopy];

  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if ([(NSString *)self->_albumArtistName length]) {
    [v6 setObject:self->_albumArtistName forKey:@"album-artist"];
  }
  if ([(NSString *)self->_albumName length]) {
    [v6 setObject:self->_albumName forKey:@"playlist-name"];
  }
  if ([(NSString *)self->_artistName length]) {
    [v6 setObject:self->_artistName forKey:@"artist-name"];
  }
  compilation = self->_compilation;
  if (compilation) {
    [v6 setObject:compilation forKey:@"compilation"];
  }
  if ([(NSString *)self->_composerName length]) {
    [v6 setObject:self->_composerName forKey:@"composer-name"];
  }
  if ([(NSString *)self->_copyright length]) {
    [v6 setObject:self->_copyright forKey:@"copyright"];
  }
  discCount = self->_discCount;
  if (discCount) {
    [v6 setObject:discCount forKey:@"disc-count"];
  }
  discNumber = self->_discNumber;
  if (discNumber) {
    [v6 setObject:discNumber forKey:@"disc-number"];
  }
  duration = self->_duration;
  if (duration)
  {
    [(NSNumber *)duration doubleValue];
    uint64_t v12 = [NSNumber numberWithLongLong:(uint64_t)(v11 * 1000.0)];
    [v6 setObject:v12 forKey:@"duration"];
  }
  fileSize = self->_fileSize;
  if (fileSize) {
    [v6 setObject:fileSize forKey:@"size"];
  }
  if ([(NSString *)self->_genreName length]) {
    [v6 setObject:self->_genreName forKey:@"genre-name"];
  }
  if ([(NSString *)self->_kind length]) {
    [v6 setObject:self->_kind forKey:@"kind"];
  }
  if ([(NSString *)self->_name length]) {
    [v6 setObject:self->_name forKey:@"item-name"];
  }
  storeAdamIdentifier = self->_storeAdamIdentifier;
  if (storeAdamIdentifier) {
    [v6 setObject:storeAdamIdentifier forKey:@"item-id"];
  }
  storeCloudIdentifier = self->_storeCloudIdentifier;
  if (storeCloudIdentifier) {
    [v6 setObject:storeCloudIdentifier forKey:@"cloud-id"];
  }
  trackCount = self->_trackCount;
  if (trackCount) {
    [v6 setObject:trackCount forKey:@"track-count"];
  }
  trackNumber = self->_trackNumber;
  if (trackNumber) {
    [v6 setObject:trackNumber forKey:@"track-number"];
  }
  year = self->_year;
  if (year) {
    [v6 setObject:year forKey:@"year"];
  }
  if ([(NSString *)self->_universalCloudLibraryID length]) {
    [v6 setObject:self->_universalCloudLibraryID forKey:@"track-ulid"];
  }
  if ([(NSString *)self->_containerID length]) {
    [v6 setObject:self->_containerID forKey:@"container-id"];
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
  id v6 = [v4 dictionaryWithCapacity:1];
  uint64_t v7 = [(ICRadioLibraryTrackContentReference *)self rawContentDictionaryWithSubscriptionStatus:v5];

  [v6 setObject:v7 forKey:@"library-track"];

  return v6;
}

- (int64_t)contentType
{
  return 3;
}

- (NSString)name
{
  if (self->_name) {
    return self->_name;
  }
  else {
    return (NSString *)&stru_1EF5F5C40;
  }
}

- (NSString)kind
{
  if (self->_kind) {
    return self->_kind;
  }
  else {
    return (NSString *)@"song";
  }
}

- (NSString)genreName
{
  if (self->_genreName) {
    return self->_genreName;
  }
  else {
    return (NSString *)&stru_1EF5F5C40;
  }
}

- (NSString)copyright
{
  if (self->_copyright) {
    return self->_copyright;
  }
  else {
    return (NSString *)&stru_1EF5F5C40;
  }
}

- (NSString)composerName
{
  if (self->_composerName) {
    return self->_composerName;
  }
  else {
    return (NSString *)&stru_1EF5F5C40;
  }
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

- (NSString)albumName
{
  if (self->_albumName) {
    return self->_albumName;
  }
  else {
    return (NSString *)&stru_1EF5F5C40;
  }
}

- (NSString)albumArtistName
{
  if (self->_albumArtistName) {
    return self->_albumArtistName;
  }
  else {
    return (NSString *)&stru_1EF5F5C40;
  }
}

- (NSString)description
{
  v3 = NSString;
  id v4 = [(ICRadioLibraryTrackContentReference *)self kind];
  id v5 = [(ICRadioLibraryTrackContentReference *)self storeAdamIdentifier];
  id v6 = [(ICRadioLibraryTrackContentReference *)self storeCloudIdentifier];
  uint64_t v7 = [(ICRadioLibraryTrackContentReference *)self universalCloudLibraryID];
  uint64_t v8 = [(ICRadioLibraryTrackContentReference *)self name];
  uint64_t v9 = [v3 stringWithFormat:@"<ICRadioLibraryTrackContentReference: %p kind=%@ adamID=%@ cloudID=%@ ulid=%@ title='%@'>", self, v4, v5, v6, v7, v8];

  return (NSString *)v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end