@interface SFImage
+ (BOOL)supportsSecureCoding;
+ (id)imageWithData:(id)a3;
- (BOOL)hasCornerRadius;
- (BOOL)hasCornerRoundingStyle;
- (BOOL)hasIsTemplate;
- (BOOL)hasScale;
- (BOOL)hasShouldCropToCircle;
- (BOOL)hasSize;
- (BOOL)hasSource;
- (BOOL)isEqual:(id)a3;
- (BOOL)isTemplate;
- (BOOL)shouldCropToCircle;
- (CGSize)size;
- (NSData)imageData;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSString)accessibilityLabel;
- (NSString)contentType;
- (NSString)identifier;
- (NSString)keyColor;
- (SFImage)badgingImage;
- (SFImage)initWithCoder:(id)a3;
- (SFImage)initWithProtobuf:(id)a3;
- (double)cornerRadius;
- (double)scale;
- (id)copyWithZone:(_NSZone *)a3;
- (int)cornerRoundingStyle;
- (int)source;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)loadImageDataWithCompletionAndErrorHandler:(id)a3;
- (void)loadImageDataWithCompletionHandler:(id)a3;
- (void)loadImageDataWithContext:(id)a3 completionHandler:(id)a4;
- (void)setAccessibilityLabel:(id)a3;
- (void)setBadgingImage:(id)a3;
- (void)setContentType:(id)a3;
- (void)setCornerRadius:(double)a3;
- (void)setCornerRoundingStyle:(int)a3;
- (void)setIdentifier:(id)a3;
- (void)setImageData:(id)a3;
- (void)setIsTemplate:(BOOL)a3;
- (void)setKeyColor:(id)a3;
- (void)setScale:(double)a3;
- (void)setShouldCropToCircle:(BOOL)a3;
- (void)setSize:(CGSize)a3;
- (void)setSource:(int)a3;
@end

@implementation SFImage

- (SFImage)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4)
  {
    v9 = 0;
    goto LABEL_58;
  }
  v6 = [v4 urlImage];

  if (v6)
  {
    v7 = [SFURLImage alloc];
    uint64_t v8 = [v5 urlImage];
  }
  else
  {
    v10 = [v5 contactImage];

    if (v10)
    {
      v7 = [SFContactImage alloc];
      uint64_t v8 = [v5 contactImage];
    }
    else
    {
      v11 = [v5 monogramImage];

      if (v11)
      {
        v7 = [SFMonogramImage alloc];
        uint64_t v8 = [v5 monogramImage];
      }
      else
      {
        v12 = [v5 localImage];

        if (v12)
        {
          v7 = [SFLocalImage alloc];
          uint64_t v8 = [v5 localImage];
        }
        else
        {
          v13 = [v5 appIconImage];

          if (v13)
          {
            v7 = [SFAppIconImage alloc];
            uint64_t v8 = [v5 appIconImage];
          }
          else
          {
            v14 = [v5 mediaArtworkImage];

            if (v14)
            {
              v7 = [SFMediaArtworkImage alloc];
              uint64_t v8 = [v5 mediaArtworkImage];
            }
            else
            {
              v15 = [v5 calendarImage];

              if (v15)
              {
                v7 = [SFCalendarImage alloc];
                uint64_t v8 = [v5 calendarImage];
              }
              else
              {
                v16 = [v5 symbolImage];

                if (v16)
                {
                  v7 = [SFSymbolImage alloc];
                  uint64_t v8 = [v5 symbolImage];
                }
                else
                {
                  v17 = [v5 photosLibraryImage];

                  if (v17)
                  {
                    v7 = [SFPhotosLibraryImage alloc];
                    uint64_t v8 = [v5 photosLibraryImage];
                  }
                  else
                  {
                    v18 = [v5 quickLookThumbnailImage];

                    if (v18)
                    {
                      v7 = [SFQuickLookThumbnailImage alloc];
                      uint64_t v8 = [v5 quickLookThumbnailImage];
                    }
                    else
                    {
                      v19 = [v5 clockImage];

                      if (v19)
                      {
                        v7 = [SFClockImage alloc];
                        uint64_t v8 = [v5 clockImage];
                      }
                      else
                      {
                        v20 = [v5 shortcutsImage];

                        if (v20)
                        {
                          v7 = [SFShortcutsImage alloc];
                          uint64_t v8 = [v5 shortcutsImage];
                        }
                        else
                        {
                          v21 = [v5 defaultPunchoutAppIconImage];

                          if (!v21)
                          {
                            v9 = objc_alloc_init(SFImage);

                            if (!v9)
                            {
                              self = 0;
                              goto LABEL_58;
                            }
                            goto LABEL_30;
                          }
                          v7 = [SFDefaultPunchoutAppIconImage alloc];
                          uint64_t v8 = [v5 defaultPunchoutAppIconImage];
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  v22 = (void *)v8;
  v9 = [(SFURLImage *)v7 initWithProtobuf:v8];

LABEL_30:
  uint64_t v23 = [v5 imageData];
  if (v23)
  {
    v24 = (void *)v23;
    v25 = [v5 urlImage];

    if (!v25)
    {
      v26 = [v5 imageData];
      [(SFImage *)v9 setImageData:v26];
    }
  }
  if ([v5 isTemplate]) {
    -[SFImage setIsTemplate:](v9, "setIsTemplate:", [v5 isTemplate]);
  }
  if ([v5 shouldCropToCircle]) {
    -[SFImage setShouldCropToCircle:](v9, "setShouldCropToCircle:", [v5 shouldCropToCircle]);
  }
  v27 = [v5 cornerRadius];

  if (v27)
  {
    v28 = [v5 cornerRadius];
    [v28 doubleValue];
    -[SFImage setCornerRadius:](v9, "setCornerRadius:");
  }
  v29 = [v5 scale];

  if (v29)
  {
    v30 = [v5 scale];
    [v30 doubleValue];
    -[SFImage setScale:](v9, "setScale:");
  }
  v31 = [v5 size];

  if (v31)
  {
    v32 = [v5 size];
    [(SFImage *)v9 setSize:_SFPBPointSizeHandwrittenTranslator(v32)];
  }
  v33 = [v5 contentType];

  if (v33)
  {
    v34 = [v5 contentType];
    [(SFImage *)v9 setContentType:v34];
  }
  v35 = [v5 keyColor];

  if (v35)
  {
    v36 = [v5 keyColor];
    [(SFImage *)v9 setKeyColor:v36];
  }
  v37 = [v5 identifier];

  if (v37)
  {
    v38 = [v5 identifier];
    [(SFImage *)v9 setIdentifier:v38];
  }
  if ([v5 source]) {
    -[SFImage setSource:](v9, "setSource:", [v5 source]);
  }
  if ([v5 cornerRoundingStyle]) {
    -[SFImage setCornerRoundingStyle:](v9, "setCornerRoundingStyle:", [v5 cornerRoundingStyle]);
  }
  v39 = [v5 accessibilityLabel];

  if (v39)
  {
    v40 = [v5 accessibilityLabel];
    [(SFImage *)v9 setAccessibilityLabel:v40];
  }
  v41 = [v5 badgingImage];

  if (v41)
  {
    v42 = [SFImage alloc];
    v43 = [v5 badgingImage];
    v44 = [(SFImage *)v42 initWithProtobuf:v43];
    [(SFImage *)v9 setBadgingImage:v44];
  }
  self = v9;
  v9 = self;
LABEL_58:

  return v9;
}

- (void)loadImageDataWithContext:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __67__SFImage_Handwritten__loadImageDataWithContext_completionHandler___block_invoke;
  v8[3] = &unk_1E5A2E718;
  id v9 = v6;
  id v7 = v6;
  SFResourceLoaderLoadImageWithContext(self, a3, v8);
}

void __67__SFImage_Handwritten__loadImageDataWithContext_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  id v6 = [a2 imageData];
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);
}

- (void)loadImageDataWithCompletionAndErrorHandler:(id)a3
{
}

- (void)loadImageDataWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59__SFImage_Handwritten__loadImageDataWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E5A2E6F0;
  id v7 = v4;
  id v5 = v4;
  [(SFImage *)self loadImageDataWithCompletionAndErrorHandler:v6];
}

uint64_t __59__SFImage_Handwritten__loadImageDataWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)imageWithData:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(SFImage);
  [(SFImage *)v4 setImageData:v3];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_badgingImage, 0);
  objc_storeStrong((id *)&self->_accessibilityLabel, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_keyColor, 0);
  objc_storeStrong((id *)&self->_contentType, 0);
  objc_storeStrong((id *)&self->_imageData, 0);
}

- (void)setBadgingImage:(id)a3
{
}

- (SFImage)badgingImage
{
  return self->_badgingImage;
}

- (void)setAccessibilityLabel:(id)a3
{
}

- (NSString)accessibilityLabel
{
  return self->_accessibilityLabel;
}

- (int)cornerRoundingStyle
{
  return self->_cornerRoundingStyle;
}

- (int)source
{
  return self->_source;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setKeyColor:(id)a3
{
}

- (NSString)keyColor
{
  return self->_keyColor;
}

- (void)setContentType:(id)a3
{
}

- (NSString)contentType
{
  return self->_contentType;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)scale
{
  return self->_scale;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (BOOL)shouldCropToCircle
{
  return self->_shouldCropToCircle;
}

- (BOOL)isTemplate
{
  return self->_isTemplate;
}

- (void)setImageData:(id)a3
{
}

- (NSData)imageData
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (unint64_t)hash
{
  BOOL v3 = [(SFImage *)self isTemplate];
  uint64_t v38 = v3 ^ [(SFImage *)self shouldCropToCircle];
  [(SFImage *)self cornerRadius];
  float64_t v39 = v4;
  [(SFImage *)self scale];
  float64_t v35 = v5;
  [(SFImage *)self size];
  float64_t v33 = v6;
  [(SFImage *)self size];
  v7.f64[0] = v39;
  v8.f64[0] = v33;
  v7.f64[1] = v35;
  v8.f64[1] = v9;
  float64x2_t v10 = (float64x2_t)vbslq_s8((int8x16_t)vcltzq_f64(v7), (int8x16_t)vnegq_f64(v7), (int8x16_t)v7);
  float64x2_t v11 = (float64x2_t)vbslq_s8((int8x16_t)vcltzq_f64(v8), (int8x16_t)vnegq_f64(v8), (int8x16_t)v8);
  float64x2_t v40 = vrndaq_f64(v10);
  float64x2_t __x = vrndaq_f64(v11);
  float64x2_t v34 = vsubq_f64(v11, __x);
  float64x2_t v36 = vsubq_f64(v10, v40);
  long double v29 = fmod(__x.f64[1], 1.84467441e19);
  v12.f64[0] = fmod(__x.f64[0], 1.84467441e19);
  v12.f64[1] = v29;
  float64x2_t __xa = v12;
  long double v30 = fmod(v40.f64[1], 1.84467441e19);
  v13.f64[0] = fmod(v40.f64[0], 1.84467441e19);
  v13.f64[1] = v30;
  float64x2_t v14 = (float64x2_t)vdupq_n_s64(0x41E3C6EF36200000uLL);
  int8x16_t v41 = (int8x16_t)vaddq_s64((int64x2_t)vcvtq_u64_f64(vmulq_f64(v13, v14)), (int64x2_t)vcvtq_n_u64_f64(v36, 0x40uLL));
  int8x16_t v37 = (int8x16_t)vaddq_s64((int64x2_t)vcvtq_u64_f64(vmulq_f64(__xa, v14)), (int64x2_t)vcvtq_n_u64_f64(v34, 0x40uLL));
  v15 = [(SFImage *)self contentType];
  *(void *)&v34.f64[0] = [v15 hash];
  v16 = [(SFImage *)self keyColor];
  uint64_t v17 = [v16 hash];
  v18 = [(SFImage *)self identifier];
  uint64_t v19 = [v18 hash];
  uint64_t v20 = [(SFImage *)self source];
  uint64_t v21 = [(SFImage *)self cornerRoundingStyle];
  v22 = [(SFImage *)self accessibilityLabel];
  uint64_t v23 = [v22 hash];
  v24 = [(SFImage *)self badgingImage];
  uint64_t v25 = [v24 hash];
  int8x16_t v26 = veorq_s8(v41, v37);
  unint64_t v27 = *(void *)&veor_s8(*(int8x8_t *)v26.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v26, v26, 8uLL)) ^ v25 ^ v23 ^ v21 ^ v19 ^ v20 ^ v17 ^ *(void *)&v34.f64[0] ^ v38;

  return v27;
}

- (BOOL)isEqual:(id)a3
{
  float64x2_t v7 = (SFImage *)a3;
  if (self == v7)
  {
    char v11 = 1;
  }
  else
  {
    if ([(SFImage *)v7 isMemberOfClass:objc_opt_class()])
    {
      float64x2_t v8 = v7;
      float64_t v9 = [(SFImage *)self imageData];
      if (v9)
      {
        BOOL v3 = [(SFImage *)v8 imageData];
        if (v3)
        {
          double v4 = [(SFImage *)self imageData];
          double v5 = [(SFImage *)v8 imageData];
          if (([v4 isEqual:v5] & 1) == 0)
          {

            char v11 = 0;
            goto LABEL_31;
          }
          int v10 = 1;
        }
        else
        {
          int v10 = 0;
        }
      }
      else
      {
        int v10 = 0;
      }
      BOOL v12 = [(SFImage *)self isTemplate];
      if (v12 == [(SFImage *)v8 isTemplate])
      {
        BOOL v13 = [(SFImage *)self shouldCropToCircle];
        if (v13 == [(SFImage *)v8 shouldCropToCircle])
        {
          [(SFImage *)self cornerRadius];
          double v15 = v14;
          [(SFImage *)v8 cornerRadius];
          if (vabdd_f64(v15, v16) < 2.22044605e-16)
          {
            [(SFImage *)self scale];
            double v18 = v17;
            [(SFImage *)v8 scale];
            if (vabdd_f64(v18, v19) < 2.22044605e-16)
            {
              [(SFImage *)self size];
              double v21 = v20;
              double v23 = v22;
              [(SFImage *)v8 size];
              if (v21 == v25 && v23 == v24)
              {
                int8x16_t v26 = [(SFImage *)self contentType];
                unint64_t v27 = [(SFImage *)v8 contentType];
                if ((v26 == 0) == (v27 != 0)) {
                  goto LABEL_45;
                }
                v73 = v27;
                v74 = [(SFImage *)self contentType];
                if (!v74)
                {
                  v72 = v26;
                  goto LABEL_23;
                }
                uint64_t v28 = [(SFImage *)self contentType];
                uint64_t v29 = [(SFImage *)v8 contentType];
                v71 = (void *)v28;
                long double v30 = (void *)v28;
                v31 = (void *)v29;
                if ([v30 isEqual:v29])
                {
                  v70 = v31;
                  v72 = v26;
LABEL_23:
                  v32 = [(SFImage *)self keyColor];
                  float64_t v33 = [(SFImage *)v8 keyColor];
                  float64x2_t v34 = v74;
                  if ((v32 == 0) != (v33 != 0))
                  {
                    v68 = v33;
                    v69 = v32;
                    float64_t v35 = [(SFImage *)self keyColor];
                    if (v35)
                    {
                      uint64_t v36 = [(SFImage *)self keyColor];
                      uint64_t v37 = [(SFImage *)v8 keyColor];
                      v66 = (void *)v36;
                      uint64_t v38 = (void *)v36;
                      float64_t v39 = (void *)v37;
                      if (![v38 isEqual:v37])
                      {
                        char v11 = 0;
LABEL_69:

LABEL_70:
                        if (v74)
                        {
                        }
                        if ((v10 & 1) == 0)
                        {
LABEL_30:
                          if (!v9)
                          {
LABEL_32:

                            goto LABEL_33;
                          }
LABEL_31:

                          goto LABEL_32;
                        }
LABEL_29:

                        goto LABEL_30;
                      }
                      v65 = v39;
                      v67 = v35;
                    }
                    else
                    {
                      v67 = 0;
                    }
                    int8x16_t v41 = [(SFImage *)self identifier];
                    v42 = [(SFImage *)v8 identifier];
                    if ((v41 == 0) != (v42 != 0))
                    {
                      v64 = v42;
                      uint64_t v63 = [(SFImage *)self identifier];
                      if (v63)
                      {
                        v43 = [(SFImage *)self identifier];
                        v58 = [(SFImage *)v8 identifier];
                        v59 = v43;
                        int v44 = objc_msgSend(v43, "isEqual:");
                        v45 = v41;
                        if (!v44)
                        {
                          char v11 = 0;
                          v46 = (void *)v63;
LABEL_67:

LABEL_68:
                          float64_t v35 = v67;
                          float64_t v39 = v65;
                          if (!v67) {
                            goto LABEL_70;
                          }
                          goto LABEL_69;
                        }
                      }
                      else
                      {
                        v45 = v41;
                      }
                      int v60 = [(SFImage *)self source];
                      if (v60 != [(SFImage *)v8 source]
                        || (int v61 = [(SFImage *)self cornerRoundingStyle],
                            v61 != [(SFImage *)v8 cornerRoundingStyle]))
                      {
                        char v11 = 0;
                        goto LABEL_66;
                      }
                      v62 = [(SFImage *)self accessibilityLabel];
                      v57 = [(SFImage *)v8 accessibilityLabel];
                      if ((v62 == 0) == (v57 != 0))
                      {

                        char v11 = 0;
LABEL_65:
                        v45 = v41;
LABEL_66:
                        v46 = (void *)v63;
                        if (!v63) {
                          goto LABEL_68;
                        }
                        goto LABEL_67;
                      }
                      v56 = [(SFImage *)self accessibilityLabel];
                      if (!v56
                        || ([(SFImage *)self accessibilityLabel],
                            v47 = objc_claimAutoreleasedReturnValue(),
                            [(SFImage *)v8 accessibilityLabel],
                            v54 = objc_claimAutoreleasedReturnValue(),
                            v55 = v47,
                            objc_msgSend(v47, "isEqual:")))
                      {
                        v53 = [(SFImage *)self badgingImage];
                        v52 = [(SFImage *)v8 badgingImage];
                        if ((v53 == 0) == (v52 != 0))
                        {

                          char v11 = 0;
                        }
                        else
                        {
                          uint64_t v48 = [(SFImage *)self badgingImage];
                          if (v48)
                          {
                            v49 = (void *)v48;
                            v51 = [(SFImage *)self badgingImage];
                            v50 = [(SFImage *)v8 badgingImage];
                            char v11 = [v51 isEqual:v50];
                          }
                          else
                          {

                            char v11 = 1;
                          }
                        }
                        if (!v56) {
                          goto LABEL_64;
                        }
                      }
                      else
                      {
                        char v11 = 0;
                      }

LABEL_64:
                      goto LABEL_65;
                    }

                    float64x2_t v34 = v74;
                    if (v67)
                    {
                    }
                    float64_t v33 = v68;
                    v32 = v69;
                  }

                  if (v34)
                  {
                  }
                  int8x16_t v26 = v72;
                  unint64_t v27 = v73;
LABEL_45:

                  char v11 = 0;
                  if (!v10) {
                    goto LABEL_30;
                  }
                  goto LABEL_29;
                }
              }
            }
          }
        }
      }
      char v11 = 0;
      if ((v10 & 1) == 0) {
        goto LABEL_30;
      }
      goto LABEL_29;
    }
    char v11 = 0;
  }
LABEL_33:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  double v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  double v5 = [(SFImage *)self imageData];
  double v6 = (void *)[v5 copy];
  [v4 setImageData:v6];

  objc_msgSend(v4, "setIsTemplate:", -[SFImage isTemplate](self, "isTemplate"));
  objc_msgSend(v4, "setShouldCropToCircle:", -[SFImage shouldCropToCircle](self, "shouldCropToCircle"));
  [(SFImage *)self cornerRadius];
  objc_msgSend(v4, "setCornerRadius:");
  [(SFImage *)self scale];
  objc_msgSend(v4, "setScale:");
  [(SFImage *)self size];
  objc_msgSend(v4, "setSize:");
  float64x2_t v7 = [(SFImage *)self contentType];
  float64x2_t v8 = (void *)[v7 copy];
  [v4 setContentType:v8];

  float64_t v9 = [(SFImage *)self keyColor];
  int v10 = (void *)[v9 copy];
  [v4 setKeyColor:v10];

  char v11 = [(SFImage *)self identifier];
  BOOL v12 = (void *)[v11 copy];
  [v4 setIdentifier:v12];

  objc_msgSend(v4, "setSource:", -[SFImage source](self, "source"));
  objc_msgSend(v4, "setCornerRoundingStyle:", -[SFImage cornerRoundingStyle](self, "cornerRoundingStyle"));
  BOOL v13 = [(SFImage *)self accessibilityLabel];
  double v14 = (void *)[v13 copy];
  [v4 setAccessibilityLabel:v14];

  double v15 = [(SFImage *)self badgingImage];
  double v16 = (void *)[v15 copy];
  [v4 setBadgingImage:v16];

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBImage alloc] initWithFacade:self];
  BOOL v3 = [(_SFPBImage *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBImage alloc] initWithFacade:self];
  BOOL v3 = [(_SFPBImage *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  double v6 = [[_SFPBImage alloc] initWithFacade:self];
  double v5 = [(_SFPBImage *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (SFImage)initWithCoder:(id)a3
{
  id v4 = a3;
  double v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  double v6 = [[_SFPBImage alloc] initWithData:v5];
  float64x2_t v7 = [(SFImage *)self initWithProtobuf:v6];

  return v7;
}

- (BOOL)hasCornerRoundingStyle
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setCornerRoundingStyle:(int)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_cornerRoundingStyle = a3;
}

- (BOOL)hasSource
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setSource:(int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_source = a3;
}

- (BOOL)hasSize
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setSize:(CGSize)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_size = a3;
}

- (BOOL)hasScale
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setScale:(double)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_scale = a3;
}

- (BOOL)hasCornerRadius
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setCornerRadius:(double)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_cornerRadius = a3;
}

- (BOOL)hasShouldCropToCircle
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setShouldCropToCircle:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_shouldCropToCircle = a3;
}

- (BOOL)hasIsTemplate
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setIsTemplate:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_isTemplate = a3;
}

@end