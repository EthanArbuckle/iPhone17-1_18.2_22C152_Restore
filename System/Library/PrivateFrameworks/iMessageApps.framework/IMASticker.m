@interface IMASticker
+ (double)screenScale;
- (IMASticker)initWithFileURL:(id)a3 stickerName:(id)a4 accessibilityLabel:(id)a5 representations:(id)a6;
- (IMASticker)initWithStickerIdentifier:(id)a3 fileURL:(id)a4 representations:(id)a5 effectType:(id)a6 externalURI:(id)a7 stickerName:(id)a8 accessibilityLabel:(id)a9 accessibilityName:(id)a10 searchText:(id)a11 sanitizedPrompt:(id)a12 metadata:(id)a13 ckAttributionInfo:(id)a14;
- (NSArray)representations;
- (NSData)metadata;
- (NSDictionary)ckAttributionInfo;
- (NSNumber)stickerEffectType;
- (NSString)accessibilityLabel;
- (NSString)accessibilityName;
- (NSString)externalURI;
- (NSString)sanitizedPrompt;
- (NSString)searchText;
- (NSString)stickerIdentifier;
- (NSString)stickerName;
- (NSURL)fileURL;
- (void)setRepresentations:(id)a3;
@end

@implementation IMASticker

+ (double)screenScale
{
  v2 = [MEMORY[0x263F31AB0] sharedBehaviors];
  [v2 stickerScreenScale];
  double v4 = v3;

  return v4;
}

- (IMASticker)initWithFileURL:(id)a3 stickerName:(id)a4 accessibilityLabel:(id)a5 representations:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v25.receiver = self;
  v25.super_class = (Class)IMASticker;
  v14 = [(IMASticker *)&v25 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    fileURL = v14->_fileURL;
    v14->_fileURL = (NSURL *)v15;

    uint64_t v17 = [v11 copy];
    stickerName = v14->_stickerName;
    v14->_stickerName = (NSString *)v17;

    uint64_t v19 = [v12 copy];
    accessibilityLabel = v14->_accessibilityLabel;
    v14->_accessibilityLabel = (NSString *)v19;

    uint64_t v21 = [v13 copy];
    representations = v14->_representations;
    v14->_representations = (NSArray *)v21;

    externalURI = v14->_externalURI;
    v14->_externalURI = 0;
  }
  return v14;
}

- (IMASticker)initWithStickerIdentifier:(id)a3 fileURL:(id)a4 representations:(id)a5 effectType:(id)a6 externalURI:(id)a7 stickerName:(id)a8 accessibilityLabel:(id)a9 accessibilityName:(id)a10 searchText:(id)a11 sanitizedPrompt:(id)a12 metadata:(id)a13 ckAttributionInfo:(id)a14
{
  id v19 = a3;
  id v20 = a4;
  id v21 = a5;
  id v58 = a6;
  id v57 = a7;
  id v56 = a8;
  v22 = v20;
  id v23 = a9;
  id v24 = a10;
  id v25 = a11;
  id v26 = a12;
  id v27 = a13;
  id v28 = a14;
  v59.receiver = self;
  v59.super_class = (Class)IMASticker;
  v29 = [(IMASticker *)&v59 init];
  if (v29)
  {
    uint64_t v30 = [v19 copy];
    stickerIdentifier = v29->_stickerIdentifier;
    v29->_stickerIdentifier = (NSString *)v30;

    uint64_t v32 = [v22 copy];
    fileURL = v29->_fileURL;
    v29->_fileURL = (NSURL *)v32;

    uint64_t v34 = [v21 copy];
    representations = v29->_representations;
    v29->_representations = (NSArray *)v34;

    uint64_t v36 = [v58 copy];
    stickerEffectType = v29->_stickerEffectType;
    v29->_stickerEffectType = (NSNumber *)v36;

    uint64_t v38 = [v56 copy];
    stickerName = v29->_stickerName;
    v29->_stickerName = (NSString *)v38;

    uint64_t v40 = [v57 copy];
    externalURI = v29->_externalURI;
    v29->_externalURI = (NSString *)v40;

    uint64_t v42 = [v23 copy];
    accessibilityLabel = v29->_accessibilityLabel;
    v29->_accessibilityLabel = (NSString *)v42;

    uint64_t v44 = [v24 copy];
    accessibilityName = v29->_accessibilityName;
    v29->_accessibilityName = (NSString *)v44;

    uint64_t v46 = [v25 copy];
    searchText = v29->_searchText;
    v29->_searchText = (NSString *)v46;

    uint64_t v48 = [v26 copy];
    sanitizedPrompt = v29->_sanitizedPrompt;
    v29->_sanitizedPrompt = (NSString *)v48;

    uint64_t v50 = [v27 copy];
    metadata = v29->_metadata;
    v29->_metadata = (NSData *)v50;

    uint64_t v52 = [v28 copy];
    ckAttributionInfo = v29->_ckAttributionInfo;
    v29->_ckAttributionInfo = (NSDictionary *)v52;
  }
  return v29;
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (NSString)stickerName
{
  return self->_stickerName;
}

- (NSString)accessibilityLabel
{
  return self->_accessibilityLabel;
}

- (NSString)accessibilityName
{
  return self->_accessibilityName;
}

- (NSString)searchText
{
  return self->_searchText;
}

- (NSString)sanitizedPrompt
{
  return self->_sanitizedPrompt;
}

- (NSString)stickerIdentifier
{
  return self->_stickerIdentifier;
}

- (NSArray)representations
{
  return self->_representations;
}

- (void)setRepresentations:(id)a3
{
}

- (NSString)externalURI
{
  return self->_externalURI;
}

- (NSNumber)stickerEffectType
{
  return self->_stickerEffectType;
}

- (NSData)metadata
{
  return self->_metadata;
}

- (NSDictionary)ckAttributionInfo
{
  return self->_ckAttributionInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ckAttributionInfo, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_stickerEffectType, 0);
  objc_storeStrong((id *)&self->_externalURI, 0);
  objc_storeStrong((id *)&self->_representations, 0);
  objc_storeStrong((id *)&self->_stickerIdentifier, 0);
  objc_storeStrong((id *)&self->_sanitizedPrompt, 0);
  objc_storeStrong((id *)&self->_searchText, 0);
  objc_storeStrong((id *)&self->_accessibilityName, 0);
  objc_storeStrong((id *)&self->_accessibilityLabel, 0);
  objc_storeStrong((id *)&self->_stickerName, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
}

@end