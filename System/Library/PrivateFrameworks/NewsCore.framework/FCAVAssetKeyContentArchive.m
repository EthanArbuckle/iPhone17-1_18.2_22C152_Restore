@interface FCAVAssetKeyContentArchive
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (FCAVAssetKeyContentArchive)initWithCoder:(id)a3;
- (id)description;
- (id)manifest;
- (id)unarchiveIntoContentContext:(id)a3;
- (int64_t)storageSize;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation FCAVAssetKeyContentArchive

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  if (v6)
  {
    v7 = [(NTPBAVAssetKey *)self->_avAssetKey identifier];
    v8 = [v6[1] identifier];
    char v9 = [v7 isEqual:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  v2 = [(NTPBAVAssetKey *)self->_avAssetKey identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)description
{
  unint64_t v3 = [[FCDescription alloc] initWithObject:self];
  [(FCDescription *)v3 addField:@"avAssetKey" object:self->_avAssetKey];
  id v4 = [(FCDescription *)v3 descriptionString];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FCAVAssetKeyContentArchive)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FCAVAssetKeyContentArchive;
  v5 = [(FCAVAssetKeyContentArchive *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"avAssetKey"];
    avAssetKey = v5->_avAssetKey;
    v5->_avAssetKey = (NTPBAVAssetKey *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (id)unarchiveIntoContentContext:(id)a3
{
  id v4 = [a3 internalContentContext];
  v5 = [v4 avAssetKeyCache];
  [v5 importAVAssetKey:self->_avAssetKey];

  uint64_t v6 = [FCContentUnarchiveResult alloc];
  int64_t v7 = [(FCAVAssetKeyContentArchive *)self storageSize];
  v8 = [(FCContentUnarchiveResult *)v6 initWithInterestToken:MEMORY[0x1E4F1CBF0] storageSize:v7];
  return v8;
}

- (id)manifest
{
  v8[1] = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [FCContentManifest alloc];
  id v4 = [(NTPBAVAssetKey *)self->_avAssetKey identifier];
  v8[0] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  uint64_t v6 = [(FCContentManifest *)v3 initWithAVAssetKeyIDs:v5];

  return v6;
}

- (int64_t)storageSize
{
  v2 = [(NTPBAVAssetKey *)self->_avAssetKey keyData];
  int64_t v3 = [v2 length];

  return v3;
}

- (void).cxx_destruct
{
}

@end