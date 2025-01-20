@interface PKAMSMediaLookupItemMusic
+ (BOOL)supportsSecureCoding;
- (BOOL)appleCurated;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToMusicItem:(id)a3;
- (NSData)artwork;
- (NSString)displayName;
- (NSString)itemDescription;
- (NSURL)animatedArtworkURL;
- (NSURL)artworkURL;
- (NSURL)musicURL;
- (PKAMSMediaLookupItemMusic)init;
- (PKAMSMediaLookupItemMusic)initWithCoder:(id)a3;
- (PKAMSMediaLookupItemMusic)initWithType:(unint64_t)a3 artwork:(id)a4 animatedArtworkURL:(id)a5 displayName:(id)a6 itemDescription:(id)a7 musicURL:(id)a8 appleCurated:(BOOL)a9;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAnimatedArtworkURL:(id)a3;
- (void)setAppleCurated:(BOOL)a3;
- (void)setArtwork:(id)a3;
- (void)setArtworkURL:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setItemDescription:(id)a3;
- (void)setMusicURL:(id)a3;
@end

@implementation PKAMSMediaLookupItemMusic

- (PKAMSMediaLookupItemMusic)init
{
  return 0;
}

- (PKAMSMediaLookupItemMusic)initWithType:(unint64_t)a3 artwork:(id)a4 animatedArtworkURL:(id)a5 displayName:(id)a6 itemDescription:(id)a7 musicURL:(id)a8 appleCurated:(BOOL)a9
{
  id v22 = a4;
  id v21 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  if (a3 <= 2)
  {
    v19 = [(PKAMSMediaLookupItem *)self _initWithType:a3];
    objc_storeStrong(v19 + 3, a4);
    objc_storeStrong(v19 + 4, a5);
    objc_storeStrong(v19 + 5, a6);
    objc_storeStrong(v19 + 6, a7);
    objc_storeStrong(v19 + 7, a8);
    *((unsigned char *)v19 + 16) = a9;
    self = v19;
  }

  return self;
}

- (PKAMSMediaLookupItemMusic)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PKAMSMediaLookupItemMusic;
  v5 = [(PKAMSMediaLookupItem *)&v17 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"artwork"];
    artwork = v5->_artwork;
    v5->_artwork = (NSData *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"animatedArtworkURL"];
    animatedArtworkURL = v5->_animatedArtworkURL;
    v5->_animatedArtworkURL = (NSURL *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayName"];
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"itemDescription"];
    itemDescription = v5->_itemDescription;
    v5->_itemDescription = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"musicURL"];
    musicURL = v5->_musicURL;
    v5->_musicURL = (NSURL *)v14;

    v5->_appleCurated = [v4 decodeBoolForKey:@"appleCurated"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKAMSMediaLookupItemMusic;
  id v4 = a3;
  [(PKAMSMediaLookupItem *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_artwork, @"artwork", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_animatedArtworkURL forKey:@"animatedArtworkURL"];
  [v4 encodeObject:self->_displayName forKey:@"displayName"];
  [v4 encodeObject:self->_itemDescription forKey:@"itemDescription"];
  [v4 encodeObject:self->_musicURL forKey:@"musicURL"];
  [v4 encodeBool:self->_appleCurated forKey:@"appleCurated"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKAMSMediaLookupItemMusic;
  id v4 = [(PKAMSMediaLookupItem *)&v6 copyWithZone:a3];
  objc_storeStrong(v4 + 3, self->_artwork);
  objc_storeStrong(v4 + 4, self->_animatedArtworkURL);
  objc_storeStrong(v4 + 5, self->_displayName);
  objc_storeStrong(v4 + 6, self->_itemDescription);
  objc_storeStrong(v4 + 7, self->_musicURL);
  *((unsigned char *)v4 + 16) = self->_appleCurated;
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKAMSMediaLookupItemMusic *)a3;
  objc_super v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKAMSMediaLookupItemMusic *)self isEqualToMusicItem:v5];

  return v6;
}

- (BOOL)isEqualToMusicItem:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PKAMSMediaLookupItemMusic;
  if (![(PKAMSMediaLookupItem *)&v16 isEqualToItem:v4]
    || !PKEqualObjects()
    || !PKEqualObjects())
  {
    goto LABEL_21;
  }
  objc_super v5 = (void *)v4[5];
  BOOL v6 = self->_displayName;
  v7 = v5;
  if (v6 == v7)
  {
  }
  else
  {
    uint64_t v8 = v7;
    if (v6) {
      BOOL v9 = v7 == 0;
    }
    else {
      BOOL v9 = 1;
    }
    if (v9) {
      goto LABEL_17;
    }
    BOOL v10 = [(NSString *)v6 isEqualToString:v7];

    if (!v10) {
      goto LABEL_21;
    }
  }
  v11 = (void *)v4[6];
  BOOL v6 = self->_itemDescription;
  uint64_t v12 = v11;
  if (v6 == v12)
  {

    goto LABEL_19;
  }
  uint64_t v8 = v12;
  if (!v6 || !v12)
  {
LABEL_17:

LABEL_21:
    BOOL v14 = 0;
    goto LABEL_22;
  }
  BOOL v13 = [(NSString *)v6 isEqualToString:v12];

  if (!v13) {
    goto LABEL_21;
  }
LABEL_19:
  if (!PKEqualObjects()) {
    goto LABEL_21;
  }
  BOOL v14 = self->_appleCurated == *((unsigned __int8 *)v4 + 16);
LABEL_22:

  return v14;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  v8.receiver = self;
  v8.super_class = (Class)PKAMSMediaLookupItemMusic;
  id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PKAMSMediaLookupItem hash](&v8, sel_hash));
  [v3 safelyAddObject:v4];

  [v3 safelyAddObject:self->_artwork];
  [v3 safelyAddObject:self->_animatedArtworkURL];
  [v3 safelyAddObject:self->_displayName];
  [v3 safelyAddObject:self->_itemDescription];
  [v3 safelyAddObject:self->_musicURL];
  objc_super v5 = [NSNumber numberWithBool:self->_appleCurated];
  [v3 safelyAddObject:v5];

  unint64_t v6 = PKCombinedHash();
  return v6;
}

- (NSData)artwork
{
  return self->_artwork;
}

- (void)setArtwork:(id)a3
{
}

- (NSURL)animatedArtworkURL
{
  return self->_animatedArtworkURL;
}

- (void)setAnimatedArtworkURL:(id)a3
{
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (NSString)itemDescription
{
  return self->_itemDescription;
}

- (void)setItemDescription:(id)a3
{
}

- (NSURL)musicURL
{
  return self->_musicURL;
}

- (void)setMusicURL:(id)a3
{
}

- (BOOL)appleCurated
{
  return self->_appleCurated;
}

- (void)setAppleCurated:(BOOL)a3
{
  self->_appleCurated = a3;
}

- (NSURL)artworkURL
{
  return self->_artworkURL;
}

- (void)setArtworkURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkURL, 0);
  objc_storeStrong((id *)&self->_musicURL, 0);
  objc_storeStrong((id *)&self->_itemDescription, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_animatedArtworkURL, 0);

  objc_storeStrong((id *)&self->_artwork, 0);
}

@end