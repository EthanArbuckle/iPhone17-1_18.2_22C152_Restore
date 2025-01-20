@interface FCCKOrderFeedUtilities
+ (id)orderFeedIDFromFeedID:(id)a3;
+ (id)orderFeedRequestForFeedID:(id)a3 feedRange:(id)a4;
+ (int64_t)_feedBinFromFeedID:(id)a3;
+ (unint64_t)_orderFeedTopKFromBin:(int64_t)a3 timeInterval:(double)a4;
@end

@implementation FCCKOrderFeedUtilities

+ (id)orderFeedRequestForFeedID:(id)a3 feedRange:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [a1 _feedBinFromFeedID:v7];
  v9 = objc_alloc_init(FCCKOrderFeedRequest);
  v10 = [a1 orderFeedIDFromFeedID:v7];

  if (v9) {
    objc_setProperty_nonatomic_copy(v9, v11, v10, 8);
  }

  v12 = [v6 top];
  uint64_t v13 = [v12 order];
  if (v9) {
    v9->_maxOrder = v13;
  }

  v14 = [v6 bottom];
  uint64_t v15 = [v14 order];
  if (v9) {
    v9->_minOrder = v15 + 1;
  }

  [v6 timeInterval];
  double v17 = v16;

  uint64_t v18 = [a1 _orderFeedTopKFromBin:v8 timeInterval:v17];
  if (v9) {
    v9->_topK = v18;
  }
  return v9;
}

+ (id)orderFeedIDFromFeedID:(id)a3
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v8[0] = @"@A";
  v8[1] = @"@B";
  v3 = (void *)MEMORY[0x1E4F1C978];
  id v4 = a3;
  v5 = [v3 arrayWithObjects:v8 count:2];
  id v6 = objc_msgSend(v4, "fc_stringByReplacingOccurrencesOfStrings:withString:", v5, &stru_1EF8299B8);

  return v6;
}

+ (int64_t)_feedBinFromFeedID:(id)a3
{
  id v3 = a3;
  if ([v3 containsString:@"@A"])
  {
    int64_t v4 = 1;
  }
  else if ([v3 containsString:@"@B"])
  {
    int64_t v4 = 2;
  }
  else
  {
    int64_t v4 = 3;
  }

  return v4;
}

+ (unint64_t)_orderFeedTopKFromBin:(int64_t)a3 timeInterval:(double)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a4 > 604800.0) {
    return 0;
  }
  if (!a3)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      id v6 = (void *)[[NSString alloc] initWithFormat:@"Case unsupported"];
      int v7 = 136315906;
      uint64_t v8 = "+[FCCKOrderFeedUtilities _orderFeedTopKFromBin:timeInterval:]";
      __int16 v9 = 2080;
      v10 = "FCCKOrderFeedUtilities.m";
      __int16 v11 = 1024;
      int v12 = 93;
      __int16 v13 = 2114;
      v14 = v6;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v7, 0x26u);
    }
    return 0;
  }
  if (a3 == 1)
  {
    double v5 = 86400.0;
    return vcvtpd_u64_f64(a4 / v5 * 12.0);
  }
  if (a3 != 2) {
    return 0;
  }
  double v5 = 3600.0;
  return vcvtpd_u64_f64(a4 / v5 * 12.0);
}

@end