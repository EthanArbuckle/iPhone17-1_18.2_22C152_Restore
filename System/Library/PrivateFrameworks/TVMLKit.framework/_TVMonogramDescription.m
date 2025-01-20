@interface _TVMonogramDescription
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldFallBackToSilhouette;
- (CGSize)size;
- (IKNetworkRequestLoader)requestLoader;
- (NSString)firstName;
- (NSString)lastName;
- (NSString)text;
- (NSURL)imageURL;
- (UIColor)backgroundColor;
- (UIColor)borderColor;
- (UIColor)fillColor;
- (UIColor)textColor;
- (UIEdgeInsets)padding;
- (UIFont)font;
- (_TVMonogramDescription)init;
- (_TVMonogramDescription)initWithFirstName:(id)a3 lastName:(id)a4 imageURL:(id)a5 font:(id)a6;
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
- (void)setFillColor:(id)a3;
- (void)setPadding:(UIEdgeInsets)a3;
- (void)setRequestLoader:(id)a3;
- (void)setScaleMode:(int64_t)a3;
- (void)setShouldFallBackToSilhouette:(BOOL)a3;
- (void)setSize:(CGSize)a3;
- (void)setText:(id)a3;
- (void)setTextColor:(id)a3;
- (void)setUpscaleAdjustment:(double)a3;
@end

@implementation _TVMonogramDescription

- (_TVMonogramDescription)initWithFirstName:(id)a3 lastName:(id)a4 imageURL:(id)a5 font:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v26.receiver = self;
  v26.super_class = (Class)_TVMonogramDescription;
  v14 = [(_TVMonogramDescription *)&v26 init];
  v15 = v14;
  if (v14)
  {
    v14->_shouldFallBackToSilhouette = 1;
    uint64_t v16 = [v10 copy];
    firstName = v15->_firstName;
    v15->_firstName = (NSString *)v16;

    uint64_t v18 = [v11 copy];
    lastName = v15->_lastName;
    v15->_lastName = (NSString *)v18;

    uint64_t v20 = [v12 copy];
    imageURL = v15->_imageURL;
    v15->_imageURL = (NSURL *)v20;

    p_font = (void **)&v15->_font;
    objc_storeStrong((id *)&v15->_font, a6);
    if (!v15->_font)
    {
      uint64_t v23 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D300]];
      v24 = *p_font;
      *p_font = (void *)v23;
    }
    v15->_scaleMode = 3;
  }

  return v15;
}

- (_TVMonogramDescription)init
{
  return [(_TVMonogramDescription *)self initWithFirstName:0 lastName:0 imageURL:0 font:0];
}

- (id)copyWithType:(unint64_t)a3
{
  if ([(_TVMonogramDescription *)self preferedMonogramType] <= a3) {
    return 0;
  }
  uint64_t v5 = [(_TVMonogramDescription *)self copy];
  v6 = (void *)v5;
  if (a3 <= 2)
  {
    v7 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = 0;

    if (a3 != 2)
    {
      v8 = (void *)v6[2];
      v6[2] = 0;

      v9 = (void *)v6[3];
      v6[3] = 0;

      [v6 setText:0];
      if (!a3) {
        [v6 setShouldFallBackToSilhouette:0];
      }
    }
  }
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[_TVMonogramDescription allocWithZone:a3];
  uint64_t v5 = [(_TVMonogramDescription *)self firstName];
  v6 = [(_TVMonogramDescription *)self lastName];
  v7 = [(_TVMonogramDescription *)self imageURL];
  v8 = [(_TVMonogramDescription *)self font];
  v9 = [(_TVMonogramDescription *)v4 initWithFirstName:v5 lastName:v6 imageURL:v7 font:v8];

  id v10 = [(_TVMonogramDescription *)self text];
  [(_TVMonogramDescription *)v9 setText:v10];

  [(_TVMonogramDescription *)self size];
  -[_TVMonogramDescription setSize:](v9, "setSize:");
  [(_TVMonogramDescription *)self padding];
  -[_TVMonogramDescription setPadding:](v9, "setPadding:");
  [(_TVMonogramDescription *)v9 setScaleMode:[(_TVMonogramDescription *)self scaleMode]];
  id v11 = [(_TVMonogramDescription *)self backgroundColor];
  [(_TVMonogramDescription *)v9 setBackgroundColor:v11];

  id v12 = [(_TVMonogramDescription *)self textColor];
  [(_TVMonogramDescription *)v9 setTextColor:v12];

  [(_TVMonogramDescription *)self upscaleAdjustment];
  -[_TVMonogramDescription setUpscaleAdjustment:](v9, "setUpscaleAdjustment:");
  [(_TVMonogramDescription *)self cornerRadius];
  -[_TVMonogramDescription setCornerRadius:](v9, "setCornerRadius:");
  id v13 = [(_TVMonogramDescription *)self fillColor];
  [(_TVMonogramDescription *)v9 setFillColor:v13];

  [(_TVMonogramDescription *)v9 setShouldFallBackToSilhouette:[(_TVMonogramDescription *)self shouldFallBackToSilhouette]];
  [(_TVMonogramDescription *)self borderWidth];
  -[_TVMonogramDescription setBorderWidth:](v9, "setBorderWidth:");
  v14 = [(_TVMonogramDescription *)self borderColor];
  [(_TVMonogramDescription *)v9 setBorderColor:v14];

  v15 = [(_TVMonogramDescription *)self requestLoader];
  [(_TVMonogramDescription *)v9 setRequestLoader:v15];

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(_TVMonogramDescription *)self firstName];
    v7 = [v5 firstName];
    if (v6 != v7)
    {
      v8 = [(_TVMonogramDescription *)self firstName];
      v9 = [v5 firstName];
      if (![v8 isEqual:v9])
      {
        char v10 = 0;
        goto LABEL_37;
      }
      v88 = v9;
      v89 = v8;
    }
    id v11 = [(_TVMonogramDescription *)self lastName];
    id v12 = [v5 lastName];
    if (v11 != v12)
    {
      id v13 = [(_TVMonogramDescription *)self lastName];
      v14 = [v5 lastName];
      if (![v13 isEqual:v14])
      {
        char v10 = 0;
LABEL_35:

LABEL_36:
        v9 = v88;
        v8 = v89;
        if (v6 == v7)
        {
LABEL_38:

          goto LABEL_39;
        }
LABEL_37:

        goto LABEL_38;
      }
      v86 = v14;
      v87 = v13;
    }
    v15 = [(_TVMonogramDescription *)self text];
    uint64_t v16 = [v5 text];
    if (v15 != v16)
    {
      v17 = [(_TVMonogramDescription *)self text];
      v81 = [v5 text];
      v82 = v17;
      if (!objc_msgSend(v17, "isEqual:"))
      {
        char v10 = 0;
LABEL_33:

LABEL_34:
        v14 = v86;
        id v13 = v87;
        if (v11 == v12) {
          goto LABEL_36;
        }
        goto LABEL_35;
      }
    }
    uint64_t v18 = [(_TVMonogramDescription *)self imageURL];
    v83 = [v5 imageURL];
    v84 = v12;
    v85 = v16;
    if (v18 != v83)
    {
      v76 = v7;
      v19 = v6;
      uint64_t v20 = v18;
      v21 = [(_TVMonogramDescription *)self imageURL];
      v79 = [v5 imageURL];
      v80 = v21;
      if (!objc_msgSend(v21, "isEqual:"))
      {
        v40 = v15;
        char v10 = 0;
        uint64_t v18 = v20;
        v44 = v83;
        v6 = v19;
        v7 = v76;
        goto LABEL_31;
      }
      uint64_t v18 = v20;
      v6 = v19;
      v7 = v76;
    }
    [(_TVMonogramDescription *)self size];
    double v23 = v22;
    double v25 = v24;
    [v5 size];
    if (v23 != v27
      || v25 != v26
      || ([(_TVMonogramDescription *)self padding],
          double v29 = v28,
          double v31 = v30,
          double v33 = v32,
          double v35 = v34,
          [v5 padding],
          v31 != v39)
      || v29 != v36
      || v35 != v38
      || v33 != v37
      || (int64_t v77 = -[_TVMonogramDescription scaleMode](self, "scaleMode"), v77 != [v5 scaleMode]))
    {
      v40 = v15;
      char v10 = 0;
      char v43 = 0;
      goto LABEL_28;
    }
    uint64_t v78 = [(_TVMonogramDescription *)self backgroundColor];
    uint64_t v73 = [v5 backgroundColor];
    v74 = v18;
    if (v78 != v73)
    {
      v72 = [(_TVMonogramDescription *)self backgroundColor];
      v69 = [v5 backgroundColor];
      if (!objc_msgSend(v72, "isEqual:"))
      {
        v40 = v15;
        char v10 = 0;
        v41 = (void *)v78;
        v42 = (void *)v73;
        goto LABEL_62;
      }
    }
    v75 = [(_TVMonogramDescription *)self textColor];
    uint64_t v71 = [v5 textColor];
    if (v75 != (void *)v71)
    {
      v70 = [(_TVMonogramDescription *)self textColor];
      v68 = [v5 textColor];
      if (!objc_msgSend(v70, "isEqual:"))
      {
        char v10 = 0;
        v46 = (void *)v71;
        goto LABEL_59;
      }
    }
    [(_TVMonogramDescription *)self upscaleAdjustment];
    double v48 = v47;
    [v5 upscaleAdjustment];
    if (v48 != v49
      || ([(_TVMonogramDescription *)self cornerRadius],
          double v51 = v50,
          [v5 cornerRadius],
          v51 != v52))
    {
      char v10 = 0;
      goto LABEL_58;
    }
    v67 = [(_TVMonogramDescription *)self fillColor];
    v66 = [v5 fillColor];
    if (v67 == v66
      || ([(_TVMonogramDescription *)self fillColor],
          v65 = objc_claimAutoreleasedReturnValue(),
          [v5 fillColor],
          v62 = objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v65, "isEqual:")))
    {
      int v63 = [(_TVMonogramDescription *)self shouldFallBackToSilhouette];
      if (v63 == [v5 shouldFallBackToSilhouette]
        && ([(_TVMonogramDescription *)self borderWidth],
            double v55 = v54,
            [v5 borderWidth],
            v55 == v56))
      {
        v64 = [(_TVMonogramDescription *)self borderColor];
        uint64_t v57 = [v5 borderColor];
        if (v64 == (void *)v57)
        {

          char v10 = 1;
        }
        else
        {
          v61 = (void *)v57;
          v60 = [(_TVMonogramDescription *)self borderColor];
          v59 = [v5 borderColor];
          char v10 = [v60 isEqual:v59];
        }
      }
      else
      {
        char v10 = 0;
      }
      v53 = v66;
      if (v67 == v66)
      {

        goto LABEL_57;
      }
    }
    else
    {
      char v10 = 0;
      v53 = v66;
    }
    v58 = v53;

LABEL_57:
LABEL_58:
    v46 = (void *)v71;
    if (v75 == (void *)v71)
    {
      v40 = v15;
LABEL_61:

      v41 = (void *)v78;
      v42 = (void *)v73;
      if (v78 == v73)
      {
LABEL_63:

        char v43 = v10;
        uint64_t v18 = v74;
LABEL_28:
        v44 = v83;
        if (v18 == v83)
        {

          char v10 = v43;
          goto LABEL_32;
        }
LABEL_31:

LABEL_32:
        v15 = v40;
        id v12 = v84;
        uint64_t v16 = v85;
        if (v15 == v85) {
          goto LABEL_34;
        }
        goto LABEL_33;
      }
LABEL_62:

      goto LABEL_63;
    }
LABEL_59:
    v40 = v15;

    goto LABEL_61;
  }
  char v10 = 0;
LABEL_39:

  return v10;
}

- (unint64_t)hash
{
  v3 = [(_TVMonogramDescription *)self lastName];
  if (!v3)
  {
    id v4 = [(_TVMonogramDescription *)self firstName];
    if (v4)
    {
      v6 = [(_TVMonogramDescription *)self firstName];
      unint64_t v5 = [v6 hash];
LABEL_11:

      goto LABEL_12;
    }
    v6 = [(_TVMonogramDescription *)self text];
    if (v6)
    {
      v7 = [(_TVMonogramDescription *)self text];
      id v8 = (id)[v7 hash];
    }
    else
    {
      v7 = [(_TVMonogramDescription *)self imageURL];
      if (v7)
      {
        v9 = [(_TVMonogramDescription *)self imageURL];
        unint64_t v5 = [v9 hash];

        goto LABEL_10;
      }
      v11.receiver = self;
      v11.super_class = (Class)_TVMonogramDescription;
      id v8 = [(_TVMonogramDescription *)&v11 hash];
    }
    unint64_t v5 = (unint64_t)v8;
LABEL_10:

    goto LABEL_11;
  }
  id v4 = [(_TVMonogramDescription *)self lastName];
  unint64_t v5 = [v4 hash];
LABEL_12:

  return v5;
}

- (unint64_t)preferedMonogramType
{
  v3 = [(_TVMonogramDescription *)self imageURL];

  if (!v3)
  {
    v7 = [(_TVMonogramDescription *)self firstName];
    if (![v7 length])
    {
      id v8 = [(_TVMonogramDescription *)self lastName];
      if (![v8 length])
      {
        objc_super v11 = [(_TVMonogramDescription *)self text];
        uint64_t v12 = [v11 length];

        if (!v12) {
          return [(_TVMonogramDescription *)self shouldFallBackToSilhouette];
        }
        return 2;
      }
    }
    return 2;
  }
  id v4 = [(_TVMonogramDescription *)self imageURL];
  BOOL v5 = +[_TVMonogramResourceImageGenerator isResourceURL:v4];

  if (v5) {
    return 3;
  }
  v9 = [(_TVMonogramDescription *)self imageURL];
  BOOL v10 = +[_TVMonogramAppleAccountImageGenerator isAppleAccountsURL:v9];

  if (v10) {
    return 4;
  }
  else {
    return 5;
  }
}

- (NSString)firstName
{
  return self->_firstName;
}

- (NSString)lastName
{
  return self->_lastName;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
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

- (BOOL)shouldFallBackToSilhouette
{
  return self->_shouldFallBackToSilhouette;
}

- (void)setShouldFallBackToSilhouette:(BOOL)a3
{
  self->_shouldFallBackToSilhouette = a3;
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

- (IKNetworkRequestLoader)requestLoader
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_requestLoader);
  return (IKNetworkRequestLoader *)WeakRetained;
}

- (void)setRequestLoader:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_requestLoader);
  objc_storeStrong((id *)&self->_borderColor, 0);
  objc_storeStrong((id *)&self->_fillColor, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_imageURL, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
}

@end