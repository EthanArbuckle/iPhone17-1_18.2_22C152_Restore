@interface WBSFormTelemetryData
- (NSDictionary)fieldIDToSingleFieldData;
- (WBSFormTelemetryData)initWithFormType:(unint64_t)a3 formID:(int64_t)a4;
- (int64_t)formID;
- (unint64_t)formType;
- (void)setFieldIDToSingleFieldData:(id)a3;
@end

@implementation WBSFormTelemetryData

- (WBSFormTelemetryData)initWithFormType:(unint64_t)a3 formID:(int64_t)a4
{
  v11.receiver = self;
  v11.super_class = (Class)WBSFormTelemetryData;
  v6 = [(WBSFormTelemetryData *)&v11 init];
  v7 = v6;
  if (v6)
  {
    unint64_t v8 = 3;
    if (a3 < 6) {
      unint64_t v8 = a3;
    }
    v6->_formID = a4;
    v6->_formType = v8;
    v9 = v6;
  }

  return v7;
}

- (NSDictionary)fieldIDToSingleFieldData
{
  return self->_fieldIDToSingleFieldData;
}

- (void)setFieldIDToSingleFieldData:(id)a3
{
}

- (int64_t)formID
{
  return self->_formID;
}

- (unint64_t)formType
{
  return self->_formType;
}

- (void).cxx_destruct
{
}

@end