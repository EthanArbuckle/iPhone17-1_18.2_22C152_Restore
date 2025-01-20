@interface MOEventPhoto
+ (BOOL)supportsSecureCoding;
+ (id)descriptionOfPhotoMomentSource:(unint64_t)a3;
- (BOOL)photoMemoryIsFavorite;
- (MOEventExtendedAttributes)extendedAttributes;
- (MOEventPhoto)initWithCoder:(id)a3;
- (NSArray)photoMemoryAssets;
- (NSString)photoMemoryTitle;
- (PHAsset)photoAsset;
- (double)photoMemoryRelevanceScore;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)photoMemoryCategory;
- (unint64_t)photoMemorySubCategory;
- (unint64_t)photoMomentSource;
- (void)encodeWithCoder:(id)a3;
- (void)setExtendedAttributes:(id)a3;
- (void)setPhotoAsset:(id)a3;
- (void)setPhotoMemoryAssets:(id)a3;
- (void)setPhotoMemoryCategory:(unint64_t)a3;
- (void)setPhotoMemoryIsFavorite:(BOOL)a3;
- (void)setPhotoMemoryRelevanceScore:(double)a3;
- (void)setPhotoMemorySubCategory:(unint64_t)a3;
- (void)setPhotoMemoryTitle:(id)a3;
- (void)setPhotoMomentSource:(unint64_t)a3;
@end

@implementation MOEventPhoto

+ (id)descriptionOfPhotoMomentSource:(unint64_t)a3
{
  if (a3 > 3) {
    return @"Invalid";
  }
  else {
    return off_1002CBC30[a3];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  extendedAttributes = self->_extendedAttributes;
  id v5 = a3;
  [v5 encodeObject:extendedAttributes forKey:@"extendedAttributes"];
  [v5 encodeInteger:self->_photoMomentSource forKey:@"photoMomentSource"];
  [v5 encodeObject:self->_photoMemoryTitle forKey:@"photoMemoryTitle"];
  [v5 encodeInteger:self->_photoMemoryCategory forKey:@"photoMemoryCategory"];
  [v5 encodeInteger:self->_photoMemorySubCategory forKey:@"photoMemorySubCategory"];
  [v5 encodeInteger:(uint64_t)self->_photoMemoryRelevanceScore forKey:@"photoMemoryRelevanceScore"];
  [v5 encodeInteger:self->_photoMemoryIsFavorite forKey:@"photoMemoryIsFavorite"];
}

- (MOEventPhoto)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MOEventPhoto;
  id v5 = [(MOEventPhoto *)&v11 init];
  if (v5)
  {
    v5->_photoMomentSource = (int)[v4 decodeIntForKey:@"photoMomentSource"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"extendedAttributes"];
    extendedAttributes = v5->_extendedAttributes;
    v5->_extendedAttributes = (MOEventExtendedAttributes *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"photoMemoryTitle"];
    photoMemoryTitle = v5->_photoMemoryTitle;
    v5->_photoMemoryTitle = (NSString *)v8;

    v5->_photoMemoryCategory = (unint64_t)[v4 decodeIntegerForKey:@"photoMemoryCategory"];
    v5->_photoMemorySubCategory = (unint64_t)[v4 decodeIntegerForKey:@"photoMemorySubCategory"];
    v5->_photoMemoryRelevanceScore = (double)(uint64_t)[v4 decodeIntegerForKey:@"photoMemoryRelevanceScore"];
    v5->_photoMemoryIsFavorite = [v4 decodeIntegerForKey:@"photoMemoryIsFavorite"] != 0;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(MOEventPhoto);
  v4->_photoMomentSource = self->_photoMomentSource;
  objc_storeStrong((id *)&v4->_extendedAttributes, self->_extendedAttributes);
  objc_storeStrong((id *)&v4->_photoMemoryTitle, self->_photoMemoryTitle);
  v4->_photoMemoryCategory = self->_photoMemoryCategory;
  v4->_photoMemorySubCategory = self->_photoMemorySubCategory;
  v4->_photoMemoryRelevanceScore = self->_photoMemoryRelevanceScore;
  v4->_photoMemoryIsFavorite = self->_photoMemoryIsFavorite;
  objc_storeStrong((id *)&v4->_photoAsset, self->_photoAsset);
  objc_storeStrong((id *)&v4->_photoMemoryAssets, self->_photoMemoryAssets);
  return v4;
}

- (id)description
{
  id v3 = objc_alloc((Class)NSString);
  extendedAttributes = self->_extendedAttributes;
  id v5 = +[MOEventPhoto descriptionOfPhotoMomentSource:self->_photoMomentSource];
  uint64_t v6 = [(NSString *)self->_photoMemoryTitle mask];
  id v7 = [v3 initWithFormat:@"extendedAttributes, %@, photo source,%@, photoMemoryTitle, %@, photoMemoryCategory,%lu, photoMemorySubCategory,%lu, photoMemoryRelevanceScore, %f, photoMemoryIsFavorite, %d", extendedAttributes, v5, v6, self->_photoMemoryCategory, self->_photoMemorySubCategory, *(void *)&self->_photoMemoryRelevanceScore, self->_photoMemoryIsFavorite];

  return v7;
}

- (unint64_t)photoMomentSource
{
  return self->_photoMomentSource;
}

- (void)setPhotoMomentSource:(unint64_t)a3
{
  self->_photoMomentSource = a3;
}

- (MOEventExtendedAttributes)extendedAttributes
{
  return self->_extendedAttributes;
}

- (void)setExtendedAttributes:(id)a3
{
}

- (PHAsset)photoAsset
{
  return self->_photoAsset;
}

- (void)setPhotoAsset:(id)a3
{
}

- (NSString)photoMemoryTitle
{
  return self->_photoMemoryTitle;
}

- (void)setPhotoMemoryTitle:(id)a3
{
}

- (NSArray)photoMemoryAssets
{
  return self->_photoMemoryAssets;
}

- (void)setPhotoMemoryAssets:(id)a3
{
}

- (unint64_t)photoMemoryCategory
{
  return self->_photoMemoryCategory;
}

- (void)setPhotoMemoryCategory:(unint64_t)a3
{
  self->_photoMemoryCategory = a3;
}

- (unint64_t)photoMemorySubCategory
{
  return self->_photoMemorySubCategory;
}

- (void)setPhotoMemorySubCategory:(unint64_t)a3
{
  self->_photoMemorySubCategory = a3;
}

- (BOOL)photoMemoryIsFavorite
{
  return self->_photoMemoryIsFavorite;
}

- (void)setPhotoMemoryIsFavorite:(BOOL)a3
{
  self->_photoMemoryIsFavorite = a3;
}

- (double)photoMemoryRelevanceScore
{
  return self->_photoMemoryRelevanceScore;
}

- (void)setPhotoMemoryRelevanceScore:(double)a3
{
  self->_photoMemoryRelevanceScore = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoMemoryAssets, 0);
  objc_storeStrong((id *)&self->_photoMemoryTitle, 0);
  objc_storeStrong((id *)&self->_photoAsset, 0);

  objc_storeStrong((id *)&self->_extendedAttributes, 0);
}

@end