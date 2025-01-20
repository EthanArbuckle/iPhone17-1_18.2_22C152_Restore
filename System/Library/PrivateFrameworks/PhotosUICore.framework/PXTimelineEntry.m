@interface PXTimelineEntry
+ (id)descriptionForRejectReason:(unint64_t)a3;
+ (id)descriptionForTimelineContentType:(unint64_t)a3;
+ (id)emptyWidgetURLForContentType:(unint64_t)a3 sourceIdentifier:(id)a4;
+ (id)fallbackEntryForAlbumNotFoundWithLocalIdentifier:(id)a3 size:(unint64_t)a4;
+ (id)fallbackEntryForContentType:(unint64_t)a3 size:(unint64_t)a4;
+ (id)fallbackEntryForContentType:(unint64_t)a3 sourceIdentifier:(id)a4 size:(unint64_t)a5;
+ (id)placeholderEntryForContentType:(unint64_t)a3;
+ (id)privacyDisclosureEntryForContentType:(unint64_t)a3;
- (BOOL)isEqual:(id)a3;
- (NSDate)endTime;
- (NSDate)startTime;
- (NSString)assetLocalIdentifier;
- (NSString)localIdentifier;
- (NSString)proactiveCriterion;
- (NSString)sourceIdentifier;
- (NSString)subtitle;
- (NSString)title;
- (NSURL)deeplink;
- (PXTimelineCrop)suggestedCrop;
- (PXTimelineEntry)initWithAlbumFeaturedPhoto:(id)a3 localAlbumIdentifier:(id)a4 andFeaturedPhotoKeyAsset:(id)a5 suggestedCrop:(id)a6;
- (PXTimelineEntry)initWithFeaturedPhoto:(id)a3 andFeaturedPhotoKeyAsset:(id)a4;
- (PXTimelineEntry)initWithFeaturedPhoto:(id)a3 andFeaturedPhotoKeyAsset:(id)a4 suggestedCrop:(id)a5;
- (PXTimelineEntry)initWithMemory:(id)a3 andMemoryKeyAsset:(id)a4;
- (PXTimelineEntry)initWithTitle:(id)a3 subtitle:(id)a4 localIdentifier:(id)a5 assetLocalIdentifier:(id)a6 deeplink:(id)a7 contentType:(unint64_t)a8 sourceIdentifier:(id)a9 relevanceScore:(double)a10 proactiveCriterion:(id)a11 suggestedCrop:(id)a12 rejectReason:(unint64_t)a13;
- (double)relevanceScore;
- (id)_initWithTimelineEntry:(id)a3;
- (id)_localTimeFormatter;
- (id)_utcTimeFormatter;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)contentType;
- (unint64_t)hash;
- (unint64_t)rejectReason;
- (unint64_t)sourceType;
- (void)setEndTime:(id)a3;
- (void)setProactiveCriterion:(id)a3;
- (void)setRejectReason:(unint64_t)a3;
- (void)setStartTime:(id)a3;
- (void)setSuggestedCrop:(id)a3;
@end

@implementation PXTimelineEntry

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proactiveCriterion, 0);
  objc_storeStrong((id *)&self->_suggestedCrop, 0);
  objc_storeStrong((id *)&self->_deeplink, 0);
  objc_storeStrong((id *)&self->_assetLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_localIdentifier, 0);
  objc_storeStrong((id *)&self->_sourceIdentifier, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_endTime, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
}

- (void)setRejectReason:(unint64_t)a3
{
  self->_rejectReason = a3;
}

- (unint64_t)rejectReason
{
  return self->_rejectReason;
}

- (double)relevanceScore
{
  return self->_relevanceScore;
}

- (void)setProactiveCriterion:(id)a3
{
}

- (NSString)proactiveCriterion
{
  return self->_proactiveCriterion;
}

- (void)setSuggestedCrop:(id)a3
{
}

- (PXTimelineCrop)suggestedCrop
{
  return self->_suggestedCrop;
}

- (NSURL)deeplink
{
  return self->_deeplink;
}

- (NSString)assetLocalIdentifier
{
  return self->_assetLocalIdentifier;
}

- (NSString)localIdentifier
{
  return self->_localIdentifier;
}

- (NSString)sourceIdentifier
{
  return self->_sourceIdentifier;
}

- (unint64_t)sourceType
{
  return self->_sourceType;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)title
{
  return self->_title;
}

- (NSDate)endTime
{
  return self->_endTime;
}

- (NSDate)startTime
{
  return self->_startTime;
}

- (unint64_t)contentType
{
  return self->_contentType;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[PXTimelineEntry allocWithZone:a3];
  return [(PXTimelineEntry *)v4 _initWithTimelineEntry:self];
}

- (unint64_t)hash
{
  v2 = [(PXTimelineEntry *)self localIdentifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PXTimelineEntry *)a3;
  if (v4 == self)
  {
    char v6 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    if (v5 == objc_opt_class())
    {
      v7 = v4;
      v8 = [(PXTimelineEntry *)self localIdentifier];
      v9 = [(PXTimelineEntry *)v7 localIdentifier];

      char v6 = [v8 isEqualToString:v9];
    }
    else
    {
      char v6 = 0;
    }
  }

  return v6;
}

- (id)dictionaryRepresentation
{
  unint64_t v3 = [(PXTimelineEntry *)self _localTimeFormatter];
  v4 = [(PXTimelineEntry *)self _utcTimeFormatter];
  uint64_t v5 = [(PXTimelineEntry *)self startTime];
  char v6 = [(PXTimelineEntry *)self endTime];
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v8 = NSString;
  v9 = (objc_class *)objc_opt_class();
  v10 = NSStringFromClass(v9);
  v11 = [v8 stringWithFormat:@"%@ <%p>:\n", v10, self];
  [v7 setObject:v11 forKeyedSubscript:@"id"];

  v12 = [v3 stringFromDate:v5];
  [v7 setObject:v12 forKeyedSubscript:@"StartTime (Local Time)"];

  v13 = [v3 stringFromDate:v6];
  [v7 setObject:v13 forKeyedSubscript:@"EndTime (Local Time)"];

  v14 = [v4 stringFromDate:v5];
  [v7 setObject:v14 forKeyedSubscript:@"StartTime(UTC)"];

  v15 = [v4 stringFromDate:v6];
  [v7 setObject:v15 forKeyedSubscript:@"EndTime(UTC)"];

  v16 = +[PXTimelineEntry descriptionForTimelineContentType:[(PXTimelineEntry *)self contentType]];
  [v7 setObject:v16 forKeyedSubscript:@"ContentType"];

  v17 = [(PXTimelineEntry *)self sourceIdentifier];
  [v7 setObject:v17 forKeyedSubscript:@"SourceIdentifier"];

  v18 = [(PXTimelineEntry *)self title];
  v19 = [v18 stringByReplacingOccurrencesOfString:@"\n" withString:@"\\n"];
  [v7 setObject:v19 forKeyedSubscript:@"Title"];

  v20 = [(PXTimelineEntry *)self subtitle];
  v21 = [v20 stringByReplacingOccurrencesOfString:@"\n" withString:@"\\n"];
  [v7 setObject:v21 forKeyedSubscript:@"Subtitle"];

  v22 = [(PXTimelineEntry *)self localIdentifier];
  [v7 setObject:v22 forKeyedSubscript:@"LocalIdentifier"];

  v23 = [(PXTimelineEntry *)self assetLocalIdentifier];
  [v7 setObject:v23 forKeyedSubscript:@"AssetLocalIdentifier"];

  v24 = [(PXTimelineEntry *)self deeplink];
  v25 = [v24 absoluteString];
  [v7 setObject:v25 forKeyedSubscript:@"Deeplink"];

  v26 = NSNumber;
  [(PXTimelineEntry *)self relevanceScore];
  v27 = objc_msgSend(v26, "numberWithDouble:");
  [v7 setObject:v27 forKeyedSubscript:@"RelevanceScore"];

  v28 = [(PXTimelineEntry *)self proactiveCriterion];
  [v7 setObject:v28 forKeyedSubscript:@"ProactiveCriterion"];

  v29 = [(PXTimelineEntry *)self suggestedCrop];
  [v7 setObject:v29 forKeyedSubscript:@"SuggestedCrop"];

  v30 = +[PXTimelineEntry descriptionForRejectReason:[(PXTimelineEntry *)self rejectReason]];
  [v7 setObject:v30 forKeyedSubscript:@"RejectReason"];

  return v7;
}

- (id)description
{
  unint64_t v3 = [(PXTimelineEntry *)self _localTimeFormatter];
  v4 = [(PXTimelineEntry *)self startTime];
  uint64_t v5 = [(PXTimelineEntry *)self endTime];
  char v6 = (void *)MEMORY[0x1E4F28E78];
  id v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  v9 = [v6 stringWithFormat:@"%@ <%p>:\n", v8, self];

  v10 = [v3 stringFromDate:v4];
  [v9 appendFormat:@" StartTime (Local Time): %@\n", v10];

  v11 = [v3 stringFromDate:v5];
  [v9 appendFormat:@" EndTime (Local Time): %@\n", v11];

  [v9 appendFormat:@" StartTime(UTC): %@\n", v4];
  [v9 appendFormat:@" EndTime(UTC): %@\n", v5];
  v12 = +[PXTimelineEntry descriptionForTimelineContentType:[(PXTimelineEntry *)self contentType]];
  [v9 appendFormat:@" ContentType: %@\n", v12];

  v13 = [(PXTimelineEntry *)self sourceIdentifier];
  [v9 appendFormat:@" SourceIdentifier: %@\n", v13];

  v14 = [(PXTimelineEntry *)self title];
  v15 = [v14 stringByReplacingOccurrencesOfString:@"\n" withString:@"\\n"];
  [v9 appendFormat:@" Title: %@\n", v15];

  v16 = [(PXTimelineEntry *)self subtitle];
  v17 = [v16 stringByReplacingOccurrencesOfString:@"\n" withString:@"\\n"];
  [v9 appendFormat:@" Subtitle: %@\n", v17];

  v18 = [(PXTimelineEntry *)self localIdentifier];
  [v9 appendFormat:@" LocalIdentifier: %@\n", v18];

  v19 = [(PXTimelineEntry *)self assetLocalIdentifier];
  [v9 appendFormat:@" AssetLocalIdentifier: %@\n", v19];

  v20 = [(PXTimelineEntry *)self deeplink];
  [v9 appendFormat:@" Deeplink: %@\n", v20];

  [(PXTimelineEntry *)self relevanceScore];
  objc_msgSend(v9, "appendFormat:", @" RelevanceScore: %f\n", v21);
  v22 = [(PXTimelineEntry *)self proactiveCriterion];
  [v9 appendFormat:@" ProactiveCriterion: %@\n", v22];

  v23 = [(PXTimelineEntry *)self suggestedCrop];
  [v9 appendFormat:@" SuggestedCrop: %@\n", v23];

  v24 = +[PXTimelineEntry descriptionForRejectReason:[(PXTimelineEntry *)self rejectReason]];
  [v9 appendFormat:@" RejectReason: %@\n", v24];

  return v9;
}

- (id)_utcTimeFormatter
{
  if (_utcTimeFormatter_onceToken != -1) {
    dispatch_once(&_utcTimeFormatter_onceToken, &__block_literal_global_275);
  }
  v2 = (void *)_utcTimeFormatter_utcTimeFormatter;
  return v2;
}

void __36__PXTimelineEntry__utcTimeFormatter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)_utcTimeFormatter_utcTimeFormatter;
  _utcTimeFormatter_utcTimeFormatter = (uint64_t)v0;

  [(id)_utcTimeFormatter_utcTimeFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
  id v2 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:@"UTC"];
  [(id)_utcTimeFormatter_utcTimeFormatter setTimeZone:v2];
}

- (id)_localTimeFormatter
{
  if (_localTimeFormatter_onceToken != -1) {
    dispatch_once(&_localTimeFormatter_onceToken, &__block_literal_global_63932);
  }
  id v2 = (void *)_localTimeFormatter_localTimeFormatter;
  return v2;
}

uint64_t __38__PXTimelineEntry__localTimeFormatter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)_localTimeFormatter_localTimeFormatter;
  _localTimeFormatter_localTimeFormatter = (uint64_t)v0;

  id v2 = (void *)_localTimeFormatter_localTimeFormatter;
  return [v2 setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
}

- (void)setEndTime:(id)a3
{
  v4 = (NSDate *)[a3 copy];
  endTime = self->_endTime;
  self->_endTime = v4;
}

- (void)setStartTime:(id)a3
{
  v4 = (NSDate *)[a3 copy];
  startTime = self->_startTime;
  self->_startTime = v4;
}

- (id)_initWithTimelineEntry:(id)a3
{
  id v3 = a3;
  v17 = [v3 title];
  v4 = [v3 subtitle];
  uint64_t v5 = [v3 localIdentifier];
  char v6 = [v3 assetLocalIdentifier];
  id v7 = [v3 deeplink];
  uint64_t v8 = [v3 contentType];
  v9 = [v3 sourceIdentifier];
  [v3 relevanceScore];
  double v11 = v10;
  v12 = [v3 proactiveCriterion];
  v13 = [v3 suggestedCrop];
  uint64_t v14 = [v3 rejectReason];

  v15 = [(PXTimelineEntry *)self initWithTitle:v17 subtitle:v4 localIdentifier:v5 assetLocalIdentifier:v6 deeplink:v7 contentType:v8 sourceIdentifier:v11 relevanceScore:v9 proactiveCriterion:v12 suggestedCrop:v13 rejectReason:v14];
  return v15;
}

- (PXTimelineEntry)initWithTitle:(id)a3 subtitle:(id)a4 localIdentifier:(id)a5 assetLocalIdentifier:(id)a6 deeplink:(id)a7 contentType:(unint64_t)a8 sourceIdentifier:(id)a9 relevanceScore:(double)a10 proactiveCriterion:(id)a11 suggestedCrop:(id)a12 rejectReason:(unint64_t)a13
{
  id v41 = a3;
  id v19 = a4;
  id v20 = a5;
  id v21 = a6;
  id v22 = a7;
  id v23 = a9;
  id v24 = a11;
  id v25 = a12;
  v42.receiver = self;
  v42.super_class = (Class)PXTimelineEntry;
  v26 = [(PXTimelineEntry *)&v42 init];
  if (v26)
  {
    uint64_t v27 = [v41 copy];
    title = v26->_title;
    v26->_title = (NSString *)v27;

    uint64_t v29 = [v19 copy];
    subtitle = v26->_subtitle;
    v26->_subtitle = (NSString *)v29;

    uint64_t v31 = [v20 copy];
    localIdentifier = v26->_localIdentifier;
    v26->_localIdentifier = (NSString *)v31;

    uint64_t v33 = [v21 copy];
    assetLocalIdentifier = v26->_assetLocalIdentifier;
    v26->_assetLocalIdentifier = (NSString *)v33;

    uint64_t v35 = [v22 copy];
    deeplink = v26->_deeplink;
    v26->_deeplink = (NSURL *)v35;

    v26->_contentType = a8;
    uint64_t v37 = [v23 copy];
    sourceIdentifier = v26->_sourceIdentifier;
    v26->_sourceIdentifier = (NSString *)v37;

    v26->_relevanceScore = a10;
    objc_storeStrong((id *)&v26->_proactiveCriterion, a11);
    objc_storeStrong((id *)&v26->_suggestedCrop, a12);
    v26->_rejectReason = a13;
  }

  return v26;
}

- (PXTimelineEntry)initWithAlbumFeaturedPhoto:(id)a3 localAlbumIdentifier:(id)a4 andFeaturedPhotoKeyAsset:(id)a5 suggestedCrop:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  v13 = [a5 localIdentifier];
  uint64_t v14 = [MEMORY[0x1E4F38EB8] uuidFromLocalIdentifier:v13];
  v15 = [MEMORY[0x1E4F38EE8] uuidFromLocalIdentifier:v11];
  v16 = (void *)MEMORY[0x1E4F1CB10];
  v17 = [NSString stringWithFormat:@"photos://asset?uuid=%@&albumuuid=%@&oneUp=1&source=widget", v14, v15];
  v18 = [v16 URLWithString:v17];

  id v19 = +[PXProactiveSuggester proactiveCriterionForFeaturedPhoto:v12];
  id v20 = [v12 localIdentifier];

  id v21 = [(PXTimelineEntry *)self initWithTitle:0 subtitle:0 localIdentifier:v20 assetLocalIdentifier:v13 deeplink:v18 contentType:2 sourceIdentifier:0.0 relevanceScore:v11 proactiveCriterion:v19 suggestedCrop:v10 rejectReason:0];
  return v21;
}

- (PXTimelineEntry)initWithFeaturedPhoto:(id)a3 andFeaturedPhotoKeyAsset:(id)a4 suggestedCrop:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [v10 localIdentifier];
  id v12 = (void *)MEMORY[0x1E4F1CB10];
  v13 = [NSString stringWithFormat:@"photos://featuredPhoto?identifier=%@&source=widget", v11];
  uint64_t v14 = [v12 URLWithString:v13];

  v15 = +[PXProactiveSuggester proactiveCriterionForFeaturedPhoto:v10];
  v16 = [v10 localIdentifier];

  v17 = [v9 localIdentifier];

  v18 = [(PXTimelineEntry *)self initWithTitle:0 subtitle:0 localIdentifier:v16 assetLocalIdentifier:v17 deeplink:v14 contentType:1 sourceIdentifier:0.0 relevanceScore:0 proactiveCriterion:v15 suggestedCrop:v8 rejectReason:0];
  return v18;
}

- (PXTimelineEntry)initWithFeaturedPhoto:(id)a3 andFeaturedPhotoKeyAsset:(id)a4
{
  return [(PXTimelineEntry *)self initWithFeaturedPhoto:a3 andFeaturedPhotoKeyAsset:a4 suggestedCrop:0];
}

- (PXTimelineEntry)initWithMemory:(id)a3 andMemoryKeyAsset:(id)a4
{
  id v6 = a4;
  id v7 = (void *)MEMORY[0x1E4F1CB10];
  id v8 = NSString;
  id v9 = a3;
  id v10 = [v9 localIdentifier];
  id v11 = [v8 stringWithFormat:@"photos://memory?identifier=%@&source=widget", v10];
  id v12 = [v7 URLWithString:v11];

  v13 = (void *)MEMORY[0x1E4F39188];
  uint64_t v14 = [MEMORY[0x1E4F1C9C8] date];
  [v13 relevanceScoreForMemory:v9 atDate:v14];
  double v16 = v15;

  v17 = +[PXProactiveSuggester proactiveCriterionForMemory:v9];
  v18 = [v9 localizedTitle];
  id v19 = [v9 localizedSubtitle];
  id v20 = [v9 localIdentifier];

  if (v6)
  {
    id v21 = [v6 localIdentifier];
    id v22 = [(PXTimelineEntry *)self initWithTitle:v18 subtitle:v19 localIdentifier:v20 assetLocalIdentifier:v21 deeplink:v12 contentType:0 sourceIdentifier:v16 relevanceScore:0 proactiveCriterion:v17 suggestedCrop:0 rejectReason:0];
  }
  else
  {
    id v22 = [(PXTimelineEntry *)self initWithTitle:v18 subtitle:v19 localIdentifier:v20 assetLocalIdentifier:&stru_1F00B0030 deeplink:v12 contentType:0 sourceIdentifier:v16 relevanceScore:0 proactiveCriterion:v17 suggestedCrop:0 rejectReason:0];
  }

  return v22;
}

+ (id)descriptionForRejectReason:(unint64_t)a3
{
  if (a3 - 1 > 3) {
    return @"None";
  }
  else {
    return off_1E5DB4CE8[a3 - 1];
  }
}

+ (id)descriptionForTimelineContentType:(unint64_t)a3
{
  id v3 = @"Memory";
  if (a3 == 1) {
    id v3 = @"Featured Photo";
  }
  if (a3 == 2) {
    return @"Album";
  }
  else {
    return v3;
  }
}

+ (id)privacyDisclosureEntryForContentType:(unint64_t)a3
{
  uint64_t v5 = PXLocalizedStringFromTable(@"PXTimelinePrivacyDisclosureRequired", @"PhotosUICore");
  id v6 = [a1 emptyWidgetURLForContentType:a3 sourceIdentifier:0];
  id v7 = [[PXTimelineEntry alloc] initWithTitle:v5 subtitle:@"-------" localIdentifier:&stru_1F00B0030 assetLocalIdentifier:&stru_1F00B0030 deeplink:v6 contentType:a3 sourceIdentifier:0.0 relevanceScore:0 proactiveCriterion:0 suggestedCrop:0 rejectReason:0];

  return v7;
}

+ (id)fallbackEntryForAlbumNotFoundWithLocalIdentifier:(id)a3 size:(unint64_t)a4
{
  id v6 = a3;
  if (a4 > 3)
  {
    id v7 = 0;
  }
  else
  {
    id v7 = PXLocalizedStringFromTable(off_1E5DB4CC8[a4], @"PhotosUICore");
  }
  id v8 = [a1 emptyWidgetURLForContentType:2 sourceIdentifier:v6];
  id v9 = [[PXTimelineEntry alloc] initWithTitle:v7 subtitle:0 localIdentifier:&stru_1F00B0030 assetLocalIdentifier:&stru_1F00B0030 deeplink:v8 contentType:2 sourceIdentifier:0.0 relevanceScore:v6 proactiveCriterion:0 suggestedCrop:0 rejectReason:0];

  return v9;
}

+ (id)fallbackEntryForContentType:(unint64_t)a3 sourceIdentifier:(id)a4 size:(unint64_t)a5
{
  id v8 = a4;
  if (a3 != 2 && !PLIsFeaturedContentAllowed())
  {
    id v11 = @"PXTimelineDisabledContentTitle";
LABEL_11:
    id v12 = PXLocalizedStringFromTable(v11, @"PhotosUICore");
    goto LABEL_12;
  }
  if (a5 - 1 < 3)
  {
    id v9 = @"PXTimelineNoContentTitle";
    id v10 = @"PXTimelineNoAlbumContentTitle";
    goto LABEL_7;
  }
  if (!a5)
  {
    id v9 = @"PXTimelineNoContentTitleWrapped";
    id v10 = @"PXTimelineNoAlbumContentTitleWrapped";
LABEL_7:
    if (a3 == 2) {
      id v11 = v10;
    }
    else {
      id v11 = v9;
    }
    goto LABEL_11;
  }
  id v12 = 0;
LABEL_12:
  v13 = [a1 emptyWidgetURLForContentType:a3 sourceIdentifier:v8];
  uint64_t v14 = [[PXTimelineEntry alloc] initWithTitle:v12 subtitle:0 localIdentifier:&stru_1F00B0030 assetLocalIdentifier:&stru_1F00B0030 deeplink:v13 contentType:a3 sourceIdentifier:0.0 relevanceScore:v8 proactiveCriterion:0 suggestedCrop:0 rejectReason:0];

  return v14;
}

+ (id)fallbackEntryForContentType:(unint64_t)a3 size:(unint64_t)a4
{
  return (id)[a1 fallbackEntryForContentType:a3 sourceIdentifier:0 size:a4];
}

+ (id)placeholderEntryForContentType:(unint64_t)a3
{
  uint64_t v5 = [PXTimelineEntry alloc];
  id v6 = [a1 emptyWidgetURLForContentType:a3 sourceIdentifier:0];
  id v7 = [(PXTimelineEntry *)v5 initWithTitle:@"---------------" subtitle:@"-------" localIdentifier:&stru_1F00B0030 assetLocalIdentifier:&stru_1F00B0030 deeplink:v6 contentType:a3 sourceIdentifier:0.0 relevanceScore:0 proactiveCriterion:0 suggestedCrop:0 rejectReason:0];

  return v7;
}

+ (id)emptyWidgetURLForContentType:(unint64_t)a3 sourceIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = v5;
  if (a3 >= 2)
  {
    if (a3 != 2)
    {
      v13 = 0;
      goto LABEL_11;
    }
    if (v5)
    {
      id v10 = [MEMORY[0x1E4F38EE8] uuidFromLocalIdentifier:v5];
      id v11 = (void *)MEMORY[0x1E4F1CB10];
      id v12 = [NSString stringWithFormat:@"photos://album?uuid=%@", v10];
      v13 = [v11 URLWithString:v12];

      goto LABEL_11;
    }
    id v8 = (void *)MEMORY[0x1E4F1CB10];
    id v9 = @"photos://contentmode?id=albums";
  }
  else
  {
    int v7 = PLIsFeaturedContentAllowed();
    id v8 = (void *)MEMORY[0x1E4F1CB10];
    if (v7) {
      id v9 = @"photos://contentmode?id=forYou";
    }
    else {
      id v9 = @"photos://contentmode?id=photos";
    }
  }
  v13 = [v8 URLWithString:v9];
LABEL_11:

  return v13;
}

@end