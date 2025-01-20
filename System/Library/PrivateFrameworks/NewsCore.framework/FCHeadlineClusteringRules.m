@interface FCHeadlineClusteringRules
+ (id)rulesWithTreatment:(id)a3 configurationSet:(int64_t)a4 deviceIsiPad:(BOOL)a5 limitUnpaidArticles:(BOOL)a6 enforcePublisherCap:(BOOL)a7 minClusterSizeiPhone:(int64_t)a8 maxClusterSizeiPhone:(int64_t)a9 minClusterSizeiPad:(int64_t)a10 maxClusterSizeiPad:(int64_t)a11 todayFeedEnabled:(BOOL)a12;
+ (id)rulesWithTreatment:(id)a3 configurationSet:(int64_t)a4 deviceIsiPad:(BOOL)a5 limitUnpaidArticles:(BOOL)a6 enforcePublisherCap:(BOOL)a7 todayFeedEnabled:(BOOL)a8;
+ (id)rulesWithTreatment:(id)a3 deviceIsiPad:(BOOL)a4 limitUnpaidArticles:(BOOL)a5 enforcePublisherCap:(BOOL)a6 minClusterSizeiPhone:(int64_t)a7 maxClusterSizeiPhone:(int64_t)a8 minClusterSizeiPad:(int64_t)a9 maxClusterSizeiPad:(int64_t)a10 todayFeedEnabled:(BOOL)a11;
+ (id)rulesWithTreatment:(id)a3 deviceIsiPad:(BOOL)a4 limitUnpaidArticles:(BOOL)a5 enforcePublisherCap:(BOOL)a6 todayFeedEnabled:(BOOL)a7;
- (BOOL)enforcePublisherCap;
- (FCHeadlineClusteringRules)init;
- (FCHeadlineClusteringRules)initWithMinClusterSize:(unint64_t)a3 maxClusterSize:(unint64_t)a4 minIdealClusterSize:(unint64_t)a5 maxIdealClusterSize:(unint64_t)a6 minClusterSizeAutoFavorite:(unint64_t)a7 maxClusterSizeAutoFavorite:(unint64_t)a8 minIdealClusterSizeAutoFavorite:(unint64_t)a9 maxIdealClusterSizeAutoFavorite:(unint64_t)a10 maxPublisherOccurrences:(unint64_t)a11 enforcePublisherCap:(BOOL)a12 maxUnpaidArticles:(unint64_t)a13 maxEvergreenArticles:(unint64_t)a14 topicDiversityThreshold:(double)a15 maxNativeAdCount:(unint64_t)a16 thumbnailMinHammingDistance:(unint64_t)a17;
- (double)autoFavoriteClusterMaxSizeMultiplier;
- (double)autoFavoriteClusterMinSizeMultiplier;
- (double)topicDiversityThreshold;
- (unint64_t)maxClusterSize;
- (unint64_t)maxClusterSizeAutoFavorite;
- (unint64_t)maxEvergreenArticles;
- (unint64_t)maxIdealClusterSize;
- (unint64_t)maxIdealClusterSizeAutoFavorite;
- (unint64_t)maxNativeAdCount;
- (unint64_t)maxPublisherOccurrences;
- (unint64_t)maxUnpaidArticles;
- (unint64_t)minClusterSize;
- (unint64_t)minClusterSizeAutoFavorite;
- (unint64_t)minIdealClusterSize;
- (unint64_t)minIdealClusterSizeAutoFavorite;
- (unint64_t)thumbnailMinHammingDistance;
- (void)setAutoFavoriteClusterMaxSizeMultiplier:(double)a3;
- (void)setAutoFavoriteClusterMinSizeMultiplier:(double)a3;
- (void)setMaxClusterSizeAutoFavorite:(unint64_t)a3;
- (void)setMaxIdealClusterSizeAutoFavorite:(unint64_t)a3;
- (void)setMinClusterSizeAutoFavorite:(unint64_t)a3;
- (void)setMinIdealClusterSizeAutoFavorite:(unint64_t)a3;
@end

@implementation FCHeadlineClusteringRules

+ (id)rulesWithTreatment:(id)a3 deviceIsiPad:(BOOL)a4 limitUnpaidArticles:(BOOL)a5 enforcePublisherCap:(BOOL)a6 todayFeedEnabled:(BOOL)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  BOOL v10 = a4;
  id v12 = a3;
  v13 = v12;
  if (v12)
  {
    uint64_t v14 = [v12 minClusterSizeIPhone];
    uint64_t v15 = [v13 maxClusterSizeIPhone];
    uint64_t v16 = [v13 minClusterSizeIPad];
    uint64_t v17 = [v13 maxClusterSizeIPad];
  }
  else
  {
    uint64_t v15 = 30;
    uint64_t v16 = 3;
    uint64_t v14 = 3;
    uint64_t v17 = 30;
  }
  LOBYTE(v20) = a7;
  v18 = [a1 rulesWithTreatment:v13 configurationSet:0 deviceIsiPad:v10 limitUnpaidArticles:v9 enforcePublisherCap:v8 minClusterSizeiPhone:v14 maxClusterSizeiPhone:v15 minClusterSizeiPad:v16 maxClusterSizeiPad:v17 todayFeedEnabled:v20];

  return v18;
}

+ (id)rulesWithTreatment:(id)a3 deviceIsiPad:(BOOL)a4 limitUnpaidArticles:(BOOL)a5 enforcePublisherCap:(BOOL)a6 minClusterSizeiPhone:(int64_t)a7 maxClusterSizeiPhone:(int64_t)a8 minClusterSizeiPad:(int64_t)a9 maxClusterSizeiPad:(int64_t)a10 todayFeedEnabled:(BOOL)a11
{
  LOBYTE(v12) = a11;
  return (id)[a1 rulesWithTreatment:a3 configurationSet:0 deviceIsiPad:a4 limitUnpaidArticles:a5 enforcePublisherCap:a6 minClusterSizeiPhone:a7 maxClusterSizeiPhone:a8 minClusterSizeiPad:a9 maxClusterSizeiPad:a10 todayFeedEnabled:v12];
}

+ (id)rulesWithTreatment:(id)a3 configurationSet:(int64_t)a4 deviceIsiPad:(BOOL)a5 limitUnpaidArticles:(BOOL)a6 enforcePublisherCap:(BOOL)a7 todayFeedEnabled:(BOOL)a8
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  BOOL v11 = a5;
  id v14 = a3;
  uint64_t v15 = v14;
  if (v14)
  {
    uint64_t v16 = [v14 minClusterSizeIPhone];
    uint64_t v17 = [v15 maxClusterSizeIPhone];
    uint64_t v18 = [v15 minClusterSizeIPad];
    uint64_t v19 = [v15 maxClusterSizeIPad];
  }
  else
  {
    uint64_t v17 = 30;
    uint64_t v18 = 3;
    uint64_t v16 = 3;
    uint64_t v19 = 30;
  }
  LOBYTE(v22) = a8;
  uint64_t v20 = [a1 rulesWithTreatment:v15 configurationSet:a4 deviceIsiPad:v11 limitUnpaidArticles:v10 enforcePublisherCap:v9 minClusterSizeiPhone:v16 maxClusterSizeiPhone:v17 minClusterSizeiPad:v18 maxClusterSizeiPad:v19 todayFeedEnabled:v22];

  return v20;
}

+ (id)rulesWithTreatment:(id)a3 configurationSet:(int64_t)a4 deviceIsiPad:(BOOL)a5 limitUnpaidArticles:(BOOL)a6 enforcePublisherCap:(BOOL)a7 minClusterSizeiPhone:(int64_t)a8 maxClusterSizeiPhone:(int64_t)a9 minClusterSizeiPad:(int64_t)a10 maxClusterSizeiPad:(int64_t)a11 todayFeedEnabled:(BOOL)a12
{
  BOOL v14 = a6;
  BOOL v15 = a5;
  BOOL v17 = a12;
  int64_t v18 = a10;
  id v19 = a3;
  uint64_t v20 = v19;
  v21 = &a9;
  if (v15) {
    v21 = &a11;
  }
  int64_t v22 = *v21;
  if (!v15) {
    int64_t v18 = a8;
  }
  if (!v19)
  {
    v25 = [FCHeadlineClusteringRules alloc];
    if (v15) {
      uint64_t v26 = 5;
    }
    else {
      uint64_t v26 = 3;
    }
    LOBYTE(v44) = a7;
    uint64_t v27 = -[FCHeadlineClusteringRules initWithMinClusterSize:maxClusterSize:minIdealClusterSize:maxIdealClusterSize:minClusterSizeAutoFavorite:maxClusterSizeAutoFavorite:minIdealClusterSizeAutoFavorite:maxIdealClusterSizeAutoFavorite:maxPublisherOccurrences:enforcePublisherCap:maxUnpaidArticles:maxEvergreenArticles:topicDiversityThreshold:maxNativeAdCount:thumbnailMinHammingDistance:](v25, "initWithMinClusterSize:maxClusterSize:minIdealClusterSize:maxIdealClusterSize:minClusterSizeAutoFavorite:maxClusterSizeAutoFavorite:minIdealClusterSizeAutoFavorite:maxIdealClusterSizeAutoFavorite:maxPublisherOccurrences:enforcePublisherCap:maxUnpaidArticles:maxEvergreenArticles:topicDiversityThreshold:maxNativeAdCount:thumbnailMinHammingDistance:", v18, v22, 3, 9, 3, 1.0, 3, v26, 2, v44, 1, 0, 0, 0);
    goto LABEL_45;
  }
  if (v15)
  {
    uint64_t v23 = [v19 maxUnpaidArticlesIPad];
    uint64_t v48 = [v20 maxPublisherOccurrencesIPad];
    uint64_t v24 = [v20 maxNativeAdCountIPad];
  }
  else
  {
    uint64_t v23 = [v19 maxUnpaidArticlesIPhone];
    uint64_t v48 = [v20 maxPublisherOccurrencesIPhone];
    uint64_t v24 = [v20 maxNativeAdCountIPhone];
  }
  uint64_t v28 = v24;
  [v20 topicDiversityThreshold];
  double v30 = v29;
  int64_t v47 = v18;
  switch(a4)
  {
    case 10:
      if (v15)
      {
        uint64_t v31 = [v20 maxUnpaidArticlesIPadBestOfBundle];
        uint64_t v48 = [v20 maxPublisherOccurrencesIPadBestOfBundle];
        uint64_t v32 = [v20 maxNativeAdCountIPadBestOfBundle];
        goto LABEL_28;
      }
      uint64_t v31 = [v20 maxUnpaidArticlesIPhoneBestOfBundle];
      uint64_t v48 = [v20 maxPublisherOccurrencesIPhoneBestOfBundle];
      uint64_t v40 = [v20 maxNativeAdCountIPhoneBestOfBundle];
      goto LABEL_37;
    case 11:
      if (v15)
      {
        uint64_t v31 = [v20 maxUnpaidArticlesIPadForYouGroup];
        uint64_t v48 = [v20 maxPublisherOccurrencesIPadForYouGroup];
        uint64_t v32 = [v20 maxNativeAdCountIPadForYouGroup];
        goto LABEL_28;
      }
      uint64_t v31 = [v20 maxUnpaidArticlesIPhoneForYouGroup];
      uint64_t v48 = [v20 maxPublisherOccurrencesIPhoneForYouGroup];
      uint64_t v40 = [v20 maxNativeAdCountIPhoneForYouGroup];
      goto LABEL_37;
    case 12:
      if (v15)
      {
        uint64_t v31 = [v20 maxUnpaidArticlesIPadGreatStoriesYouMissed];
        uint64_t v48 = [v20 maxPublisherOccurrencesIPadGreatStoriesYouMissed];
        uint64_t v32 = [v20 maxNativeAdCountIPadGreatStoriesYouMissed];
        goto LABEL_28;
      }
      uint64_t v31 = [v20 maxUnpaidArticlesIPhoneGreatStoriesYouMissed];
      uint64_t v48 = [v20 maxPublisherOccurrencesIPhoneGreatStoriesYouMissed];
      uint64_t v40 = [v20 maxNativeAdCountIPhoneGreatStoriesYouMissed];
      goto LABEL_37;
    case 13:
    case 14:
    case 15:
    case 16:
    case 17:
    case 18:
    case 20:
      goto LABEL_22;
    case 19:
    case 21:
      goto LABEL_17;
    default:
      if ((unint64_t)(a4 - 27) < 2)
      {
LABEL_17:
        if (v17) {
          uint64_t v33 = v28;
        }
        else {
          uint64_t v33 = 0;
        }
        uint64_t v46 = v33;
        v45 = [FCHeadlineClusteringRules alloc];
        double v30 = 1.0;
        uint64_t v31 = v23;
        if (!v15) {
          goto LABEL_41;
        }
LABEL_32:
        uint64_t v35 = [v20 minIdealClusterSizeIPad];
        uint64_t v36 = [v20 maxIdealClusterSizeIPad];
        uint64_t v37 = [v20 minClusterSizeIPadAutoFavorite];
        [v20 maxClusterSizeIPadAutoFavorite];
        uint64_t v38 = [v20 minIdealClusterSizeIPadAutoFavorite];
        uint64_t v39 = [v20 maxIdealClusterSizeIPadAutoFavorite];
        goto LABEL_42;
      }
LABEL_22:
      if (v15)
      {
        uint64_t v31 = [v20 maxUnpaidArticlesIPad];
        uint64_t v48 = [v20 maxPublisherOccurrencesIPad];
        uint64_t v32 = [v20 maxNativeAdCountIPad];
LABEL_28:
        if (v17) {
          uint64_t v34 = v32;
        }
        else {
          uint64_t v34 = 0;
        }
        uint64_t v46 = v34;
        v45 = [FCHeadlineClusteringRules alloc];
        goto LABEL_32;
      }
      uint64_t v31 = [v20 maxUnpaidArticlesIPhone];
      uint64_t v48 = [v20 maxPublisherOccurrencesIPhone];
      uint64_t v40 = [v20 maxNativeAdCountIPhone];
LABEL_37:
      if (v17) {
        uint64_t v41 = v40;
      }
      else {
        uint64_t v41 = 0;
      }
      uint64_t v46 = v41;
      v45 = [FCHeadlineClusteringRules alloc];
LABEL_41:
      uint64_t v35 = [v20 minIdealClusterSizeIPhone];
      uint64_t v36 = [v20 maxIdealClusterSizeIPhone];
      uint64_t v37 = [v20 minClusterSizeIPhoneAutoFavorite];
      [v20 maxClusterSizeIPhoneAutoFavorite];
      uint64_t v38 = [v20 minIdealClusterSizeIPhoneAutoFavorite];
      uint64_t v39 = [v20 maxIdealClusterSizeIPhoneAutoFavorite];
LABEL_42:
      if (!v14) {
        uint64_t v31 = v22;
      }
      LOBYTE(v44) = a7;
      uint64_t v27 = -[FCHeadlineClusteringRules initWithMinClusterSize:maxClusterSize:minIdealClusterSize:maxIdealClusterSize:minClusterSizeAutoFavorite:maxClusterSizeAutoFavorite:minIdealClusterSizeAutoFavorite:maxIdealClusterSizeAutoFavorite:maxPublisherOccurrences:enforcePublisherCap:maxUnpaidArticles:maxEvergreenArticles:topicDiversityThreshold:maxNativeAdCount:thumbnailMinHammingDistance:](v45, "initWithMinClusterSize:maxClusterSize:minIdealClusterSize:maxIdealClusterSize:minClusterSizeAutoFavorite:maxClusterSizeAutoFavorite:minIdealClusterSizeAutoFavorite:maxIdealClusterSizeAutoFavorite:maxPublisherOccurrences:enforcePublisherCap:maxUnpaidArticles:maxEvergreenArticles:topicDiversityThreshold:maxNativeAdCount:thumbnailMinHammingDistance:", v47, v22, v35, v36, v37, v30, v38, v39, v48, v44, v31, [v20 maxEvergreenArticlesPerGroup], v46, objc_msgSend(v20, "thumbnailMinHammingDistance"));
LABEL_45:
      v42 = (void *)v27;

      return v42;
  }
}

- (FCHeadlineClusteringRules)initWithMinClusterSize:(unint64_t)a3 maxClusterSize:(unint64_t)a4 minIdealClusterSize:(unint64_t)a5 maxIdealClusterSize:(unint64_t)a6 minClusterSizeAutoFavorite:(unint64_t)a7 maxClusterSizeAutoFavorite:(unint64_t)a8 minIdealClusterSizeAutoFavorite:(unint64_t)a9 maxIdealClusterSizeAutoFavorite:(unint64_t)a10 maxPublisherOccurrences:(unint64_t)a11 enforcePublisherCap:(BOOL)a12 maxUnpaidArticles:(unint64_t)a13 maxEvergreenArticles:(unint64_t)a14 topicDiversityThreshold:(double)a15 maxNativeAdCount:(unint64_t)a16 thumbnailMinHammingDistance:(unint64_t)a17
{
  v30.receiver = self;
  v30.super_class = (Class)FCHeadlineClusteringRules;
  result = [(FCHeadlineClusteringRules *)&v30 init];
  if (result)
  {
    result->_minClusterSize = a3;
    result->_maxClusterSize = a4;
    result->_minIdealClusterSize = a5;
    result->_maxIdealClusterSize = a6;
    result->_minClusterSizeAutoFavorite = a7;
    result->_maxClusterSizeAutoFavorite = a8;
    result->_minIdealClusterSizeAutoFavorite = a9;
    result->_maxIdealClusterSizeAutoFavorite = a10;
    result->_enforcePublisherCap = a12;
    result->_maxUnpaidArticles = a13;
    result->_maxEvergreenArticles = a14;
    result->_topicDiversityThreshold = a15;
    result->_maxPublisherOccurrences = a11;
    result->_maxNativeAdCount = a16;
    result->_thumbnailMinHammingDistance = a17;
    __asm { FMOV            V0.2D, #1.0 }
    *(_OWORD *)&result->_autoFavoriteClusterMinSizeMultiplier = _Q0;
  }
  return result;
}

- (FCHeadlineClusteringRules)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    BOOL v8 = "-[FCHeadlineClusteringRules init]";
    __int16 v9 = 2080;
    BOOL v10 = "FCHeadlineClusteringRules.m";
    __int16 v11 = 1024;
    int v12 = 213;
    __int16 v13 = 2114;
    BOOL v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCHeadlineClusteringRules init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (unint64_t)minClusterSizeAutoFavorite
{
  double minClusterSizeAutoFavorite = (double)self->_minClusterSizeAutoFavorite;
  [(FCHeadlineClusteringRules *)self autoFavoriteClusterMinSizeMultiplier];
  *(float *)&double v3 = v3 * minClusterSizeAutoFavorite;
  return vcvtas_u32_f32(*(float *)&v3);
}

- (unint64_t)maxClusterSizeAutoFavorite
{
  double maxClusterSizeAutoFavorite = (double)self->_maxClusterSizeAutoFavorite;
  [(FCHeadlineClusteringRules *)self autoFavoriteClusterMaxSizeMultiplier];
  *(float *)&double v3 = v3 * maxClusterSizeAutoFavorite;
  return vcvtas_u32_f32(*(float *)&v3);
}

- (unint64_t)minIdealClusterSizeAutoFavorite
{
  double minIdealClusterSizeAutoFavorite = (double)self->_minIdealClusterSizeAutoFavorite;
  [(FCHeadlineClusteringRules *)self autoFavoriteClusterMinSizeMultiplier];
  *(float *)&double v3 = v3 * minIdealClusterSizeAutoFavorite;
  return vcvtas_u32_f32(*(float *)&v3);
}

- (unint64_t)maxIdealClusterSizeAutoFavorite
{
  double maxIdealClusterSizeAutoFavorite = (double)self->_maxIdealClusterSizeAutoFavorite;
  [(FCHeadlineClusteringRules *)self autoFavoriteClusterMaxSizeMultiplier];
  *(float *)&double v3 = v3 * maxIdealClusterSizeAutoFavorite;
  return vcvtas_u32_f32(*(float *)&v3);
}

- (unint64_t)minClusterSize
{
  return self->_minClusterSize;
}

- (unint64_t)maxClusterSize
{
  return self->_maxClusterSize;
}

- (unint64_t)minIdealClusterSize
{
  return self->_minIdealClusterSize;
}

- (unint64_t)maxIdealClusterSize
{
  return self->_maxIdealClusterSize;
}

- (void)setMinClusterSizeAutoFavorite:(unint64_t)a3
{
  self->_double minClusterSizeAutoFavorite = a3;
}

- (void)setMaxClusterSizeAutoFavorite:(unint64_t)a3
{
  self->_double maxClusterSizeAutoFavorite = a3;
}

- (void)setMinIdealClusterSizeAutoFavorite:(unint64_t)a3
{
  self->_double minIdealClusterSizeAutoFavorite = a3;
}

- (void)setMaxIdealClusterSizeAutoFavorite:(unint64_t)a3
{
  self->_double maxIdealClusterSizeAutoFavorite = a3;
}

- (unint64_t)maxPublisherOccurrences
{
  return self->_maxPublisherOccurrences;
}

- (unint64_t)maxNativeAdCount
{
  return self->_maxNativeAdCount;
}

- (BOOL)enforcePublisherCap
{
  return self->_enforcePublisherCap;
}

- (unint64_t)maxUnpaidArticles
{
  return self->_maxUnpaidArticles;
}

- (unint64_t)maxEvergreenArticles
{
  return self->_maxEvergreenArticles;
}

- (double)topicDiversityThreshold
{
  return self->_topicDiversityThreshold;
}

- (unint64_t)thumbnailMinHammingDistance
{
  return self->_thumbnailMinHammingDistance;
}

- (double)autoFavoriteClusterMinSizeMultiplier
{
  return self->_autoFavoriteClusterMinSizeMultiplier;
}

- (void)setAutoFavoriteClusterMinSizeMultiplier:(double)a3
{
  self->_autoFavoriteClusterMinSizeMultiplier = a3;
}

- (double)autoFavoriteClusterMaxSizeMultiplier
{
  return self->_autoFavoriteClusterMaxSizeMultiplier;
}

- (void)setAutoFavoriteClusterMaxSizeMultiplier:(double)a3
{
  self->_autoFavoriteClusterMaxSizeMultiplier = a3;
}

@end