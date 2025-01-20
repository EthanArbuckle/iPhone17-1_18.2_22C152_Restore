@interface REImageContentProvider
+ (BOOL)supportsSecureCoding;
+ (REImageContentProvider)imageContentProviderWithOnePieceImage:(id)a3;
+ (REImageContentProvider)imageContentProviderWithOnePieceImage:(id)a3 twoPieceForegroundImage:(id)a4 twoPieceBackgroundImage:(id)a5;
+ (id)imageContentProviderFromClockKitImageProvider:(id)a3;
- (REImage)onePieceImage;
- (REImage)twoPieceBackgroundImage;
- (REImage)twoPieceForegroundImage;
- (REImageContentProvider)initWithCoder:(id)a3;
- (REImageContentProvider)initWithImage:(id)a3 foregroundImage:(id)a4 backgroundImage:(id)a5;
- (id)clockKitImageProviderRepresentation;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation REImageContentProvider

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (REImageContentProvider)imageContentProviderWithOnePieceImage:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithImage:v4 foregroundImage:0 backgroundImage:0];

  return (REImageContentProvider *)v5;
}

+ (REImageContentProvider)imageContentProviderWithOnePieceImage:(id)a3 twoPieceForegroundImage:(id)a4 twoPieceBackgroundImage:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = (void *)[objc_alloc((Class)a1) initWithImage:v10 foregroundImage:v9 backgroundImage:v8];

  return (REImageContentProvider *)v11;
}

- (REImageContentProvider)initWithImage:(id)a3 foregroundImage:(id)a4 backgroundImage:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)REImageContentProvider;
  v11 = [(REImageContentProvider *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    onePieceImage = v11->_onePieceImage;
    v11->_onePieceImage = (REImage *)v12;

    uint64_t v14 = [v10 copy];
    twoPieceBackgroundImage = v11->_twoPieceBackgroundImage;
    v11->_twoPieceBackgroundImage = (REImage *)v14;

    uint64_t v16 = [v9 copy];
    twoPieceForegroundImage = v11->_twoPieceForegroundImage;
    v11->_twoPieceForegroundImage = (REImage *)v16;
  }
  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  onePieceImage = self->_onePieceImage;
  twoPieceForegroundImage = self->_twoPieceForegroundImage;
  twoPieceBackgroundImage = self->_twoPieceBackgroundImage;
  return (id)[v4 initWithImage:onePieceImage foregroundImage:twoPieceForegroundImage backgroundImage:twoPieceBackgroundImage];
}

+ (id)imageContentProviderFromClockKitImageProvider:(id)a3
{
  id v4 = a3;
  RelevanceEngineUILibrary();
  v5 = [v4 onePieceImage];
  v6 = +[REImage imageWithImage:v5];

  v7 = [v4 twoPieceImageForeground];
  id v8 = +[REImage imageWithImage:v7];

  id v9 = [v4 twoPieceImageBackground];

  id v10 = +[REImage imageWithImage:v9];

  v11 = (void *)[objc_alloc((Class)a1) initWithImage:v6 foregroundImage:v8 backgroundImage:v10];
  return v11;
}

- (id)clockKitImageProviderRepresentation
{
  RelevanceEngineUILibrary();
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2050000000;
  v3 = (void *)getCLKImageProviderClass_softClass;
  uint64_t v14 = getCLKImageProviderClass_softClass;
  if (!getCLKImageProviderClass_softClass)
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __getCLKImageProviderClass_block_invoke;
    v10[3] = &unk_2644BC768;
    v10[4] = &v11;
    __getCLKImageProviderClass_block_invoke((uint64_t)v10);
    v3 = (void *)v12[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v11, 8);
  v5 = [(REImage *)self->_onePieceImage image];
  v6 = [(REImage *)self->_twoPieceForegroundImage image];
  v7 = [(REImage *)self->_twoPieceBackgroundImage image];
  id v8 = [v4 imageProviderWithOnePieceImage:v5 twoPieceImageBackground:v6 twoPieceImageForeground:v7];

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  onePieceImage = self->_onePieceImage;
  id v5 = a3;
  [v5 encodeObject:onePieceImage forKey:@"onePieceImage"];
  [v5 encodeObject:self->_twoPieceForegroundImage forKey:@"twoPieceForeground"];
  [v5 encodeObject:self->_twoPieceBackgroundImage forKey:@"twoPieceBackground"];
}

- (REImageContentProvider)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"onePieceImage"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"twoPieceForeground"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"twoPieceBackground"];

  id v8 = [(REImageContentProvider *)self initWithImage:v5 foregroundImage:v6 backgroundImage:v7];
  return v8;
}

- (REImage)onePieceImage
{
  return self->_onePieceImage;
}

- (REImage)twoPieceForegroundImage
{
  return self->_twoPieceForegroundImage;
}

- (REImage)twoPieceBackgroundImage
{
  return self->_twoPieceBackgroundImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_twoPieceBackgroundImage, 0);
  objc_storeStrong((id *)&self->_twoPieceForegroundImage, 0);
  objc_storeStrong((id *)&self->_onePieceImage, 0);
}

@end