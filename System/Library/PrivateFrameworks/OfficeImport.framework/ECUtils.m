@interface ECUtils
+ (BOOL)isRenameFunction:(id)a3;
+ (BOOL)isValidDateTime:(double)a3 edWorkbook:(id)a4;
+ (BOOL)validDateInExcel:(id)a3 edWorkbook:(id)a4;
+ (double)dateTimeNumberFromNSDate:(id)a3 edWorkbook:(id)a4;
+ (double)timeIntervalFromXlDateTimeNumber:(double)a3 edWorkbook:(id)a4;
+ (id)dateFromXlDateTimeNumber:(double)a3 edWorkbook:(id)a4;
+ (id)lassoDefaultTableName;
+ (id)lassoStyleTableReferenceFromTableId:(id)a3;
+ (id)renameFunction:(id)a3;
+ (id)renameMap;
+ (unsigned)dateTimeOffsetForBuggy1900Dates:(double)a3 edWorkbook:(id)a4;
@end

@implementation ECUtils

+ (BOOL)isRenameFunction:(id)a3
{
  id v4 = a3;
  v5 = [a1 renameMap];
  v6 = [v4 uppercaseString];
  v7 = [v5 objectForKey:v6];
  BOOL v8 = v7 != 0;

  return v8;
}

+ (id)renameFunction:(id)a3
{
  id v4 = a3;
  v5 = [v4 uppercaseString];

  v6 = [a1 renameMap];
  v7 = [v6 objectForKey:v5];

  if (v7) {
    BOOL v8 = v7;
  }
  else {
    BOOL v8 = v5;
  }
  id v9 = v8;

  return v9;
}

+ (id)lassoStyleTableReferenceFromTableId:(id)a3
{
  v3 = [NSString stringWithFormat:@"SFTGlobalID_%@", a3];
  return v3;
}

+ (id)lassoDefaultTableName
{
  v2 = TCBundle();
  v3 = [v2 localizedStringForKey:@"Table 1" value:&stru_26EBF24D8 table:@"TCCompatibility"];

  return v3;
}

+ (BOOL)isValidDateTime:(double)a3 edWorkbook:(id)a4
{
  [a1 timeIntervalFromXlDateTimeNumber:a4 edWorkbook:a3];
  return v4 > -2.55485146e11 && v4 < 2.5561129e11;
}

+ (BOOL)validDateInExcel:(id)a3 edWorkbook:(id)a4
{
  id v5 = a3;
  v6 = [a4 dateBaseDate];
  [v5 timeIntervalSinceDate:v6];
  BOOL v8 = v7 >= -86400.0;

  return v8;
}

+ (id)dateFromXlDateTimeNumber:(double)a3 edWorkbook:(id)a4
{
  id v6 = a4;
  [a1 timeIntervalFromXlDateTimeNumber:v6 edWorkbook:a3];
  double v8 = v7;
  id v9 = objc_alloc(MEMORY[0x263EFF910]);
  v10 = [v6 dateBaseDate];
  v11 = (void *)[v9 initWithTimeInterval:v10 sinceDate:v8];

  return v11;
}

+ (double)dateTimeNumberFromNSDate:(id)a3 edWorkbook:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [v7 dateBaseDate];
  [v6 timeIntervalSinceDate:v8];
  double v10 = (v9 - (double)((uint64_t)v9 / 86400) * 86400.0) / 86400.0
      + (double)((uint64_t)v9 / 86400)
      + (double)[a1 dateTimeOffsetForBuggy1900Dates:v7 edWorkbook:(v9 - (double)((uint64_t)v9 / 86400) * 86400.0) / 86400.0 + (double)((uint64_t)v9 / 86400)];

  return v10;
}

+ (id)renameMap
{
  v2 = objc_opt_class();
  objc_sync_enter(v2);
  if (!+[ECUtils(Private) renameMap]::xlRenameMapDictionary)
  {
    uint64_t v3 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", @"BETAINV", @"_XLFN.BETA.INV", @"BINOMDIST", @"_XLFN.BINOM.DIST", @"CRITBINOM", @"_XLFN.BINOM.INV", @"CHIDIST", @"_XLFN.CHISQ.DIST.RT", @"CHIINV", @"_XLFN.CHISQ.INV.RT", @"CHITEST", @"_XLFN.CHISQ.TEST", @"CONFIDENCE", @"_XLFN.CONFIDENCE.NORM", @"COVAR", @"_XLFN.COVARIANCE.P", @"EXPONDIST",
           @"_XLFN.EXPON.DIST",
           @"FDIST",
           @"_XLFN.F.DIST.RT",
           @"FINV",
           @"_XLFN.F.INV.RT",
           @"GAMMADIST",
           @"_XLFN.GAMMA.DIST",
           @"GAMMAINV",
           @"_XLFN.GAMMA.INV",
           @"LOGINV",
           @"_XLFN.LOGNORM.INV",
           @"MODE",
           @"_XLFN.MODE.SNGL",
           @"NORMDIST",
           @"_XLFN.NORM.DIST",
           @"NORMINV",
           @"_XLFN.NORM.INV",
           @"NORMSINV",
           @"_XLFN.NORM.S.INV",
           @"PERCENTILE",
           @"_XLFN.PERCENTILE.INC",
           @"PERCENTRANK",
           @"_XLFN.PERCENTRANK.INC",
           @"POISSON",
           @"_XLFN.POISSON.DIST",
           @"QUARTILE",
           @"_XLFN.QUARTILE.INC",
           @"RANK",
           @"_XLFN.RANK.EQ",
           @"STDEVP",
           @"_XLFN.STDEV.P",
           @"STDEV",
           @"_XLFN.STDEV.S",
           @"TINV",
           @"_XLFN.T.INV.2T",
           @"TTEST",
           @"_XLFN.T.TEST",
           @"VARP",
           @"_XLFN.VAR.P",
           @"VAR",
           @"_XLFN.VAR.S",
           @"ZTEST",
           @"_XLFN.Z.TEST",
           @"BONDDURATION");
    double v4 = (void *)+[ECUtils(Private) renameMap]::xlRenameMapDictionary;
    +[ECUtils(Private) renameMap]::xlRenameMapDictionary = v3;
  }
  objc_sync_exit(v2);

  id v5 = (void *)+[ECUtils(Private) renameMap]::xlRenameMapDictionary;
  return v5;
}

+ (double)timeIntervalFromXlDateTimeNumber:(double)a3 edWorkbook:(id)a4
{
  return (a3 - (double)objc_msgSend(a1, "dateTimeOffsetForBuggy1900Dates:edWorkbook:", a4)) * 86400.0;
}

+ (unsigned)dateTimeOffsetForBuggy1900Dates:(double)a3 edWorkbook:(id)a4
{
  int v5 = [a4 dateBase];
  if (a3 <= 60.0) {
    unsigned int v6 = 1;
  }
  else {
    unsigned int v6 = 2;
  }
  if (v5 == 1) {
    return v6;
  }
  else {
    return 0;
  }
}

@end