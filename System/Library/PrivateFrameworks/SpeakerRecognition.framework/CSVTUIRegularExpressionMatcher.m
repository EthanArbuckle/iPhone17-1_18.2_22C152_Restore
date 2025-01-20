@interface CSVTUIRegularExpressionMatcher
+ (int64_t)matchWithString:(id)a3 TrailingStr:(id)a4 LeadingStr:(id)a5 Pattern:(id)a6;
@end

@implementation CSVTUIRegularExpressionMatcher

+ (int64_t)matchWithString:(id)a3 TrailingStr:(id)a4 LeadingStr:(id)a5 Pattern:(id)a6
{
  int64_t v6 = 0;
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (a3 && a4 && a5 && a6)
  {
    id v10 = a6;
    v11 = [a3 _stringByStrippingNoiseLeadingNoise:a5 TrailingNoise:a4];
    v12 = *MEMORY[0x263F37FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 136315394;
      v16 = "+[CSVTUIRegularExpressionMatcher matchWithString:TrailingStr:LeadingStr:Pattern:]";
      __int16 v17 = 2112;
      v18 = v11;
      _os_log_impl(&dword_21C8A5000, v12, OS_LOG_TYPE_DEFAULT, "%s Testing [%@] against regex.", (uint8_t *)&v15, 0x16u);
    }
    v13 = [v11 _firstMatchesForRegularExpression:v10];

    int64_t v6 = [v13 count] != 0;
  }
  return v6;
}

@end