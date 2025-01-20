@interface PKPassDetailsImageSet
+ (BOOL)shouldCache;
+ (BOOL)supportsSecureCoding;
+ (int64_t)imageSetType;
- (BOOL)isEqual:(id)a3;
- (PKImage)cardHolderPicture;
- (PKPassDetailsImageSet)initWithCoder:(id)a3;
- (PKPassDetailsImageSet)initWithDisplayProfile:(id)a3 fileURL:(id)a4 screenScale:(double)a5 suffix:(id)a6;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)preheatImages;
- (void)setCardHolderPicture:(id)a3;
@end

@implementation PKPassDetailsImageSet

- (PKPassDetailsImageSet)initWithDisplayProfile:(id)a3 fileURL:(id)a4 screenScale:(double)a5 suffix:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v19.receiver = self;
  v19.super_class = (Class)PKPassDetailsImageSet;
  v13 = [(PKImageSet *)&v19 initWithDisplayProfile:v10 fileURL:v11 screenScale:v12 suffix:a5];
  if (v13)
  {
    v14 = (void *)MEMORY[0x192FDC630]();
    v15 = [MEMORY[0x1E4F28B50] bundleWithURL:v11];
    uint64_t v16 = +[PKImage imageNamed:@"cardHolderPicture" inBundle:v15 screenScale:v12 suffix:a5];
    cardHolderPicture = v13->_cardHolderPicture;
    v13->_cardHolderPicture = (PKImage *)v16;
  }

  return v13;
}

+ (int64_t)imageSetType
{
  return 5;
}

+ (BOOL)shouldCache
{
  return 0;
}

- (void)preheatImages
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPassDetailsImageSet)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKPassDetailsImageSet;
  v5 = [(PKImageSet *)&v10 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x192FDC630]();
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cardHolderPicture"];
    cardHolderPicture = v5->_cardHolderPicture;
    v5->_cardHolderPicture = (PKImage *)v7;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PKPassDetailsImageSet;
  id v5 = [(PKImageSet *)&v7 encodeWithCoder:v4];
  v6 = (void *)MEMORY[0x192FDC630](v5);
  [v4 encodeObject:self->_cardHolderPicture forKey:@"cardHolderPicture"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(PKImageSet *)self _isSetImage:self->_cardHolderPicture equalToImage:v4[3]];

  return v5;
}

- (unint64_t)hash
{
  v2 = [(PKImage *)self->_cardHolderPicture imageHash];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (PKImage)cardHolderPicture
{
  return self->_cardHolderPicture;
}

- (void)setCardHolderPicture:(id)a3
{
}

- (void).cxx_destruct
{
}

@end