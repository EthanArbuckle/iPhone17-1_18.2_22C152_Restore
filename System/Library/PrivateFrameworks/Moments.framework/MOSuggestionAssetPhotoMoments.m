@interface MOSuggestionAssetPhotoMoments
+ (BOOL)supportsSecureCoding;
- (MOSuggestionAssetPhotoMoments)initWithCoder:(id)a3;
- (MOSuggestionAssetPhotoMoments)initWithKeyPhoto:(id)a3 curatedPhotos:(id)a4;
- (NSArray)curatedPhotos;
- (UIImage)keyPhoto;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MOSuggestionAssetPhotoMoments

- (MOSuggestionAssetPhotoMoments)initWithKeyPhoto:(id)a3 curatedPhotos:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MOSuggestionAssetPhotoMoments;
  v9 = [(MOSuggestionAssetPhotoMoments *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_keyPhoto, a3);
    objc_storeStrong((id *)&v10->_curatedPhotos, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  curatedPhotos = self->_curatedPhotos;
  id v5 = a3;
  [v5 encodeObject:curatedPhotos forKey:@"photos"];
  [v5 encodeObject:self->_keyPhoto forKey:@"keyPhotos"];
}

- (MOSuggestionAssetPhotoMoments)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MOSuggestionAssetPhotoMoments;
  id v5 = [(MOSuggestionAssetPhotoMoments *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"keyPhotos"];
    keyPhoto = v5->_keyPhoto;
    v5->_keyPhoto = (UIImage *)v6;

    id v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"photos"];
    curatedPhotos = v5->_curatedPhotos;
    v5->_curatedPhotos = (NSArray *)v11;
  }
  return v5;
}

- (UIImage)keyPhoto
{
  return self->_keyPhoto;
}

- (NSArray)curatedPhotos
{
  return self->_curatedPhotos;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_curatedPhotos, 0);
  objc_storeStrong((id *)&self->_keyPhoto, 0);
}

@end