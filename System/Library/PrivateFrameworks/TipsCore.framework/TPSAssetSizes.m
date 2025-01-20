@interface TPSAssetSizes
+ (BOOL)supportsSecureCoding;
- (TPSAssetSizes)initWithCoder:(id)a3;
- (TPSAssetSizes)initWithDictionary:(id)a3;
- (TPSSizes)collectionFeatured;
- (TPSSizes)thumbnail;
- (TPSSizes)tip;
- (TPSSizes)tipIntro;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (void)encodeWithCoder:(id)a3;
- (void)setCollectionFeatured:(id)a3;
- (void)setThumbnail:(id)a3;
- (void)setTip:(id)a3;
- (void)setTipIntro:(id)a3;
@end

@implementation TPSAssetSizes

- (TPSAssetSizes)initWithDictionary:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)TPSAssetSizes;
  v5 = [(TPSSerializableObject *)&v24 initWithDictionary:v4];
  if (!v5) {
    goto LABEL_6;
  }
  v6 = [TPSSizes alloc];
  v7 = [v4 TPSSafeDictionaryForKey:@"tip"];
  uint64_t v8 = [(TPSSizes *)v6 initWithDictionary:v7];
  tip = v5->_tip;
  v5->_tip = (TPSSizes *)v8;

  v10 = [TPSSizes alloc];
  v11 = [v4 TPSSafeDictionaryForKey:@"tipIntro"];
  uint64_t v12 = [(TPSSizes *)v10 initWithDictionary:v11];
  tipIntro = v5->_tipIntro;
  v5->_tipIntro = (TPSSizes *)v12;

  v14 = [TPSSizes alloc];
  v15 = [v4 TPSSafeDictionaryForKey:@"collectionHero"];
  uint64_t v16 = [(TPSSizes *)v14 initWithDictionary:v15];
  collectionFeatured = v5->_collectionFeatured;
  v5->_collectionFeatured = (TPSSizes *)v16;

  v18 = [TPSSizes alloc];
  v19 = [v4 TPSSafeDictionaryForKey:@"thumbnail"];
  uint64_t v20 = [(TPSSizes *)v18 initWithDictionary:v19];
  thumbnail = v5->_thumbnail;
  v5->_thumbnail = (TPSSizes *)v20;

  if (v5->_tip || v5->_tipIntro || v5->_collectionFeatured || v5->_thumbnail) {
LABEL_6:
  }
    v22 = v5;
  else {
    v22 = 0;
  }

  return v22;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)TPSAssetSizes;
  id v4 = a3;
  [(TPSSerializableObject *)&v9 encodeWithCoder:v4];
  v5 = [(TPSAssetSizes *)self tip];
  [v4 encodeObject:v5 forKey:@"tip"];

  v6 = [(TPSAssetSizes *)self tipIntro];
  [v4 encodeObject:v6 forKey:@"tipIntro"];

  v7 = [(TPSAssetSizes *)self collectionFeatured];
  [v4 encodeObject:v7 forKey:@"collectionHero"];

  uint64_t v8 = [(TPSAssetSizes *)self thumbnail];
  [v4 encodeObject:v8 forKey:@"thumbnail"];
}

- (TPSSizes)tip
{
  return self->_tip;
}

- (TPSSizes)tipIntro
{
  return self->_tipIntro;
}

- (TPSSizes)thumbnail
{
  return self->_thumbnail;
}

- (TPSSizes)collectionFeatured
{
  return self->_collectionFeatured;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnail, 0);
  objc_storeStrong((id *)&self->_collectionFeatured, 0);
  objc_storeStrong((id *)&self->_tipIntro, 0);
  objc_storeStrong((id *)&self->_tip, 0);
}

- (TPSAssetSizes)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)TPSAssetSizes;
  v5 = [(TPSSerializableObject *)&v15 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tip"];
    tip = v5->_tip;
    v5->_tip = (TPSSizes *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tipIntro"];
    tipIntro = v5->_tipIntro;
    v5->_tipIntro = (TPSSizes *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"collectionHero"];
    collectionFeatured = v5->_collectionFeatured;
    v5->_collectionFeatured = (TPSSizes *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"thumbnail"];
    thumbnail = v5->_thumbnail;
    v5->_thumbnail = (TPSSizes *)v12;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)TPSAssetSizes;
  id v4 = [(TPSSerializableObject *)&v10 copyWithZone:a3];
  v5 = [(TPSAssetSizes *)self tip];
  [v4 setTip:v5];

  uint64_t v6 = [(TPSAssetSizes *)self tipIntro];
  [v4 setTipIntro:v6];

  v7 = [(TPSAssetSizes *)self collectionFeatured];
  [v4 setCollectionFeatured:v7];

  uint64_t v8 = [(TPSAssetSizes *)self thumbnail];
  [v4 setThumbnail:v8];

  return v4;
}

- (id)debugDescription
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  v11.receiver = self;
  v11.super_class = (Class)TPSAssetSizes;
  id v4 = [(TPSAssetSizes *)&v11 description];
  v5 = (void *)[v3 initWithString:v4];

  uint64_t v6 = [(TPSAssetSizes *)self tip];
  [v5 appendFormat:@"\n %@ = %@\n", @"tip", v6];

  v7 = [(TPSAssetSizes *)self tipIntro];
  [v5 appendFormat:@" %@ = %@\n", @"tipIntro", v7];

  uint64_t v8 = [(TPSAssetSizes *)self collectionFeatured];
  [v5 appendFormat:@" %@ = %@\n", @"collectionHero", v8];

  objc_super v9 = [(TPSAssetSizes *)self thumbnail];
  [v5 appendFormat:@" %@ = %@", @"thumbnail", v9];

  return v5;
}

- (void)setTip:(id)a3
{
}

- (void)setTipIntro:(id)a3
{
}

- (void)setCollectionFeatured:(id)a3
{
}

- (void)setThumbnail:(id)a3
{
}

@end