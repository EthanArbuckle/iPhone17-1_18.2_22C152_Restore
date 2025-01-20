@interface VLAR_DTMFEventsAccumulator
- (VLAR_DTMFEventsAccumulator)init;
- (id)analyticsDataDict;
- (void)noteDidReceiveDTMFDigit:(char)a3;
@end

@implementation VLAR_DTMFEventsAccumulator

- (VLAR_DTMFEventsAccumulator)init
{
  v6.receiver = self;
  v6.super_class = (Class)VLAR_DTMFEventsAccumulator;
  v2 = [(VLAR_DTMFEventsAccumulator *)&v6 init];
  if (v2)
  {
    v3 = [[SOSAnalyticsEventAccumulator alloc] initWithName:@"DTMFEvent"];
    eventsAccumulator = v2->_eventsAccumulator;
    v2->_eventsAccumulator = v3;
  }
  return v2;
}

- (void)noteDidReceiveDTMFDigit:(char)a3
{
  eventsAccumulator = self->_eventsAccumulator;
  _NSStringFromDTMFDigitChar(a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(SOSAnalyticsEventAccumulator *)eventsAccumulator noteEvent:v4];
}

- (id)analyticsDataDict
{
  v9[16] = *MEMORY[0x1E4F143B8];
  v9[0] = @"1";
  v9[1] = @"2";
  v9[2] = @"3";
  v9[3] = @"4";
  v9[4] = @"5";
  v9[5] = @"6";
  v9[6] = @"7";
  v9[7] = @"8";
  v9[8] = @"9";
  v9[9] = @"0";
  v9[10] = @"Star";
  v9[11] = @"Pound";
  v9[12] = @"A";
  v9[13] = @"B";
  v9[14] = @"C";
  v9[15] = @"D";
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:16];
  v7[0] = @"AllEventsKey";
  v7[1] = @"KnownEventsKey";
  v8[0] = @"nDTMFEvents_Total";
  v8[1] = @"nDTMFEvents_Known";
  v7[2] = @"UnknownEventsKey";
  v8[2] = @"nDTMFEvents_Unknown";
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:3];
  v5 = [(SOSAnalyticsEventAccumulator *)self->_eventsAccumulator analyticsDataDictForAccumulatedKeys:v3 outputKeyPrefix:@"nDTMFEvent_" summaryKeysDict:v4];

  return v5;
}

- (void).cxx_destruct
{
}

@end