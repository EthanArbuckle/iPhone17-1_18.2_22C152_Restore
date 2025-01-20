@interface EMTResult(MetaInfo)
- (double)score;
- (void)score;
@end

@implementation EMTResult(MetaInfo)

- (double)score
{
  v1 = [a1 metaInfo];
  v2 = v1;
  if (v1)
  {
    v3 = [v1 dataUsingEncoding:4];
    id v11 = 0;
    v4 = [MEMORY[0x263F08900] JSONObjectWithData:v3 options:0 error:&v11];
    id v5 = v11;
    if (v4)
    {
      v6 = [v4 objectForKey:@"norm_cost"];
      if (v6)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v7 = v6;
          [v7 doubleValue];
          double v9 = v8 * -0.434294482;
        }
        else
        {
          v7 = _nlpDefaultLog();
          double v9 = -15.6535598;
          if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
            [(EMTResult(MetaInfo) *)(uint64_t)v6 score];
          }
        }
      }
      else
      {
        v7 = _nlpDefaultLog();
        double v9 = -15.6535598;
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          [(EMTResult(MetaInfo) *)(uint64_t)v4 score];
        }
      }
    }
    else
    {
      v6 = _nlpDefaultLog();
      double v9 = -15.6535598;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        [(EMTResult(MetaInfo) *)(uint64_t)v3 score];
      }
    }
  }
  else
  {
    v3 = _nlpDefaultLog();
    double v9 = -15.6535598;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      -[EMTResult(MetaInfo) score](v3);
    }
  }

  return v9;
}

- (void)score
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_26031A000, a2, OS_LOG_TYPE_ERROR, "Failed to get seq2seq score, normCost is not of string class type: %@", (uint8_t *)&v2, 0xCu);
}

@end