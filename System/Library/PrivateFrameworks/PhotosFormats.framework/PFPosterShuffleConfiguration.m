@interface PFPosterShuffleConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)includeCityscapes;
- (BOOL)includeLandscapes;
- (BOOL)includePeople;
- (BOOL)includePets;
- (BOOL)isEqual:(id)a3;
- (NSSet)albumCloudIdentifiers;
- (NSSet)personLocalIdentifiers;
- (NSString)description;
- (PFPosterShuffleConfiguration)initWithCoder:(id)a3;
- (PFPosterShuffleConfiguration)initWithShuffleType:(int64_t)a3;
- (id)analyticsPayload;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)shuffleFrequency;
- (int64_t)shuffleType;
- (unint64_t)hash;
- (unint64_t)shuffleSmartAlbums;
- (void)encodeWithCoder:(id)a3;
- (void)setAlbumCloudIdentifiers:(id)a3;
- (void)setIncludeCityscapes:(BOOL)a3;
- (void)setIncludeLandscapes:(BOOL)a3;
- (void)setIncludePeople:(BOOL)a3;
- (void)setIncludePets:(BOOL)a3;
- (void)setPersonLocalIdentifiers:(id)a3;
- (void)setShuffleFrequency:(int64_t)a3;
- (void)setShuffleSmartAlbums:(unint64_t)a3;
- (void)setShuffleType:(int64_t)a3;
@end

@implementation PFPosterShuffleConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_albumCloudIdentifiers, 0);

  objc_storeStrong((id *)&self->_personLocalIdentifiers, 0);
}

- (void)setAlbumCloudIdentifiers:(id)a3
{
}

- (NSSet)albumCloudIdentifiers
{
  return self->_albumCloudIdentifiers;
}

- (void)setShuffleSmartAlbums:(unint64_t)a3
{
  self->_shuffleSmartAlbums = a3;
}

- (unint64_t)shuffleSmartAlbums
{
  return self->_shuffleSmartAlbums;
}

- (void)setPersonLocalIdentifiers:(id)a3
{
}

- (NSSet)personLocalIdentifiers
{
  return self->_personLocalIdentifiers;
}

- (void)setShuffleFrequency:(int64_t)a3
{
  self->_shuffleFrequency = a3;
}

- (int64_t)shuffleFrequency
{
  return self->_shuffleFrequency;
}

- (void)setShuffleType:(int64_t)a3
{
  self->_shuffleType = a3;
}

- (int64_t)shuffleType
{
  return self->_shuffleType;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  int64_t v6 = [(PFPosterShuffleConfiguration *)self shuffleType];
  v7 = @"Manual";
  if (!v6) {
    v7 = @"Smart Albums";
  }
  if (v6 == 2) {
    v7 = @"User Album";
  }
  v8 = v7;
  int64_t v9 = [(PFPosterShuffleConfiguration *)self shuffleFrequency];
  if ((unint64_t)(v9 - 1) > 3) {
    v10 = @"None";
  }
  else {
    v10 = off_1E5B2D348[v9 - 1];
  }
  v11 = v10;
  v12 = [(PFPosterShuffleConfiguration *)self personLocalIdentifiers];
  v13 = PFBitmaskDescription([(PFPosterShuffleConfiguration *)self shuffleSmartAlbums], &unk_1EF7CACE8, &unk_1EF7CAD00);
  v14 = [(PFPosterShuffleConfiguration *)self albumCloudIdentifiers];
  v15 = objc_msgSend(v3, "initWithFormat:", @"<%@ %p; type: %@; frequency: %@; person IDs: %@, Smart Albums: %@, albumCloudIdentifiers: %@>",
                  v5,
                  self,
                  v8,
                  v11,
                  v12,
                  v13,
                  v14);

  return (NSString *)v15;
}

- (PFPosterShuffleConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = -[PFPosterShuffleConfiguration initWithShuffleType:](self, "initWithShuffleType:", [v4 decodeIntegerForKey:@"shuffleType"]);
  if (v5)
  {
    v5->_shuffleFrequency = [v4 decodeIntegerForKey:@"shuffleFrequency"];
    int64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"personLocalIdentifiers"];
    personLocalIdentifiers = v5->_personLocalIdentifiers;
    v5->_personLocalIdentifiers = (NSSet *)v9;

    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shuffleSmartAlbums"];
    v5->_shuffleSmartAlbums = [v11 unsignedIntegerValue];

    v12 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v13 = objc_opt_class();
    v14 = objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"albumCloudIdentifiers"];
    albumCloudIdentifiers = v5->_albumCloudIdentifiers;
    v5->_albumCloudIdentifiers = (NSSet *)v15;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[PFPosterShuffleConfiguration shuffleType](self, "shuffleType"), @"shuffleType");
  objc_msgSend(v4, "encodeInteger:forKey:", -[PFPosterShuffleConfiguration shuffleFrequency](self, "shuffleFrequency"), @"shuffleFrequency");
  v5 = [(PFPosterShuffleConfiguration *)self personLocalIdentifiers];
  [v4 encodeObject:v5 forKey:@"personLocalIdentifiers"];

  int64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PFPosterShuffleConfiguration shuffleSmartAlbums](self, "shuffleSmartAlbums"));
  [v4 encodeObject:v6 forKey:@"shuffleSmartAlbums"];

  id v7 = [(PFPosterShuffleConfiguration *)self albumCloudIdentifiers];
  [v4 encodeObject:v7 forKey:@"albumCloudIdentifiers"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[PFPosterShuffleConfiguration allocWithZone:a3];
  v4->_shuffleFrequency = self->_shuffleFrequency;
  uint64_t v5 = [(NSSet *)self->_personLocalIdentifiers copy];
  personLocalIdentifiers = v4->_personLocalIdentifiers;
  v4->_personLocalIdentifiers = (NSSet *)v5;

  v4->_shuffleSmartAlbums = self->_shuffleSmartAlbums;
  v4->_shuffleType = self->_shuffleType;
  uint64_t v7 = [(NSSet *)self->_albumCloudIdentifiers copy];
  albumCloudIdentifiers = v4->_albumCloudIdentifiers;
  v4->_albumCloudIdentifiers = (NSSet *)v7;

  return v4;
}

- (id)analyticsPayload
{
  v23[7] = *MEMORY[0x1E4F143B8];
  char v3 = [(PFPosterShuffleConfiguration *)self shuffleSmartAlbums];
  unint64_t v4 = [(PFPosterShuffleConfiguration *)self shuffleSmartAlbums];
  unint64_t v5 = [(PFPosterShuffleConfiguration *)self shuffleSmartAlbums];
  unint64_t v6 = [(PFPosterShuffleConfiguration *)self shuffleSmartAlbums];
  v22[0] = @"shuffle_type";
  unint64_t v7 = [(PFPosterShuffleConfiguration *)self shuffleType];
  if (v7 > 2) {
    v8 = @"??";
  }
  else {
    v8 = off_1E5B2D030[v7];
  }
  v23[0] = v8;
  v22[1] = @"shuffle_frequency";
  unint64_t v9 = [(PFPosterShuffleConfiguration *)self shuffleFrequency];
  if (v9 > 4) {
    v10 = @"??";
  }
  else {
    v10 = off_1E5B2D048[v9];
  }
  uint64_t v11 = (v4 >> 1) & 1;
  uint64_t v12 = v3 & 1;
  v23[1] = v10;
  v22[2] = @"shuffle_people_count";
  uint64_t v13 = NSNumber;
  v14 = [(PFPosterShuffleConfiguration *)self personLocalIdentifiers];
  uint64_t v15 = objc_msgSend(v13, "numberWithUnsignedInteger:", objc_msgSend(v14, "count"));
  v23[2] = v15;
  v22[3] = @"people_enabled";
  v16 = [NSNumber numberWithBool:v12];
  v23[3] = v16;
  v22[4] = @"pet_enabled";
  v17 = [NSNumber numberWithBool:v11];
  v23[4] = v17;
  v22[5] = @"nature_enabled";
  v18 = [NSNumber numberWithBool:(v5 >> 2) & 1];
  v23[5] = v18;
  v22[6] = @"urban_enabled";
  v19 = [NSNumber numberWithBool:(v6 >> 3) & 1];
  v23[6] = v19;
  v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:7];

  return v20;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (PFPosterShuffleConfiguration *)a3;
  if (v4 == self)
  {
    char v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v5 = v4;
      int64_t v6 = [(PFPosterShuffleConfiguration *)self shuffleType];
      if (v6 != [(PFPosterShuffleConfiguration *)v5 shuffleType]
        || (int64_t v7 = [(PFPosterShuffleConfiguration *)self shuffleFrequency],
            v7 != [(PFPosterShuffleConfiguration *)v5 shuffleFrequency]))
      {
        char v11 = 0;
LABEL_19:

        goto LABEL_20;
      }
      id v8 = [(PFPosterShuffleConfiguration *)self personLocalIdentifiers];
      id v9 = [(PFPosterShuffleConfiguration *)v5 personLocalIdentifiers];
      if (v8 == v9)
      {
      }
      else
      {
        int v10 = [v8 isEqual:v9];

        if (!v10) {
          goto LABEL_15;
        }
      }
      unint64_t v12 = [(PFPosterShuffleConfiguration *)self shuffleSmartAlbums];
      if (v12 == [(PFPosterShuffleConfiguration *)v5 shuffleSmartAlbums])
      {
        uint64_t v13 = [(PFPosterShuffleConfiguration *)self albumCloudIdentifiers];
        v14 = [(PFPosterShuffleConfiguration *)v5 albumCloudIdentifiers];
        if (v13 == v14) {
          char v11 = 1;
        }
        else {
          char v11 = [v13 isEqual:v14];
        }

        goto LABEL_18;
      }
LABEL_15:
      char v11 = 0;
LABEL_18:

      goto LABEL_19;
    }
    char v11 = 0;
  }
LABEL_20:

  return v11;
}

- (unint64_t)hash
{
  char v3 = [NSNumber numberWithUnsignedInteger:self->_shuffleSmartAlbums];
  uint64_t v4 = [v3 hash];
  unint64_t v5 = [NSNumber numberWithInteger:self->_shuffleType];
  uint64_t v6 = [v5 hash] ^ v4;
  int64_t v7 = [NSNumber numberWithInteger:self->_shuffleFrequency];
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

- (PFPosterShuffleConfiguration)initWithShuffleType:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PFPosterShuffleConfiguration;
  result = [(PFPosterShuffleConfiguration *)&v5 init];
  if (result)
  {
    result->_shuffleType = a3;
    result->_shuffleFrequency = 3;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)includeCityscapes
{
  return ([(PFPosterShuffleConfiguration *)self shuffleSmartAlbums] >> 3) & 1;
}

- (void)setIncludeCityscapes:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v5 = [(PFPosterShuffleConfiguration *)self shuffleSmartAlbums] & 0xFFFFFFFFFFFFFFF7;
  uint64_t v6 = 8;
  if (!v3) {
    uint64_t v6 = 0;
  }

  [(PFPosterShuffleConfiguration *)self setShuffleSmartAlbums:v5 | v6];
}

- (BOOL)includeLandscapes
{
  return ([(PFPosterShuffleConfiguration *)self shuffleSmartAlbums] >> 2) & 1;
}

- (void)setIncludeLandscapes:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v5 = [(PFPosterShuffleConfiguration *)self shuffleSmartAlbums] & 0xFFFFFFFFFFFFFFFBLL;
  uint64_t v6 = 4;
  if (!v3) {
    uint64_t v6 = 0;
  }

  [(PFPosterShuffleConfiguration *)self setShuffleSmartAlbums:v5 | v6];
}

- (BOOL)includePets
{
  return ([(PFPosterShuffleConfiguration *)self shuffleSmartAlbums] >> 1) & 1;
}

- (void)setIncludePets:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v5 = [(PFPosterShuffleConfiguration *)self shuffleSmartAlbums] & 0xFFFFFFFFFFFFFFFDLL;
  uint64_t v6 = 2;
  if (!v3) {
    uint64_t v6 = 0;
  }

  [(PFPosterShuffleConfiguration *)self setShuffleSmartAlbums:v5 | v6];
}

- (BOOL)includePeople
{
  return [(PFPosterShuffleConfiguration *)self shuffleSmartAlbums] & 1;
}

- (void)setIncludePeople:(BOOL)a3
{
  unint64_t v4 = [(PFPosterShuffleConfiguration *)self shuffleSmartAlbums] & 0xFFFFFFFFFFFFFFFELL | a3;

  [(PFPosterShuffleConfiguration *)self setShuffleSmartAlbums:v4];
}

@end