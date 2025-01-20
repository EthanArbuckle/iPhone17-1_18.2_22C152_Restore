@interface MOEventBundleRanking(MORankingParamsMO)
@end

@implementation MOEventBundleRanking(MORankingParamsMO)

- (void)setRankingParamsFromRankingParamsMO:()MORankingParamsMO .cold.1(void *a1, NSObject *a2)
{
  int v3 = 134218754;
  id v4 = [a1 count];
  __int16 v5 = 2048;
  uint64_t v6 = 15;
  __int16 v7 = 2080;
  v8 = "-[MOEventBundleRanking(MORankingParamsMO) setRankingParamsFromRankingParamsMO:]";
  __int16 v9 = 1024;
  int v10 = 44;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Mismatch between ranking modelParameterDict, %lu and bundle interface type, %lu (in %s:%d)", (uint8_t *)&v3, 0x26u);
}

- (void)setRankingParamsFromRankingParamsMO:()MORankingParamsMO .cold.2(os_log_t log)
{
  int v1 = 136315394;
  v2 = "-[MOEventBundleRanking(MORankingParamsMO) setRankingParamsFromRankingParamsMO:]";
  __int16 v3 = 1024;
  int v4 = 23;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "MOEventBundleRanking was not initialized (in %s:%d)", (uint8_t *)&v1, 0x12u);
}

@end