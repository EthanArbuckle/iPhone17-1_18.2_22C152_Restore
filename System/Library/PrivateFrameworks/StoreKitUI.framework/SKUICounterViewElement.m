@interface SKUICounterViewElement
- (NSDate)endDate;
- (NSDate)startValueDate;
- (NSString)numberFormat;
- (SKUICounterViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
- (SKUIImageViewElement)backgroundImageElement;
- (double)changeRatePerSecond;
- (id)applyUpdatesWithElement:(id)a3;
- (int64_t)counterType;
- (int64_t)currentNumberValue;
- (int64_t)dateFormatType;
- (int64_t)startValue;
- (int64_t)stopValue;
@end

@implementation SKUICounterViewElement

- (SKUICounterViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUICounterViewElement initWithDOMElement:parent:elementFactory:]();
  }
  v28.receiver = self;
  v28.super_class = (Class)SKUICounterViewElement;
  v11 = [(SKUIViewElement *)&v28 initWithDOMElement:v8 parent:v9 elementFactory:v10];
  if (v11)
  {
    v12 = [v8 getAttribute:@"type"];
    v11->_counterType = [v12 isEqualToString:@"timer"] ^ 1;
    v13 = [v8 getAttribute:@"dateFormat"];

    if ([v13 isEqualToString:@"hm"])
    {
      uint64_t v14 = 3;
    }
    else if ([v13 isEqualToString:@"hms"])
    {
      uint64_t v14 = 2;
    }
    else
    {
      if ([v13 isEqualToString:@"dhms"])
      {
        v11->_dateFormatType = 0;
LABEL_14:
        v15 = [v8 getAttribute:@"endDate"];

        if ([v15 length])
        {
          uint64_t v16 = SKUIViewElementDateWithString(v15);
          endDate = v11->_endDate;
          v11->_endDate = (NSDate *)v16;
        }
        v18 = [v8 getAttribute:@"timestamp"];

        if ([v18 length])
        {
          uint64_t v19 = SKUIViewElementDateWithString(v18);
          startValueDate = v11->_startValueDate;
          v11->_startValueDate = (NSDate *)v19;
        }
        v21 = [v8 getAttribute:@"rate"];
        [v21 doubleValue];
        v11->_changeRatePerSecond = v22;

        uint64_t v23 = [v8 getAttribute:@"numberFormat"];
        numberFormat = v11->_numberFormat;
        v11->_numberFormat = (NSString *)v23;

        v25 = [v8 getAttribute:@"value"];
        v11->_startValue = [v25 longLongValue];

        v26 = [v8 getAttribute:@"endValue"];
        v11->_stopValue = [v26 longLongValue];

        goto LABEL_19;
      }
      uint64_t v14 = 1;
    }
    v11->_dateFormatType = v14;
    goto LABEL_14;
  }
LABEL_19:

  return v11;
}

- (SKUIImageViewElement)backgroundImageElement
{
  return (SKUIImageViewElement *)[(SKUIViewElement *)self firstChildForElementType:49];
}

- (int64_t)currentNumberValue
{
  int64_t v3 = [(SKUICounterViewElement *)self stopValue];
  v4 = [(SKUICounterViewElement *)self startValueDate];
  if (v4)
  {
    [(SKUICounterViewElement *)self changeRatePerSecond];
    double v6 = v5;
    double v7 = (double)[(SKUICounterViewElement *)self startValue];
    id v8 = [MEMORY[0x1E4F1C9C8] date];
    id v9 = [(SKUICounterViewElement *)self startValueDate];
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
  v4 = (SKUICounterViewElement *)a3;
  v15.receiver = self;
  v15.super_class = (Class)SKUICounterViewElement;
  double v5 = [(SKUIViewElement *)&v15 applyUpdatesWithElement:v4];
  double v6 = v5;
  if (v4 != self && v5 == self)
  {
    [(SKUICounterViewElement *)v4 changeRatePerSecond];
    self->_changeRatePerSecond = v7;
    self->_counterType = [(SKUICounterViewElement *)v4 counterType];
    self->_dateFormatType = [(SKUICounterViewElement *)v4 dateFormatType];
    id v8 = [(SKUICounterViewElement *)v4 endDate];
    endDate = self->_endDate;
    self->_endDate = v8;

    double v10 = [(SKUICounterViewElement *)v4 numberFormat];
    numberFormat = self->_numberFormat;
    self->_numberFormat = v10;

    self->_startValue = [(SKUICounterViewElement *)v4 startValue];
    int64_t v12 = [(SKUICounterViewElement *)v4 startValueDate];
    startValueDate = self->_startValueDate;
    self->_startValueDate = v12;

    self->_stopValue = [(SKUICounterViewElement *)v4 stopValue];
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

- (void)initWithDOMElement:parent:elementFactory:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUICounterViewElement initWithDOMElement:parent:elementFactory:]";
}

@end