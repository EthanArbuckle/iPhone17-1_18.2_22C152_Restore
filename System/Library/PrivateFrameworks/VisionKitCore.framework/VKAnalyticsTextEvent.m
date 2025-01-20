@interface VKAnalyticsTextEvent
- (BOOL)includesRichPasteboardContent;
- (SEL)macOSKBNavigationSelector;
- (VKAnalyticsTextEvent)initWithSelectionLength:(unint64_t)a3 totalLength:(unint64_t)a4 selectionWordCount:(unint64_t)a5 macOSSelector:(SEL)a6 includesRichPasteBoardContent:(BOOL)a7 eventType:(int64_t)a8 source:(int64_t)a9 customIdentifier:(id)a10;
- (id)coreAnalyticsDictionary;
- (id)description;
- (id)eventKey;
- (int64_t)eventType;
- (int64_t)source;
- (int64_t)textEventType;
- (int64_t)type;
- (unint64_t)selectionLength;
- (unint64_t)selectionWordCount;
- (unint64_t)totalLength;
- (void)setIncludesRichPasteboardContent:(BOOL)a3;
- (void)setMacOSKBNavigationSelector:(SEL)a3;
- (void)setSelectionLength:(unint64_t)a3;
- (void)setSelectionWordCount:(unint64_t)a3;
- (void)setSource:(int64_t)a3;
- (void)setTextEventType:(int64_t)a3;
- (void)setTotalLength:(unint64_t)a3;
@end

@implementation VKAnalyticsTextEvent

- (VKAnalyticsTextEvent)initWithSelectionLength:(unint64_t)a3 totalLength:(unint64_t)a4 selectionWordCount:(unint64_t)a5 macOSSelector:(SEL)a6 includesRichPasteBoardContent:(BOOL)a7 eventType:(int64_t)a8 source:(int64_t)a9 customIdentifier:(id)a10
{
  v18.receiver = self;
  v18.super_class = (Class)VKAnalyticsTextEvent;
  result = [(VKAnalyticsEvent *)&v18 initWithCustomIdentifier:a10];
  if (result)
  {
    result->_selectionLength = a3;
    result->_totalLength = a4;
    result->_selectionWordCount = a5;
    result->_eventType = a8;
    if (a6) {
      v17 = a6;
    }
    else {
      v17 = 0;
    }
    result->_macOSKBNavigationSelector = v17;
    result->_includesRichPasteboardContent = a7;
    result->_source = a9;
  }
  return result;
}

- (id)eventKey
{
  return @"textEventOccured";
}

- (int64_t)type
{
  return 2;
}

- (id)coreAnalyticsDictionary
{
  v14[8] = *MEMORY[0x1E4F143B8];
  if ([(VKAnalyticsTextEvent *)self macOSKBNavigationSelector])
  {
    NSStringFromSelector([(VKAnalyticsTextEvent *)self macOSKBNavigationSelector]);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = &stru_1F35566F8;
  }
  v13[0] = @"eventType";
  v4 = VKMUIStringForVKAnalyticsTextEventType([(VKAnalyticsTextEvent *)self eventType]);
  v14[0] = v4;
  v13[1] = @"eventSource";
  v5 = VKMUIStringForVKAnalyticsEventSource([(VKAnalyticsTextEvent *)self source]);
  v14[1] = v5;
  v13[2] = @"selectionLength";
  v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[VKAnalyticsTextEvent selectionLength](self, "selectionLength"));
  v14[2] = v6;
  v13[3] = @"selectionLength";
  v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[VKAnalyticsTextEvent selectionWordCount](self, "selectionWordCount"));
  v14[3] = v7;
  v13[4] = @"selectionLength";
  v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[VKAnalyticsTextEvent totalLength](self, "totalLength"));
  v14[4] = v8;
  v14[5] = v3;
  v13[5] = @"macOSKBNavigationSelector";
  v13[6] = @"automatedTest";
  v9 = objc_msgSend(NSNumber, "numberWithBool:", -[VKAnalyticsEvent isPerformingAutomatedTest](self, "isPerformingAutomatedTest"));
  v14[6] = v9;
  v13[7] = @"bundleIdentifier";
  v10 = [(VKAnalyticsEvent *)self bundleIdentifier];
  v14[7] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:8];

  return v11;
}

- (id)description
{
  v3 = NSString;
  v16.receiver = self;
  v16.super_class = (Class)VKAnalyticsTextEvent;
  v4 = [(VKAnalyticsTextEvent *)&v16 description];
  v5 = VKMUIStringForVKAnalyticsTextEventType([(VKAnalyticsTextEvent *)self textEventType]);
  v6 = VKMUIStringForVKAnalyticsEventSource([(VKAnalyticsTextEvent *)self source]);
  unint64_t v7 = [(VKAnalyticsTextEvent *)self selectionLength];
  unint64_t v8 = [(VKAnalyticsTextEvent *)self selectionWordCount];
  unint64_t v9 = [(VKAnalyticsTextEvent *)self totalLength];
  v10 = VKMUIStringForBool([(VKAnalyticsEvent *)self isPerformingAutomatedTest]);
  v11 = [(VKAnalyticsEvent *)self bundleIdentifier];
  v12 = [v3 stringWithFormat:@"%@ \n textEventType: %@ \n source: %@ \n selectionLength: %lu \n selectionWordCount: %lu \n totalLength: %lu \n automatedTest: %@ \n bundleIdentifier: %@ ", v4, v5, v6, v7, v8, v9, v10, v11];

  if ([(VKAnalyticsTextEvent *)self macOSKBNavigationSelector])
  {
    v13 = NSStringFromSelector([(VKAnalyticsTextEvent *)self macOSKBNavigationSelector]);
    uint64_t v14 = [v12 stringByAppendingFormat:@"\n macOSSelector: %@", v13];

    v12 = (void *)v14;
  }
  return v12;
}

- (int64_t)eventType
{
  return self->_eventType;
}

- (int64_t)source
{
  return self->_source;
}

- (void)setSource:(int64_t)a3
{
  self->_source = a3;
}

- (unint64_t)selectionLength
{
  return self->_selectionLength;
}

- (void)setSelectionLength:(unint64_t)a3
{
  self->_selectionLength = a3;
}

- (unint64_t)selectionWordCount
{
  return self->_selectionWordCount;
}

- (void)setSelectionWordCount:(unint64_t)a3
{
  self->_selectionWordCount = a3;
}

- (unint64_t)totalLength
{
  return self->_totalLength;
}

- (void)setTotalLength:(unint64_t)a3
{
  self->_totalLength = a3;
}

- (SEL)macOSKBNavigationSelector
{
  if (self->_macOSKBNavigationSelector) {
    return self->_macOSKBNavigationSelector;
  }
  else {
    return 0;
  }
}

- (void)setMacOSKBNavigationSelector:(SEL)a3
{
  if (a3) {
    v3 = a3;
  }
  else {
    v3 = 0;
  }
  self->_macOSKBNavigationSelector = v3;
}

- (int64_t)textEventType
{
  return self->_textEventType;
}

- (void)setTextEventType:(int64_t)a3
{
  self->_textEventType = a3;
}

- (BOOL)includesRichPasteboardContent
{
  return self->_includesRichPasteboardContent;
}

- (void)setIncludesRichPasteboardContent:(BOOL)a3
{
  self->_includesRichPasteboardContent = a3;
}

@end