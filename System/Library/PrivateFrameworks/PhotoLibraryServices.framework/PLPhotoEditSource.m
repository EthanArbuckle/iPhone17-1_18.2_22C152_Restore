@interface PLPhotoEditSource
- (BOOL)isRAWSource;
- (PLPhotoEditSource)initWithURL:(id)a3 type:(id)a4 image:(id)a5 useEmbeddedPreview:(BOOL)a6;
- (id)newSourceWithURL:(id)a3 type:(id)a4 useEmbeddedPreview:(BOOL)a5;
- (void)setURL:(id)a3 type:(id)a4 image:(id)a5 useEmbeddedPreview:(BOOL)a6;
@end

@implementation PLPhotoEditSource

- (id)newSourceWithURL:(id)a3 type:(id)a4 useEmbeddedPreview:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = a3;
  v9 = [getPIPhotoEditHelperClass_84181() imageSourceWithURL:v8 type:v7 useEmbeddedPreview:v5];

  return v9;
}

- (BOOL)isRAWSource
{
  return self->_isRAWSource;
}

- (void)setURL:(id)a3 type:(id)a4 image:(id)a5 useEmbeddedPreview:(BOOL)a6
{
  BOOL v6 = a6;
  id v19 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = v11;
  if (v11)
  {
    uint64_t v13 = MEMORY[0x19F38B400](v11);
    if (v13) {
      [MEMORY[0x1E4F1E050] imageWithIOSurface:v13];
    }
    else {
    v15 = [MEMORY[0x1E4F1E050] imageWithCGImage:DCIM_CGImageRefFromPLImage()];
    }
    MEMORY[0x19F38B490](v12);
    uint64_t v16 = (int)PLExifOrientationFromImageOrientation();
    id PIPhotoEditHelperClass_84181 = getPIPhotoEditHelperClass_84181();
    if (v19) {
      [PIPhotoEditHelperClass_84181 imageSourceWithURL:v19 type:v10 proxyImage:v15 orientation:v16 useEmbeddedPreview:v6];
    }
    else {
    id v14 = [PIPhotoEditHelperClass_84181 imageSourceWithCIImage:v15 orientation:v16];
    }
  }
  else
  {
    id v14 = [(PLPhotoEditSource *)self newSourceWithURL:v19 type:v10 useEmbeddedPreview:v6];
  }
  [(PLEditSource *)self setResolvedSource:v14 mediaType:1];
  if (v10)
  {
    v18 = [MEMORY[0x1E4F442D8] typeWithIdentifier:v10];
    self->_isRAWSource = [v18 conformsToType:*MEMORY[0x1E4F44498]];
  }
  else
  {
    self->_isRAWSource = 0;
  }
}

- (PLPhotoEditSource)initWithURL:(id)a3 type:(id)a4 image:(id)a5 useEmbeddedPreview:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PLPhotoEditSource;
  uint64_t v13 = [(PLPhotoEditSource *)&v17 init];
  id v14 = v13;
  if (v13)
  {
    [(PLPhotoEditSource *)v13 setURL:v10 type:v11 image:v12 useEmbeddedPreview:v6];
    v15 = v14;
  }

  return v14;
}

@end