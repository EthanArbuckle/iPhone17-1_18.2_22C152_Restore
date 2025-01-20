@interface _UIActivityBundleImageConfiguration
+ (BOOL)supportsSecureCoding;
- (NSString)bundlePath;
- (NSString)imageName;
- (UIImage)fetchedImage;
- (_UIActivityBundleImageConfiguration)initWithCoder:(id)a3;
- (_UIActivityBundleImageConfiguration)initWithImageName:(id)a3 bundlePath:(id)a4 activityCategory:(int64_t)a5;
- (int64_t)activityCategory;
- (void)encodeWithCoder:(id)a3;
- (void)setActivityCategory:(int64_t)a3;
- (void)setBundlePath:(id)a3;
- (void)setImageName:(id)a3;
@end

@implementation _UIActivityBundleImageConfiguration

- (_UIActivityBundleImageConfiguration)initWithImageName:(id)a3 bundlePath:(id)a4 activityCategory:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_UIActivityBundleImageConfiguration;
  v10 = [(_UIActivityBundleImageConfiguration *)&v16 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    imageName = v10->_imageName;
    v10->_imageName = (NSString *)v11;

    uint64_t v13 = [v9 copy];
    bundlePath = v10->_bundlePath;
    v10->_bundlePath = (NSString *)v13;

    v10->_activityCategory = a5;
  }

  return v10;
}

- (UIImage)fetchedImage
{
  v19[2] = *MEMORY[0x1E4F143B8];
  p_fetchedImage = &self->_fetchedImage;
  v4 = self->_fetchedImage;
  if (!v4)
  {
    v5 = [(_UIActivityBundleImageConfiguration *)self imageName];
    v6 = [(_UIActivityBundleImageConfiguration *)self bundlePath];
    if (v6)
    {
      v7 = [MEMORY[0x1E4F28B50] bundleWithPath:v6];
      v4 = [MEMORY[0x1E4FB1818] imageNamed:v5 inBundle:v7];
    }
    else
    {
      id v8 = (void *)MEMORY[0x1E4FB1E20];
      id v9 = [MEMORY[0x1E4FB1BA8] mainScreen];
      v10 = [v9 traitCollection];
      v19[0] = v10;
      uint64_t v11 = (void *)MEMORY[0x1E4FB1E20];
      v12 = [MEMORY[0x1E4FB16C8] currentDevice];
      uint64_t v13 = objc_msgSend(v11, "traitCollectionWithUserInterfaceIdiom:", objc_msgSend(v12, "userInterfaceIdiom"));
      v19[1] = v13;
      v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
      v15 = [v8 traitCollectionWithTraitsFromCollections:v14];

      objc_super v16 = (void *)MEMORY[0x1E4FB1818];
      v17 = [MEMORY[0x1E4F28B50] mainBundle];
      v4 = [v16 imageNamed:v5 inBundle:v17 compatibleWithTraitCollection:v15];
    }
    objc_storeStrong((id *)p_fetchedImage, v4);
  }
  return v4;
}

- (_UIActivityBundleImageConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)_UIActivityBundleImageConfiguration;
  v5 = [(_UIActivityBundleImageConfiguration *)&v16 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    v7 = NSStringFromSelector(sel_imageName);
    uint64_t v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    imageName = v5->_imageName;
    v5->_imageName = (NSString *)v8;

    uint64_t v10 = objc_opt_class();
    uint64_t v11 = NSStringFromSelector(sel_bundlePath);
    uint64_t v12 = [v4 decodeObjectOfClass:v10 forKey:v11];
    bundlePath = v5->_bundlePath;
    v5->_bundlePath = (NSString *)v12;

    v14 = NSStringFromSelector(sel_activityCategory);
    v5->_activityCategory = [v4 decodeIntegerForKey:v14];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(_UIActivityBundleImageConfiguration *)self imageName];
  uint64_t v6 = NSStringFromSelector(sel_imageName);
  [v4 encodeObject:v5 forKey:v6];

  v7 = [(_UIActivityBundleImageConfiguration *)self bundlePath];
  uint64_t v8 = NSStringFromSelector(sel_bundlePath);
  [v4 encodeObject:v7 forKey:v8];

  int64_t v9 = [(_UIActivityBundleImageConfiguration *)self activityCategory];
  NSStringFromSelector(sel_activityCategory);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeInteger:v9 forKey:v10];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)imageName
{
  return self->_imageName;
}

- (void)setImageName:(id)a3
{
}

- (NSString)bundlePath
{
  return self->_bundlePath;
}

- (void)setBundlePath:(id)a3
{
}

- (int64_t)activityCategory
{
  return self->_activityCategory;
}

- (void)setActivityCategory:(int64_t)a3
{
  self->_activityCategory = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundlePath, 0);
  objc_storeStrong((id *)&self->_imageName, 0);
  objc_storeStrong((id *)&self->_fetchedImage, 0);
}

@end