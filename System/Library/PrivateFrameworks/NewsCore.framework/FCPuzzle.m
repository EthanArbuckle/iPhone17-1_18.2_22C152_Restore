@interface FCPuzzle
- (BOOL)ignoreFromStatsAndStreaks;
- (BOOL)isDeprecated;
- (BOOL)isDraft;
- (BOOL)isPaid;
- (BOOL)showInfoModalOnFirstPlay;
- (FCAssetHandle)thumbnailLargeImageAssetHandle;
- (FCAssetHandle)thumbnailSmallImageAssetHandle;
- (FCContentArchive)contentArchive;
- (FCContentManifest)contentManifest;
- (FCInterestToken)interestToken;
- (FCPuzzle)initWithIdentifier:(id)a3 title:(id)a4 subtitle:(id)a5 puzzleDescription:(id)a6 puzzleType:(id)a7 dataResourceID:(id)a8 authors:(id)a9 publishDate:(id)a10 isPaid:(BOOL)a11 difficulty:(int64_t)a12 difficultyDescription:(id)a13 relatedPuzzleIDs:(id)a14 thumbnailSmallImageAssetHandle:(id)a15 thumbnailLargeImageAssetHandle:(id)a16 loadDate:(id)a17 teaserClue:(id)a18 teaserAnswer:(id)a19 teaserInfo:(id)a20 teaserDirection:(id)a21 teaserNumber:(id)a22 language:(id)a23 blockedStorefrontIDs:(id)a24 allowedStorefrontIDs:(id)a25 minimumNewsVersion:(int64_t)a26 showInfoModalOnFirstPlay:(BOOL)a27 ignoreFromStatsAndStreaks:(BOOL)a28 isDeprecated:(BOOL)a29 isDraft:(BOOL)a30 lastModifiedDate:(id)a31;
- (FCPuzzle)initWithPuzzle:(id)a3 overrides:(id)a4;
- (FCPuzzle)initWithPuzzleRecord:(id)a3 puzzleType:(id)a4 assetManager:(id)a5 interestToken:(id)a6 difficultyDescriptions:(id)a7;
- (FCPuzzleTypeProviding)puzzleType;
- (NSArray)allowedStorefrontIDs;
- (NSArray)authors;
- (NSArray)blockedStorefrontIDs;
- (NSArray)relatedPuzzleIDs;
- (NSDate)lastModifiedDate;
- (NSDate)loadDate;
- (NSDate)publishDate;
- (NSString)dataResourceID;
- (NSString)difficultyDescription;
- (NSString)identifier;
- (NSString)language;
- (NSString)publishDateString;
- (NSString)puzzleDescription;
- (NSString)subtitle;
- (NSString)teaserAnswer;
- (NSString)teaserClue;
- (NSString)teaserDirection;
- (NSString)teaserInfo;
- (NSString)teaserNumber;
- (NSString)title;
- (NTPBPuzzleRecord)puzzleRecord;
- (int64_t)difficulty;
- (int64_t)minimumNewsVersion;
- (unint64_t)behaviorFlags;
@end

@implementation FCPuzzle

- (FCPuzzle)initWithIdentifier:(id)a3 title:(id)a4 subtitle:(id)a5 puzzleDescription:(id)a6 puzzleType:(id)a7 dataResourceID:(id)a8 authors:(id)a9 publishDate:(id)a10 isPaid:(BOOL)a11 difficulty:(int64_t)a12 difficultyDescription:(id)a13 relatedPuzzleIDs:(id)a14 thumbnailSmallImageAssetHandle:(id)a15 thumbnailLargeImageAssetHandle:(id)a16 loadDate:(id)a17 teaserClue:(id)a18 teaserAnswer:(id)a19 teaserInfo:(id)a20 teaserDirection:(id)a21 teaserNumber:(id)a22 language:(id)a23 blockedStorefrontIDs:(id)a24 allowedStorefrontIDs:(id)a25 minimumNewsVersion:(int64_t)a26 showInfoModalOnFirstPlay:(BOOL)a27 ignoreFromStatsAndStreaks:(BOOL)a28 isDeprecated:(BOOL)a29 isDraft:(BOOL)a30 lastModifiedDate:(id)a31
{
  id v69 = a3;
  id v50 = a4;
  id v68 = a4;
  id v51 = a5;
  id v67 = a5;
  id v52 = a6;
  id v66 = a6;
  id v53 = a7;
  id v36 = a7;
  id v65 = a8;
  id v64 = a9;
  id v63 = a10;
  id v62 = a13;
  id v61 = a14;
  id v60 = a15;
  id v59 = a16;
  id v58 = a17;
  id v57 = a18;
  id v56 = a19;
  id v37 = a20;
  id v54 = a21;
  id v38 = a22;
  id v39 = a23;
  id v40 = a24;
  id v41 = a25;
  id v42 = a31;
  uint64_t v43 = [v69 length];
  v44 = 0;
  if (v36 && v43)
  {
    v70.receiver = self;
    v70.super_class = (Class)FCPuzzle;
    v45 = [(FCPuzzle *)&v70 init];
    v46 = v45;
    if (v45)
    {
      objc_storeStrong((id *)&v45->_identifier, a3);
      objc_storeStrong((id *)&v46->_title, v50);
      objc_storeStrong((id *)&v46->_subtitle, v51);
      objc_storeStrong((id *)&v46->_puzzleDescription, v52);
      objc_storeStrong((id *)&v46->_puzzleType, v53);
      objc_storeStrong((id *)&v46->_dataResourceID, a8);
      objc_storeStrong((id *)&v46->_authors, a9);
      objc_storeStrong((id *)&v46->_publishDate, a10);
      v46->_paid = a11;
      v46->_difficulty = a12;
      objc_storeStrong((id *)&v46->_difficultyDescription, a13);
      objc_storeStrong((id *)&v46->_relatedPuzzleIDs, a14);
      objc_storeStrong((id *)&v46->_thumbnailSmallImageAssetHandle, a15);
      objc_storeStrong((id *)&v46->_thumbnailLargeImageAssetHandle, a16);
      objc_storeStrong((id *)&v46->_loadDate, a17);
      objc_storeStrong((id *)&v46->_teaserClue, a18);
      objc_storeStrong((id *)&v46->_teaserAnswer, a19);
      objc_storeStrong((id *)&v46->_teaserInfo, a20);
      objc_storeStrong((id *)&v46->_teaserDirection, a21);
      objc_storeStrong((id *)&v46->_teaserNumber, a22);
      objc_storeStrong((id *)&v46->_language, a23);
      objc_storeStrong((id *)&v46->_blockedStorefrontIDs, a24);
      objc_storeStrong((id *)&v46->_allowedStorefrontIDs, a25);
      v46->_minimumNewsVersion = a26;
      v46->_showInfoModalOnFirstPlay = a27;
      v46->_ignoreFromStatsAndStreaks = a28;
      v46->_deprecated = a29;
      v46->_draft = a30;
      objc_storeStrong((id *)&v46->_lastModifiedDate, a31);
    }
    v47 = v46;
    v44 = v47;
  }
  else
  {
    v47 = self;
  }

  return v44;
}

- (FCPuzzle)initWithPuzzleRecord:(id)a3 puzzleType:(id)a4 assetManager:(id)a5 interestToken:(id)a6 difficultyDescriptions:(id)a7
{
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v80 = a6;
  id v16 = a7;
  v17 = [v13 base];
  v18 = [v17 identifier];

  if (!v18 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v78 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "identifier != 0");
    *(_DWORD *)buf = 136315906;
    v83 = "-[FCPuzzle initWithPuzzleRecord:puzzleType:assetManager:interestToken:difficultyDescriptions:]";
    __int16 v84 = 2080;
    v85 = "FCPuzzle.m";
    __int16 v86 = 1024;
    int v87 = 139;
    __int16 v88 = 2114;
    v89 = v78;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v81.receiver = self;
  v81.super_class = (Class)FCPuzzle;
  v19 = [(FCPuzzle *)&v81 init];
  if (v19)
  {
    if ([v18 length])
    {
      context = (void *)MEMORY[0x1A6260FD0]();
      objc_storeStrong((id *)&v19->_puzzleRecord, a3);
      objc_storeStrong((id *)&v19->_interestToken, a6);
      uint64_t v20 = [MEMORY[0x1E4F1C9C8] date];
      loadDate = v19->_loadDate;
      v19->_loadDate = (NSDate *)v20;

      uint64_t v22 = [v18 copy];
      identifier = v19->_identifier;
      v19->_identifier = (NSString *)v22;

      uint64_t v24 = [v13 title];
      title = v19->_title;
      v19->_title = (NSString *)v24;

      v26 = [v13 subtitle];
      if ([v26 length])
      {
        uint64_t v27 = [v13 subtitle];
        subtitle = v19->_subtitle;
        v19->_subtitle = (NSString *)v27;
      }
      else
      {
        subtitle = v19->_subtitle;
        v19->_subtitle = 0;
      }

      uint64_t v29 = [v13 puzzleDescription];
      puzzleDescription = v19->_puzzleDescription;
      v19->_puzzleDescription = (NSString *)v29;

      objc_storeStrong((id *)&v19->_puzzleType, a4);
      uint64_t v31 = [v13 dataResourceID];
      dataResourceID = v19->_dataResourceID;
      v19->_dataResourceID = (NSString *)v31;

      v19->_paid = [v13 isPaid];
      uint64_t v33 = [v13 authors];
      authors = v19->_authors;
      v19->_authors = (NSArray *)v33;

      v35 = (void *)MEMORY[0x1E4F1C9C8];
      id v36 = [v13 publishedDate];
      uint64_t v37 = [v35 dateWithPBDate:v36];
      publishDate = v19->_publishDate;
      v19->_publishDate = (NSDate *)v37;

      v19->_difficulty = [v13 difficultyLevel];
      id v39 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v13, "difficultyLevel"));
      uint64_t v40 = objc_msgSend(v16, "fc_safeObjectForKey:", v39);
      id v41 = (void *)v40;
      if (v40) {
        id v42 = (__CFString *)v40;
      }
      else {
        id v42 = &stru_1EF8299B8;
      }
      objc_storeStrong((id *)&v19->_difficultyDescription, v42);

      uint64_t v43 = [v13 relatedPuzzleIDs];
      relatedPuzzleIDs = v19->_relatedPuzzleIDs;
      v19->_relatedPuzzleIDs = (NSArray *)v43;

      v45 = [v14 thumbnailDirectory];
      v46 = v19->_publishDate;
      v47 = resolvedPuzzleTypeDifficultyWithPuzzleType(v14, v19->_difficulty);
      uint64_t v48 = [v45 smallThumbnailForDate:v46 difficulty:v47];
      thumbnailSmallImageAssetHandle = v19->_thumbnailSmallImageAssetHandle;
      v19->_thumbnailSmallImageAssetHandle = (FCAssetHandle *)v48;

      uint64_t v50 = [v13 generateThumbnailLargeImageAssetHandleWithAssetManager:v15];
      thumbnailLargeImageAssetHandle = v19->_thumbnailLargeImageAssetHandle;
      v19->_thumbnailLargeImageAssetHandle = (FCAssetHandle *)v50;

      id v52 = [v13 teaserConfiguration];
      id v53 = [v52 dataUsingEncoding:4];

      if (v53)
      {
        id v54 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v53 options:0 error:0];
        v55 = [v54 objectForKeyedSubscript:@"interactiveClue"];

        uint64_t v56 = [v55 objectForKeyedSubscript:@"clue"];
        teaserClue = v19->_teaserClue;
        v19->_teaserClue = (NSString *)v56;

        uint64_t v58 = [v55 objectForKeyedSubscript:@"answer"];
        teaserAnswer = v19->_teaserAnswer;
        v19->_teaserAnswer = (NSString *)v58;

        uint64_t v60 = [v55 objectForKeyedSubscript:@"hint"];
        teaserInfo = v19->_teaserInfo;
        v19->_teaserInfo = (NSString *)v60;

        uint64_t v62 = [v55 objectForKeyedSubscript:@"direction"];
        teaserDirection = v19->_teaserDirection;
        v19->_teaserDirection = (NSString *)v62;

        uint64_t v64 = [v55 objectForKeyedSubscript:@"number"];
        teaserNumber = v19->_teaserNumber;
        v19->_teaserNumber = (NSString *)v64;
      }
      uint64_t v66 = [v13 language];
      language = v19->_language;
      v19->_language = (NSString *)v66;

      uint64_t v68 = [v13 blockedStorefrontIDs];
      blockedStorefrontIDs = v19->_blockedStorefrontIDs;
      v19->_blockedStorefrontIDs = (NSArray *)v68;

      uint64_t v70 = [v13 allowedStorefrontIDs];
      allowedStorefrontIDs = v19->_allowedStorefrontIDs;
      v19->_allowedStorefrontIDs = (NSArray *)v70;

      v19->_minimumNewsVersion = [v13 minimumNewsVersion];
      v19->_showInfoModalOnFirstPlay = [v13 behaviorFlags] & 1;
      v19->_ignoreFromStatsAndStreaks = ([v13 behaviorFlags] & 2) != 0;
      v19->_behaviorFlags = [v13 behaviorFlags];
      v19->_deprecated = [v13 isDeprecated];
      v19->_draft = [v13 isDraft];
      v72 = (void *)MEMORY[0x1E4F1C9C8];
      v73 = [v13 base];
      v74 = [v73 modificationDate];
      uint64_t v75 = [v72 dateWithPBDate:v74];
      lastModifiedDate = v19->_lastModifiedDate;
      v19->_lastModifiedDate = (NSDate *)v75;
    }
    else
    {

      v19 = 0;
    }
  }

  return v19;
}

- (FCPuzzle)initWithPuzzle:(id)a3 overrides:(id)a4
{
  v63[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 identifier];
  uint64_t v8 = [v6 title];
  uint64_t v9 = v8;
  if (!v8)
  {
    uint64_t v9 = [v5 title];
  }
  uint64_t v10 = [v6 subtitle];
  id v42 = (void *)v10;
  if (!v10)
  {
    uint64_t v10 = [v5 subtitle];
  }
  uint64_t v11 = [v6 puzzleDescription];
  uint64_t v12 = v11;
  if (!v11)
  {
    uint64_t v12 = [v5 puzzleDescription];
  }
  uint64_t v62 = [v5 puzzleType];
  id v61 = [v5 dataResourceID];
  uint64_t v13 = [v6 author];
  if (v13)
  {
    uint64_t v37 = [v6 author];
    v63[0] = v37;
    uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v63 count:1];
  }
  else
  {
    uint64_t v14 = [v5 authors];
    uint64_t v37 = (void *)v14;
  }
  uint64_t v50 = (void *)v14;
  uint64_t v60 = [v5 publishDate];
  char v34 = [v5 isPaid];
  uint64_t v33 = [v5 difficulty];
  id v59 = [v5 difficultyDescription];
  uint64_t v58 = [v5 relatedPuzzleIDs];
  id v57 = [v5 thumbnailSmallImageAssetHandle];
  uint64_t v56 = [v5 thumbnailLargeImageAssetHandle];
  v55 = [v5 loadDate];
  id v54 = [v6 teaserClue];
  uint64_t v48 = v54;
  if (!v54)
  {
    id v54 = [v5 teaserClue];
  }
  id v53 = [v6 teaserAnswer];
  v47 = v53;
  if (!v53)
  {
    id v53 = [v5 teaserAnswer];
  }
  id v52 = [v6 teaserInfo];
  v46 = v52;
  if (!v52)
  {
    id v52 = [v5 teaserInfo];
  }
  uint64_t v40 = (void *)v11;
  id v51 = [v6 teaserDirection];
  v32 = v51;
  if (!v51)
  {
    id v51 = [v5 teaserDirection];
  }
  id v38 = (void *)v13;
  id v39 = (void *)v12;
  id v41 = (void *)v10;
  v49 = (void *)v9;
  uint64_t v43 = (void *)v8;
  v44 = (void *)v7;
  v45 = v6;
  id v15 = [v6 teaserNumber];
  id v16 = v15;
  if (!v15)
  {
    id v16 = [v5 teaserNumber];
  }
  uint64_t v31 = [v5 language];
  v30 = [v5 blockedStorefrontIDs];
  v17 = [v5 allowedStorefrontIDs];
  uint64_t v18 = [v5 minimumNewsVersion];
  char v19 = [v5 showInfoModalOnFirstPlay];
  char v20 = [v5 ignoreFromStatsAndStreaks];
  char v21 = [v5 isDeprecated];
  char v22 = [v5 isDraft];
  v23 = [v5 lastModifiedDate];
  BYTE3(v29) = v22;
  BYTE2(v29) = v21;
  BYTE1(v29) = v20;
  LOBYTE(v29) = v19;
  LOBYTE(v28) = v34;
  id v36 = -[FCPuzzle initWithIdentifier:title:subtitle:puzzleDescription:puzzleType:dataResourceID:authors:publishDate:isPaid:difficulty:difficultyDescription:relatedPuzzleIDs:thumbnailSmallImageAssetHandle:thumbnailLargeImageAssetHandle:loadDate:teaserClue:teaserAnswer:teaserInfo:teaserDirection:teaserNumber:language:blockedStorefrontIDs:allowedStorefrontIDs:minimumNewsVersion:showInfoModalOnFirstPlay:ignoreFromStatsAndStreaks:isDeprecated:isDraft:lastModifiedDate:](self, "initWithIdentifier:title:subtitle:puzzleDescription:puzzleType:dataResourceID:authors:publishDate:isPaid:difficulty:difficultyDescription:relatedPuzzleIDs:thumbnailSmallImageAssetHandle:thumbnailLargeImageAssetHandle:loadDate:teaserClue:teaserAnswer:teaserInfo:teaserDirection:teaserNumber:language:blockedStorefrontIDs:allowedStorefrontIDs:minimumNewsVersion:showInfoModalOnFirstPlay:ignoreFromStatsAndStreaks:isDeprecated:isDraft:lastModifiedDate:", v44, v49, v41, v39, v62, v61, v50, v60, v28, v33, v59, v58, v57, v56,
          v55,
          v54,
          v53,
          v52,
          v51,
          v16,
          v31,
          v30,
          v17,
          v18,
          v29,
          v23);

  if (!v15) {
  if (!v32)
  }

  uint64_t v24 = v46;
  if (!v46)
  {

    uint64_t v24 = 0;
  }

  v25 = v47;
  if (!v47)
  {

    v25 = 0;
  }

  v26 = v48;
  if (!v48)
  {

    v26 = 0;
  }

  if (v38) {
  if (!v40)
  }

  if (!v42) {
  if (!v43)
  }

  return v36;
}

- (NSString)publishDateString
{
  v3 = (void *)publishDateString_dateFormatter;
  if (!publishDateString_dateFormatter)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    id v5 = (void *)publishDateString_dateFormatter;
    publishDateString_dateFormatter = (uint64_t)v4;

    id v6 = [MEMORY[0x1E4F1CAF0] timeZoneWithAbbreviation:@"EST"];
    [(id)publishDateString_dateFormatter setTimeZone:v6];

    [(id)publishDateString_dateFormatter setDateFormat:@"EEEE, MMM d, yyyy"];
    v3 = (void *)publishDateString_dateFormatter;
  }
  uint64_t v7 = [(FCPuzzle *)self publishDate];
  uint64_t v8 = [v3 stringFromDate:v7];

  return (NSString *)v8;
}

- (FCContentArchive)contentArchive
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __26__FCPuzzle_contentArchive__block_invoke;
  v5[3] = &unk_1E5B4BF30;
  v5[4] = self;
  v2 = objc_msgSend(MEMORY[0x1E4F1C978], "fc_array:", v5);
  v3 = +[FCContentArchive archiveWithChildArchives:v2];

  return (FCContentArchive *)v3;
}

void __26__FCPuzzle_contentArchive__block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 puzzleRecord];
  id v6 = +[FCContentArchive archiveWithRecord:v5];
  objc_msgSend(v4, "fc_safelyAddObject:", v6);

  uint64_t v7 = [*(id *)(a1 + 32) puzzleType];
  uint64_t v8 = v7;
  if (v7)
  {
    if ([v7 conformsToProtocol:&unk_1EF8E9808]) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = 0;
    }
  }
  else
  {
    uint64_t v9 = 0;
  }
  id v11 = v9;

  uint64_t v10 = [v11 contentArchive];
  objc_msgSend(v4, "fc_safelyAddObject:", v10);
}

- (FCContentManifest)contentManifest
{
  v3 = [FCContentManifest alloc];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __27__FCPuzzle_contentManifest__block_invoke;
  v7[3] = &unk_1E5B4BF30;
  v7[4] = self;
  id v4 = objc_msgSend(MEMORY[0x1E4F1C978], "fc_array:", v7);
  id v5 = [(FCContentManifest *)v3 initWithManifests:v4];

  return v5;
}

void __27__FCPuzzle_contentManifest__block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 puzzleRecord];
  id v6 = [v5 base];
  uint64_t v7 = [v6 contentManifest];
  objc_msgSend(v4, "fc_safelyAddObject:", v7);

  uint64_t v8 = [*(id *)(a1 + 32) puzzleType];
  uint64_t v9 = v8;
  if (v8)
  {
    if ([v8 conformsToProtocol:&unk_1EF8E9808]) {
      uint64_t v10 = v9;
    }
    else {
      uint64_t v10 = 0;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }
  id v12 = v10;

  id v11 = [v12 contentManifest];
  objc_msgSend(v4, "fc_safelyAddObject:", v11);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)puzzleDescription
{
  return self->_puzzleDescription;
}

- (FCPuzzleTypeProviding)puzzleType
{
  return self->_puzzleType;
}

- (NSArray)authors
{
  return self->_authors;
}

- (NSString)dataResourceID
{
  return self->_dataResourceID;
}

- (int64_t)difficulty
{
  return self->_difficulty;
}

- (NSString)difficultyDescription
{
  return self->_difficultyDescription;
}

- (NSArray)relatedPuzzleIDs
{
  return self->_relatedPuzzleIDs;
}

- (BOOL)isPaid
{
  return self->_paid;
}

- (NSDate)publishDate
{
  return self->_publishDate;
}

- (FCAssetHandle)thumbnailSmallImageAssetHandle
{
  return self->_thumbnailSmallImageAssetHandle;
}

- (FCAssetHandle)thumbnailLargeImageAssetHandle
{
  return self->_thumbnailLargeImageAssetHandle;
}

- (NSArray)allowedStorefrontIDs
{
  return self->_allowedStorefrontIDs;
}

- (NSArray)blockedStorefrontIDs
{
  return self->_blockedStorefrontIDs;
}

- (NSString)language
{
  return self->_language;
}

- (int64_t)minimumNewsVersion
{
  return self->_minimumNewsVersion;
}

- (NSDate)loadDate
{
  return self->_loadDate;
}

- (BOOL)showInfoModalOnFirstPlay
{
  return self->_showInfoModalOnFirstPlay;
}

- (BOOL)ignoreFromStatsAndStreaks
{
  return self->_ignoreFromStatsAndStreaks;
}

- (BOOL)isDeprecated
{
  return self->_deprecated;
}

- (BOOL)isDraft
{
  return self->_draft;
}

- (NSDate)lastModifiedDate
{
  return self->_lastModifiedDate;
}

- (unint64_t)behaviorFlags
{
  return self->_behaviorFlags;
}

- (NSString)teaserClue
{
  return self->_teaserClue;
}

- (NSString)teaserAnswer
{
  return self->_teaserAnswer;
}

- (NSString)teaserInfo
{
  return self->_teaserInfo;
}

- (NSString)teaserNumber
{
  return self->_teaserNumber;
}

- (NSString)teaserDirection
{
  return self->_teaserDirection;
}

- (NTPBPuzzleRecord)puzzleRecord
{
  return self->_puzzleRecord;
}

- (FCInterestToken)interestToken
{
  return self->_interestToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interestToken, 0);
  objc_storeStrong((id *)&self->_puzzleRecord, 0);
  objc_storeStrong((id *)&self->_teaserDirection, 0);
  objc_storeStrong((id *)&self->_teaserNumber, 0);
  objc_storeStrong((id *)&self->_teaserInfo, 0);
  objc_storeStrong((id *)&self->_teaserAnswer, 0);
  objc_storeStrong((id *)&self->_teaserClue, 0);
  objc_storeStrong((id *)&self->_lastModifiedDate, 0);
  objc_storeStrong((id *)&self->_loadDate, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_blockedStorefrontIDs, 0);
  objc_storeStrong((id *)&self->_allowedStorefrontIDs, 0);
  objc_storeStrong((id *)&self->_thumbnailLargeImageAssetHandle, 0);
  objc_storeStrong((id *)&self->_thumbnailSmallImageAssetHandle, 0);
  objc_storeStrong((id *)&self->_publishDate, 0);
  objc_storeStrong((id *)&self->_relatedPuzzleIDs, 0);
  objc_storeStrong((id *)&self->_difficultyDescription, 0);
  objc_storeStrong((id *)&self->_dataResourceID, 0);
  objc_storeStrong((id *)&self->_authors, 0);
  objc_storeStrong((id *)&self->_puzzleType, 0);
  objc_storeStrong((id *)&self->_puzzleDescription, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end