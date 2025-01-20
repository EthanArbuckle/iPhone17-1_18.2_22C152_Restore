@interface _TVImage16x9Decorator
- (NSString)inlineTitle;
- (_TVImage16x9Decorator)initWithInlineTitle:(id)a3;
- (id)decorate:(id)a3 scaledWithSize:(CGSize)a4 croppedToFit:(BOOL)a5;
- (id)decoratorIdentifier;
- (void)setInlineTitle:(id)a3;
@end

@implementation _TVImage16x9Decorator

- (_TVImage16x9Decorator)initWithInlineTitle:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_TVImage16x9Decorator;
  v6 = [(TVImageScaleDecorator *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_inlineTitle, a3);
  }

  return v7;
}

- (id)decoratorIdentifier
{
  v7.receiver = self;
  v7.super_class = (Class)_TVImage16x9Decorator;
  v2 = [(TVImageScaleDecorator *)&v7 decoratorIdentifier];
  v3 = [MEMORY[0x263EFF960] currentLocale];
  v4 = [v3 localeIdentifier];

  id v5 = [NSString stringWithFormat:@"%@_%@_KeyFrameArt", v2, v4];

  return v5;
}

- (id)decorate:(id)a3 scaledWithSize:(CGSize)a4 croppedToFit:(BOOL)a5
{
  id v6 = a3;
  objc_super v7 = [v6 uiImage];
  BOOL v8 = (int)[v6 orientation] >= 2 && (int)objc_msgSend(v6, "orientation") < 9;
  [v7 size];
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  long long v31 = *MEMORY[0x263F001A8];
  [(TVImageScaleDecorator *)self _scaleToSizeAdjustedForUpscaling];
  double v14 = v13;
  double v16 = v15;
  id v17 = v6;
  v18 = +[TVGraphicsImageRenderer formatWithCGImage:](TVGraphicsImageRenderer, "formatWithCGImage:", [v17 image]);
  [v18 setOpaque:0];
  uint64_t v24 = MEMORY[0x263EF8330];
  uint64_t v25 = 3221225472;
  v26 = __62___TVImage16x9Decorator_decorate_scaledWithSize_croppedToFit___block_invoke;
  v27 = &unk_264BA7570;
  double v32 = v14;
  double v33 = v16;
  v28 = self;
  id v29 = v7;
  BOOL v36 = v8;
  id v30 = v17;
  uint64_t v34 = v10;
  uint64_t v35 = v12;
  id v19 = v17;
  id v20 = v7;
  +[TVGraphicsImageRenderer imageWithSize:format:actions:](TVGraphicsImageRenderer, "imageWithSize:format:actions:", v18, &v24, v14, v16);
  id v21 = objc_claimAutoreleasedReturnValue();
  v22 = +[TVImage imageWithCGImageRef:preserveAlpha:](TVImage, "imageWithCGImageRef:preserveAlpha:", objc_msgSend(v21, "CGImage", v24, v25, v26, v27, v28), 0);

  return v22;
}

- (NSString)inlineTitle
{
  return self->_inlineTitle;
}

- (void)setInlineTitle:(id)a3
{
}

- (void).cxx_destruct
{
}

@end