@interface WiFiUsageLQMWindowAnalysisLinkDown
- (BOOL)isInvoluntary;
- (NSString)linkDownReason;
- (WiFiUsageLQMWindowAnalysisLinkDown)initWithRollingWindow:(id)a3 WithIsInvoluntary:(BOOL)a4 AndLinkChangeReason:(int64_t)a5 AndLinkChangeSubreason:(int64_t)a6 AndDuration:(unint64_t)a7 andContext:(context)a8 AndTimestamp:(id)a9 onQueue:(id)a10;
- (id)addDimensionsTo:(id)a3;
- (int64_t)linkDownSubreason;
- (unint64_t)linkUpDuration;
- (void)setIsInvoluntary:(BOOL)a3;
- (void)setLinkDownReason:(id)a3;
- (void)setLinkDownSubreason:(int64_t)a3;
- (void)setLinkUpDuration:(unint64_t)a3;
@end

@implementation WiFiUsageLQMWindowAnalysisLinkDown

- (WiFiUsageLQMWindowAnalysisLinkDown)initWithRollingWindow:(id)a3 WithIsInvoluntary:(BOOL)a4 AndLinkChangeReason:(int64_t)a5 AndLinkChangeSubreason:(int64_t)a6 AndDuration:(unint64_t)a7 andContext:(context)a8 AndTimestamp:(id)a9 onQueue:(id)a10
{
  BOOL v13 = a4;
  v17.receiver = self;
  v17.super_class = (Class)WiFiUsageLQMWindowAnalysisLinkDown;
  v14 = [(WiFiUsageLQMWindowAnalysis *)&v17 initWithRollingWindow:a3 andReason:@"LinkDown" andContext:*(void *)&a8.var0 & 0xFFFFFFLL andTimestamp:a9 onQueue:a10];
  [(WiFiUsageLQMWindowAnalysisLinkDown *)v14 setIsInvoluntary:v13];
  v15 = +[WiFiUsageSession disconnectReasonString:a5];
  [(WiFiUsageLQMWindowAnalysisLinkDown *)v14 setLinkDownReason:v15];

  [(WiFiUsageLQMWindowAnalysisLinkDown *)v14 setLinkDownSubreason:a6];
  [(WiFiUsageLQMWindowAnalysisLinkDown *)v14 setLinkUpDuration:a7];
  return v14;
}

- (id)addDimensionsTo:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v44.receiver = self;
  v44.super_class = (Class)WiFiUsageLQMWindowAnalysisLinkDown;
  id v5 = [(WiFiUsageLQMWindowAnalysis *)&v44 addDimensionsTo:v4];
  v6 = objc_msgSend(NSString, "stringWithFormat:", @"%u", self->_isInvoluntary);
  [v4 setObject:v6 forKeyedSubscript:@"linkdownIsInVoluntary"];

  [v4 setObject:self->_linkDownReason forKeyedSubscript:@"linkdownReason"];
  v7 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", self->_linkDownSubreason);
  [v4 setObject:v7 forKeyedSubscript:@"linkdownSubReason"];

  unint64_t linkUpDuration = self->_linkUpDuration;
  if (linkUpDuration == 0x7FFFFFFFFFFFFFFFLL)
  {
    [v4 setObject:0 forKeyedSubscript:@"linkupDuration"];
  }
  else
  {
    v9 = +[WiFiUsageLQMTransformations getBinTimeIntervalUpTo12h:1 As:(double)linkUpDuration];
    [v4 setObject:v9 forKeyedSubscript:@"linkupDuration"];
  }
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  v39.receiver = self;
  v39.super_class = (Class)WiFiUsageLQMWindowAnalysisLinkDown;
  v10 = [(WiFiUsageLQMWindowAnalysis *)&v39 subsequentTriggers];
  v11 = (void *)MEMORY[0x1E4F1C978];
  v12 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"timestamp" ascending:1];
  BOOL v13 = [v11 arrayWithObject:v12];
  v14 = [v10 sortedArrayUsingDescriptors:v13];

  uint64_t v15 = [v14 countByEnumeratingWithState:&v40 objects:v45 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v41;
    while (2)
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v41 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        v20 = [v19 reason];

        if (v20 == @"Join")
        {
          v38.receiver = self;
          v38.super_class = (Class)WiFiUsageLQMWindowAnalysisLinkDown;
          v21 = [(WiFiUsageLQMWindowAnalysis *)&v38 timestamp];
          v22 = [v19 timestamp];
          [v21 timeIntervalSinceDate:v22];
          v23 = +[WiFiUsageLQMTransformations getBinTimeIntervalUpTo60s:As:](WiFiUsageLQMTransformations, "getBinTimeIntervalUpTo60s:As:", 1);
          [v4 setObject:v23 forKeyedSubscript:@"timeToJoin"];

          goto LABEL_14;
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v40 objects:v45 count:16];
      if (v16) {
        continue;
      }
      break;
    }
  }
LABEL_14:

  v37.receiver = self;
  v37.super_class = (Class)WiFiUsageLQMWindowAnalysisLinkDown;
  v24 = [(WiFiUsageLQMWindowAnalysis *)&v37 windowBeforeTrigger];
  v25 = [v24 samples];
  v26 = [v25 lastObject];

  v27 = +[WiFiUsageLQMTransformations numberForKeyPath:@"driverRoamRecommended" ofObject:v26];
  [v4 setObject:v27 forKeyedSubscript:@"roamingRecommended"];

  v28 = +[WiFiUsageLQMTransformations numberForKeyPath:@"driverTDrecommended" ofObject:v26];
  [v4 setObject:v28 forKeyedSubscript:@"tdRecommended"];

  v29 = +[WiFiUsageLQMTransformations numberForKeyPath:@"chanQualScore" ofObject:v26];
  [v4 setObject:v29 forKeyedSubscript:@"last_chanQualScore_before"];

  v30 = +[WiFiUsageLQMTransformations numberForKeyPath:@"txLatencyScore" ofObject:v26];
  [v4 setObject:v30 forKeyedSubscript:@"last_txLatencyScore_before"];

  v31 = +[WiFiUsageLQMTransformations numberForKeyPath:@"rxLatencyScore" ofObject:v26];
  [v4 setObject:v31 forKeyedSubscript:@"last_rxLatencyScore_before"];

  v32 = +[WiFiUsageLQMTransformations numberForKeyPath:@"txLossScore" ofObject:v26];
  [v4 setObject:v32 forKeyedSubscript:@"last_txLossScore_before"];

  v33 = +[WiFiUsageLQMTransformations numberForKeyPath:@"rxLossScore" ofObject:v26];
  [v4 setObject:v33 forKeyedSubscript:@"last_rxLossScore_before"];

  v34 = +[WiFiUsageLQMTransformations numberForKeyPath:@"txLatencyP95" ofObject:v26];
  v35 = +[WiFiUsageLQMSample binLabelfromFieldName:value:](WiFiUsageLQMUserSample, "binLabelfromFieldName:value:", @"txLatencyP95", [v34 integerValue]);
  [v4 setObject:v35 forKeyedSubscript:@"last_txLatencyP95_before"];

  return v4;
}

- (BOOL)isInvoluntary
{
  return self->_isInvoluntary;
}

- (void)setIsInvoluntary:(BOOL)a3
{
  self->_isInvoluntary = a3;
}

- (NSString)linkDownReason
{
  return self->_linkDownReason;
}

- (void)setLinkDownReason:(id)a3
{
}

- (int64_t)linkDownSubreason
{
  return self->_linkDownSubreason;
}

- (void)setLinkDownSubreason:(int64_t)a3
{
  self->_linkDownSubreason = a3;
}

- (unint64_t)linkUpDuration
{
  return self->_linkUpDuration;
}

- (void)setLinkUpDuration:(unint64_t)a3
{
  self->_unint64_t linkUpDuration = a3;
}

- (void).cxx_destruct
{
}

@end