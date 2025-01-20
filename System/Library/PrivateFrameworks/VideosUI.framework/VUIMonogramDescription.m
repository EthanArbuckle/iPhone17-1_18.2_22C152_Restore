@interface VUIMonogramDescription
- (BOOL)isEqual:(id)a3;
- (BOOL)isUsingLibraryImageLoader;
- (BOOL)optimizedImageRendering;
- (BOOL)shouldFallBackToSilhouette;
- (CGPoint)specialOffsetForString:(id)a3;
- (CGSize)defaultImageSize;
- (CGSize)size;
- (NSDictionary)specialOffsetByFirstLetter;
- (NSString)text;
- (NSURL)imageURL;
- (UIColor)backgroundColor;
- (UIColor)borderColor;
- (UIColor)fillColor;
- (UIColor)gradientEndColor;
- (UIColor)gradientStartColor;
- (UIColor)textColor;
- (UIEdgeInsets)padding;
- (UIFont)font;
- (UIImage)placeholderImage;
- (VUIMonogramDescription)init;
- (VUIMonogramDescription)initWithText:(id)a3 imageURL:(id)a4 font:(id)a5;
- (VUINetworkRequestLoader)requestLoader;
- (double)borderWidth;
- (double)cornerRadius;
- (double)upscaleAdjustment;
- (id)copyWithType:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)scaleMode;
- (unint64_t)hash;
- (unint64_t)preferedMonogramType;
- (void)setBackgroundColor:(id)a3;
- (void)setBorderColor:(id)a3;
- (void)setBorderWidth:(double)a3;
- (void)setCornerRadius:(double)a3;
- (void)setDefaultImageSize:(CGSize)a3;
- (void)setFillColor:(id)a3;
- (void)setGradientEndColor:(id)a3;
- (void)setGradientStartColor:(id)a3;
- (void)setIsUsingLibraryImageLoader:(BOOL)a3;
- (void)setOptimizedImageRendering:(BOOL)a3;
- (void)setPadding:(UIEdgeInsets)a3;
- (void)setPlaceholderImage:(id)a3;
- (void)setRequestLoader:(id)a3;
- (void)setScaleMode:(int64_t)a3;
- (void)setShouldFallBackToSilhouette:(BOOL)a3;
- (void)setSize:(CGSize)a3;
- (void)setSpecialOffsetByFirstLetter:(id)a3;
- (void)setTextColor:(id)a3;
- (void)setUpscaleAdjustment:(double)a3;
@end

@implementation VUIMonogramDescription

- (VUIMonogramDescription)initWithText:(id)a3 imageURL:(id)a4 font:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)VUIMonogramDescription;
  v11 = [(VUIMonogramDescription *)&v21 init];
  v12 = v11;
  if (v11)
  {
    v11->_shouldFallBackToSilhouette = 1;
    uint64_t v13 = [v8 copy];
    text = v12->_text;
    v12->_text = (NSString *)v13;

    uint64_t v15 = [v9 copy];
    imageURL = v12->_imageURL;
    v12->_imageURL = (NSURL *)v15;

    p_font = (void **)&v12->_font;
    objc_storeStrong((id *)&v12->_font, a5);
    if (!v12->_font)
    {
      uint64_t v18 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2990]];
      v19 = *p_font;
      *p_font = (void *)v18;
    }
    v12->_scaleMode = 3;
    v12->_optimizedImageRendering = 1;
  }

  return v12;
}

- (VUIMonogramDescription)init
{
  return [(VUIMonogramDescription *)self initWithText:0 imageURL:0 font:0];
}

- (id)copyWithType:(unint64_t)a3
{
  if ([(VUIMonogramDescription *)self preferedMonogramType] <= a3) {
    return 0;
  }
  uint64_t v5 = [(VUIMonogramDescription *)self copy];
  v6 = (void *)v5;
  if (a3 <= 2)
  {
    v7 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = 0;

    if (a3 != 2)
    {
      id v8 = (void *)v6[2];
      v6[2] = 0;

      if (!a3) {
        [v6 setShouldFallBackToSilhouette:0];
      }
    }
  }
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[VUIMonogramDescription allocWithZone:a3];
  uint64_t v5 = [(VUIMonogramDescription *)self text];
  v6 = [(VUIMonogramDescription *)self imageURL];
  v7 = [(VUIMonogramDescription *)self font];
  id v8 = [(VUIMonogramDescription *)v4 initWithText:v5 imageURL:v6 font:v7];

  [(VUIMonogramDescription *)self size];
  -[VUIMonogramDescription setSize:](v8, "setSize:");
  [(VUIMonogramDescription *)self defaultImageSize];
  -[VUIMonogramDescription setDefaultImageSize:](v8, "setDefaultImageSize:");
  id v9 = [(VUIMonogramDescription *)self specialOffsetByFirstLetter];
  [(VUIMonogramDescription *)v8 setSpecialOffsetByFirstLetter:v9];

  [(VUIMonogramDescription *)self padding];
  -[VUIMonogramDescription setPadding:](v8, "setPadding:");
  [(VUIMonogramDescription *)v8 setScaleMode:[(VUIMonogramDescription *)self scaleMode]];
  id v10 = [(VUIMonogramDescription *)self backgroundColor];
  [(VUIMonogramDescription *)v8 setBackgroundColor:v10];

  v11 = [(VUIMonogramDescription *)self textColor];
  [(VUIMonogramDescription *)v8 setTextColor:v11];

  [(VUIMonogramDescription *)self upscaleAdjustment];
  -[VUIMonogramDescription setUpscaleAdjustment:](v8, "setUpscaleAdjustment:");
  [(VUIMonogramDescription *)self cornerRadius];
  -[VUIMonogramDescription setCornerRadius:](v8, "setCornerRadius:");
  v12 = [(VUIMonogramDescription *)self fillColor];
  [(VUIMonogramDescription *)v8 setFillColor:v12];

  uint64_t v13 = [(VUIMonogramDescription *)self gradientStartColor];
  [(VUIMonogramDescription *)v8 setGradientStartColor:v13];

  v14 = [(VUIMonogramDescription *)self gradientEndColor];
  [(VUIMonogramDescription *)v8 setGradientEndColor:v14];

  [(VUIMonogramDescription *)v8 setShouldFallBackToSilhouette:[(VUIMonogramDescription *)self shouldFallBackToSilhouette]];
  [(VUIMonogramDescription *)self borderWidth];
  -[VUIMonogramDescription setBorderWidth:](v8, "setBorderWidth:");
  uint64_t v15 = [(VUIMonogramDescription *)self borderColor];
  [(VUIMonogramDescription *)v8 setBorderColor:v15];

  v16 = [(VUIMonogramDescription *)self requestLoader];
  [(VUIMonogramDescription *)v8 setRequestLoader:v16];

  [(VUIMonogramDescription *)v8 setOptimizedImageRendering:[(VUIMonogramDescription *)self optimizedImageRendering]];
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v6 = a3;
  objc_opt_class();
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    id v8 = [(VUIMonogramDescription *)self text];
    id v9 = [v7 text];
    if (v8 != v9)
    {
      v3 = [(VUIMonogramDescription *)self text];
      v4 = [v7 text];
      if (![v3 isEqual:v4])
      {
        char v10 = 0;
        goto LABEL_20;
      }
    }
    v11 = [(VUIMonogramDescription *)self imageURL];
    v12 = [v7 imageURL];
    if (v11 != v12)
    {
      uint64_t v13 = [(VUIMonogramDescription *)self imageURL];
      v96 = [v7 imageURL];
      v97 = v13;
      if (!objc_msgSend(v13, "isEqual:"))
      {
        char v10 = 0;
LABEL_18:

LABEL_19:
        if (v8 == v9)
        {
LABEL_21:

          goto LABEL_22;
        }
LABEL_20:

        goto LABEL_21;
      }
    }
    [(VUIMonogramDescription *)self size];
    double v15 = v14;
    double v17 = v16;
    [v7 size];
    if (v15 != v19
      || v17 != v18
      || ([(VUIMonogramDescription *)self defaultImageSize],
          double v21 = v20,
          double v23 = v22,
          [v7 defaultImageSize],
          v21 != v25)
      || v23 != v24)
    {
      char v10 = 0;
      char v28 = 0;
      if (v11 != v12) {
        goto LABEL_18;
      }
      goto LABEL_16;
    }
    v94 = v3;
    uint64_t v26 = [(VUIMonogramDescription *)self specialOffsetByFirstLetter];
    v27 = [v7 specialOffsetByFirstLetter];
    v95 = (void *)v26;
    if ((void *)v26 != v27
      || ([(VUIMonogramDescription *)self padding],
          double v31 = v30,
          double v33 = v32,
          double v35 = v34,
          double v37 = v36,
          [v7 padding],
          v33 != v41)
      || v31 != v38
      || v37 != v40
      || v35 != v39
      || (int64_t v42 = -[VUIMonogramDescription scaleMode](self, "scaleMode"), v42 != [v7 scaleMode]))
    {

      char v10 = 0;
      char v28 = 0;
      goto LABEL_15;
    }
    uint64_t v43 = [(VUIMonogramDescription *)self backgroundColor];
    v93 = [v7 backgroundColor];
    v92 = (void *)v43;
    if ((void *)v43 != v93)
    {
      v44 = [(VUIMonogramDescription *)self backgroundColor];
      v89 = [v7 backgroundColor];
      v90 = v44;
      if (!objc_msgSend(v44, "isEqual:"))
      {
        char v10 = 0;
        goto LABEL_64;
      }
    }
    uint64_t v45 = [(VUIMonogramDescription *)self textColor];
    uint64_t v91 = [v7 textColor];
    if (v45 != v91)
    {
      v46 = (void *)v45;
      v47 = [(VUIMonogramDescription *)self textColor];
      v87 = [v7 textColor];
      v88 = v47;
      if (!objc_msgSend(v47, "isEqual:"))
      {
        char v10 = 0;
        v57 = (void *)v91;
LABEL_62:

LABEL_63:
        if (v92 == v93)
        {
LABEL_65:

          char v28 = v10;
LABEL_15:
          v3 = v94;
          if (v11 != v12) {
            goto LABEL_18;
          }
LABEL_16:

          char v10 = v28;
          goto LABEL_19;
        }
LABEL_64:

        goto LABEL_65;
      }
      uint64_t v45 = (uint64_t)v46;
    }
    [(VUIMonogramDescription *)self upscaleAdjustment];
    double v49 = v48;
    [v7 upscaleAdjustment];
    if (v49 != v50
      || ([(VUIMonogramDescription *)self cornerRadius],
          double v52 = v51,
          [v7 cornerRadius],
          v52 != v53))
    {
      char v10 = 0;
      v46 = (void *)v45;
      v57 = (void *)v91;
      goto LABEL_61;
    }
    uint64_t v54 = [(VUIMonogramDescription *)self fillColor];
    uint64_t v84 = [v7 fillColor];
    v85 = (void *)v45;
    v86 = (void *)v54;
    if (v54 != v84)
    {
      v55 = [(VUIMonogramDescription *)self fillColor];
      v80 = [v7 fillColor];
      v81 = v55;
      if (!objc_msgSend(v55, "isEqual:"))
      {
        char v10 = 0;
        v56 = (void *)v84;
        goto LABEL_59;
      }
    }
    uint64_t v58 = [(VUIMonogramDescription *)self gradientStartColor];
    uint64_t v82 = [v7 gradientStartColor];
    v83 = (void *)v58;
    if (v58 != v82)
    {
      v59 = [(VUIMonogramDescription *)self gradientStartColor];
      v78 = [v7 gradientStartColor];
      v79 = v59;
      if (!objc_msgSend(v59, "isEqual:"))
      {
        char v10 = 0;
        v60 = (void *)v82;
        v61 = v83;
LABEL_57:

LABEL_58:
        v56 = (void *)v84;
        if (v86 == (void *)v84)
        {
LABEL_60:

          v57 = (void *)v91;
          v46 = v85;
LABEL_61:
          if (v46 == v57) {
            goto LABEL_63;
          }
          goto LABEL_62;
        }
LABEL_59:

        goto LABEL_60;
      }
    }
    v62 = [(VUIMonogramDescription *)self gradientEndColor];
    uint64_t v77 = [v7 gradientEndColor];
    if (v62 != (void *)v77)
    {
      v73 = v62;
      v63 = [(VUIMonogramDescription *)self gradientEndColor];
      v75 = [v7 gradientEndColor];
      v76 = v63;
      if (!objc_msgSend(v63, "isEqual:"))
      {
        char v10 = 0;
        v70 = (void *)v77;
        v62 = v73;
        goto LABEL_55;
      }
      v62 = v73;
    }
    int v64 = [(VUIMonogramDescription *)self shouldFallBackToSilhouette];
    if (v64 == [v7 shouldFallBackToSilhouette]
      && ([(VUIMonogramDescription *)self borderWidth],
          double v66 = v65,
          [v7 borderWidth],
          v66 == v67))
    {
      v68 = [(VUIMonogramDescription *)self borderColor];
      v72 = [v7 borderColor];
      v74 = v68;
      if (v68 == v72)
      {

        char v10 = 1;
      }
      else
      {
        v71 = [(VUIMonogramDescription *)self borderColor];
        v69 = [v7 borderColor];
        char v10 = [v71 isEqual:v69];
      }
    }
    else
    {
      char v10 = 0;
    }
    v70 = (void *)v77;
    if (v62 == (void *)v77)
    {
LABEL_56:

      v60 = (void *)v82;
      v61 = v83;
      if (v83 == (void *)v82) {
        goto LABEL_58;
      }
      goto LABEL_57;
    }
LABEL_55:

    goto LABEL_56;
  }
  char v10 = 0;
LABEL_22:

  return v10;
}

- (CGPoint)specialOffsetForString:(id)a3
{
  id v4 = a3;
  double v5 = *MEMORY[0x1E4F1DAD8];
  double v6 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  id v7 = [(VUIMonogramDescription *)self specialOffsetByFirstLetter];
  if (v7 && [v4 length])
  {
    id v8 = [v4 substringToIndex:1];
    id v9 = [v7 objectForKeyedSubscript:v8];
    [v9 CGPointValue];
    double v5 = v10;
    double v6 = v11;
  }
  double v12 = v5;
  double v13 = v6;
  result.y = v13;
  result.x = v12;
  return result;
}

- (unint64_t)hash
{
  v3 = [(VUIMonogramDescription *)self text];
  if (v3)
  {
    id v4 = [(VUIMonogramDescription *)self text];
    id v5 = (id)[v4 hash];
  }
  else
  {
    id v4 = [(VUIMonogramDescription *)self imageURL];
    if (v4)
    {
      id v7 = [(VUIMonogramDescription *)self imageURL];
      unint64_t v6 = [v7 hash];

      goto LABEL_6;
    }
    v9.receiver = self;
    v9.super_class = (Class)VUIMonogramDescription;
    id v5 = [(VUIMonogramDescription *)&v9 hash];
  }
  unint64_t v6 = (unint64_t)v5;
LABEL_6:

  return v6;
}

- (unint64_t)preferedMonogramType
{
  v3 = [(VUIMonogramDescription *)self imageURL];
  if (v3)
  {

    goto LABEL_4;
  }
  if ([(VUIMonogramDescription *)self isUsingLibraryImageLoader])
  {
LABEL_4:
    id v4 = [(VUIMonogramDescription *)self imageURL];
    char v5 = objc_msgSend(v4, "vuicore_isResourceOrSymbolURL");

    if (v5) {
      return 3;
    }
    id v7 = [(VUIMonogramDescription *)self imageURL];
    BOOL v8 = +[_VUIMonogramAppleAccountImageGenerator isAppleAccountsURL:v7];

    if (v8) {
      return 4;
    }
    else {
      return 5;
    }
  }
  objc_super v9 = [(VUIMonogramDescription *)self text];
  uint64_t v10 = [v9 length];

  if (v10) {
    return 2;
  }
  else {
    return [(VUIMonogramDescription *)self shouldFallBackToSilhouette];
  }
}

- (NSString)text
{
  return self->_text;
}

- (NSURL)imageURL
{
  return self->_imageURL;
}

- (UIFont)font
{
  return self->_font;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (CGSize)defaultImageSize
{
  double width = self->_defaultImageSize.width;
  double height = self->_defaultImageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setDefaultImageSize:(CGSize)a3
{
  self->_defaultImageSize = a3;
}

- (NSDictionary)specialOffsetByFirstLetter
{
  return self->_specialOffsetByFirstLetter;
}

- (void)setSpecialOffsetByFirstLetter:(id)a3
{
}

- (UIEdgeInsets)padding
{
  double top = self->_padding.top;
  double left = self->_padding.left;
  double bottom = self->_padding.bottom;
  double right = self->_padding.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setPadding:(UIEdgeInsets)a3
{
  self->_padding = a3;
}

- (int64_t)scaleMode
{
  return self->_scaleMode;
}

- (void)setScaleMode:(int64_t)a3
{
  self->_scaleMode = a3;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (void)setTextColor:(id)a3
{
}

- (double)upscaleAdjustment
{
  return self->_upscaleAdjustment;
}

- (void)setUpscaleAdjustment:(double)a3
{
  self->_upscaleAdjustment = a3;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (UIColor)fillColor
{
  return self->_fillColor;
}

- (void)setFillColor:(id)a3
{
}

- (UIColor)gradientStartColor
{
  return self->_gradientStartColor;
}

- (void)setGradientStartColor:(id)a3
{
}

- (UIColor)gradientEndColor
{
  return self->_gradientEndColor;
}

- (void)setGradientEndColor:(id)a3
{
}

- (BOOL)shouldFallBackToSilhouette
{
  return self->_shouldFallBackToSilhouette;
}

- (void)setShouldFallBackToSilhouette:(BOOL)a3
{
  self->_shouldFallBackToSilhouette = a3;
}

- (BOOL)isUsingLibraryImageLoader
{
  return self->_isUsingLibraryImageLoader;
}

- (void)setIsUsingLibraryImageLoader:(BOOL)a3
{
  self->_isUsingLibraryImageLoader = a3;
}

- (double)borderWidth
{
  return self->_borderWidth;
}

- (void)setBorderWidth:(double)a3
{
  self->_borderWidth = a3;
}

- (UIColor)borderColor
{
  return self->_borderColor;
}

- (void)setBorderColor:(id)a3
{
}

- (VUINetworkRequestLoader)requestLoader
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_requestLoader);
  return (VUINetworkRequestLoader *)WeakRetained;
}

- (void)setRequestLoader:(id)a3
{
}

- (UIImage)placeholderImage
{
  return self->_placeholderImage;
}

- (void)setPlaceholderImage:(id)a3
{
}

- (BOOL)optimizedImageRendering
{
  return self->_optimizedImageRendering;
}

- (void)setOptimizedImageRendering:(BOOL)a3
{
  self->_optimizedImageRendering = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeholderImage, 0);
  objc_destroyWeak((id *)&self->_requestLoader);
  objc_storeStrong((id *)&self->_borderColor, 0);
  objc_storeStrong((id *)&self->_gradientEndColor, 0);
  objc_storeStrong((id *)&self->_gradientStartColor, 0);
  objc_storeStrong((id *)&self->_fillColor, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_specialOffsetByFirstLetter, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_imageURL, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end