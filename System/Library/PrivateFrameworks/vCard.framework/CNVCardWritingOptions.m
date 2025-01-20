@interface CNVCardWritingOptions
+ (id)optionsFromPreferences;
- (BOOL)compressPhotos;
- (BOOL)includeMeCardOnlySharingProperties;
- (BOOL)includeNotes;
- (BOOL)includePhotos;
- (BOOL)includePrivateBundleIdentifiers;
- (BOOL)includePrivateFields;
- (BOOL)includePronouns;
- (BOOL)includeUserSettings;
- (BOOL)includeWallpaper;
- (BOOL)prefersUncroppedPhotos;
- (BOOL)shouldSuppressRegulatoryLogging;
- (BOOL)usePhotoReferencesIfAvailable;
- (BOOL)useUnencryptedPronouns;
- (CGSize)maximumImageSize;
- (CNVCardWritingOptions)init;
- (NSArray)availableEncodings;
- (NSArray)treatAsUnknownProperties;
- (id)description;
- (unint64_t)maximumEncodingLength;
- (unint64_t)maximumImageEncodingLength;
- (unint64_t)outputVersion;
- (void)setAvailableEncodings:(id)a3;
- (void)setCompressPhotos:(BOOL)a3;
- (void)setIncludeMeCardOnlySharingProperties:(BOOL)a3;
- (void)setIncludeNotes:(BOOL)a3;
- (void)setIncludePhotos:(BOOL)a3;
- (void)setIncludePrivateBundleIdentifiers:(BOOL)a3;
- (void)setIncludePrivateFields:(BOOL)a3;
- (void)setIncludePronouns:(BOOL)a3;
- (void)setIncludeUserSettings:(BOOL)a3;
- (void)setIncludeWallpaper:(BOOL)a3;
- (void)setMaximumEncodingLength:(unint64_t)a3;
- (void)setMaximumImageEncodingLength:(unint64_t)a3;
- (void)setMaximumImageSize:(CGSize)a3;
- (void)setOutputVersion:(unint64_t)a3;
- (void)setPrefersUncroppedPhotos:(BOOL)a3;
- (void)setShouldSuppressRegulatoryLogging:(BOOL)a3;
- (void)setTreatAsUnknownProperties:(id)a3;
- (void)setUsePhotoReferencesIfAvailable:(BOOL)a3;
- (void)setUseUnencryptedPronouns:(BOOL)a3;
@end

@implementation CNVCardWritingOptions

+ (id)optionsFromPreferences
{
  id v2 = objc_alloc_init((Class)a1);
  objc_msgSend(v2, "setIncludeNotes:", +[CNVCardUserDefaults includeNotesInVCards](CNVCardUserDefaults, "includeNotesInVCards"));
  objc_msgSend(v2, "setIncludePhotos:", +[CNVCardUserDefaults includePhotosInVCards](CNVCardUserDefaults, "includePhotosInVCards"));
  objc_msgSend(v2, "setOutputVersion:", +[CNVCardUserDefaults outputFormat](CNVCardUserDefaults, "outputFormat"));
  objc_msgSend(v2, "setIncludeUserSettings:", +[CNVCardUserDefaults includeUserSettings](CNVCardUserDefaults, "includeUserSettings"));
  if ([v2 outputVersion] == 1)
  {
    v3 = +[CNVCardEncoding encodingsFromUserDefaults];
    [v2 setAvailableEncodings:v3];
  }
  return v2;
}

- (void)setOutputVersion:(unint64_t)a3
{
  self->_outputVersion = a3;
}

- (void)setIncludeUserSettings:(BOOL)a3
{
  self->_includeUserSettings = a3;
}

- (void)setIncludePhotos:(BOOL)a3
{
  self->_includePhotos = a3;
}

- (void)setIncludeNotes:(BOOL)a3
{
  self->_includeNotes = a3;
}

- (unint64_t)outputVersion
{
  return self->_outputVersion;
}

- (CNVCardWritingOptions)init
{
  v6.receiver = self;
  v6.super_class = (Class)CNVCardWritingOptions;
  id v2 = [(CNVCardWritingOptions *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_includeMeCardOnlySharingProperties = 1;
    v2->_maximumImageSize = (CGSize)*MEMORY[0x1E4F28AE0];
    v4 = v2;
  }

  return v3;
}

- (BOOL)includePronouns
{
  return self->_includePronouns;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_availableEncodings, 0);
  objc_storeStrong((id *)&self->_treatAsUnknownProperties, 0);
}

- (id)description
{
  v3 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  id v4 = (id)objc_msgSend(v3, "appendName:BOOLValue:", @"includePrivateFields", -[CNVCardWritingOptions includePrivateFields](self, "includePrivateFields"));
  id v5 = (id)objc_msgSend(v3, "appendName:BOOLValue:", @"includePrivateBundleIdentifiers", -[CNVCardWritingOptions includePrivateBundleIdentifiers](self, "includePrivateBundleIdentifiers"));
  id v6 = (id)objc_msgSend(v3, "appendName:BOOLValue:", @"includeUserSettings", -[CNVCardWritingOptions includeUserSettings](self, "includeUserSettings"));
  id v7 = (id)objc_msgSend(v3, "appendName:BOOLValue:", @"includeNotes", -[CNVCardWritingOptions includeNotes](self, "includeNotes"));
  id v8 = (id)objc_msgSend(v3, "appendName:BOOLValue:", @"includePhotos", -[CNVCardWritingOptions includePhotos](self, "includePhotos"));
  id v9 = (id)objc_msgSend(v3, "appendName:BOOLValue:", @"includeWallpaper", -[CNVCardWritingOptions includeWallpaper](self, "includeWallpaper"));
  id v10 = (id)objc_msgSend(v3, "appendName:BOOLValue:", @"includeMeCardOnlySharingProperties", -[CNVCardWritingOptions includeMeCardOnlySharingProperties](self, "includeMeCardOnlySharingProperties"));
  id v11 = (id)objc_msgSend(v3, "appendName:BOOLValue:", @"includePronouns", -[CNVCardWritingOptions includePronouns](self, "includePronouns"));
  id v12 = (id)objc_msgSend(v3, "appendName:BOOLValue:", @"useUnencryptedPronouns", -[CNVCardWritingOptions useUnencryptedPronouns](self, "useUnencryptedPronouns"));
  id v13 = (id)objc_msgSend(v3, "appendName:BOOLValue:", @"compressPhotos", -[CNVCardWritingOptions compressPhotos](self, "compressPhotos"));
  id v14 = (id)objc_msgSend(v3, "appendName:BOOLValue:", @"prefersUncroppedPhotos", -[CNVCardWritingOptions prefersUncroppedPhotos](self, "prefersUncroppedPhotos"));
  id v15 = (id)objc_msgSend(v3, "appendName:BOOLValue:", @"usePhotoReferencesIfAvailable", -[CNVCardWritingOptions usePhotoReferencesIfAvailable](self, "usePhotoReferencesIfAvailable"));
  id v16 = (id)objc_msgSend(v3, "appendName:BOOLValue:", @"shouldSuppressRegulatoryLogging", -[CNVCardWritingOptions shouldSuppressRegulatoryLogging](self, "shouldSuppressRegulatoryLogging"));
  id v17 = (id)objc_msgSend(v3, "appendName:unsignedInteger:", @"maximumEncodingLength", -[CNVCardWritingOptions maximumEncodingLength](self, "maximumEncodingLength"));
  id v18 = (id)objc_msgSend(v3, "appendName:unsignedInteger:", @"maximumImageEncodingLength", -[CNVCardWritingOptions maximumImageEncodingLength](self, "maximumImageEncodingLength"));
  [(CNVCardWritingOptions *)self maximumImageSize];
  v19 = NSStringFromSize(v29);
  id v20 = (id)[v3 appendName:@"maximumImageSize" object:v19];

  v21 = [(CNVCardWritingOptions *)self treatAsUnknownProperties];
  id v22 = (id)[v3 appendName:@"treatAsUnknownProperties" object:v21];

  id v23 = (id)objc_msgSend(v3, "appendName:vCardOutputVersionValue:", @"outputVersion", -[CNVCardWritingOptions outputVersion](self, "outputVersion"));
  v24 = [(CNVCardWritingOptions *)self availableEncodings];
  id v25 = (id)[v3 appendName:@"availableEncodings" object:v24];

  v26 = [v3 build];

  return v26;
}

- (BOOL)includePrivateFields
{
  return self->_includePrivateFields;
}

- (void)setIncludePrivateFields:(BOOL)a3
{
  self->_includePrivateFields = a3;
}

- (BOOL)includePrivateBundleIdentifiers
{
  return self->_includePrivateBundleIdentifiers;
}

- (void)setIncludePrivateBundleIdentifiers:(BOOL)a3
{
  self->_includePrivateBundleIdentifiers = a3;
}

- (BOOL)includeNotes
{
  return self->_includeNotes;
}

- (BOOL)includeUserSettings
{
  return self->_includeUserSettings;
}

- (BOOL)includePhotos
{
  return self->_includePhotos;
}

- (BOOL)includeWallpaper
{
  return self->_includeWallpaper;
}

- (void)setIncludeWallpaper:(BOOL)a3
{
  self->_includeWallpaper = a3;
}

- (BOOL)includeMeCardOnlySharingProperties
{
  return self->_includeMeCardOnlySharingProperties;
}

- (void)setIncludeMeCardOnlySharingProperties:(BOOL)a3
{
  self->_includeMeCardOnlySharingProperties = a3;
}

- (void)setIncludePronouns:(BOOL)a3
{
  self->_includePronouns = a3;
}

- (BOOL)useUnencryptedPronouns
{
  return self->_useUnencryptedPronouns;
}

- (void)setUseUnencryptedPronouns:(BOOL)a3
{
  self->_useUnencryptedPronouns = a3;
}

- (BOOL)compressPhotos
{
  return self->_compressPhotos;
}

- (void)setCompressPhotos:(BOOL)a3
{
  self->_compressPhotos = a3;
}

- (BOOL)prefersUncroppedPhotos
{
  return self->_prefersUncroppedPhotos;
}

- (void)setPrefersUncroppedPhotos:(BOOL)a3
{
  self->_prefersUncroppedPhotos = a3;
}

- (BOOL)usePhotoReferencesIfAvailable
{
  return self->_usePhotoReferencesIfAvailable;
}

- (void)setUsePhotoReferencesIfAvailable:(BOOL)a3
{
  self->_usePhotoReferencesIfAvailable = a3;
}

- (BOOL)shouldSuppressRegulatoryLogging
{
  return self->_shouldSuppressRegulatoryLogging;
}

- (void)setShouldSuppressRegulatoryLogging:(BOOL)a3
{
  self->_shouldSuppressRegulatoryLogging = a3;
}

- (CGSize)maximumImageSize
{
  objc_copyStruct(v4, &self->_maximumImageSize, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setMaximumImageSize:(CGSize)a3
{
  CGSize v3 = a3;
  objc_copyStruct(&self->_maximumImageSize, &v3, 16, 1, 0);
}

- (unint64_t)maximumEncodingLength
{
  return self->_maximumEncodingLength;
}

- (void)setMaximumEncodingLength:(unint64_t)a3
{
  self->_maximumEncodingLength = a3;
}

- (unint64_t)maximumImageEncodingLength
{
  return self->_maximumImageEncodingLength;
}

- (void)setMaximumImageEncodingLength:(unint64_t)a3
{
  self->_maximumImageEncodingLength = a3;
}

- (NSArray)treatAsUnknownProperties
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setTreatAsUnknownProperties:(id)a3
{
}

- (NSArray)availableEncodings
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setAvailableEncodings:(id)a3
{
}

@end