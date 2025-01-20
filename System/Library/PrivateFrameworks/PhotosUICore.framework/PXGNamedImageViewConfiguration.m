@interface PXGNamedImageViewConfiguration
- (BOOL)isEqual:(id)a3;
- (NSBundle)bundle;
- (NSString)imageName;
- (PXGNamedImageViewConfiguration)initWithImageName:(id)a3 contentMode:(int64_t)a4 bundle:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)contentMode;
- (unint64_t)hash;
- (void)setBundle:(id)a3;
- (void)setContentMode:(int64_t)a3;
- (void)setImageName:(id)a3;
@end

@implementation PXGNamedImageViewConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundle, 0);
  objc_storeStrong((id *)&self->_imageName, 0);
}

- (void)setBundle:(id)a3
{
}

- (NSBundle)bundle
{
  return self->_bundle;
}

- (void)setContentMode:(int64_t)a3
{
  self->_contentMode = a3;
}

- (int64_t)contentMode
{
  return self->_contentMode;
}

- (void)setImageName:(id)a3
{
}

- (NSString)imageName
{
  return self->_imageName;
}

- (unint64_t)hash
{
  v3 = [(PXGNamedImageViewConfiguration *)self imageName];
  uint64_t v4 = [v3 hash];
  int64_t v5 = v4 ^ (2 * [(PXGNamedImageViewConfiguration *)self contentMode]);
  v6 = [(PXGNamedImageViewConfiguration *)self bundle];
  unint64_t v7 = v5 ^ [v6 hash];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (PXGNamedImageViewConfiguration *)a3;
  if (self == v4)
  {
    BOOL v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int64_t v5 = v4;
      id v6 = [(PXGNamedImageViewConfiguration *)self imageName];
      id v7 = [(PXGNamedImageViewConfiguration *)v5 imageName];
      if (v6 == v7)
      {
      }
      else
      {
        int v8 = [v6 isEqualToString:v7];

        if (!v8) {
          goto LABEL_11;
        }
      }
      int64_t v10 = [(PXGNamedImageViewConfiguration *)self contentMode];
      if (v10 == [(PXGNamedImageViewConfiguration *)v5 contentMode])
      {
        v11 = [(PXGNamedImageViewConfiguration *)self bundle];
        v12 = [(PXGNamedImageViewConfiguration *)v5 bundle];
        BOOL v9 = v11 == v12;

LABEL_12:
        goto LABEL_13;
      }
LABEL_11:
      BOOL v9 = 0;
      goto LABEL_12;
    }
    BOOL v9 = 0;
  }
LABEL_13:

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  int64_t v5 = [(PXGNamedImageViewConfiguration *)self imageName];
  [v4 setImageName:v5];

  objc_msgSend(v4, "setContentMode:", -[PXGNamedImageViewConfiguration contentMode](self, "contentMode"));
  id v6 = [(PXGNamedImageViewConfiguration *)self bundle];
  [v4 setBundle:v6];

  return v4;
}

- (PXGNamedImageViewConfiguration)initWithImageName:(id)a3 contentMode:(int64_t)a4 bundle:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PXGNamedImageViewConfiguration;
  v11 = [(PXGNamedImageViewConfiguration *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_imageName, a3);
    v12->_contentMode = a4;
    objc_storeStrong((id *)&v12->_bundle, a5);
  }

  return v12;
}

@end