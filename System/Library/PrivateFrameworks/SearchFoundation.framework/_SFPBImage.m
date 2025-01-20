@interface _SFPBImage
- (BOOL)isEqual:(id)a3;
- (BOOL)isTemplate;
- (BOOL)readFrom:(id)a3;
- (BOOL)shouldCropToCircle;
- (NSData)imageData;
- (NSData)jsonData;
- (NSString)accessibilityLabel;
- (NSString)contentType;
- (NSString)identifier;
- (NSString)keyColor;
- (_SFPBAppIconImage)appIconImage;
- (_SFPBCalendarImage)calendarImage;
- (_SFPBClockImage)clockImage;
- (_SFPBContactImage)contactImage;
- (_SFPBDefaultPunchoutAppIconImage)defaultPunchoutAppIconImage;
- (_SFPBGraphicalFloat)cornerRadius;
- (_SFPBGraphicalFloat)scale;
- (_SFPBImage)badgingImage;
- (_SFPBImage)initWithDictionary:(id)a3;
- (_SFPBImage)initWithFacade:(id)a3;
- (_SFPBImage)initWithJSON:(id)a3;
- (_SFPBLocalImage)localImage;
- (_SFPBMediaArtworkImage)mediaArtworkImage;
- (_SFPBMonogramImage)monogramImage;
- (_SFPBPhotosLibraryImage)photosLibraryImage;
- (_SFPBPointSize)size;
- (_SFPBQuickLookThumbnailImage)quickLookThumbnailImage;
- (_SFPBShortcutsImage)shortcutsImage;
- (_SFPBSymbolImage)symbolImage;
- (_SFPBURLImage)urlImage;
- (id)dictionaryRepresentation;
- (int)cornerRoundingStyle;
- (int)source;
- (int)type;
- (unint64_t)hash;
- (void)setAccessibilityLabel:(id)a3;
- (void)setAppIconImage:(id)a3;
- (void)setBadgingImage:(id)a3;
- (void)setCalendarImage:(id)a3;
- (void)setClockImage:(id)a3;
- (void)setContactImage:(id)a3;
- (void)setContentType:(id)a3;
- (void)setCornerRadius:(id)a3;
- (void)setCornerRoundingStyle:(int)a3;
- (void)setDefaultPunchoutAppIconImage:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setImageData:(id)a3;
- (void)setIsTemplate:(BOOL)a3;
- (void)setKeyColor:(id)a3;
- (void)setLocalImage:(id)a3;
- (void)setMediaArtworkImage:(id)a3;
- (void)setMonogramImage:(id)a3;
- (void)setPhotosLibraryImage:(id)a3;
- (void)setQuickLookThumbnailImage:(id)a3;
- (void)setScale:(id)a3;
- (void)setShortcutsImage:(id)a3;
- (void)setShouldCropToCircle:(BOOL)a3;
- (void)setSize:(id)a3;
- (void)setSource:(int)a3;
- (void)setSymbolImage:(id)a3;
- (void)setType:(int)a3;
- (void)setUrlImage:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBImage

- (_SFPBImage)initWithFacade:(id)a3
{
  id v4 = a3;
  v5 = [(_SFPBImage *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 imageData];
    if (v6)
    {
      v7 = (void *)v6;
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
        v9 = [v4 imageData];
        [(_SFPBImage *)v5 setImageData:v9];
      }
    }
    if ([v4 hasIsTemplate]) {
      -[_SFPBImage setIsTemplate:](v5, "setIsTemplate:", [v4 isTemplate]);
    }
    if ([v4 hasShouldCropToCircle]) {
      -[_SFPBImage setShouldCropToCircle:](v5, "setShouldCropToCircle:", [v4 shouldCropToCircle]);
    }
    if ([v4 hasCornerRadius])
    {
      v10 = [_SFPBGraphicalFloat alloc];
      [v4 cornerRadius];
      v11 = -[_SFPBGraphicalFloat initWithCGFloat:](v10, "initWithCGFloat:");
      [(_SFPBImage *)v5 setCornerRadius:v11];
    }
    if ([v4 hasScale])
    {
      v12 = [_SFPBGraphicalFloat alloc];
      [v4 scale];
      v13 = -[_SFPBGraphicalFloat initWithCGFloat:](v12, "initWithCGFloat:");
      [(_SFPBImage *)v5 setScale:v13];
    }
    if ([v4 hasSize])
    {
      v14 = [_SFPBPointSize alloc];
      [v4 size];
      v15 = -[_SFPBPointSize initWithCGSize:](v14, "initWithCGSize:");
      [(_SFPBImage *)v5 setSize:v15];
    }
    v16 = [v4 contentType];

    if (v16)
    {
      v17 = [v4 contentType];
      [(_SFPBImage *)v5 setContentType:v17];
    }
    v18 = [v4 keyColor];

    if (v18)
    {
      v19 = [v4 keyColor];
      [(_SFPBImage *)v5 setKeyColor:v19];
    }
    v20 = [v4 identifier];

    if (v20)
    {
      v21 = [v4 identifier];
      [(_SFPBImage *)v5 setIdentifier:v21];
    }
    if ([v4 hasSource]) {
      -[_SFPBImage setSource:](v5, "setSource:", [v4 source]);
    }
    if ([v4 hasCornerRoundingStyle]) {
      -[_SFPBImage setCornerRoundingStyle:](v5, "setCornerRoundingStyle:", [v4 cornerRoundingStyle]);
    }
    v22 = [v4 accessibilityLabel];

    if (v22)
    {
      v23 = [v4 accessibilityLabel];
      [(_SFPBImage *)v5 setAccessibilityLabel:v23];
    }
    v24 = [v4 badgingImage];

    if (v24)
    {
      v25 = [_SFPBImage alloc];
      v26 = [v4 badgingImage];
      v27 = [(_SFPBImage *)v25 initWithFacade:v26];
      [(_SFPBImage *)v5 setBadgingImage:v27];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v28 = [[_SFPBURLImage alloc] initWithFacade:v4];
      [(_SFPBImage *)v5 setUrlImage:v28];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v29 = [[_SFPBContactImage alloc] initWithFacade:v4];
      [(_SFPBImage *)v5 setContactImage:v29];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v30 = [[_SFPBMonogramImage alloc] initWithFacade:v4];
      [(_SFPBImage *)v5 setMonogramImage:v30];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v31 = [[_SFPBLocalImage alloc] initWithFacade:v4];
      [(_SFPBImage *)v5 setLocalImage:v31];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v32 = [[_SFPBAppIconImage alloc] initWithFacade:v4];
      [(_SFPBImage *)v5 setAppIconImage:v32];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v33 = [[_SFPBMediaArtworkImage alloc] initWithFacade:v4];
      [(_SFPBImage *)v5 setMediaArtworkImage:v33];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v34 = [[_SFPBCalendarImage alloc] initWithFacade:v4];
      [(_SFPBImage *)v5 setCalendarImage:v34];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v35 = [[_SFPBSymbolImage alloc] initWithFacade:v4];
      [(_SFPBImage *)v5 setSymbolImage:v35];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v36 = [[_SFPBPhotosLibraryImage alloc] initWithFacade:v4];
      [(_SFPBImage *)v5 setPhotosLibraryImage:v36];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v37 = [[_SFPBQuickLookThumbnailImage alloc] initWithFacade:v4];
      [(_SFPBImage *)v5 setQuickLookThumbnailImage:v37];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v38 = [[_SFPBClockImage alloc] initWithFacade:v4];
      [(_SFPBImage *)v5 setClockImage:v38];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v39 = [[_SFPBShortcutsImage alloc] initWithFacade:v4];
      [(_SFPBImage *)v5 setShortcutsImage:v39];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v40 = [[_SFPBDefaultPunchoutAppIconImage alloc] initWithFacade:v4];
      [(_SFPBImage *)v5 setDefaultPunchoutAppIconImage:v40];
    }
    v41 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultPunchoutAppIconImage, 0);
  objc_storeStrong((id *)&self->_shortcutsImage, 0);
  objc_storeStrong((id *)&self->_clockImage, 0);
  objc_storeStrong((id *)&self->_quickLookThumbnailImage, 0);
  objc_storeStrong((id *)&self->_photosLibraryImage, 0);
  objc_storeStrong((id *)&self->_symbolImage, 0);
  objc_storeStrong((id *)&self->_calendarImage, 0);
  objc_storeStrong((id *)&self->_mediaArtworkImage, 0);
  objc_storeStrong((id *)&self->_appIconImage, 0);
  objc_storeStrong((id *)&self->_localImage, 0);
  objc_storeStrong((id *)&self->_monogramImage, 0);
  objc_storeStrong((id *)&self->_contactImage, 0);
  objc_storeStrong((id *)&self->_urlImage, 0);
  objc_storeStrong((id *)&self->_badgingImage, 0);
  objc_storeStrong((id *)&self->_accessibilityLabel, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_keyColor, 0);
  objc_storeStrong((id *)&self->_contentType, 0);
  objc_storeStrong((id *)&self->_size, 0);
  objc_storeStrong((id *)&self->_scale, 0);
  objc_storeStrong((id *)&self->_cornerRadius, 0);
  objc_storeStrong((id *)&self->_imageData, 0);
}

- (_SFPBDefaultPunchoutAppIconImage)defaultPunchoutAppIconImage
{
  return self->_defaultPunchoutAppIconImage;
}

- (_SFPBShortcutsImage)shortcutsImage
{
  return self->_shortcutsImage;
}

- (_SFPBClockImage)clockImage
{
  return self->_clockImage;
}

- (_SFPBQuickLookThumbnailImage)quickLookThumbnailImage
{
  return self->_quickLookThumbnailImage;
}

- (_SFPBPhotosLibraryImage)photosLibraryImage
{
  return self->_photosLibraryImage;
}

- (_SFPBSymbolImage)symbolImage
{
  return self->_symbolImage;
}

- (_SFPBCalendarImage)calendarImage
{
  return self->_calendarImage;
}

- (_SFPBMediaArtworkImage)mediaArtworkImage
{
  return self->_mediaArtworkImage;
}

- (_SFPBAppIconImage)appIconImage
{
  return self->_appIconImage;
}

- (_SFPBLocalImage)localImage
{
  return self->_localImage;
}

- (_SFPBMonogramImage)monogramImage
{
  return self->_monogramImage;
}

- (_SFPBContactImage)contactImage
{
  return self->_contactImage;
}

- (_SFPBURLImage)urlImage
{
  return self->_urlImage;
}

- (int)type
{
  return self->_type;
}

- (_SFPBImage)badgingImage
{
  return self->_badgingImage;
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

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)keyColor
{
  return self->_keyColor;
}

- (NSString)contentType
{
  return self->_contentType;
}

- (_SFPBPointSize)size
{
  return self->_size;
}

- (_SFPBGraphicalFloat)scale
{
  return self->_scale;
}

- (_SFPBGraphicalFloat)cornerRadius
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

- (NSData)imageData
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (_SFPBImage)initWithDictionary:(id)a3
{
  id v4 = a3;
  v77.receiver = self;
  v77.super_class = (Class)_SFPBImage;
  v5 = [(_SFPBImage *)&v77 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"imageData"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v6 options:0];
      [(_SFPBImage *)v5 setImageData:v7];
    }
    v69 = (void *)v6;
    v8 = [v4 objectForKeyedSubscript:@"isTemplate"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBImage setIsTemplate:](v5, "setIsTemplate:", [v8 BOOLValue]);
    }
    v68 = v8;
    v9 = [v4 objectForKeyedSubscript:@"shouldCropToCircle"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBImage setShouldCropToCircle:](v5, "setShouldCropToCircle:", [v9 BOOLValue]);
    }
    v67 = v9;
    uint64_t v10 = [v4 objectForKeyedSubscript:@"cornerRadius"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = [[_SFPBGraphicalFloat alloc] initWithDictionary:v10];
      [(_SFPBImage *)v5 setCornerRadius:v11];
    }
    uint64_t v12 = [v4 objectForKeyedSubscript:@"scale"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [[_SFPBGraphicalFloat alloc] initWithDictionary:v12];
      [(_SFPBImage *)v5 setScale:v13];
    }
    uint64_t v14 = [v4 objectForKeyedSubscript:@"size"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = [[_SFPBPointSize alloc] initWithDictionary:v14];
      [(_SFPBImage *)v5 setSize:v15];
    }
    v16 = [v4 objectForKeyedSubscript:@"contentType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v17 = (void *)[v16 copy];
      [(_SFPBImage *)v5 setContentType:v17];
    }
    v18 = [v4 objectForKeyedSubscript:@"keyColor"];
    objc_opt_class();
    v76 = v18;
    if (objc_opt_isKindOfClass())
    {
      v19 = (void *)[v18 copy];
      [(_SFPBImage *)v5 setKeyColor:v19];
    }
    v20 = [v4 objectForKeyedSubscript:@"identifier"];
    objc_opt_class();
    v75 = v20;
    if (objc_opt_isKindOfClass())
    {
      v21 = (void *)[v20 copy];
      [(_SFPBImage *)v5 setIdentifier:v21];
    }
    v66 = (void *)v10;
    v22 = [v4 objectForKeyedSubscript:@"source"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBImage setSource:](v5, "setSource:", [v22 intValue]);
    }
    v23 = [v4 objectForKeyedSubscript:@"cornerRoundingStyle"];
    objc_opt_class();
    v74 = v23;
    if (objc_opt_isKindOfClass()) {
      -[_SFPBImage setCornerRoundingStyle:](v5, "setCornerRoundingStyle:", [v23 intValue]);
    }
    v62 = v22;
    v24 = [v4 objectForKeyedSubscript:@"accessibilityLabel"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v25 = (void *)[v24 copy];
      [(_SFPBImage *)v5 setAccessibilityLabel:v25];
    }
    uint64_t v26 = [v4 objectForKeyedSubscript:@"badgingImage"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v27 = [[_SFPBImage alloc] initWithDictionary:v26];
      [(_SFPBImage *)v5 setBadgingImage:v27];
    }
    v28 = [v4 objectForKeyedSubscript:@"type"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBImage setType:](v5, "setType:", [v28 intValue]);
    }
    v59 = v28;
    uint64_t v29 = [v4 objectForKeyedSubscript:@"urlImage"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v30 = [[_SFPBURLImage alloc] initWithDictionary:v29];
      [(_SFPBImage *)v5 setUrlImage:v30];
    }
    uint64_t v31 = [v4 objectForKeyedSubscript:@"contactImage"];
    objc_opt_class();
    v73 = (void *)v31;
    if (objc_opt_isKindOfClass())
    {
      v32 = [[_SFPBContactImage alloc] initWithDictionary:v31];
      [(_SFPBImage *)v5 setContactImage:v32];
    }
    uint64_t v33 = [v4 objectForKeyedSubscript:@"monogramImage"];
    objc_opt_class();
    v72 = (void *)v33;
    if (objc_opt_isKindOfClass())
    {
      v34 = [[_SFPBMonogramImage alloc] initWithDictionary:v33];
      [(_SFPBImage *)v5 setMonogramImage:v34];
    }
    uint64_t v35 = [v4 objectForKeyedSubscript:@"localImage"];
    objc_opt_class();
    v71 = (void *)v35;
    if (objc_opt_isKindOfClass())
    {
      v36 = [[_SFPBLocalImage alloc] initWithDictionary:v35];
      [(_SFPBImage *)v5 setLocalImage:v36];
    }
    uint64_t v37 = [v4 objectForKeyedSubscript:@"appIconImage"];
    objc_opt_class();
    v70 = (void *)v37;
    if (objc_opt_isKindOfClass())
    {
      v38 = [[_SFPBAppIconImage alloc] initWithDictionary:v37];
      [(_SFPBImage *)v5 setAppIconImage:v38];
    }
    v64 = (void *)v14;
    uint64_t v39 = [v4 objectForKeyedSubscript:@"mediaArtworkImage"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v40 = [[_SFPBMediaArtworkImage alloc] initWithDictionary:v39];
      [(_SFPBImage *)v5 setMediaArtworkImage:v40];
    }
    v57 = (void *)v39;
    v61 = v24;
    v41 = [v4 objectForKeyedSubscript:@"calendarImage"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v42 = [[_SFPBCalendarImage alloc] initWithDictionary:v41];
      [(_SFPBImage *)v5 setCalendarImage:v42];
    }
    v65 = (void *)v12;
    v43 = [v4 objectForKeyedSubscript:@"symbolImage"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v44 = [[_SFPBSymbolImage alloc] initWithDictionary:v43];
      [(_SFPBImage *)v5 setSymbolImage:v44];
    }
    v63 = v16;
    v45 = [v4 objectForKeyedSubscript:@"photosLibraryImage"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v46 = [[_SFPBPhotosLibraryImage alloc] initWithDictionary:v45];
      [(_SFPBImage *)v5 setPhotosLibraryImage:v46];
    }
    v58 = (void *)v29;
    v47 = [v4 objectForKeyedSubscript:@"quickLookThumbnailImage"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v48 = [[_SFPBQuickLookThumbnailImage alloc] initWithDictionary:v47];
      [(_SFPBImage *)v5 setQuickLookThumbnailImage:v48];
    }
    v60 = (void *)v26;
    v49 = [v4 objectForKeyedSubscript:@"clockImage"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v50 = [[_SFPBClockImage alloc] initWithDictionary:v49];
      [(_SFPBImage *)v5 setClockImage:v50];
    }
    v51 = [v4 objectForKeyedSubscript:@"shortcutsImage"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v52 = [[_SFPBShortcutsImage alloc] initWithDictionary:v51];
      [(_SFPBImage *)v5 setShortcutsImage:v52];
    }
    v53 = [v4 objectForKeyedSubscript:@"defaultPunchoutAppIconImage"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v54 = [[_SFPBDefaultPunchoutAppIconImage alloc] initWithDictionary:v53];
      [(_SFPBImage *)v5 setDefaultPunchoutAppIconImage:v54];
    }
    v55 = v5;
  }
  return v5;
}

- (_SFPBImage)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBImage *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBImage *)self dictionaryRepresentation];
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:v2])
  {
    v3 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v2 options:0 error:0];
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_accessibilityLabel)
  {
    id v4 = [(_SFPBImage *)self accessibilityLabel];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"accessibilityLabel"];
  }
  if (self->_appIconImage)
  {
    uint64_t v6 = [(_SFPBImage *)self appIconImage];
    uint64_t v7 = [v6 dictionaryRepresentation];
    if (v7)
    {
      [v3 setObject:v7 forKeyedSubscript:@"appIconImage"];
    }
    else
    {
      v8 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v8 forKeyedSubscript:@"appIconImage"];
    }
  }
  if (self->_badgingImage)
  {
    v9 = [(_SFPBImage *)self badgingImage];
    uint64_t v10 = [v9 dictionaryRepresentation];
    if (v10)
    {
      [v3 setObject:v10 forKeyedSubscript:@"badgingImage"];
    }
    else
    {
      v11 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v11 forKeyedSubscript:@"badgingImage"];
    }
  }
  if (self->_calendarImage)
  {
    uint64_t v12 = [(_SFPBImage *)self calendarImage];
    v13 = [v12 dictionaryRepresentation];
    if (v13)
    {
      [v3 setObject:v13 forKeyedSubscript:@"calendarImage"];
    }
    else
    {
      uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v14 forKeyedSubscript:@"calendarImage"];
    }
  }
  if (self->_clockImage)
  {
    v15 = [(_SFPBImage *)self clockImage];
    v16 = [v15 dictionaryRepresentation];
    if (v16)
    {
      [v3 setObject:v16 forKeyedSubscript:@"clockImage"];
    }
    else
    {
      v17 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v17 forKeyedSubscript:@"clockImage"];
    }
  }
  if (self->_contactImage)
  {
    v18 = [(_SFPBImage *)self contactImage];
    v19 = [v18 dictionaryRepresentation];
    if (v19)
    {
      [v3 setObject:v19 forKeyedSubscript:@"contactImage"];
    }
    else
    {
      v20 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v20 forKeyedSubscript:@"contactImage"];
    }
  }
  if (self->_contentType)
  {
    v21 = [(_SFPBImage *)self contentType];
    v22 = (void *)[v21 copy];
    [v3 setObject:v22 forKeyedSubscript:@"contentType"];
  }
  if (self->_cornerRadius)
  {
    v23 = [(_SFPBImage *)self cornerRadius];
    v24 = [v23 dictionaryRepresentation];
    if (v24)
    {
      [v3 setObject:v24 forKeyedSubscript:@"cornerRadius"];
    }
    else
    {
      v25 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v25 forKeyedSubscript:@"cornerRadius"];
    }
  }
  if (self->_cornerRoundingStyle)
  {
    uint64_t v26 = [(_SFPBImage *)self cornerRoundingStyle];
    if (v26 >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v26);
      v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v27 = off_1E5A2EF58[v26];
    }
    [v3 setObject:v27 forKeyedSubscript:@"cornerRoundingStyle"];
  }
  if (self->_defaultPunchoutAppIconImage)
  {
    v28 = [(_SFPBImage *)self defaultPunchoutAppIconImage];
    uint64_t v29 = [v28 dictionaryRepresentation];
    if (v29)
    {
      [v3 setObject:v29 forKeyedSubscript:@"defaultPunchoutAppIconImage"];
    }
    else
    {
      v30 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v30 forKeyedSubscript:@"defaultPunchoutAppIconImage"];
    }
  }
  if (self->_identifier)
  {
    uint64_t v31 = [(_SFPBImage *)self identifier];
    v32 = (void *)[v31 copy];
    [v3 setObject:v32 forKeyedSubscript:@"identifier"];
  }
  if (self->_imageData)
  {
    uint64_t v33 = [(_SFPBImage *)self imageData];
    v34 = [v33 base64EncodedStringWithOptions:0];
    if (v34)
    {
      [v3 setObject:v34 forKeyedSubscript:@"imageData"];
    }
    else
    {
      uint64_t v35 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v35 forKeyedSubscript:@"imageData"];
    }
  }
  if (self->_isTemplate)
  {
    v36 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBImage isTemplate](self, "isTemplate"));
    [v3 setObject:v36 forKeyedSubscript:@"isTemplate"];
  }
  if (self->_keyColor)
  {
    uint64_t v37 = [(_SFPBImage *)self keyColor];
    v38 = (void *)[v37 copy];
    [v3 setObject:v38 forKeyedSubscript:@"keyColor"];
  }
  if (self->_localImage)
  {
    uint64_t v39 = [(_SFPBImage *)self localImage];
    v40 = [v39 dictionaryRepresentation];
    if (v40)
    {
      [v3 setObject:v40 forKeyedSubscript:@"localImage"];
    }
    else
    {
      v41 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v41 forKeyedSubscript:@"localImage"];
    }
  }
  if (self->_mediaArtworkImage)
  {
    v42 = [(_SFPBImage *)self mediaArtworkImage];
    v43 = [v42 dictionaryRepresentation];
    if (v43)
    {
      [v3 setObject:v43 forKeyedSubscript:@"mediaArtworkImage"];
    }
    else
    {
      v44 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v44 forKeyedSubscript:@"mediaArtworkImage"];
    }
  }
  if (self->_monogramImage)
  {
    v45 = [(_SFPBImage *)self monogramImage];
    v46 = [v45 dictionaryRepresentation];
    if (v46)
    {
      [v3 setObject:v46 forKeyedSubscript:@"monogramImage"];
    }
    else
    {
      v47 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v47 forKeyedSubscript:@"monogramImage"];
    }
  }
  if (self->_photosLibraryImage)
  {
    v48 = [(_SFPBImage *)self photosLibraryImage];
    v49 = [v48 dictionaryRepresentation];
    if (v49)
    {
      [v3 setObject:v49 forKeyedSubscript:@"photosLibraryImage"];
    }
    else
    {
      v50 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v50 forKeyedSubscript:@"photosLibraryImage"];
    }
  }
  if (self->_quickLookThumbnailImage)
  {
    v51 = [(_SFPBImage *)self quickLookThumbnailImage];
    v52 = [v51 dictionaryRepresentation];
    if (v52)
    {
      [v3 setObject:v52 forKeyedSubscript:@"quickLookThumbnailImage"];
    }
    else
    {
      v53 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v53 forKeyedSubscript:@"quickLookThumbnailImage"];
    }
  }
  if (self->_scale)
  {
    v54 = [(_SFPBImage *)self scale];
    v55 = [v54 dictionaryRepresentation];
    if (v55)
    {
      [v3 setObject:v55 forKeyedSubscript:@"scale"];
    }
    else
    {
      v56 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v56 forKeyedSubscript:@"scale"];
    }
  }
  if (self->_shortcutsImage)
  {
    v57 = [(_SFPBImage *)self shortcutsImage];
    v58 = [v57 dictionaryRepresentation];
    if (v58)
    {
      [v3 setObject:v58 forKeyedSubscript:@"shortcutsImage"];
    }
    else
    {
      v59 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v59 forKeyedSubscript:@"shortcutsImage"];
    }
  }
  if (self->_shouldCropToCircle)
  {
    v60 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBImage shouldCropToCircle](self, "shouldCropToCircle"));
    [v3 setObject:v60 forKeyedSubscript:@"shouldCropToCircle"];
  }
  if (self->_size)
  {
    v61 = [(_SFPBImage *)self size];
    v62 = [v61 dictionaryRepresentation];
    if (v62)
    {
      [v3 setObject:v62 forKeyedSubscript:@"size"];
    }
    else
    {
      v63 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v63 forKeyedSubscript:@"size"];
    }
  }
  if (self->_source)
  {
    uint64_t v64 = [(_SFPBImage *)self source];
    if (v64 >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v64);
      v65 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v65 = off_1E5A2F058[v64];
    }
    [v3 setObject:v65 forKeyedSubscript:@"source"];
  }
  if (self->_symbolImage)
  {
    v66 = [(_SFPBImage *)self symbolImage];
    v67 = [v66 dictionaryRepresentation];
    if (v67)
    {
      [v3 setObject:v67 forKeyedSubscript:@"symbolImage"];
    }
    else
    {
      v68 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v68 forKeyedSubscript:@"symbolImage"];
    }
  }
  if (self->_type)
  {
    uint64_t v69 = [(_SFPBImage *)self type];
    switch((int)v69)
    {
      case '4':
        v70 = @"52";
        break;
      case '5':
        v70 = @"53";
        break;
      case '6':
        v70 = @"54";
        break;
      case '7':
        v70 = @"55";
        break;
      case '8':
        v70 = @"56";
        break;
      case '9':
        v70 = @"57";
        break;
      case ':':
        v70 = @"58";
        break;
      case ';':
        v70 = @"59";
        break;
      case '<':
        v70 = @"60";
        break;
      case '=':
        v70 = @"61";
        break;
      case '>':
        v70 = @"62";
        break;
      case '?':
        v70 = @"63";
        break;
      case '@':
        v70 = @"64";
        break;
      default:
        if (v69)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v69);
          v70 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v70 = @"0";
        }
        break;
    }
    [v3 setObject:v70 forKeyedSubscript:@"type"];
  }
  if (self->_urlImage)
  {
    v71 = [(_SFPBImage *)self urlImage];
    v72 = [v71 dictionaryRepresentation];
    if (v72)
    {
      [v3 setObject:v72 forKeyedSubscript:@"urlImage"];
    }
    else
    {
      v73 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v73 forKeyedSubscript:@"urlImage"];
    }
  }
  id v74 = v3;

  return v74;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_imageData hash];
  if (self->_isTemplate) {
    uint64_t v4 = 2654435761;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v31 = v4;
  uint64_t v32 = v3;
  if (self->_shouldCropToCircle) {
    uint64_t v5 = 2654435761;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v30 = v5;
  unint64_t v29 = [(_SFPBGraphicalFloat *)self->_cornerRadius hash];
  unint64_t v6 = [(_SFPBGraphicalFloat *)self->_scale hash];
  unint64_t v7 = [(_SFPBPointSize *)self->_size hash];
  NSUInteger v8 = [(NSString *)self->_contentType hash];
  NSUInteger v9 = [(NSString *)self->_keyColor hash];
  NSUInteger v10 = [(NSString *)self->_identifier hash];
  uint64_t v11 = 2654435761 * self->_source;
  uint64_t v12 = 2654435761 * self->_cornerRoundingStyle;
  NSUInteger v13 = [(NSString *)self->_accessibilityLabel hash];
  unint64_t v14 = v31 ^ v32 ^ v30 ^ v29 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
  unint64_t v15 = v13 ^ [(_SFPBImage *)self->_badgingImage hash] ^ (2654435761 * self->_type);
  unint64_t v16 = v14 ^ v15 ^ [(_SFPBURLImage *)self->_urlImage hash];
  unint64_t v17 = [(_SFPBContactImage *)self->_contactImage hash];
  unint64_t v18 = v17 ^ [(_SFPBMonogramImage *)self->_monogramImage hash];
  unint64_t v19 = v18 ^ [(_SFPBLocalImage *)self->_localImage hash];
  unint64_t v20 = v19 ^ [(_SFPBAppIconImage *)self->_appIconImage hash];
  unint64_t v21 = v20 ^ [(_SFPBMediaArtworkImage *)self->_mediaArtworkImage hash];
  unint64_t v22 = v21 ^ [(_SFPBCalendarImage *)self->_calendarImage hash];
  unint64_t v23 = v22 ^ [(_SFPBSymbolImage *)self->_symbolImage hash];
  unint64_t v24 = v16 ^ v23 ^ [(_SFPBPhotosLibraryImage *)self->_photosLibraryImage hash];
  unint64_t v25 = [(_SFPBQuickLookThumbnailImage *)self->_quickLookThumbnailImage hash];
  unint64_t v26 = v25 ^ [(_SFPBClockImage *)self->_clockImage hash];
  unint64_t v27 = v26 ^ [(_SFPBShortcutsImage *)self->_shortcutsImage hash];
  return v24 ^ v27 ^ [(_SFPBDefaultPunchoutAppIconImage *)self->_defaultPunchoutAppIconImage hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_117;
  }
  uint64_t v5 = [(_SFPBImage *)self imageData];
  unint64_t v6 = [v4 imageData];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_116;
  }
  uint64_t v7 = [(_SFPBImage *)self imageData];
  if (v7)
  {
    NSUInteger v8 = (void *)v7;
    NSUInteger v9 = [(_SFPBImage *)self imageData];
    NSUInteger v10 = [v4 imageData];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_117;
    }
  }
  else
  {
  }
  int isTemplate = self->_isTemplate;
  if (isTemplate != [v4 isTemplate]) {
    goto LABEL_117;
  }
  int shouldCropToCircle = self->_shouldCropToCircle;
  if (shouldCropToCircle != [v4 shouldCropToCircle]) {
    goto LABEL_117;
  }
  uint64_t v5 = [(_SFPBImage *)self cornerRadius];
  unint64_t v6 = [v4 cornerRadius];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_116;
  }
  uint64_t v14 = [(_SFPBImage *)self cornerRadius];
  if (v14)
  {
    unint64_t v15 = (void *)v14;
    unint64_t v16 = [(_SFPBImage *)self cornerRadius];
    unint64_t v17 = [v4 cornerRadius];
    int v18 = [v16 isEqual:v17];

    if (!v18) {
      goto LABEL_117;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBImage *)self scale];
  unint64_t v6 = [v4 scale];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_116;
  }
  uint64_t v19 = [(_SFPBImage *)self scale];
  if (v19)
  {
    unint64_t v20 = (void *)v19;
    unint64_t v21 = [(_SFPBImage *)self scale];
    unint64_t v22 = [v4 scale];
    int v23 = [v21 isEqual:v22];

    if (!v23) {
      goto LABEL_117;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBImage *)self size];
  unint64_t v6 = [v4 size];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_116;
  }
  uint64_t v24 = [(_SFPBImage *)self size];
  if (v24)
  {
    unint64_t v25 = (void *)v24;
    unint64_t v26 = [(_SFPBImage *)self size];
    unint64_t v27 = [v4 size];
    int v28 = [v26 isEqual:v27];

    if (!v28) {
      goto LABEL_117;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBImage *)self contentType];
  unint64_t v6 = [v4 contentType];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_116;
  }
  uint64_t v29 = [(_SFPBImage *)self contentType];
  if (v29)
  {
    uint64_t v30 = (void *)v29;
    uint64_t v31 = [(_SFPBImage *)self contentType];
    uint64_t v32 = [v4 contentType];
    int v33 = [v31 isEqual:v32];

    if (!v33) {
      goto LABEL_117;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBImage *)self keyColor];
  unint64_t v6 = [v4 keyColor];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_116;
  }
  uint64_t v34 = [(_SFPBImage *)self keyColor];
  if (v34)
  {
    uint64_t v35 = (void *)v34;
    v36 = [(_SFPBImage *)self keyColor];
    uint64_t v37 = [v4 keyColor];
    int v38 = [v36 isEqual:v37];

    if (!v38) {
      goto LABEL_117;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBImage *)self identifier];
  unint64_t v6 = [v4 identifier];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_116;
  }
  uint64_t v39 = [(_SFPBImage *)self identifier];
  if (v39)
  {
    v40 = (void *)v39;
    v41 = [(_SFPBImage *)self identifier];
    v42 = [v4 identifier];
    int v43 = [v41 isEqual:v42];

    if (!v43) {
      goto LABEL_117;
    }
  }
  else
  {
  }
  int source = self->_source;
  if (source != [v4 source]) {
    goto LABEL_117;
  }
  int cornerRoundingStyle = self->_cornerRoundingStyle;
  if (cornerRoundingStyle != [v4 cornerRoundingStyle]) {
    goto LABEL_117;
  }
  uint64_t v5 = [(_SFPBImage *)self accessibilityLabel];
  unint64_t v6 = [v4 accessibilityLabel];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_116;
  }
  uint64_t v46 = [(_SFPBImage *)self accessibilityLabel];
  if (v46)
  {
    v47 = (void *)v46;
    v48 = [(_SFPBImage *)self accessibilityLabel];
    v49 = [v4 accessibilityLabel];
    int v50 = [v48 isEqual:v49];

    if (!v50) {
      goto LABEL_117;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBImage *)self badgingImage];
  unint64_t v6 = [v4 badgingImage];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_116;
  }
  uint64_t v51 = [(_SFPBImage *)self badgingImage];
  if (v51)
  {
    v52 = (void *)v51;
    v53 = [(_SFPBImage *)self badgingImage];
    v54 = [v4 badgingImage];
    int v55 = [v53 isEqual:v54];

    if (!v55) {
      goto LABEL_117;
    }
  }
  else
  {
  }
  int type = self->_type;
  if (type != [v4 type]) {
    goto LABEL_117;
  }
  uint64_t v5 = [(_SFPBImage *)self urlImage];
  unint64_t v6 = [v4 urlImage];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_116;
  }
  uint64_t v57 = [(_SFPBImage *)self urlImage];
  if (v57)
  {
    v58 = (void *)v57;
    v59 = [(_SFPBImage *)self urlImage];
    v60 = [v4 urlImage];
    int v61 = [v59 isEqual:v60];

    if (!v61) {
      goto LABEL_117;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBImage *)self contactImage];
  unint64_t v6 = [v4 contactImage];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_116;
  }
  uint64_t v62 = [(_SFPBImage *)self contactImage];
  if (v62)
  {
    v63 = (void *)v62;
    uint64_t v64 = [(_SFPBImage *)self contactImage];
    v65 = [v4 contactImage];
    int v66 = [v64 isEqual:v65];

    if (!v66) {
      goto LABEL_117;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBImage *)self monogramImage];
  unint64_t v6 = [v4 monogramImage];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_116;
  }
  uint64_t v67 = [(_SFPBImage *)self monogramImage];
  if (v67)
  {
    v68 = (void *)v67;
    uint64_t v69 = [(_SFPBImage *)self monogramImage];
    v70 = [v4 monogramImage];
    int v71 = [v69 isEqual:v70];

    if (!v71) {
      goto LABEL_117;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBImage *)self localImage];
  unint64_t v6 = [v4 localImage];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_116;
  }
  uint64_t v72 = [(_SFPBImage *)self localImage];
  if (v72)
  {
    v73 = (void *)v72;
    id v74 = [(_SFPBImage *)self localImage];
    v75 = [v4 localImage];
    int v76 = [v74 isEqual:v75];

    if (!v76) {
      goto LABEL_117;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBImage *)self appIconImage];
  unint64_t v6 = [v4 appIconImage];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_116;
  }
  uint64_t v77 = [(_SFPBImage *)self appIconImage];
  if (v77)
  {
    v78 = (void *)v77;
    v79 = [(_SFPBImage *)self appIconImage];
    v80 = [v4 appIconImage];
    int v81 = [v79 isEqual:v80];

    if (!v81) {
      goto LABEL_117;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBImage *)self mediaArtworkImage];
  unint64_t v6 = [v4 mediaArtworkImage];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_116;
  }
  uint64_t v82 = [(_SFPBImage *)self mediaArtworkImage];
  if (v82)
  {
    v83 = (void *)v82;
    v84 = [(_SFPBImage *)self mediaArtworkImage];
    v85 = [v4 mediaArtworkImage];
    int v86 = [v84 isEqual:v85];

    if (!v86) {
      goto LABEL_117;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBImage *)self calendarImage];
  unint64_t v6 = [v4 calendarImage];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_116;
  }
  uint64_t v87 = [(_SFPBImage *)self calendarImage];
  if (v87)
  {
    v88 = (void *)v87;
    v89 = [(_SFPBImage *)self calendarImage];
    v90 = [v4 calendarImage];
    int v91 = [v89 isEqual:v90];

    if (!v91) {
      goto LABEL_117;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBImage *)self symbolImage];
  unint64_t v6 = [v4 symbolImage];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_116;
  }
  uint64_t v92 = [(_SFPBImage *)self symbolImage];
  if (v92)
  {
    v93 = (void *)v92;
    v94 = [(_SFPBImage *)self symbolImage];
    v95 = [v4 symbolImage];
    int v96 = [v94 isEqual:v95];

    if (!v96) {
      goto LABEL_117;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBImage *)self photosLibraryImage];
  unint64_t v6 = [v4 photosLibraryImage];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_116;
  }
  uint64_t v97 = [(_SFPBImage *)self photosLibraryImage];
  if (v97)
  {
    v98 = (void *)v97;
    v99 = [(_SFPBImage *)self photosLibraryImage];
    v100 = [v4 photosLibraryImage];
    int v101 = [v99 isEqual:v100];

    if (!v101) {
      goto LABEL_117;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBImage *)self quickLookThumbnailImage];
  unint64_t v6 = [v4 quickLookThumbnailImage];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_116;
  }
  uint64_t v102 = [(_SFPBImage *)self quickLookThumbnailImage];
  if (v102)
  {
    v103 = (void *)v102;
    v104 = [(_SFPBImage *)self quickLookThumbnailImage];
    v105 = [v4 quickLookThumbnailImage];
    int v106 = [v104 isEqual:v105];

    if (!v106) {
      goto LABEL_117;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBImage *)self clockImage];
  unint64_t v6 = [v4 clockImage];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_116;
  }
  uint64_t v107 = [(_SFPBImage *)self clockImage];
  if (v107)
  {
    v108 = (void *)v107;
    v109 = [(_SFPBImage *)self clockImage];
    v110 = [v4 clockImage];
    int v111 = [v109 isEqual:v110];

    if (!v111) {
      goto LABEL_117;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBImage *)self shortcutsImage];
  unint64_t v6 = [v4 shortcutsImage];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_116;
  }
  uint64_t v112 = [(_SFPBImage *)self shortcutsImage];
  if (v112)
  {
    v113 = (void *)v112;
    v114 = [(_SFPBImage *)self shortcutsImage];
    v115 = [v4 shortcutsImage];
    int v116 = [v114 isEqual:v115];

    if (!v116) {
      goto LABEL_117;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBImage *)self defaultPunchoutAppIconImage];
  unint64_t v6 = [v4 defaultPunchoutAppIconImage];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_116:

    goto LABEL_117;
  }
  uint64_t v117 = [(_SFPBImage *)self defaultPunchoutAppIconImage];
  if (!v117)
  {

LABEL_120:
    BOOL v122 = 1;
    goto LABEL_118;
  }
  v118 = (void *)v117;
  v119 = [(_SFPBImage *)self defaultPunchoutAppIconImage];
  v120 = [v4 defaultPunchoutAppIconImage];
  char v121 = [v119 isEqual:v120];

  if (v121) {
    goto LABEL_120;
  }
LABEL_117:
  BOOL v122 = 0;
LABEL_118:

  return v122;
}

- (void)writeTo:(id)a3
{
  id v26 = a3;
  id v4 = [(_SFPBImage *)self imageData];
  if (v4) {
    PBDataWriterWriteDataField();
  }

  if ([(_SFPBImage *)self isTemplate]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_SFPBImage *)self shouldCropToCircle]) {
    PBDataWriterWriteBOOLField();
  }
  uint64_t v5 = [(_SFPBImage *)self cornerRadius];
  if (v5) {
    PBDataWriterWriteSubmessage();
  }

  unint64_t v6 = [(_SFPBImage *)self scale];
  if (v6) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v7 = [(_SFPBImage *)self size];
  if (v7) {
    PBDataWriterWriteSubmessage();
  }

  NSUInteger v8 = [(_SFPBImage *)self contentType];
  if (v8) {
    PBDataWriterWriteStringField();
  }

  NSUInteger v9 = [(_SFPBImage *)self keyColor];
  if (v9) {
    PBDataWriterWriteStringField();
  }

  NSUInteger v10 = [(_SFPBImage *)self identifier];
  if (v10) {
    PBDataWriterWriteStringField();
  }

  if ([(_SFPBImage *)self source]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_SFPBImage *)self cornerRoundingStyle]) {
    PBDataWriterWriteInt32Field();
  }
  int v11 = [(_SFPBImage *)self accessibilityLabel];
  if (v11) {
    PBDataWriterWriteStringField();
  }

  uint64_t v12 = [(_SFPBImage *)self badgingImage];
  if (v12) {
    PBDataWriterWriteSubmessage();
  }

  if ([(_SFPBImage *)self type]) {
    PBDataWriterWriteInt32Field();
  }
  NSUInteger v13 = [(_SFPBImage *)self urlImage];
  if (v13) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v14 = [(_SFPBImage *)self contactImage];
  if (v14) {
    PBDataWriterWriteSubmessage();
  }

  unint64_t v15 = [(_SFPBImage *)self monogramImage];
  if (v15) {
    PBDataWriterWriteSubmessage();
  }

  unint64_t v16 = [(_SFPBImage *)self localImage];
  if (v16) {
    PBDataWriterWriteSubmessage();
  }

  unint64_t v17 = [(_SFPBImage *)self appIconImage];
  if (v17) {
    PBDataWriterWriteSubmessage();
  }

  int v18 = [(_SFPBImage *)self mediaArtworkImage];
  if (v18) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v19 = [(_SFPBImage *)self calendarImage];
  if (v19) {
    PBDataWriterWriteSubmessage();
  }

  unint64_t v20 = [(_SFPBImage *)self symbolImage];
  if (v20) {
    PBDataWriterWriteSubmessage();
  }

  unint64_t v21 = [(_SFPBImage *)self photosLibraryImage];
  if (v21) {
    PBDataWriterWriteSubmessage();
  }

  unint64_t v22 = [(_SFPBImage *)self quickLookThumbnailImage];
  if (v22) {
    PBDataWriterWriteSubmessage();
  }

  int v23 = [(_SFPBImage *)self clockImage];
  if (v23) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v24 = [(_SFPBImage *)self shortcutsImage];
  if (v24) {
    PBDataWriterWriteSubmessage();
  }

  unint64_t v25 = [(_SFPBImage *)self defaultPunchoutAppIconImage];
  if (v25) {
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBImageReadFrom(self, (uint64_t)a3);
}

- (void)setDefaultPunchoutAppIconImage:(id)a3
{
}

- (void)setShortcutsImage:(id)a3
{
}

- (void)setClockImage:(id)a3
{
}

- (void)setQuickLookThumbnailImage:(id)a3
{
}

- (void)setPhotosLibraryImage:(id)a3
{
}

- (void)setSymbolImage:(id)a3
{
}

- (void)setCalendarImage:(id)a3
{
}

- (void)setMediaArtworkImage:(id)a3
{
}

- (void)setAppIconImage:(id)a3
{
}

- (void)setLocalImage:(id)a3
{
}

- (void)setMonogramImage:(id)a3
{
}

- (void)setContactImage:(id)a3
{
}

- (void)setUrlImage:(id)a3
{
}

- (void)setType:(int)a3
{
  self->_int type = a3;
}

- (void)setBadgingImage:(id)a3
{
}

- (void)setAccessibilityLabel:(id)a3
{
  self->_accessibilityLabel = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setCornerRoundingStyle:(int)a3
{
  self->_int cornerRoundingStyle = a3;
}

- (void)setSource:(int)a3
{
  self->_int source = a3;
}

- (void)setIdentifier:(id)a3
{
  self->_identifier = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setKeyColor:(id)a3
{
  self->_keyColor = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setContentType:(id)a3
{
  self->_contentType = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setSize:(id)a3
{
}

- (void)setScale:(id)a3
{
}

- (void)setCornerRadius:(id)a3
{
}

- (void)setShouldCropToCircle:(BOOL)a3
{
  self->_int shouldCropToCircle = a3;
}

- (void)setIsTemplate:(BOOL)a3
{
  self->_int isTemplate = a3;
}

- (void)setImageData:(id)a3
{
  self->_imageData = (NSData *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

@end