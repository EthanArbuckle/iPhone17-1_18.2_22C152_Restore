@interface SiriAnalyticsLogicalTimeStamp
- (NSUUID)clockIdentifier;
- (SiriAnalyticsLogicalTimeStamp)init;
- (SiriAnalyticsLogicalTimeStamp)initWithMachAbsoluteTime:(unint64_t)a3 clockIdentifier:(id)a4;
- (SiriAnalyticsLogicalTimeStamp)initWithNanosecondsSinceBoot:(unint64_t)a3 clockIdentifier:(id)a4;
- (id)loggingRepresentation;
- (unint64_t)nanoSecondsSinceBoot;
@end

@implementation SiriAnalyticsLogicalTimeStamp

- (void).cxx_destruct
{
}

- (NSUUID)clockIdentifier
{
  return self->_clockIdentifier;
}

- (unint64_t)nanoSecondsSinceBoot
{
  return self->_nanoSecondsSinceBoot;
}

- (id)loggingRepresentation
{
  id v3 = objc_alloc(MEMORY[0x1E4FA1378]);
  v4 = [(SiriAnalyticsLogicalTimeStamp *)self clockIdentifier];
  v5 = (void *)[v3 initWithNSUUID:v4];

  id v6 = objc_alloc_init(MEMORY[0x1E4FA12C8]);
  [v6 setClockIdentifier:v5];
  objc_msgSend(v6, "setTimestampInNanoseconds:", -[SiriAnalyticsLogicalTimeStamp nanoSecondsSinceBoot](self, "nanoSecondsSinceBoot"));

  return v6;
}

- (SiriAnalyticsLogicalTimeStamp)initWithNanosecondsSinceBoot:(unint64_t)a3 clockIdentifier:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SiriAnalyticsLogicalTimeStamp;
  v8 = [(SiriAnalyticsLogicalTimeStamp *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_nanoSecondsSinceBoot = a3;
    objc_storeStrong((id *)&v8->_clockIdentifier, a4);
  }

  return v9;
}

- (SiriAnalyticsLogicalTimeStamp)initWithMachAbsoluteTime:(unint64_t)a3 clockIdentifier:(id)a4
{
  id v6 = a4;
  if (_SiriAnalyticsMachAbsoluteTimeRate_onceToken != -1) {
    dispatch_once(&_SiriAnalyticsMachAbsoluteTimeRate_onceToken, &__block_literal_global_403);
  }
  id v7 = [(SiriAnalyticsLogicalTimeStamp *)self initWithNanosecondsSinceBoot:(unint64_t)(*(double *)&_SiriAnalyticsMachAbsoluteTimeRate_rate * (double)a3) clockIdentifier:v6];

  return v7;
}

- (SiriAnalyticsLogicalTimeStamp)init
{
  return 0;
}

@end