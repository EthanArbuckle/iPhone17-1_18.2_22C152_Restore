@interface TBDataSource
- (unint64_t)type;
- (void)executeFetchRequest:(id)a3;
- (void)submitAnalyticsEventForFetchRequest:(id)a3 duration:(double)a4 error:(id)a5 resultCount:(int64_t)a6;
@end

@implementation TBDataSource

- (void)submitAnalyticsEventForFetchRequest:(id)a3 duration:(double)a4 error:(id)a5 resultCount:(int64_t)a6
{
  id v29 = a3;
  id v10 = a5;
  v11 = [v29 descriptor];
  uint64_t v12 = [v11 type];

  unint64_t v13 = [(TBDataSource *)self type];
  v14 = [v29 descriptor];
  if ([v14 type] == 1)
  {
    v15 = [v29 descriptor];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      v19 = 0;
      goto LABEL_7;
    }
    v17 = NSNumber;
    v14 = [v29 descriptor];
    v18 = [v14 bssids];
    v19 = objc_msgSend(v17, "numberWithUnsignedInteger:", objc_msgSend(v18, "count"));
  }
  else
  {
    v19 = 0;
  }

LABEL_7:
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([v29 userInfo],
        v20 = objc_claimAutoreleasedReturnValue(),
        [v20 objectForKeyedSubscript:@"trigger"],
        v21 = objc_claimAutoreleasedReturnValue(),
        v21,
        v20,
        v21))
  {
    v22 = [v29 userInfo];
    v23 = [v22 objectForKeyedSubscript:@"trigger"];
    uint64_t v24 = [v23 unsignedIntegerValue];
  }
  else
  {
    uint64_t v24 = 0;
  }
  if ((unint64_t)(v12 - 1) >= 3) {
    uint64_t v12 = 0;
  }
  if (v13) {
    uint64_t v25 = 2 * (v13 == 1);
  }
  else {
    uint64_t v25 = 1;
  }
  v26 = [NSNumber numberWithDouble:a4];
  v27 = [NSNumber numberWithInteger:a6];
  v28 = +[TBFetchAnalyticsEvent fetchEventWithSource:v25 type:v12 trigger:v24 duration:v26 requestCount:v19 resultCount:v27 error:v10 tileKey:0];

  +[TBAnalytics captureEvent:v28];
}

- (void)executeFetchRequest:(id)a3
{
  id v3 = a3;
  NSLog(&cfstr_UnsupportedFet.isa, v3);
  id v5 = +[TBError fetchUnsupportedErrorWithUserInfo:0];
  v4 = +[TBErrorFetchResponse responseWithError:v5];
  [v3 handleResponse:v4];
}

- (unint64_t)type
{
  return self->_type;
}

@end