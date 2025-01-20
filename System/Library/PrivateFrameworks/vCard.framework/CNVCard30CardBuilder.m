@interface CNVCard30CardBuilder
+ (id)builderWithPerson:(id)a3;
+ (unint64_t)estimatedBytesAvailableForPhotoWithOptions:(id)a3 serializer:(id)a4;
- (BOOL)addPhotoReferences;
- (BOOL)photoHandled;
- (CNVCard30CardBuilder)initWithPerson:(id)a3;
- (CNVCardLineFactory)lineFactory;
- (CNVCardPerson)person;
- (NSMutableArray)lines;
- (NSMutableArray)unknownProperties;
- (id)retrofitPhoto;
- (int64_t)groupCount;
- (unint64_t)countOfLinesBeforePhoto;
- (void)_addAttributesForCropRects:(id)a3 imageHash:(id)a4 toLine:(id)a5;
- (void)addActivityAlerts;
- (void)addAddressingGrammar;
- (void)addAlternateBirthday;
- (void)addBeginningOfCard;
- (void)addBirthday;
- (void)addCalendarURIs;
- (void)addCardDAVUID;
- (void)addCategories;
- (void)addCompanyMarker;
- (void)addDowntimeWhitelist;
- (void)addEmailAddresses;
- (void)addEndOfCard;
- (void)addFullName;
- (void)addImageBackgroundColorsData;
- (void)addImageHash;
- (void)addImageType;
- (void)addInstantMessagingHandles:(id)a3;
- (void)addInstantMessagingInfo;
- (void)addLegacyInstantMessagingHandles:(id)a3 forService:(id)a4 vCardProperty:(id)a5;
- (void)addLineWithName:(id)a3 value:(id)a4;
- (void)addNameComponents;
- (void)addNameLines;
- (void)addNameOrderMarker;
- (void)addNote;
- (void)addOrganization;
- (void)addOtherDates;
- (void)addPhoneNumbers;
- (void)addPhonemeData;
- (void)addPhotoWithOptions:(id)a3;
- (void)addPostalAddresses;
- (void)addPreferredApplePersonaIdentifier;
- (void)addPreferredLikenessSource;
- (void)addPropertyLinesForValues:(id)a3 generator:(id)a4;
- (void)addRelatedNames;
- (void)addSensitiveContentConfiguration;
- (void)addSharedPhotoDisplayPreference;
- (void)addSocialProfiles;
- (void)addUID;
- (void)addURLs;
- (void)addUnknownProperties;
- (void)addWallpaper;
- (void)addWatchWallpaperImageData;
- (void)buildWithSerializer:(id)a3;
- (void)preparePhotoLineWithOptions:(id)a3;
- (void)removeUnknownPropertiesWithTag:(id)a3;
- (void)setCountOfLinesBeforePhoto:(unint64_t)a3;
- (void)setGroupCount:(int64_t)a3;
- (void)setPhotoHandled:(BOOL)a3;
@end

@implementation CNVCard30CardBuilder

+ (id)builderWithPerson:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithPerson:v4];

  return v5;
}

- (CNVCard30CardBuilder)initWithPerson:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CNVCard30CardBuilder;
  v6 = [(CNVCard30CardBuilder *)&v17 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_person, a3);
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    lines = v7->_lines;
    v7->_lines = v8;

    v7->_groupCount = 0;
    v10 = [v5 unknownProperties];
    uint64_t v11 = [v10 mutableCopy];
    unknownProperties = v7->_unknownProperties;
    v7->_unknownProperties = (NSMutableArray *)v11;

    v7->_countOfLinesBeforePhoto = -1;
    uint64_t v13 = +[CNVCardLineFactory version30LineFactory];
    lineFactory = v7->_lineFactory;
    v7->_lineFactory = (CNVCardLineFactory *)v13;

    v15 = v7;
  }

  return v7;
}

- (void)buildWithSerializer:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  lines = self->_lines;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __44__CNVCard30CardBuilder_buildWithSerializer___block_invoke;
  v9[3] = &unk_1E6C2D0D8;
  v9[4] = self;
  uint64_t v11 = &v12;
  id v6 = v4;
  id v10 = v6;
  [(NSMutableArray *)lines enumerateObjectsUsingBlock:v9];
  retrofitPhoto = (void (**)(id, id, void))self->_retrofitPhoto;
  if (retrofitPhoto)
  {
    retrofitPhoto[2](retrofitPhoto, v6, v13[5]);
    id v8 = self->_retrofitPhoto;
    self->_retrofitPhoto = 0;
  }
  _Block_object_dispose(&v12, 8);
}

void __44__CNVCard30CardBuilder_buildWithSerializer___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v9 = a2;
  if ([*(id *)(a1 + 32) countOfLinesBeforePhoto] == a3)
  {
    id v5 = [*(id *)(a1 + 40) insertionMarker];
    uint64_t v6 = [v5 copy];
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
  [v9 serializeWithStrategy:*(void *)(a1 + 40)];
}

- (void)removeUnknownPropertiesWithTag:(id)a3
{
  unknownProperties = self->_unknownProperties;
  [MEMORY[0x1E4F28F60] predicateWithFormat:@"propertyName != %@", a3];
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(NSMutableArray *)unknownProperties filterUsingPredicate:v4];
}

- (void)addLineWithName:(id)a3 value:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A298] + 16))() & 1) == 0)
  {
    lines = self->_lines;
    id v8 = [(CNVCardLineFactory *)self->_lineFactory stringLineWithName:v9 value:v6];
    [(NSMutableArray *)lines _cn_addNonNilObject:v8];
  }
}

- (void)addBeginningOfCard
{
  [(CNVCard30CardBuilder *)self addLineWithName:@"BEGIN" value:@"VCARD"];
  lines = self->_lines;
  id v4 = [(CNVCardLineFactory *)self->_lineFactory versionPlaceholderLine];
  [(NSMutableArray *)lines _cn_addNonNilObject:v4];

  if (addBeginningOfCard_onceToken != -1) {
    dispatch_once(&addBeginningOfCard_onceToken, &__block_literal_global_7);
  }
  uint64_t v5 = addBeginningOfCard_prodID;
  [(CNVCard30CardBuilder *)self addLineWithName:@"PRODID" value:v5];
}

void __42__CNVCard30CardBuilder_addBeginningOfCard__block_invoke()
{
  id v2 = +[CNVCardProdIdString stringForCurrentBuild];
  uint64_t v0 = [v2 copy];
  v1 = (void *)addBeginningOfCard_prodID;
  addBeginningOfCard_prodID = v0;
}

- (void)addEndOfCard
{
}

- (void)addNameLines
{
  [(CNVCard30CardBuilder *)self addNameComponents];
  [(CNVCard30CardBuilder *)self addFullName];
  v3 = [(CNVCardPerson *)self->_person nickname];
  [(CNVCard30CardBuilder *)self addLineWithName:@"NICKNAME" value:v3];

  id v4 = [(CNVCardPerson *)self->_person maidenName];
  [(CNVCard30CardBuilder *)self addLineWithName:@"X-MAIDENNAME" value:v4];

  uint64_t v5 = [(CNVCardPerson *)self->_person phoneticFirstName];
  [(CNVCard30CardBuilder *)self addLineWithName:@"X-PHONETIC-FIRST-NAME" value:v5];

  id v6 = [(CNVCardPerson *)self->_person phoneticMiddleName];
  [(CNVCard30CardBuilder *)self addLineWithName:@"X-PHONETIC-MIDDLE-NAME" value:v6];

  uint64_t v7 = [(CNVCardPerson *)self->_person phoneticLastName];
  [(CNVCard30CardBuilder *)self addLineWithName:@"X-PHONETIC-LAST-NAME" value:v7];

  id v8 = [(CNVCardPerson *)self->_person pronunciationFirstName];
  [(CNVCard30CardBuilder *)self addLineWithName:@"X-PRONUNCIATION-FIRST-NAME" value:v8];

  id v9 = [(CNVCardPerson *)self->_person pronunciationLastName];
  [(CNVCard30CardBuilder *)self addLineWithName:@"X-PRONUNCIATION-LAST-NAME" value:v9];

  [(CNVCard30CardBuilder *)self addOrganization];
  id v10 = [(CNVCardPerson *)self->_person phoneticOrganization];
  [(CNVCard30CardBuilder *)self addLineWithName:@"X-PHONETIC-ORG" value:v10];

  id v11 = [(CNVCardPerson *)self->_person jobTitle];
  [(CNVCard30CardBuilder *)self addLineWithName:@"TITLE" value:v11];
}

- (void)addNameComponents
{
  id v10 = [MEMORY[0x1E4F1CA48] array];
  v3 = [(CNVCardPerson *)self->_person lastName];
  objc_msgSend(v10, "_cn_addObject:orPlaceholder:", v3, &stru_1F362EAE0);

  id v4 = [(CNVCardPerson *)self->_person firstName];
  objc_msgSend(v10, "_cn_addObject:orPlaceholder:", v4, &stru_1F362EAE0);

  uint64_t v5 = [(CNVCardPerson *)self->_person middleName];
  objc_msgSend(v10, "_cn_addObject:orPlaceholder:", v5, &stru_1F362EAE0);

  id v6 = [(CNVCardPerson *)self->_person title];
  objc_msgSend(v10, "_cn_addObject:orPlaceholder:", v6, &stru_1F362EAE0);

  uint64_t v7 = [(CNVCardPerson *)self->_person suffix];
  objc_msgSend(v10, "_cn_addObject:orPlaceholder:", v7, &stru_1F362EAE0);

  lines = self->_lines;
  id v9 = [(CNVCardLineFactory *)self->_lineFactory arrayLineWithName:@"N" value:v10];
  [(NSMutableArray *)lines _cn_addNonNilObject:v9];
}

- (void)addFullName
{
  id v3 = +[CNVCardNameSerialization compositeNameWithComponents:self->_person];
  [(CNVCard30CardBuilder *)self addLineWithName:@"FN" value:v3];
}

- (void)addAddressingGrammar
{
  id v4 = +[CNVCardLineGenerator generatorWithName:@"X-ADDRESSING-GRAMMAR" groupingCount:&self->_groupCount];
  id v3 = [(CNVCardPerson *)self->_person addressingGrammars];
  [(CNVCard30CardBuilder *)self addPropertyLinesForValues:v3 generator:v4];
}

- (void)addOrganization
{
  id v7 = [MEMORY[0x1E4F1CA48] array];
  id v3 = [(CNVCardPerson *)self->_person organization];
  objc_msgSend(v7, "_cn_addObject:orPlaceholder:", v3, &stru_1F362EAE0);

  id v4 = [(CNVCardPerson *)self->_person department];
  objc_msgSend(v7, "_cn_addObject:orPlaceholder:", v4, &stru_1F362EAE0);

  if ((objc_msgSend(v7, "_cn_all:", *MEMORY[0x1E4F5A298]) & 1) == 0)
  {
    lines = self->_lines;
    id v6 = [(CNVCardLineFactory *)self->_lineFactory arrayLineWithName:@"ORG" value:v7];
    [(NSMutableArray *)lines _cn_addNonNilObject:v6];
  }
}

- (void)addEmailAddresses
{
  id v4 = +[CNVCardLineGenerator emailGeneratorWithName:@"EMAIL" groupingCount:&self->_groupCount];
  id v3 = [(CNVCardPerson *)self->_person emailAddresses];
  [(CNVCard30CardBuilder *)self addPropertyLinesForValues:v3 generator:v4];
}

- (void)addPhoneNumbers
{
  id v4 = +[CNVCardLineGenerator phoneGeneratorWithName:@"TEL" groupingCount:&self->_groupCount];
  id v3 = [(CNVCardPerson *)self->_person phoneNumbers];
  [(CNVCard30CardBuilder *)self addPropertyLinesForValues:v3 generator:v4];
}

- (void)addPostalAddresses
{
  id v4 = +[CNVCardLineGenerator streetAddressGeneratorWithName:@"ADR" groupingCount:&self->_groupCount];
  id v3 = [(CNVCardPerson *)self->_person postalAddresses];
  [(CNVCard30CardBuilder *)self addPropertyLinesForValues:v3 generator:v4];
}

- (void)addSocialProfiles
{
  id v4 = +[CNVCardLineGenerator socialProfileGeneratorWithName:@"X-SOCIALPROFILE" groupingCount:&self->_groupCount];
  id v3 = [(CNVCardPerson *)self->_person socialProfiles];
  [(CNVCard30CardBuilder *)self addPropertyLinesForValues:v3 generator:v4];
}

- (void)addActivityAlerts
{
  id v3 = +[CNVCardLineGenerator activityAlertGeneratorWithName:@"X-ACTIVITY-ALERT" groupingCount:&self->_groupCount];
  id v4 = [(CNVCardPerson *)self->_person activityAlerts];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __41__CNVCard30CardBuilder_addActivityAlerts__block_invoke;
  v6[3] = &unk_1E6C2D100;
  id v7 = v3;
  id v8 = self;
  id v5 = v3;
  [v4 enumerateKeysAndObjectsUsingBlock:v6];
}

void __41__CNVCard30CardBuilder_addActivityAlerts__block_invoke(uint64_t a1, void *a2, void *a3)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v5 = *(void **)(a1 + 32);
  uint64_t v12 = a2;
  v13[0] = a3;
  id v6 = (void *)MEMORY[0x1E4F1C9E8];
  id v7 = a3;
  id v8 = a2;
  id v9 = [v6 dictionaryWithObjects:v13 forKeys:&v12 count:1];
  id v10 = [v5 lineWithValue:v9 label:0];

  id v11 = [*(id *)(a1 + 40) lines];

  objc_msgSend(v11, "_cn_addNonNilObject:", v10);
}

- (void)addNote
{
  id v3 = [(CNVCardPerson *)self->_person note];
  [(CNVCard30CardBuilder *)self addLineWithName:@"NOTE" value:v3];
}

- (void)addURLs
{
  id v4 = +[CNVCardLineGenerator generatorWithName:@"URL" groupingCount:&self->_groupCount];
  id v3 = [(CNVCardPerson *)self->_person urls];
  [(CNVCard30CardBuilder *)self addPropertyLinesForValues:v3 generator:v4];
}

- (void)addCalendarURIs
{
  id v4 = +[CNVCardLineGenerator generatorWithName:@"CALURI" groupingCount:&self->_groupCount];
  id v3 = [(CNVCardPerson *)self->_person calendarURIs];
  [(CNVCard30CardBuilder *)self addPropertyLinesForValues:v3 generator:v4];
}

- (void)addBirthday
{
  id v5 = [(CNVCardPerson *)self->_person birthdayComponents];
  if (v5)
  {
    id v3 = +[CNVCardLineGenerator dateComponentsGeneratorWithName:@"BDAY" groupingCount:0];
    id v4 = [v3 lineWithValue:v5 label:0];
    [(NSMutableArray *)self->_lines _cn_addNonNilObject:v4];
  }
}

- (void)addAlternateBirthday
{
  id v5 = [(CNVCardPerson *)self->_person alternateBirthdayComponents];
  if (v5)
  {
    id v3 = +[CNVCardLineGenerator alternateDateComponentsGeneratorWithName:@"X-ALTBDAY" groupingcount:&self->_groupCount];
    id v4 = [v3 lineWithValue:v5 label:0];
    [(NSMutableArray *)self->_lines _cn_addNonNilObject:v4];
  }
}

- (void)addOtherDates
{
  id v4 = +[CNVCardLineGenerator dateComponentsGeneratorWithName:@"X-ABDATE" groupingCount:&self->_groupCount];
  id v3 = [(CNVCardPerson *)self->_person otherDateComponents];
  [(CNVCard30CardBuilder *)self addPropertyLinesForValues:v3 generator:v4];
}

- (void)addRelatedNames
{
  id v4 = +[CNVCardLineGenerator generatorWithName:@"X-ABRELATEDNAMES" groupingCount:&self->_groupCount];
  id v3 = [(CNVCardPerson *)self->_person relatedNames];
  [(CNVCard30CardBuilder *)self addPropertyLinesForValues:v3 generator:v4];
}

- (void)addCompanyMarker
{
  if ([(CNVCardPerson *)self->_person isCompany])
  {
    [(CNVCard30CardBuilder *)self addLineWithName:@"X-ABShowAs" value:@"COMPANY"];
  }
}

- (void)addNameOrderMarker
{
  int v3 = [(CNVCardPerson *)self->_person nameOrder];
  if (v3 == 1)
  {
    id v4 = @"FIRST";
  }
  else
  {
    if (v3 != 2) {
      return;
    }
    id v4 = @"LAST";
  }
  [(CNVCard30CardBuilder *)self addLineWithName:@"X-ABOrder" value:v4];
}

- (void)addCategories
{
  [(CNVCard30CardBuilder *)self removeUnknownPropertiesWithTag:@"CATEGORIES"];
  id v6 = [(CNVCardPerson *)self->_person namesOfParentGroups];
  if ([v6 count])
  {
    int v3 = [v6 sortedArrayUsingSelector:sel_localizedStandardCompare_];
    lines = self->_lines;
    id v5 = [(CNVCardLineFactory *)self->_lineFactory arrayLineWithName:@"CATEGORIES" value:v3 itemSeparator:@","];
    [(NSMutableArray *)lines _cn_addNonNilObject:v5];
  }
}

- (void)addUnknownProperties
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  int v3 = self->_unknownProperties;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v16;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v15 + 1) + 8 * v7);
        id v9 = objc_alloc(MEMORY[0x1E4F1C9B8]);
        id v10 = objc_msgSend(v8, "originalLine", (void)v15);
        id v11 = (void *)[v9 initWithBase64EncodedString:v10 options:0];

        if (!v11)
        {
          uint64_t v12 = [v8 originalLine];
          id v11 = [v12 dataUsingEncoding:4];
        }
        lines = self->_lines;
        uint64_t v14 = +[CNVCardLine lineWithLiteralValue:v11];
        [(NSMutableArray *)lines _cn_addNonNilObject:v14];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v5);
  }
}

- (void)addCardDAVUID
{
  id v3 = [(CNVCardPerson *)self->_person cardDAVUID];
  [(CNVCard30CardBuilder *)self addLineWithName:@"UID" value:v3];
}

- (void)addUID
{
  id v3 = [(CNVCardPerson *)self->_person uid];
  [(CNVCard30CardBuilder *)self addLineWithName:@"X-ABUID" value:v3];
}

- (void)addPhonemeData
{
  id v3 = [(CNVCardPerson *)self->_person phonemeData];
  [(CNVCard30CardBuilder *)self addLineWithName:@"X-ADDRESSBOOKSERVER-PHONEME-DATA" value:v3];
}

- (void)addPreferredLikenessSource
{
  id v3 = [(CNVCardPerson *)self->_person preferredLikenessSource];
  [(CNVCard30CardBuilder *)self addLineWithName:@"X-APPLE-LIKENESS-SOURCE" value:v3];
}

- (void)addPreferredApplePersonaIdentifier
{
  id v3 = [(CNVCardPerson *)self->_person preferredApplePersonaIdentifier];
  [(CNVCard30CardBuilder *)self addLineWithName:@"X-APPLE-LIKENESS-SERVICE-IDENTIFIER" value:v3];
}

- (void)addDowntimeWhitelist
{
  if ([(CNVCardPerson *)self->_person downtimeWhitelistAuthorization] == 1)
  {
    id v3 = CNVCardGuardianWhitelistAuthorizationAllowed;
  }
  else
  {
    if ([(CNVCardPerson *)self->_person downtimeWhitelistAuthorization] != 2) {
      return;
    }
    id v3 = CNVCardGuardianWhitelistAuthorizationDisallowed;
  }
  uint64_t v4 = *v3;
  [(CNVCard30CardBuilder *)self addLineWithName:@"X-APPLE-GUARDIAN-WHITELISTED" value:v4];
}

- (void)addImageType
{
  id v3 = [(CNVCardPerson *)self->_person imageType];
  [(CNVCard30CardBuilder *)self addLineWithName:@"X-IMAGETYPE" value:v3];
}

- (void)addImageHash
{
  id v4 = [(CNVCardPerson *)self->_person imageHash];
  id v3 = [v4 base64EncodedStringWithOptions:0];
  [(CNVCard30CardBuilder *)self addLineWithName:@"X-IMAGEHASH" value:v3];
}

- (void)addWallpaper
{
  id v4 = [(CNVCardPerson *)self->_person wallpaper];
  id v3 = [v4 base64EncodedStringWithOptions:0];
  [(CNVCard30CardBuilder *)self addLineWithName:@"X-WALLPAPER" value:v3];
}

- (void)addWatchWallpaperImageData
{
  id v4 = [(CNVCardPerson *)self->_person watchWallpaperImageData];
  id v3 = [v4 base64EncodedStringWithOptions:0];
  [(CNVCard30CardBuilder *)self addLineWithName:@"X-WATCH-WALLPAPER-IMAGE-DATA" value:v3];
}

- (void)addSharedPhotoDisplayPreference
{
  unsigned int v3 = [(CNVCardPerson *)self->_person sharedPhotoDisplayPreference] - 1;
  if (v3 <= 2)
  {
    id v4 = off_1E6C2D1E0[v3];
    [(CNVCard30CardBuilder *)self addLineWithName:@"X-SHARED-PHOTO-DISPLAY-PREF" value:v4];
  }
}

- (void)addImageBackgroundColorsData
{
  id v4 = [(CNVCardPerson *)self->_person imageBackgroundColorsData];
  unsigned int v3 = [v4 base64EncodedStringWithOptions:0];
  [(CNVCard30CardBuilder *)self addLineWithName:@"X-IMAGE-BACKGROUND-COLORS-DATA" value:v3];
}

- (void)addSensitiveContentConfiguration
{
  id v4 = [(CNVCardPerson *)self->_person sensitiveContentConfiguration];
  unsigned int v3 = [v4 base64EncodedStringWithOptions:0];
  [(CNVCard30CardBuilder *)self addLineWithName:@"VND-63-SENSITIVE-CONTENT-CONFIG" value:v3];
}

- (void)addInstantMessagingInfo
{
  id v3 = [(CNVCardPerson *)self->_person instantMessagingAddresses];
  [(CNVCard30CardBuilder *)self addLegacyInstantMessagingHandles:v3 forService:@"AIMInstant" vCardProperty:@"X-AIM"];
  [(CNVCard30CardBuilder *)self addLegacyInstantMessagingHandles:v3 forService:@"JabberInstant" vCardProperty:@"X-JABBER"];
  [(CNVCard30CardBuilder *)self addLegacyInstantMessagingHandles:v3 forService:@"MSNInstant" vCardProperty:@"X-MSN"];
  [(CNVCard30CardBuilder *)self addLegacyInstantMessagingHandles:v3 forService:@"YahooInstant" vCardProperty:@"X-YAHOO"];
  [(CNVCard30CardBuilder *)self addLegacyInstantMessagingHandles:v3 forService:@"ICQInstant" vCardProperty:@"X-ICQ"];
  [(CNVCard30CardBuilder *)self addInstantMessagingHandles:v3];
}

- (void)addInstantMessagingHandles:(id)a3
{
  p_groupCount = &self->_groupCount;
  id v5 = a3;
  id v6 = +[CNVCardLineGenerator instantMessagingGeneratorWithName:@"IMPP" groupingCount:p_groupCount];
  [(CNVCard30CardBuilder *)self addPropertyLinesForValues:v5 generator:v6];
}

- (void)addLegacyInstantMessagingHandles:(id)a3 forService:(id)a4 vCardProperty:(id)a5
{
  p_groupCount = &self->_groupCount;
  id v9 = a4;
  id v10 = a3;
  id v13 = +[CNVCardLineGenerator legacyInstantMessagingGeneratorWithName:a5 groupingCount:p_groupCount];
  id v11 = (*((void (**)(uint64_t, void *))sFilterIMPPsForService + 2))((uint64_t)sFilterIMPPsForService, v9);

  uint64_t v12 = objc_msgSend(v10, "_cn_filter:", v11);

  [(CNVCard30CardBuilder *)self addPropertyLinesForValues:v12 generator:v13];
}

- (void)addPhotoWithOptions:(id)a3
{
  id v4 = a3;
  if ([v4 includePhotos]
    && (![v4 usePhotoReferencesIfAvailable]
     || ![(CNVCard30CardBuilder *)self addPhotoReferences]))
  {
    [(CNVCard30CardBuilder *)self preparePhotoLineWithOptions:v4];
  }
}

- (BOOL)addPhotoReferences
{
  id v3 = [(CNVCardPerson *)self->_person imageReferences];
  if ([v3 count])
  {
    id v4 = [v3 objectAtIndex:0];
    uint64_t v5 = [v4 length];
    BOOL v6 = v5 != 0;
    if (v5)
    {
      uint64_t v7 = [(CNVCardLineFactory *)self->_lineFactory stringLineWithName:@"PHOTO" value:v4];
      [v7 addParameterWithName:@"VALUE" value:@"uri"];
      id v8 = [(CNVCardPerson *)self->_person memojiMetadata];
      id v9 = [v8 base64EncodedStringWithOptions:0];
      [v7 addParameterWithName:@"VND-63-MEMOJI-DETAILS" value:v9];

      id v10 = [(CNVCardPerson *)self->_person largeImageCropRects];
      [(CNVCard30CardBuilder *)self _addAttributesForCropRects:v10 imageHash:0 toLine:v7];
      [(CNVCard30CardBuilder *)self addImageType];
      [(CNVCard30CardBuilder *)self addImageHash];
      [(NSMutableArray *)self->_lines _cn_addNonNilObject:v7];
      self->_photoHandled = 1;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)preparePhotoLineWithOptions:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self->_person;
  BOOL v6 = self->_lineFactory;
  uint64_t v7 = self;
  v7->_countOfLinesBeforePhoto = [(NSMutableArray *)v7->_lines count];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __52__CNVCard30CardBuilder_preparePhotoLineWithOptions___block_invoke;
  v14[3] = &unk_1E6C2D170;
  id v15 = v4;
  long long v16 = v5;
  long long v17 = v6;
  long long v18 = v7;
  id v8 = v7;
  id v9 = v6;
  id v10 = v5;
  id v11 = v4;
  uint64_t v12 = [v14 copy];
  id retrofitPhoto = v8->_retrofitPhoto;
  v8->_id retrofitPhoto = (id)v12;
}

void __52__CNVCard30CardBuilder_preparePhotoLineWithOptions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v27 = a2;
  id v5 = a3;
  unint64_t v6 = +[CNVCard30CardBuilder estimatedBytesAvailableForPhotoWithOptions:*(void *)(a1 + 32) serializer:v27];
  if (v6)
  {
    uint64_t v7 = [[CNVCard30PHOTOHelper alloc] initWithPerson:*(void *)(a1 + 40) options:*(void *)(a1 + 32) maximumDataLength:v6];
    id v8 = [(CNVCard30PHOTOHelper *)v7 bestEffortImage];
    uint64_t v9 = *MEMORY[0x1E4F5A268];
    id v10 = [v8 data];
    LOBYTE(v9) = (*(uint64_t (**)(uint64_t, void *))(v9 + 16))(v9, v10);

    if ((v9 & 1) == 0)
    {
      id v11 = [v8 data];
      uint64_t v12 = objc_msgSend(v11, "_cn_md5Hash");

      id v13 = *(void **)(a1 + 48);
      uint64_t v14 = [v8 data];
      id v15 = [v13 dataLineWithName:@"PHOTO" value:v14];

      long long v16 = *(void **)(a1 + 56);
      long long v17 = [v8 cropRects];
      [v16 _addAttributesForCropRects:v17 imageHash:v12 toLine:v15];

      long long v18 = [*(id *)(a1 + 40) memojiMetadata];
      v19 = [v18 base64EncodedStringWithOptions:0];
      [v15 addParameterWithName:@"VND-63-MEMOJI-DETAILS" value:v19];

      [v27 insertLine:v15 atMarker:v5];
      uint64_t v20 = *(void **)(a1 + 48);
      v21 = [*(id *)(a1 + 40) imageType];
      v22 = [v20 stringLineWithName:@"X-IMAGETYPE" value:v21];
      [v27 insertLine:v22 atMarker:v5];

      v23 = [*(id *)(a1 + 40) imageType];

      if (v23)
      {
        v24 = *(void **)(a1 + 48);
        v25 = [v12 base64EncodedStringWithOptions:0];
        v26 = [v24 stringLineWithName:@"X-IMAGEHASH" value:v25];
        [v27 insertLine:v26 atMarker:v5];
      }
    }
  }
}

+ (unint64_t)estimatedBytesAvailableForPhotoWithOptions:(id)a3 serializer:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 maximumEncodingLength])
  {
    unint64_t v7 = [v6 estimatedDataLength] + 129;
    if (v7 <= [v5 maximumEncodingLength]) {
      unint64_t v8 = objc_msgSend(MEMORY[0x1E4F1C9B8], "_cn_maxDataLengthFittingInBase64EncodingLength:", objc_msgSend(v5, "maximumEncodingLength") - v7);
    }
    else {
      unint64_t v8 = 0;
    }
  }
  else
  {
    unint64_t v8 = -1;
  }
  if ([v5 maximumImageEncodingLength])
  {
    unint64_t v9 = objc_msgSend(MEMORY[0x1E4F1C9B8], "_cn_maxDataLengthFittingInBase64EncodingLength:", objc_msgSend(v5, "maximumImageEncodingLength"));
    uint64_t v10 = [v5 maximumEncodingLength];
    if (v8 >= v9) {
      unint64_t v11 = v9;
    }
    else {
      unint64_t v11 = v8;
    }
    if (v10) {
      unint64_t v8 = v11;
    }
    else {
      unint64_t v8 = v9;
    }
  }

  return v8;
}

- (void)_addAttributesForCropRects:(id)a3 imageHash:(id)a4 toLine:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 count])
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __68__CNVCard30CardBuilder__addAttributesForCropRects_imageHash_toLine___block_invoke;
    v11[3] = &unk_1E6C2D198;
    id v12 = v9;
    id v13 = self;
    id v14 = v10;
    [v8 enumerateKeysAndObjectsUsingBlock:v11];
  }
}

uint64_t __68__CNVCard30CardBuilder__addAttributesForCropRects_imageHash_toLine___block_invoke(id *a1, void *a2, void *a3)
{
  id v20 = a2;
  [a3 rectValue];
  NSRect v23 = NSIntegralRect(v22);
  double x = v23.origin.x;
  double y = v23.origin.y;
  double width = v23.size.width;
  double height = v23.size.height;
  if (!NSEqualRects(*MEMORY[0x1E4F28AD8], v23))
  {
    id v9 = objc_msgSend(NSString, "stringWithFormat:", @"%ld&%ld&%ld&%ld", (uint64_t)x, (uint64_t)y, (uint64_t)width, (uint64_t)height);
    uint64_t v10 = *MEMORY[0x1E4F5A298];
    if (((*(uint64_t (**)(void, void *))(*MEMORY[0x1E4F5A298] + 16))(*MEMORY[0x1E4F5A298], v9) & 1) == 0)
    {
      id v11 = a1[4];
      if (!a1[4])
      {
        id v12 = [a1[5] person];
        uint64_t v13 = [v12 largeImageHashOfType:v20];

        id v11 = (id)v13;
      }
      id v14 = objc_msgSend(v11, "_cn_encodeVCardBase64DataWithInitialLength:", 20);
      id v15 = (void *)[[NSString alloc] initWithData:v14 encoding:1];
      if (((*(uint64_t (**)(uint64_t, void *))(v10 + 16))(v10, v15) & 1) == 0)
      {
        long long v16 = NSString;
        long long v17 = +[CNVCardParameterEncoder encodeParameterValue:v20];
        long long v18 = [v16 stringWithFormat:@"%@&%@&%@", v17, v9, v15];

        [a1[6] addParameterWithName:@"X-ABCROP-RECTANGLE" value:v18];
      }
    }
  }
  return MEMORY[0x1F41817F8]();
}

- (void)addPropertyLinesForValues:(id)a3 generator:(id)a4
{
  id v6 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __60__CNVCard30CardBuilder_addPropertyLinesForValues_generator___block_invoke;
  v11[3] = &unk_1E6C2D1C0;
  id v12 = v6;
  id v7 = v6;
  id v8 = objc_msgSend(a3, "_cn_map:", v11);
  id v9 = objc_msgSend(v8, "_cn_filter:", &__block_literal_global_222);

  uint64_t v10 = [v9 firstObject];
  [v7 addPrimaryValueMarkerToLine:v10];

  [(NSMutableArray *)self->_lines addObjectsFromArray:v9];
}

id __60__CNVCard30CardBuilder_addPropertyLinesForValues_generator___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v3 value];
  id v5 = [v3 label];

  id v6 = [v2 lineWithValue:v4 label:v5];

  return v6;
}

void *__60__CNVCard30CardBuilder_addPropertyLinesForValues_generator___block_invoke_2()
{
  return (*(void *(**)(void *__return_ptr))(*MEMORY[0x1E4F5A280] + 16))(MEMORY[0x1E4F5A280]);
}

- (CNVCardPerson)person
{
  return self->_person;
}

- (NSMutableArray)lines
{
  return self->_lines;
}

- (int64_t)groupCount
{
  return self->_groupCount;
}

- (void)setGroupCount:(int64_t)a3
{
  self->_groupCount = a3;
}

- (unint64_t)countOfLinesBeforePhoto
{
  return self->_countOfLinesBeforePhoto;
}

- (void)setCountOfLinesBeforePhoto:(unint64_t)a3
{
  self->_countOfLinesBeforePhoto = a3;
}

- (id)retrofitPhoto
{
  return self->_retrofitPhoto;
}

- (BOOL)photoHandled
{
  return self->_photoHandled;
}

- (void)setPhotoHandled:(BOOL)a3
{
  self->_photoHandled = a3;
}

- (NSMutableArray)unknownProperties
{
  return self->_unknownProperties;
}

- (CNVCardLineFactory)lineFactory
{
  return self->_lineFactory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lineFactory, 0);
  objc_storeStrong((id *)&self->_unknownProperties, 0);
  objc_storeStrong(&self->_retrofitPhoto, 0);
  objc_storeStrong((id *)&self->_lines, 0);
  objc_storeStrong((id *)&self->_person, 0);
}

@end