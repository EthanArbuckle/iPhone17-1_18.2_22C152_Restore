@interface WBSResultRankerHelpers
+ (BOOL)allowMatch:(id)a3 forMatch:(id)a4 forQueryString:(id)a5;
+ (BOOL)hostAreEqual:(id)a3 forSecondURLString:(id)a4;
+ (double)topSitesScoreAndVisitCountScoreFactor:(id)a3 forTopSiteScore:(float)a4 forVisitCountScore:(int64_t)a5;
+ (id)simplifiedURL:(id)a3;
+ (int64_t)numberOfWords:(id)a3;
@end

@implementation WBSResultRankerHelpers

+ (BOOL)hostAreEqual:(id)a3 forSecondURLString:(id)a4
{
  id v5 = a4;
  v6 = [MEMORY[0x1E4F1CB10] URLWithString:a3];
  v7 = [v6 host];
  v8 = [MEMORY[0x1E4F1CB10] URLWithString:v5];
  v9 = [v8 host];
  char v10 = [v7 isEqualToString:v9];

  return v10;
}

+ (id)simplifiedURL:(id)a3
{
  v3 = [MEMORY[0x1E4F1CB10] URLWithString:a3];
  v4 = [v3 host];

  id v5 = objc_msgSend(v4, "safari_stringByRemovingTopLevelDomainFromHost");
  v6 = objc_msgSend(v5, "safari_stringByRemovingWwwDotPrefix");

  return v6;
}

+ (int64_t)numberOfWords:(id)a3
{
  id v3 = a3;
  v4 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  id v5 = [v3 componentsSeparatedByCharactersInSet:v4];
  v6 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"SELF != ''"];
  v7 = [v5 filteredArrayUsingPredicate:v6];
  int64_t v8 = [v7 count];

  return v8;
}

+ (double)topSitesScoreAndVisitCountScoreFactor:(id)a3 forTopSiteScore:(float)a4 forVisitCountScore:(int64_t)a5
{
  id v7 = a3;
  if (a5 == -1)
  {
    float v9 = 1.0;
  }
  else
  {
    +[WBSHistoryVisit weightedVisitCountFromScore:a5];
    float v9 = tanhf(v8 + 1.1755e-38);
  }
  if (a4 != -1.0) {
    float v9 = v9 * tanhf(a4 + 1.1755e-38);
  }
  [v7 normalizedTopSitesScoreAndVisitCountMultiplier];
  double v11 = v10;
  [v7 normalizedTopSitesScoreAndVisitCountMultiplier];
  double v13 = 1.0 / (v9 * v11 + 1.0) + 1.0 - 1.0 / (v12 + 1.0);

  return v13;
}

+ (BOOL)allowMatch:(id)a3 forMatch:(id)a4 forQueryString:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unint64_t v11 = [v10 length];
  int v12 = [v9 containsBookmark];
  if (v12) {
    double v13 = (double)v11 * 1.5;
  }
  else {
    double v13 = (double)v11;
  }
  if (v12) {
    double v14 = 0.75;
  }
  else {
    double v14 = 1.0;
  }
  [v9 topSitesScore];
  int v16 = v15;
  uint64_t v17 = [v9 visitCountScore];
  LODWORD(v18) = v16;
  [a1 topSitesScoreAndVisitCountScoreFactor:v8 forTopSiteScore:v17 forVisitCountScore:v18];
  float v20 = v19;
  switch([v9 matchLocation])
  {
    case 2:
      v22 = [v9 originalURLString];
      v23 = [a1 simplifiedURL:v22];
      unint64_t v24 = [v23 length];

      if (v13 >= (double)[v8 characterThresholdForAnywhereInTitleOrURL]) {
        goto LABEL_15;
      }
      [v8 percentageThresholdForAnywhereInURL];
      BOOL v26 = (v13 + 1.0) / (double)v24 < v14 * v25;
      goto LABEL_20;
    case 3:
      v28 = [v9 title];
      unint64_t v29 = [v28 length];

      if (v13 >= (double)[v8 characterThresholdForAnywhereInTitleOrURL]) {
        goto LABEL_15;
      }
      [v8 percentageThresholdForAnywhereInTitle];
      if ((v13 + 1.0) / (double)v29 >= v14 * v30) {
        goto LABEL_15;
      }
      uint64_t v31 = [a1 numberOfWords:v10];
      BOOL v26 = v31 < [v8 matchingWordsInTitleThreshold];
      goto LABEL_20;
    case 4:
    case 6:
      uint64_t v21 = [v8 characterThresholdForStartOfTitleWord];
      goto LABEL_19;
    case 5:
      uint64_t v21 = [v8 characterThresholdForStartOfURLPathComponent];
      goto LABEL_19;
    case 7:
      uint64_t v21 = [v8 characterThresholdForStartOfTitle];
      goto LABEL_19;
    case 8:
    case 10:
LABEL_15:
      BOOL v27 = 1;
      break;
    case 9:
      uint64_t v21 = [v8 characterThresholdForStartOfURL];
LABEL_19:
      BOOL v26 = v13 < floorf(v20 * (float)v21);
LABEL_20:
      BOOL v27 = !v26;
      break;
    default:
      BOOL v27 = 0;
      break;
  }

  return v27;
}

@end