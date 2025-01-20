@interface NTKUserPhotoEditOption
+ (BOOL)supportsSecureCoding;
+ (id)optionUsingDefaultPhoto:(BOOL)a3 forDevice:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isValidOption;
- (BOOL)usesDefaultPhoto;
- (NTKUserPhotoEditOption)initWithCoder:(id)a3;
- (NTKUserPhotoEditOption)initWithJSONObjectRepresentation:(id)a3 forDevice:(id)a4;
- (id)JSONObjectRepresentation;
- (id)dailySnapshotKey;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setUsesDefaultPhoto:(BOOL)a3;
@end

@implementation NTKUserPhotoEditOption

+ (id)optionUsingDefaultPhoto:(BOOL)a3 forDevice:(id)a4
{
  id v6 = a4;
  v7 = (unsigned char *)[objc_alloc((Class)a1) initWithDevice:v6];

  v7[16] = a3;

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    int usesDefaultPhoto = self->_usesDefaultPhoto;
    BOOL v6 = usesDefaultPhoto == [v4 usesDefaultPhoto];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return self->_usesDefaultPhoto;
}

+ (BOOL)supportsSecureCoding
{
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NTKUserPhotoEditOption;
  id v4 = a3;
  [(NTKEditOption *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeBool:forKey:", self->_usesDefaultPhoto, @"UsesDefault", v5.receiver, v5.super_class);
}

- (NTKUserPhotoEditOption)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)NTKUserPhotoEditOption;
  objc_super v5 = [(NTKEditOption *)&v7 initWithCoder:v4];
  if (v5) {
    v5->_int usesDefaultPhoto = [v4 decodeBoolForKey:@"UsesDefault"];
  }

  return v5;
}

- (id)dailySnapshotKey
{
  if (self->_usesDefaultPhoto) {
    return @"defaultPhoto";
  }
  else {
    return @"selectedPhoto";
  }
}

- (id)JSONObjectRepresentation
{
  if (self->_usesDefaultPhoto) {
    v2 = NTKFaceBundlePhotoContentDefault;
  }
  else {
    v2 = NTKFaceBundlePhotoContentCustom;
  }
  return *v2;
}

- (NTKUserPhotoEditOption)initWithJSONObjectRepresentation:(id)a3 forDevice:(id)a4
{
  id v6 = a3;
  objc_super v7 = [(NTKEditOption *)self initWithDevice:a4];
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"object must be a string - invalid value: %@", v6 format];
    }
    if ([v6 isEqualToString:@"custom"])
    {
      v7->_int usesDefaultPhoto = 0;
    }
    else if ([v6 isEqualToString:@"default"])
    {
      v7->_int usesDefaultPhoto = 1;
    }
    else
    {
      [MEMORY[0x1E4F1CA00] raise:@"NTKFaceBundleException", @"invalid value: %@", v6 format];
    }
  }

  return v7;
}

- (BOOL)isValidOption
{
  return 1;
}

- (BOOL)usesDefaultPhoto
{
  return self->_usesDefaultPhoto;
}

- (void)setUsesDefaultPhoto:(BOOL)a3
{
  self->_int usesDefaultPhoto = a3;
}

@end