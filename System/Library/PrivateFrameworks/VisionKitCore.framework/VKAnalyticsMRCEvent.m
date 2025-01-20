@interface VKAnalyticsMRCEvent
- (NSString)barcodeSymbology;
- (VKAnalyticsMRCEvent)initWithElement:(id)a3 eventType:(int64_t)a4 customIdentifier:(id)a5;
- (id)coreAnalyticsDictionary;
- (id)description;
- (id)eventKey;
- (int64_t)_dataType;
- (int64_t)eventType;
- (int64_t)type;
- (void)setBarcodeSymbology:(id)a3;
- (void)setEventType:(int64_t)a3;
- (void)set_dataType:(int64_t)a3;
@end

@implementation VKAnalyticsMRCEvent

- (VKAnalyticsMRCEvent)initWithElement:(id)a3 eventType:(int64_t)a4 customIdentifier:(id)a5
{
  id v8 = a3;
  v16.receiver = self;
  v16.super_class = (Class)VKAnalyticsMRCEvent;
  v9 = [(VKAnalyticsEvent *)&v16 initWithCustomIdentifier:a5];
  v10 = v9;
  if (v9)
  {
    v9->_eventType = a4;
    v11 = [v8 barcodeObservation];
    uint64_t v12 = [v11 symbology];
    barcodeSymbology = v10->_barcodeSymbology;
    v10->_barcodeSymbology = (NSString *)v12;

    v14 = [v8 barcodeAction];
    v10->__dataType = [v14 payloadDataType];
  }
  return v10;
}

- (int64_t)type
{
  return 4;
}

- (id)eventKey
{
  return @"MRCEventOccured";
}

- (id)coreAnalyticsDictionary
{
  v11[5] = *MEMORY[0x1E4F143B8];
  v10[0] = @"dataTypes";
  v3 = VKMUIStringForBCSParsedDataType([(VKAnalyticsMRCEvent *)self dataType]);
  v11[0] = v3;
  v10[1] = @"symbology";
  v4 = [(VKAnalyticsMRCEvent *)self barcodeSymbology];
  v11[1] = v4;
  v10[2] = @"eventType";
  v5 = VKMUIStringForVKAnalyticsDDEventType([(VKAnalyticsMRCEvent *)self eventType]);
  v11[2] = v5;
  v10[3] = @"automatedTest";
  v6 = objc_msgSend(NSNumber, "numberWithBool:", -[VKAnalyticsEvent isPerformingAutomatedTest](self, "isPerformingAutomatedTest"));
  v11[3] = v6;
  v10[4] = @"bundleIdentifier";
  v7 = [(VKAnalyticsEvent *)self bundleIdentifier];
  v11[4] = v7;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:5];

  return v8;
}

- (id)description
{
  v3 = NSString;
  v12.receiver = self;
  v12.super_class = (Class)VKAnalyticsMRCEvent;
  v4 = [(VKAnalyticsMRCEvent *)&v12 description];
  v5 = VKMUIStringForVKAnalyticsDDEventType([(VKAnalyticsMRCEvent *)self eventType]);
  v6 = VKMUIStringForBCSParsedDataType([(VKAnalyticsMRCEvent *)self dataType]);
  v7 = [(VKAnalyticsMRCEvent *)self barcodeSymbology];
  id v8 = VKMUIStringForBool([(VKAnalyticsEvent *)self isPerformingAutomatedTest]);
  v9 = [(VKAnalyticsEvent *)self bundleIdentifier];
  v10 = [v3 stringWithFormat:@"%@ \n ddEventType: %@ \n bcsTypes: %@ \n symbology: %@ \n automatedTest: %@ \n bundleIdentifier: %@", v4, v5, v6, v7, v8, v9];

  return v10;
}

- (int64_t)eventType
{
  return self->_eventType;
}

- (void)setEventType:(int64_t)a3
{
  self->_eventType = a3;
}

- (NSString)barcodeSymbology
{
  return self->_barcodeSymbology;
}

- (void)setBarcodeSymbology:(id)a3
{
}

- (int64_t)_dataType
{
  return self->__dataType;
}

- (void)set_dataType:(int64_t)a3
{
  self->__dataType = a3;
}

- (void).cxx_destruct
{
}

@end