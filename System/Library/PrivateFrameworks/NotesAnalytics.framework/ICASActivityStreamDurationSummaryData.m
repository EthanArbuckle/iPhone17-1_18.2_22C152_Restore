@interface ICASActivityStreamDurationSummaryData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASActivityStreamDurationSummaryData)initWithHalfHeightViewDuration:(id)a3 fullHeightViewDuration:(id)a4 sideBarViewDuration:(id)a5 minimizedViewDuration:(id)a6;
- (NSNumber)fullHeightViewDuration;
- (NSNumber)halfHeightViewDuration;
- (NSNumber)minimizedViewDuration;
- (NSNumber)sideBarViewDuration;
- (id)toDict;
@end

@implementation ICASActivityStreamDurationSummaryData

- (ICASActivityStreamDurationSummaryData)initWithHalfHeightViewDuration:(id)a3 fullHeightViewDuration:(id)a4 sideBarViewDuration:(id)a5 minimizedViewDuration:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)ICASActivityStreamDurationSummaryData;
  v15 = [(ICASActivityStreamDurationSummaryData *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_halfHeightViewDuration, a3);
    objc_storeStrong((id *)&v16->_fullHeightViewDuration, a4);
    objc_storeStrong((id *)&v16->_sideBarViewDuration, a5);
    objc_storeStrong((id *)&v16->_minimizedViewDuration, a6);
  }

  return v16;
}

+ (NSString)dataName
{
  return (NSString *)@"ActivityStreamDurationSummaryData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v18[4] = *MEMORY[0x1E4F143B8];
  v17[0] = @"halfHeightViewDuration";
  v3 = [(ICASActivityStreamDurationSummaryData *)self halfHeightViewDuration];
  if (v3)
  {
    uint64_t v4 = [(ICASActivityStreamDurationSummaryData *)self halfHeightViewDuration];
  }
  else
  {
    uint64_t v4 = objc_opt_new();
  }
  v5 = (void *)v4;
  v18[0] = v4;
  v17[1] = @"fullHeightViewDuration";
  v6 = [(ICASActivityStreamDurationSummaryData *)self fullHeightViewDuration];
  if (v6)
  {
    uint64_t v7 = [(ICASActivityStreamDurationSummaryData *)self fullHeightViewDuration];
  }
  else
  {
    uint64_t v7 = objc_opt_new();
  }
  v8 = (void *)v7;
  v18[1] = v7;
  v17[2] = @"sideBarViewDuration";
  v9 = [(ICASActivityStreamDurationSummaryData *)self sideBarViewDuration];
  if (v9)
  {
    uint64_t v10 = [(ICASActivityStreamDurationSummaryData *)self sideBarViewDuration];
  }
  else
  {
    uint64_t v10 = objc_opt_new();
  }
  id v11 = (void *)v10;
  v18[2] = v10;
  v17[3] = @"minimizedViewDuration";
  id v12 = [(ICASActivityStreamDurationSummaryData *)self minimizedViewDuration];
  if (v12)
  {
    uint64_t v13 = [(ICASActivityStreamDurationSummaryData *)self minimizedViewDuration];
  }
  else
  {
    uint64_t v13 = objc_opt_new();
  }
  id v14 = (void *)v13;
  v18[3] = v13;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:4];

  return v15;
}

- (NSNumber)halfHeightViewDuration
{
  return self->_halfHeightViewDuration;
}

- (NSNumber)fullHeightViewDuration
{
  return self->_fullHeightViewDuration;
}

- (NSNumber)sideBarViewDuration
{
  return self->_sideBarViewDuration;
}

- (NSNumber)minimizedViewDuration
{
  return self->_minimizedViewDuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minimizedViewDuration, 0);
  objc_storeStrong((id *)&self->_sideBarViewDuration, 0);
  objc_storeStrong((id *)&self->_fullHeightViewDuration, 0);
  objc_storeStrong((id *)&self->_halfHeightViewDuration, 0);
}

@end