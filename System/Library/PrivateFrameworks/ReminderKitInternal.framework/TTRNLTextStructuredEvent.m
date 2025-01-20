@interface TTRNLTextStructuredEvent
- (NSArray)locations;
- (TTRNLTextStructuredEvent)initWithStructuredEvent:(void *)a3;
- (TTRNLTextStructuredEventRecurrentEvent)recurrentEvent;
- (void)dealloc;
- (void)setStructuredEvent:(void *)a3;
- (void)structuredEvent;
@end

@implementation TTRNLTextStructuredEvent

- (TTRNLTextStructuredEvent)initWithStructuredEvent:(void *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TTRNLTextStructuredEvent;
  v4 = [(TTRNLTextStructuredEvent *)&v6 init];
  if (v4)
  {
    CFRetain(a3);
    v4->_structuredEvent = a3;
  }
  return v4;
}

- (void)dealloc
{
  CFRelease(self->_structuredEvent);
  v3.receiver = self;
  v3.super_class = (Class)TTRNLTextStructuredEvent;
  [(TTRNLTextStructuredEvent *)&v3 dealloc];
}

- (TTRNLTextStructuredEventRecurrentEvent)recurrentEvent
{
  [(TTRNLTextStructuredEvent *)self structuredEvent];
  RecurrentEvent = (TTRNLTextStructuredEventRecurrentEvent *)NLTextStructuredEventGetRecurrentEvent();
  if (RecurrentEvent)
  {
    uint64_t EventRange = NLTextSlotRecurrentEventGetEventRange();
    uint64_t v5 = v4;
    objc_super v6 = NLTextSlotRecurrentEventGetEventFrequency();
    v7 = NLTextSlotRecurrentEventGetEventStartDate();
    v8 = NLTextSlotRecurrentEventGetEventEndDate();
    RecurrentEvent = -[TTRNLTextStructuredEventRecurrentEvent initWithRange:startDate:endDate:isAllDay:frequency:]([TTRNLTextStructuredEventRecurrentEvent alloc], "initWithRange:startDate:endDate:isAllDay:frequency:", EventRange, v5, v7, v8, NLTextSlotRecurrentEventIsAllDayEvent() != 0, v6);
  }

  return RecurrentEvent;
}

- (NSArray)locations
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  [(TTRNLTextStructuredEvent *)self structuredEvent];
  v2 = NLTextStructuredEventGetLocationRanges();
  objc_super v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t Range = NLTextSlotGetRange();
        uint64_t v11 = v10;
        signed int v12 = NLTextSlotGetSlotID() - 5;
        if (v12 <= 5)
        {
          uint64_t v13 = qword_1A7576ED0[v12];
          uint64_t v14 = qword_1A7576F00[v12];
          v15 = [TTRNLTextStructuredEventLocation alloc];
          v16 = -[TTRNLTextStructuredEventLocation initWithRange:locationType:proximity:](v15, "initWithRange:locationType:proximity:", Range, v11, v13, v14, v19);
          [v3 addObject:v16];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v6);
  }

  v17 = (void *)[v3 copy];

  return (NSArray *)v17;
}

- (void)structuredEvent
{
  return self->_structuredEvent;
}

- (void)setStructuredEvent:(void *)a3
{
  self->_structuredEvent = a3;
}

@end