@interface SUUICounterViewElement
- (NSDate)endDate;
- (NSDate)startValueDate;
- (NSString)numberFormat;
- (SUUICounterViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
- (SUUIImageViewElement)backgroundImageElement;
- (double)changeRatePerSecond;
- (id)applyUpdatesWithElement:(id)a3;
- (int64_t)counterType;
- (int64_t)currentNumberValue;
- (int64_t)dateFormatType;
- (int64_t)startValue;
- (int64_t)stopValue;
@end

@implementation SUUICounterViewElement

- (SUUICounterViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8 = a3;
  v26.receiver = self;
  v26.super_class = (Class)SUUICounterViewElement;
  v9 = [(SUUIViewElement *)&v26 initWithDOMElement:v8 parent:a4 elementFactory:a5];
  if (!v9) {
    goto LABEL_15;
  }
  v10 = [v8 getAttribute:@"type"];
  v9->_counterType = [v10 isEqualToString:@"timer"] ^ 1;
  v11 = [v8 getAttribute:@"dateFormat"];

  if ([v11 isEqualToString:@"hm"])
  {
    uint64_t v12 = 3;
LABEL_9:
    v9->_dateFormatType = v12;
    goto LABEL_10;
  }
  if ([v11 isEqualToString:@"hms"])
  {
    uint64_t v12 = 2;
    goto LABEL_9;
  }
  if (![v11 isEqualToString:@"dhms"])
  {
    uint64_t v12 = 1;
    goto LABEL_9;
  }
  v9->_dateFormatType = 0;
LABEL_10:
  v13 = [v8 getAttribute:@"endDate"];

  if ([v13 length])
  {
    uint64_t v14 = SUUIViewElementDateWithString(v13);
    endDate = v9->_endDate;
    v9->_endDate = (NSDate *)v14;
  }
  v16 = [v8 getAttribute:@"timestamp"];

  if ([v16 length])
  {
    uint64_t v17 = SUUIViewElementDateWithString(v16);
    startValueDate = v9->_startValueDate;
    v9->_startValueDate = (NSDate *)v17;
  }
  v19 = [v8 getAttribute:@"rate"];
  [v19 doubleValue];
  v9->_changeRatePerSecond = v20;

  uint64_t v21 = [v8 getAttribute:@"numberFormat"];
  numberFormat = v9->_numberFormat;
  v9->_numberFormat = (NSString *)v21;

  v23 = [v8 getAttribute:@"value"];
  v9->_startValue = [v23 longLongValue];

  v24 = [v8 getAttribute:@"endValue"];
  v9->_stopValue = [v24 longLongValue];

LABEL_15:
  return v9;
}

- (SUUIImageViewElement)backgroundImageElement
{
  return (SUUIImageViewElement *)[(SUUIViewElement *)self firstChildForElementType:49];
}

- (int64_t)currentNumberValue
{
  int64_t v3 = [(SUUICounterViewElement *)self stopValue];
  v4 = [(SUUICounterViewElement *)self startValueDate];
  if (v4)
  {
    [(SUUICounterViewElement *)self changeRatePerSecond];
    double v6 = v5;
    double v7 = (double)[(SUUICounterViewElement *)self startValue];
    id v8 = [MEMORY[0x263EFF910] date];
    v9 = [(SUUICounterViewElement *)self startValueDate];
    [v8 timeIntervalSinceDate:v9];
    uint64_t v11 = (uint64_t)(v7 + v10 * v6);

    if (v3 >= v11) {
      int64_t v12 = v11;
    }
    else {
      int64_t v12 = v3;
    }
    if (v3 <= v11) {
      int64_t v13 = v11;
    }
    else {
      int64_t v13 = v3;
    }
    if (v6 >= 0.0) {
      int64_t v3 = v12;
    }
    else {
      int64_t v3 = v13;
    }
  }

  return v3;
}

- (id)applyUpdatesWithElement:(id)a3
{
  v4 = (SUUICounterViewElement *)a3;
  v15.receiver = self;
  v15.super_class = (Class)SUUICounterViewElement;
  double v5 = [(SUUIViewElement *)&v15 applyUpdatesWithElement:v4];
  double v6 = v5;
  if (v4 != self && v5 == self)
  {
    [(SUUICounterViewElement *)v4 changeRatePerSecond];
    self->_changeRatePerSecond = v7;
    self->_counterType = [(SUUICounterViewElement *)v4 counterType];
    self->_dateFormatType = [(SUUICounterViewElement *)v4 dateFormatType];
    id v8 = [(SUUICounterViewElement *)v4 endDate];
    endDate = self->_endDate;
    self->_endDate = v8;

    double v10 = [(SUUICounterViewElement *)v4 numberFormat];
    numberFormat = self->_numberFormat;
    self->_numberFormat = v10;

    self->_startValue = [(SUUICounterViewElement *)v4 startValue];
    int64_t v12 = [(SUUICounterViewElement *)v4 startValueDate];
    startValueDate = self->_startValueDate;
    self->_startValueDate = v12;

    self->_stopValue = [(SUUICounterViewElement *)v4 stopValue];
  }

  return v6;
}

- (double)changeRatePerSecond
{
  return self->_changeRatePerSecond;
}

- (int64_t)counterType
{
  return self->_counterType;
}

- (int64_t)dateFormatType
{
  return self->_dateFormatType;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (NSString)numberFormat
{
  return self->_numberFormat;
}

- (int64_t)startValue
{
  return self->_startValue;
}

- (NSDate)startValueDate
{
  return self->_startValueDate;
}

- (int64_t)stopValue
{
  return self->_stopValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startValueDate, 0);
  objc_storeStrong((id *)&self->_numberFormat, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
}

@end