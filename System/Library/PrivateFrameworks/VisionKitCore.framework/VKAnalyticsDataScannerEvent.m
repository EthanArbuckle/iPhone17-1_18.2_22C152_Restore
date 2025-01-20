@interface VKAnalyticsDataScannerEvent
- (BOOL)didScanForBarcodes;
- (BOOL)didScanForText;
- (BOOL)isHealth;
- (VKAnalyticsDataScannerEvent)initWithFeedDuration:(double)a3 scannedForText:(BOOL)a4 scannedForBarcodes:(BOOL)a5 customIdentifier:(id)a6;
- (double)feedDuration;
- (id)coreAnalyticsDictionary;
- (id)description;
- (id)eventKey;
- (int64_t)type;
- (void)setDidScanForBarcodes:(BOOL)a3;
- (void)setDidScanForText:(BOOL)a3;
- (void)setFeedDuration:(double)a3;
@end

@implementation VKAnalyticsDataScannerEvent

- (VKAnalyticsDataScannerEvent)initWithFeedDuration:(double)a3 scannedForText:(BOOL)a4 scannedForBarcodes:(BOOL)a5 customIdentifier:(id)a6
{
  v10.receiver = self;
  v10.super_class = (Class)VKAnalyticsDataScannerEvent;
  result = [(VKAnalyticsEvent *)&v10 initWithCustomIdentifier:a6];
  if (result)
  {
    result->_feedDuration = a3;
    result->_didScanForText = a4;
    result->_didScanForBarcodes = a5;
  }
  return result;
}

- (id)eventKey
{
  return @"DataScannerEventOccurred";
}

- (int64_t)type
{
  return 9;
}

- (id)coreAnalyticsDictionary
{
  v12[5] = *MEMORY[0x1E4F143B8];
  v11[0] = @"feedDuration";
  v3 = NSNumber;
  [(VKAnalyticsDataScannerEvent *)self feedDuration];
  v4 = objc_msgSend(v3, "numberWithDouble:");
  v12[0] = v4;
  v11[1] = @"didScanForText";
  v5 = objc_msgSend(NSNumber, "numberWithBool:", -[VKAnalyticsDataScannerEvent didScanForText](self, "didScanForText"));
  v12[1] = v5;
  v11[2] = @"didScanForBarcodes";
  v6 = objc_msgSend(NSNumber, "numberWithBool:", -[VKAnalyticsDataScannerEvent didScanForBarcodes](self, "didScanForBarcodes"));
  v12[2] = v6;
  v11[3] = @"automatedTest";
  v7 = objc_msgSend(NSNumber, "numberWithBool:", -[VKAnalyticsEvent isPerformingAutomatedTest](self, "isPerformingAutomatedTest"));
  v12[3] = v7;
  v11[4] = @"bundleIdentifier";
  v8 = [(VKAnalyticsEvent *)self bundleIdentifier];
  v12[4] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:5];

  return v9;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)VKAnalyticsDataScannerEvent;
  v4 = [(VKAnalyticsDataScannerEvent *)&v8 description];
  v5 = [(VKAnalyticsDataScannerEvent *)self coreAnalyticsDictionary];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)isHealth
{
  v2 = [(VKAnalyticsEvent *)self bundleIdentifier];
  char v3 = [v2 isEqualToString:@"com.apple.Health"];

  return v3;
}

- (double)feedDuration
{
  return self->_feedDuration;
}

- (void)setFeedDuration:(double)a3
{
  self->_feedDuration = a3;
}

- (BOOL)didScanForText
{
  return self->_didScanForText;
}

- (void)setDidScanForText:(BOOL)a3
{
  self->_didScanForText = a3;
}

- (BOOL)didScanForBarcodes
{
  return self->_didScanForBarcodes;
}

- (void)setDidScanForBarcodes:(BOOL)a3
{
  self->_didScanForBarcodes = a3;
}

@end