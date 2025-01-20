@interface WiFiUsageLQMWindowAnalysisNetworkQuality
- (NSDictionary)networkQualityEventFields;
- (WiFiUsageLQMWindowAnalysisNetworkQuality)initWithRollingWindow:(id)a3 AndDictionary:(id)a4 andContext:(context)a5 andTimestamp:(id)a6 onQueue:(id)a7;
- (id)addDimensionsTo:(id)a3;
- (unint64_t)networkQualityResponsivenessScore;
- (void)setNetworkQualityEventFields:(id)a3;
- (void)setNetworkQualityResponsivenessScore:(unint64_t)a3;
@end

@implementation WiFiUsageLQMWindowAnalysisNetworkQuality

- (WiFiUsageLQMWindowAnalysisNetworkQuality)initWithRollingWindow:(id)a3 AndDictionary:(id)a4 andContext:(context)a5 andTimestamp:(id)a6 onQueue:(id)a7
{
  v14.receiver = self;
  v14.super_class = (Class)WiFiUsageLQMWindowAnalysisNetworkQuality;
  uint64_t v10 = *(void *)&a5.var0 & 0xFFFFFFLL;
  id v11 = a4;
  v12 = [(WiFiUsageLQMWindowAnalysis *)&v14 initWithRollingWindow:a3 andReason:@"NetworkQuality" andContext:v10 andTimestamp:a6 onQueue:a7];
  -[WiFiUsageLQMWindowAnalysisNetworkQuality setNetworkQualityResponsivenessScore:](v12, "setNetworkQualityResponsivenessScore:", 0x7FFFFFFFFFFFFFFFLL, v14.receiver, v14.super_class);
  [(WiFiUsageLQMWindowAnalysisNetworkQuality *)v12 setNetworkQualityEventFields:v11];

  return v12;
}

- (id)addDimensionsTo:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)WiFiUsageLQMWindowAnalysisNetworkQuality;
  id v5 = [(WiFiUsageLQMWindowAnalysis *)&v7 addDimensionsTo:v4];
  [v4 addEntriesFromDictionary:self->_networkQualityEventFields];

  return v4;
}

- (unint64_t)networkQualityResponsivenessScore
{
  return self->_networkQualityResponsivenessScore;
}

- (void)setNetworkQualityResponsivenessScore:(unint64_t)a3
{
  self->_networkQualityResponsivenessScore = a3;
}

- (NSDictionary)networkQualityEventFields
{
  return self->_networkQualityEventFields;
}

- (void)setNetworkQualityEventFields:(id)a3
{
}

- (void).cxx_destruct
{
}

@end