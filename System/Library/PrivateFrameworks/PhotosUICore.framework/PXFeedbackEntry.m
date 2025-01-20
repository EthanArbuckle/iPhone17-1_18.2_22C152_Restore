@interface PXFeedbackEntry
+ (BOOL)supportsSecureCoding;
+ (id)createFakeTestEntry;
+ (id)createFakeTestFeedbackDictionary;
+ (id)negativeAlchemistFeedbackForImageQualityKeys;
+ (id)negativeFeedbackForAutoLoopKeys;
+ (id)negativeFeedbackForImageQualityKeys;
+ (id)negativeFeedbackForMemoriesKeys;
+ (id)negativeFeedbackForMemoryDetailsKeys;
+ (id)positiveFeedbackForAutoLoopKeys;
+ (id)positiveFeedbackForImageQualityKeys;
+ (id)positiveFeedbackForMemoriesKeys;
+ (id)positiveFeedbackForMemoryDetailsKeys;
- (BOOL)alreadyCollected;
- (BOOL)userLikedResults;
- (NSDate)timestamp;
- (NSMutableDictionary)feedbackItemsDict;
- (NSString)appVersion;
- (NSString)systemID;
- (PXFeedbackEntry)init;
- (PXFeedbackEntry)initWithCoder:(id)a3;
- (PXFeedbackEntry)initWithSystemID:(id)a3 timestamp:(id)a4;
- (id)asTextForItemKey:(id)a3;
- (id)longDescription;
- (id)osKeyForItemKey:(id)a3;
- (id)uniqueID;
- (int64_t)generalFeedback;
- (void)encodeWithCoder:(id)a3;
- (void)setAlreadyCollected:(BOOL)a3;
- (void)setAppVersion:(id)a3;
- (void)setFeedbackItemsDict:(id)a3;
- (void)setGeneralFeedback:(int64_t)a3;
- (void)setSystemID:(id)a3;
- (void)setTimestamp:(id)a3;
@end

@implementation PXFeedbackEntry

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appVersion, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_systemID, 0);
  objc_storeStrong((id *)&self->_feedbackItemsDict, 0);
  objc_storeStrong((id *)&self->_feedbackItemDetails, 0);
}

- (void)setAppVersion:(id)a3
{
}

- (NSString)appVersion
{
  return self->_appVersion;
}

- (void)setAlreadyCollected:(BOOL)a3
{
  self->_alreadyCollected = a3;
}

- (BOOL)alreadyCollected
{
  return self->_alreadyCollected;
}

- (void)setTimestamp:(id)a3
{
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setSystemID:(id)a3
{
}

- (NSString)systemID
{
  return self->_systemID;
}

- (void)setGeneralFeedback:(int64_t)a3
{
  self->_generalFeedback = a3;
}

- (int64_t)generalFeedback
{
  return self->_generalFeedback;
}

- (void)setFeedbackItemsDict:(id)a3
{
}

- (NSMutableDictionary)feedbackItemsDict
{
  return self->_feedbackItemsDict;
}

- (id)longDescription
{
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__62048;
  v34 = __Block_byref_object_dispose__62049;
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v35 = [v3 stringWithFormat:@"<%@: %p>]\n", v5, self];

  v6 = (void *)v31[5];
  v7 = [(PXFeedbackEntry *)self uniqueID];
  uint64_t v8 = [v6 stringByAppendingFormat:@"   - uniqueID  : %@\n", v7];
  v9 = (void *)v31[5];
  v31[5] = v8;

  v10 = (void *)v31[5];
  v11 = [(PXFeedbackEntry *)self systemID];
  uint64_t v12 = [v10 stringByAppendingFormat:@"   - systemID  : %@\n", v11];
  v13 = (void *)v31[5];
  v31[5] = v12;

  v14 = (void *)v31[5];
  v15 = [(PXFeedbackEntry *)self appVersion];
  uint64_t v16 = [v14 stringByAppendingFormat:@"   - appVersion: %@\n", v15];
  v17 = (void *)v31[5];
  v31[5] = v16;

  v18 = (void *)v31[5];
  v19 = [(PXFeedbackEntry *)self timestamp];
  uint64_t v20 = [v18 stringByAppendingFormat:@"   - timestamp : %@\n", v19];
  v21 = (void *)v31[5];
  v31[5] = v20;

  uint64_t v22 = objc_msgSend((id)v31[5], "stringByAppendingFormat:", @"   - generalFB : %ld\n", -[PXFeedbackEntry generalFeedback](self, "generalFeedback"));
  v23 = (void *)v31[5];
  v31[5] = v22;

  uint64_t v24 = [(id)v31[5] stringByAppendingFormat:@"\n\n"];
  v25 = (void *)v31[5];
  v31[5] = v24;

  v26 = [(PXFeedbackEntry *)self feedbackItemsDict];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __34__PXFeedbackEntry_longDescription__block_invoke;
  v29[3] = &unk_1E5DCB3E0;
  v29[4] = &v30;
  [v26 enumerateKeysAndObjectsUsingBlock:v29];

  id v27 = (id)v31[5];
  _Block_object_dispose(&v30, 8);

  return v27;
}

void __34__PXFeedbackEntry_longDescription__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  if ([v5 isEqualToNumber:MEMORY[0x1E4F1CC38]])
  {
    v6 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    int v7 = [v5 isEqualToNumber:MEMORY[0x1E4F1CC38]];
    uint64_t v8 = @"No";
    if (v7) {
      uint64_t v8 = @"Yes";
    }
    uint64_t v9 = [v6 stringByAppendingFormat:@"   - %@  : \t\t\t%@\n", v12, v8];
    uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
    v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }
}

- (id)asTextForItemKey:(id)a3
{
  id v4 = a3;
  id v5 = [(NSDictionary *)self->_feedbackItemDetails objectForKeyedSubscript:v4];
  v6 = [v5 objectForKeyedSubscript:@"asText"];
  if (![v6 length]) {
    NSLog(&cfstr_ErrorUknownIte.isa, v4);
  }

  return v6;
}

- (id)osKeyForItemKey:(id)a3
{
  id v4 = a3;
  id v5 = [(NSDictionary *)self->_feedbackItemDetails objectForKeyedSubscript:v4];
  v6 = [v5 objectForKeyedSubscript:@"osKey"];
  if (![v6 length]) {
    NSLog(&cfstr_ErrorUknownIte.isa, v4);
  }

  return v6;
}

- (BOOL)userLikedResults
{
  v10[2] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v10[0] = kPXFeedbackUserLikedCollectionKey;
  v10[1] = kPXFeedbackUserLikedMemoriesKey;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __35__PXFeedbackEntry_userLikedResults__block_invoke;
  v5[3] = &unk_1E5DB4C58;
  v5[4] = self;
  v5[5] = &v6;
  [v3 enumerateObjectsUsingBlock:v5];
  LOBYTE(self) = *((unsigned char *)v7 + 24) != 0;

  _Block_object_dispose(&v6, 8);
  return (char)self;
}

void __35__PXFeedbackEntry_userLikedResults__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = *(void **)(a1 + 32);
  id v7 = a2;
  uint64_t v8 = [v6 feedbackItemsDict];
  char v9 = [v8 objectForKeyedSubscript:v7];

  LODWORD(v7) = [v9 isEqualToNumber:MEMORY[0x1E4F1CC38]];
  if (v7)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
}

- (id)uniqueID
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v3 setDateFormat:@"yyyyMMdd-HHmmss.SSSSS"];
  id v4 = [(PXFeedbackEntry *)self timestamp];
  id v5 = [v3 stringFromDate:v4];

  uint64_t v6 = NSString;
  id v7 = [(PXFeedbackEntry *)self systemID];
  uint64_t v8 = [v7 substringToIndex:6];
  char v9 = [v6 stringWithFormat:@"%@-%@", v8, v5];

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  id v4 = [(PXFeedbackEntry *)self feedbackItemsDict];
  [v8 encodeObject:v4 forKey:@"feedbackItemsDict"];

  objc_msgSend(v8, "encodeInt:forKey:", -[PXFeedbackEntry generalFeedback](self, "generalFeedback"), @"generalFeedback");
  id v5 = [(PXFeedbackEntry *)self systemID];
  [v8 encodeObject:v5 forKey:@"systemID"];

  uint64_t v6 = [(PXFeedbackEntry *)self timestamp];
  [v8 encodeObject:v6 forKey:@"timestamp"];

  id v7 = [(PXFeedbackEntry *)self appVersion];
  [v8 encodeObject:v7 forKey:@"appVersion"];

  objc_msgSend(v8, "encodeBool:forKey:", -[PXFeedbackEntry alreadyCollected](self, "alreadyCollected"), @"alreadyCollected");
}

- (PXFeedbackEntry)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PXFeedbackEntry;
  id v5 = [(PXFeedbackEntry *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodePropertyListForKey:@"feedbackItemsDict"];
    [(PXFeedbackEntry *)v5 setFeedbackItemsDict:v6];

    id v7 = [(PXFeedbackEntry *)v5 feedbackItemsDict];

    if (!v7)
    {
      id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      [(PXFeedbackEntry *)v5 setFeedbackItemsDict:v8];
    }
    -[PXFeedbackEntry setGeneralFeedback:](v5, "setGeneralFeedback:", (int)[v4 decodeIntForKey:@"generalFeedback"]);
    char v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"systemID"];
    [(PXFeedbackEntry *)v5 setSystemID:v9];

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timestamp"];
    [(PXFeedbackEntry *)v5 setTimestamp:v10];

    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appVersion"];
    [(PXFeedbackEntry *)v5 setAppVersion:v11];

    -[PXFeedbackEntry setAlreadyCollected:](v5, "setAlreadyCollected:", [v4 decodeBoolForKey:@"alreadyCollected"]);
  }

  return v5;
}

- (PXFeedbackEntry)initWithSystemID:(id)a3 timestamp:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PXFeedbackEntry *)self init];
  char v9 = v8;
  if (v8)
  {
    [(PXFeedbackEntry *)v8 setGeneralFeedback:0];
    [(PXFeedbackEntry *)v9 setSystemID:v6];
    [(PXFeedbackEntry *)v9 setTimestamp:v7];
    [(PXFeedbackEntry *)v9 setAlreadyCollected:0];
    uint64_t v10 = [MEMORY[0x1E4F28B50] mainBundle];
    v11 = [v10 infoDictionary];
    id v12 = [v11 objectForKey:@"CFBundleShortVersionString"];

    objc_super v13 = [MEMORY[0x1E4F28B50] mainBundle];
    v14 = [v13 infoDictionary];
    v15 = [v14 objectForKey:*MEMORY[0x1E4F1D020]];

    uint64_t v16 = [NSString stringWithFormat:@"%@(%@)", v12, v15];
    appVersion = v9->_appVersion;
    v9->_appVersion = (NSString *)v16;
  }
  return v9;
}

- (PXFeedbackEntry)init
{
  v9[53] = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)PXFeedbackEntry;
  v2 = [(PXFeedbackEntry *)&v7 init];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [(PXFeedbackEntry *)v2 setFeedbackItemsDict:v3];

    v8[0] = kPXFeedbackUserLikedCollectionKey;
    v8[1] = kPXFeedbackUserDislikedCollectionKey;
    v9[0] = &unk_1F02DA9D8;
    v9[1] = &unk_1F02DAA00;
    v8[2] = kPXFeedbackUserLikedDetailViewSourceYear;
    v8[3] = kPXFeedbackUserLikedDetailViewSourceMoment;
    v9[2] = &unk_1F02DAA28;
    v9[3] = &unk_1F02DAA50;
    v8[4] = kPXFeedbackUserLikedDetailViewSourceMemory;
    v8[5] = kPXFeedbackUserLikedDetailViewSourceAlbum;
    v9[4] = &unk_1F02DAA78;
    v9[5] = &unk_1F02DAAA0;
    v8[6] = kPXFeedbackUserLikedDetailViewSourceFace;
    v8[7] = kPXFeedbackUserLikedDetailViewSourceCollection;
    v9[6] = &unk_1F02DAAC8;
    v9[7] = &unk_1F02DAAF0;
    v8[8] = kPXFeedbackUserLikedDetailViewSourceRelated;
    v8[9] = kPXFeedbackUserLikedDetailViewReasonGoodMovie;
    v9[8] = &unk_1F02DAB18;
    v9[9] = &unk_1F02DAB40;
    v8[10] = kPXFeedbackUserLikedDetailViewReasonGoodSelectionOfPhotosInGrid;
    v8[11] = kPXFeedbackUserLikedDetailViewReasonRediscoveredOldPhotos;
    v9[10] = &unk_1F02DAB68;
    v9[11] = &unk_1F02DAB90;
    v8[12] = kPXFeedbackUserLikedDetailViewReasonRediscoveredPeople;
    v8[13] = kPXFeedbackUserLikedDetailViewReasonRediscoveredPlace;
    v9[12] = &unk_1F02DABB8;
    v9[13] = &unk_1F02DABE0;
    v8[14] = kPXFeedbackUserLikedDetailViewReasonRediscoveredEvent;
    v8[15] = kPXFeedbackUserLikedDetailViewReasonMeaningfulCollection;
    v9[14] = &unk_1F02DAC08;
    v9[15] = &unk_1F02DAC30;
    v8[16] = kPXFeedbackUserLikedDetailViewReasonManyMeaningfulRelatedCollectionsIncluded;
    v8[17] = kPXFeedbackUserLikedDetailViewReasonGoodKeyPhotosRepresentingCollectionsInRelated;
    v9[16] = &unk_1F02DAC58;
    v9[17] = &unk_1F02DAC80;
    v8[18] = kPXFeedbackUserDislikedDetailViewSourceYear;
    v8[19] = kPXFeedbackUserDislikedDetailViewSourceMoment;
    v9[18] = &unk_1F02DACA8;
    v9[19] = &unk_1F02DACD0;
    v8[20] = kPXFeedbackUserDislikedDetailViewSourceMemory;
    v8[21] = kPXFeedbackUserDislikedDetailViewSourceAlbum;
    v9[20] = &unk_1F02DACF8;
    v9[21] = &unk_1F02DAD20;
    v8[22] = kPXFeedbackUserDislikedDetailViewSourceFace;
    v8[23] = kPXFeedbackUserDislikedDetailViewSourceCollection;
    v9[22] = &unk_1F02DAD48;
    v9[23] = &unk_1F02DAD70;
    v8[24] = kPXFeedbackUserDislikedDetailViewSourceRelated;
    v8[25] = kPXFeedbackUserDislikedDetailViewReasonNotSoGoodMovie;
    v9[24] = &unk_1F02DAD98;
    v9[25] = &unk_1F02DADC0;
    v8[26] = kPXFeedbackUserDislikedDetailViewReasonNotSoInterestingSelectionOfPhotos;
    v8[27] = kPXFeedbackUserDislikedDetailViewReasonTooManyJunkPhotosInGrid;
    v9[26] = &unk_1F02DADE8;
    v9[27] = &unk_1F02DAE10;
    v8[28] = kPXFeedbackUserDislikedDetailViewReasonTooManySimilarPhotosInGrid;
    v8[29] = kPXFeedbackUserDislikedDetailViewReasonTooManyBadQualityPhotosInGrid;
    v9[28] = &unk_1F02DAE38;
    v9[29] = &unk_1F02DAE60;
    v8[30] = kPXFeedbackUserDislikedDetailViewReasonTooManyPhotosInGrid;
    v8[31] = kPXFeedbackUserDislikedDetailViewReasonNotEnoughPhotosInGrid;
    v9[30] = &unk_1F02DAE88;
    v9[31] = &unk_1F02DAEB0;
    v8[32] = kPXFeedbackUserDislikedDetailViewReasonNotVeryMeaningfulCollection;
    v8[33] = kPXFeedbackUserDislikedDetailViewReasonRelatedCollectionsMissing;
    v9[32] = &unk_1F02DAED8;
    v9[33] = &unk_1F02DAF00;
    v8[34] = kPXFeedbackUserDislikedDetailViewReasonRelatedCollectionsNotRelated;
    v8[35] = kPXFeedbackUserDislikedDetailViewReasonNotSoGoodPhotosRepresentingCollectionsInRelated;
    v9[34] = &unk_1F02DAF28;
    v9[35] = &unk_1F02DAF50;
    v8[36] = kPXFeedbackUserLikedMemoriesKey;
    v8[37] = kPXFeedbackUserDislikedMemoriesKey;
    v9[36] = &unk_1F02DAF78;
    v9[37] = &unk_1F02DAFA0;
    v8[38] = kPXFeedbackMeaningfulMemoriesKey;
    v8[39] = kPXFeedbackGoodVarietyInMemoriesKey;
    v9[38] = &unk_1F02DAFC8;
    v9[39] = &unk_1F02DAFF0;
    v8[40] = kPXFeedbackGoodSelectionsOfMemoriesRelatedToYourCurrentLocationAndPeopleNearYouKey;
    v8[41] = kPXFeedbackGoodAmountOfMemoriesKey;
    v9[40] = &unk_1F02DB018;
    v9[41] = &unk_1F02DB040;
    v8[42] = kPXFeedbackRediscoveredOldMemoriesKey;
    v8[43] = kPXFeedbackRediscoveredRecentMemoriesKey;
    v9[42] = &unk_1F02DB068;
    v9[43] = &unk_1F02DB090;
    v8[44] = kPXFeedbackRediscoveredPeopleKey;
    v8[45] = kPXFeedbackRediscoveredPlaceKey;
    v9[44] = &unk_1F02DB0B8;
    v9[45] = &unk_1F02DB0E0;
    v8[46] = kPXFeedbackRediscoveredEventKey;
    v8[47] = kPXFeedbackGoodKeyPhotosRepresentingMemoriesKey;
    v9[46] = &unk_1F02DB108;
    v9[47] = &unk_1F02DB130;
    v8[48] = kPXFeedbackNotVeryMeaningfulMemoriesKey;
    v8[49] = kPXFeedbackLackOfVarietyInMemoriesKey;
    v9[48] = &unk_1F02DB158;
    v9[49] = &unk_1F02DB180;
    v8[50] = kPXFeedbackPoorSelectionOfMemoriesRelatedToYourCurrentLocationAndPeopleNearYouKey;
    v8[51] = kPXFeedbackNotEnoughMemoriesKey;
    v9[50] = &unk_1F02DB1A8;
    v9[51] = &unk_1F02DB1D0;
    v8[52] = kPXFeedbackNotSoGoodKeyPhotosRepresentingMemoriesKey;
    v9[52] = &unk_1F02DB1F8;
    uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:53];
    feedbackItemDetails = v2->_feedbackItemDetails;
    v2->_feedbackItemDetails = (NSDictionary *)v4;
  }
  return v2;
}

+ (id)createFakeTestFeedbackDictionary
{
  v2 = [MEMORY[0x1E4FB16C8] currentDevice];
  id v3 = [v2 identifierForVendor];
  uint64_t v4 = [v3 UUIDString];

  id v5 = [MEMORY[0x1E4F1C9C8] date];
  id v6 = objc_msgSend(NSString, "stringWithFormat:", @"MyApp%ld.%ld(%ld)", 1, arc4random() & 1, 101);
  objc_super v7 = [MEMORY[0x1E4F1CA60] dictionary];
  [v7 setValue:v4 forKey:kPXFeedbackEntrySystemIDKey];
  [v7 setValue:v5 forKey:kPXFeedbackEntryTimestampKey];
  [v7 setValue:v6 forKey:kPXFeedbackEntryAppVersionKey];

  return v7;
}

+ (id)createFakeTestEntry
{
  v2 = [MEMORY[0x1E4FB16C8] currentDevice];
  id v3 = [v2 identifierForVendor];
  uint64_t v4 = [v3 UUIDString];

  id v5 = [MEMORY[0x1E4F1C9C8] date];
  id v6 = objc_msgSend(NSString, "stringWithFormat:", @"MyApp%ld.%ld(%ld)", 1, arc4random() & 1, 101);
  objc_super v7 = [[PXFeedbackEntry alloc] initWithSystemID:v4 timestamp:v5];
  [(PXFeedbackEntry *)v7 setAppVersion:v6];

  return v7;
}

+ (id)negativeAlchemistFeedbackForImageQualityKeys
{
  if (negativeAlchemistFeedbackForImageQualityKeys_onceToken != -1) {
    dispatch_once(&negativeAlchemistFeedbackForImageQualityKeys_onceToken, &__block_literal_global_842);
  }
  v2 = (void *)negativeAlchemistFeedbackForImageQualityKeys_negativeAlchemistFeedbackForImageQualityKeys;
  return v2;
}

void __63__PXFeedbackEntry_negativeAlchemistFeedbackForImageQualityKeys__block_invoke()
{
  v2[7] = *MEMORY[0x1E4F143B8];
  v2[0] = kPXFeedbackImageQualitySceneScaleFeelsWrongKey;
  v2[1] = kPXFeedbackImageQualityUncomfortableFlickeringKey;
  v2[2] = kPXFeedbackImageQualityBoundaryOfObjectInaccurateKey;
  v2[3] = kPXFeedbackImageQualityObjectsSeemDetachedKey;
  v2[4] = kPXFeedbackImageQualityPersonPetObjectSplitIntoPartsKey;
  v2[5] = kPXFeedbackImageQualityForegroundStuckToBackgroundKey;
  v2[6] = kPXFeedbackImageQualityPersonPetPartiallyDeformedKey;
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:7];
  v1 = (void *)negativeAlchemistFeedbackForImageQualityKeys_negativeAlchemistFeedbackForImageQualityKeys;
  negativeAlchemistFeedbackForImageQualityKeys_negativeAlchemistFeedbackForImageQualityKeys = v0;
}

+ (id)negativeFeedbackForImageQualityKeys
{
  if (negativeFeedbackForImageQualityKeys_onceToken != -1) {
    dispatch_once(&negativeFeedbackForImageQualityKeys_onceToken, &__block_literal_global_839);
  }
  v2 = (void *)negativeFeedbackForImageQualityKeys_sharedNegativeFeedbackForImageQualityKeys;
  return v2;
}

void __54__PXFeedbackEntry_negativeFeedbackForImageQualityKeys__block_invoke()
{
  v4[19] = *MEMORY[0x1E4F143B8];
  id v0 = objc_alloc(MEMORY[0x1E4F1CA48]);
  v4[0] = kPXFeedbackImageQualityBadColorKey;
  v4[1] = kPXFeedbackImageQualityBadFocusKey;
  v4[2] = kPXFeedbackImageQualityBadContrastKey;
  v4[3] = kPXFeedbackImageQualityTooNoisyKey;
  v4[4] = kPXFeedbackImageQualityBlurryKey;
  v4[5] = kPXFeedbackImageQualityBadHDRKey;
  v4[6] = kPXFeedbackImageQualityBadFlashKey;
  v4[7] = kPXFeedbackImageQualityBadPortraitBlurKey;
  v4[8] = kPXFeedbackImageQualityShortLivePhotoKey;
  v4[9] = kPXFeedbackImageQualityMuteLivePhotoKey;
  v4[10] = kPXFeedbackImageQualitySemanticDevelopmentBadEffectKey;
  v4[11] = kPXFeedbackImageQualitySemanticDevelopmentNoEffectKey;
  v4[12] = kPXFeedbackImageQualityBadTrackingCPVKey;
  v4[13] = kPXFeedbackImageQualityBadCinematographyCPVKey;
  v4[14] = kPXFeedbackImageQualityBadRenderingCPVKey;
  v4[15] = kPXFeedbackImageQualityHardToChangeCPVKey;
  v4[16] = kPXFeedbackImageQualityGenericBadCPVKey;
  v4[17] = kPXFeedbackProvideOriginalAndEdit;
  v4[18] = kPXFeedbackProvideOriginalAndEditSysdiagnose;
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:19];
  uint64_t v2 = [v0 initWithArray:v1];
  id v3 = (void *)negativeFeedbackForImageQualityKeys_sharedNegativeFeedbackForImageQualityKeys;
  negativeFeedbackForImageQualityKeys_sharedNegativeFeedbackForImageQualityKeys = v2;
}

+ (id)positiveFeedbackForImageQualityKeys
{
  if (positiveFeedbackForImageQualityKeys_onceToken != -1) {
    dispatch_once(&positiveFeedbackForImageQualityKeys_onceToken, &__block_literal_global_837);
  }
  uint64_t v2 = (void *)positiveFeedbackForImageQualityKeys_sharedPositiveFeedbackForImageQualityKeys;
  return v2;
}

void __54__PXFeedbackEntry_positiveFeedbackForImageQualityKeys__block_invoke()
{
  id v0 = (void *)positiveFeedbackForImageQualityKeys_sharedPositiveFeedbackForImageQualityKeys;
  positiveFeedbackForImageQualityKeys_sharedPositiveFeedbackForImageQualityKeys = MEMORY[0x1E4F1CBF0];
}

+ (id)negativeFeedbackForAutoLoopKeys
{
  if (negativeFeedbackForAutoLoopKeys_onceToken != -1) {
    dispatch_once(&negativeFeedbackForAutoLoopKeys_onceToken, &__block_literal_global_835);
  }
  uint64_t v2 = (void *)negativeFeedbackForAutoLoopKeys_sharedNegativeFeedbackForAutoLoopKeys;
  return v2;
}

void __50__PXFeedbackEntry_negativeFeedbackForAutoLoopKeys__block_invoke()
{
  v2[9] = *MEMORY[0x1E4F143B8];
  v2[0] = kPXFeedbackAutoLoopPauseOrGlitch;
  v2[1] = kPXFeedbackAutoLoopUnpleasantCrossfade;
  v2[2] = kPXFeedbackAutoLoopUnsuitableContent;
  v2[3] = kPXFeedbackAutoLoopTooLittleActivity;
  v2[4] = kPXFeedbackAutoLoopTooShort;
  v2[5] = kPXFeedbackAutoLoopPoorImageQuality;
  v2[6] = kPXFeedbackAutoLoopBadStabilization;
  v2[7] = kPXFeedbackAutoLoopBadPanning;
  void v2[8] = kPXFeedbackAutoLoopPeopleOrFaceIssues;
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:9];
  v1 = (void *)negativeFeedbackForAutoLoopKeys_sharedNegativeFeedbackForAutoLoopKeys;
  negativeFeedbackForAutoLoopKeys_sharedNegativeFeedbackForAutoLoopKeys = v0;
}

+ (id)positiveFeedbackForAutoLoopKeys
{
  if (positiveFeedbackForAutoLoopKeys_onceToken != -1) {
    dispatch_once(&positiveFeedbackForAutoLoopKeys_onceToken, &__block_literal_global_833);
  }
  uint64_t v2 = (void *)positiveFeedbackForAutoLoopKeys_sharedPositiveFeedbackForAutoLoopKeys;
  return v2;
}

void __50__PXFeedbackEntry_positiveFeedbackForAutoLoopKeys__block_invoke()
{
  v2[1] = *MEMORY[0x1E4F143B8];
  v2[0] = kPXFeedbackAutoLoopExceptionallyGood;
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:1];
  v1 = (void *)positiveFeedbackForAutoLoopKeys_sharedPositiveFeedbackForAutoLoopKeys;
  positiveFeedbackForAutoLoopKeys_sharedPositiveFeedbackForAutoLoopKeys = v0;
}

+ (id)negativeFeedbackForMemoriesKeys
{
  if (negativeFeedbackForMemoriesKeys_onceToken != -1) {
    dispatch_once(&negativeFeedbackForMemoriesKeys_onceToken, &__block_literal_global_831);
  }
  uint64_t v2 = (void *)negativeFeedbackForMemoriesKeys_sharedNegativeFeedbackForMemoriesKeys;
  return v2;
}

void __50__PXFeedbackEntry_negativeFeedbackForMemoriesKeys__block_invoke()
{
  v2[5] = *MEMORY[0x1E4F143B8];
  v2[0] = kPXFeedbackNotVeryMeaningfulMemoriesKey;
  v2[1] = kPXFeedbackLackOfVarietyInMemoriesKey;
  void v2[2] = kPXFeedbackPoorSelectionOfMemoriesRelatedToYourCurrentLocationAndPeopleNearYouKey;
  v2[3] = kPXFeedbackNotEnoughMemoriesKey;
  v2[4] = kPXFeedbackNotSoGoodKeyPhotosRepresentingMemoriesKey;
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:5];
  v1 = (void *)negativeFeedbackForMemoriesKeys_sharedNegativeFeedbackForMemoriesKeys;
  negativeFeedbackForMemoriesKeys_sharedNegativeFeedbackForMemoriesKeys = v0;
}

+ (id)positiveFeedbackForMemoriesKeys
{
  if (positiveFeedbackForMemoriesKeys_onceToken != -1) {
    dispatch_once(&positiveFeedbackForMemoriesKeys_onceToken, &__block_literal_global_829);
  }
  uint64_t v2 = (void *)positiveFeedbackForMemoriesKeys_sharedPositiveFeedbackForMemoriesKeys;
  return v2;
}

void __50__PXFeedbackEntry_positiveFeedbackForMemoriesKeys__block_invoke()
{
  void v2[10] = *MEMORY[0x1E4F143B8];
  v2[0] = kPXFeedbackMeaningfulMemoriesKey;
  v2[1] = kPXFeedbackGoodVarietyInMemoriesKey;
  void v2[2] = kPXFeedbackGoodSelectionsOfMemoriesRelatedToYourCurrentLocationAndPeopleNearYouKey;
  v2[3] = kPXFeedbackGoodAmountOfMemoriesKey;
  v2[4] = kPXFeedbackRediscoveredOldMemoriesKey;
  v2[5] = kPXFeedbackRediscoveredRecentMemoriesKey;
  void v2[6] = kPXFeedbackRediscoveredPeopleKey;
  v2[7] = kPXFeedbackRediscoveredPlaceKey;
  void v2[8] = kPXFeedbackRediscoveredEventKey;
  v2[9] = kPXFeedbackGoodKeyPhotosRepresentingMemoriesKey;
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:10];
  v1 = (void *)positiveFeedbackForMemoriesKeys_sharedPositiveFeedbackForMemoriesKeys;
  positiveFeedbackForMemoriesKeys_sharedPositiveFeedbackForMemoriesKeys = v0;
}

+ (id)negativeFeedbackForMemoryDetailsKeys
{
  if (negativeFeedbackForMemoryDetailsKeys_onceToken != -1) {
    dispatch_once(&negativeFeedbackForMemoryDetailsKeys_onceToken, &__block_literal_global_827);
  }
  uint64_t v2 = (void *)negativeFeedbackForMemoryDetailsKeys_sharedNegativeFeedbackForMemoryDetailsKeys;
  return v2;
}

void __55__PXFeedbackEntry_negativeFeedbackForMemoryDetailsKeys__block_invoke()
{
  void v2[11] = *MEMORY[0x1E4F143B8];
  v2[0] = kPXFeedbackUserDislikedDetailViewReasonNotVeryMeaningfulCollection;
  v2[1] = kPXFeedbackUserDislikedDetailViewReasonNotSoGoodMovie;
  void v2[2] = kPXFeedbackUserDislikedDetailViewReasonNotSoInterestingSelectionOfPhotos;
  v2[3] = kPXFeedbackUserDislikedDetailViewReasonTooManyJunkPhotosInGrid;
  v2[4] = kPXFeedbackUserDislikedDetailViewReasonTooManySimilarPhotosInGrid;
  v2[5] = kPXFeedbackUserDislikedDetailViewReasonTooManyBadQualityPhotosInGrid;
  void v2[6] = kPXFeedbackUserDislikedDetailViewReasonTooManyPhotosInGrid;
  v2[7] = kPXFeedbackUserDislikedDetailViewReasonNotEnoughPhotosInGrid;
  void v2[8] = kPXFeedbackUserDislikedDetailViewReasonRelatedCollectionsMissing;
  v2[9] = kPXFeedbackUserDislikedDetailViewReasonRelatedCollectionsNotRelated;
  void v2[10] = kPXFeedbackUserDislikedDetailViewReasonNotSoGoodPhotosRepresentingCollectionsInRelated;
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:11];
  v1 = (void *)negativeFeedbackForMemoryDetailsKeys_sharedNegativeFeedbackForMemoryDetailsKeys;
  negativeFeedbackForMemoryDetailsKeys_sharedNegativeFeedbackForMemoryDetailsKeys = v0;
}

+ (id)positiveFeedbackForMemoryDetailsKeys
{
  if (positiveFeedbackForMemoryDetailsKeys_onceToken != -1) {
    dispatch_once(&positiveFeedbackForMemoryDetailsKeys_onceToken, &__block_literal_global_62326);
  }
  uint64_t v2 = (void *)positiveFeedbackForMemoryDetailsKeys_sharedPositiveFeedbackForMemoryDetailsKeys;
  return v2;
}

void __55__PXFeedbackEntry_positiveFeedbackForMemoryDetailsKeys__block_invoke()
{
  v2[9] = *MEMORY[0x1E4F143B8];
  v2[0] = kPXFeedbackUserLikedDetailViewReasonMeaningfulCollection;
  v2[1] = kPXFeedbackUserLikedDetailViewReasonGoodMovie;
  void v2[2] = kPXFeedbackUserLikedDetailViewReasonGoodSelectionOfPhotosInGrid;
  v2[3] = kPXFeedbackUserLikedDetailViewReasonRediscoveredOldPhotos;
  v2[4] = kPXFeedbackUserLikedDetailViewReasonRediscoveredPeople;
  v2[5] = kPXFeedbackUserLikedDetailViewReasonRediscoveredPlace;
  void v2[6] = kPXFeedbackUserLikedDetailViewReasonRediscoveredEvent;
  v2[7] = kPXFeedbackUserLikedDetailViewReasonManyMeaningfulRelatedCollectionsIncluded;
  void v2[8] = kPXFeedbackUserLikedDetailViewReasonGoodKeyPhotosRepresentingCollectionsInRelated;
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:9];
  v1 = (void *)positiveFeedbackForMemoryDetailsKeys_sharedPositiveFeedbackForMemoryDetailsKeys;
  positiveFeedbackForMemoryDetailsKeys_sharedPositiveFeedbackForMemoryDetailsKeys = v0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end