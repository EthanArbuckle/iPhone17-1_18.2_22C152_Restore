@interface WBSSingleFieldTelemetryData
- (BOOL)isAutoFilled;
- (BOOL)isManuallyFilledByUser;
- (BOOL)wasPreviouslyAutoFilled;
- (NSString)fieldID;
- (WBSSingleFieldTelemetryData)initWithFieldType:(int64_t)a3 fieldID:(id)a4 elementType:(unint64_t)a5;
- (int64_t)fieldType;
- (unint64_t)autoFillOfferedType;
- (unint64_t)elementType;
- (unint64_t)modificationType;
- (void)setAutoFillOfferedType:(unint64_t)a3;
- (void)setFieldType:(int64_t)a3;
- (void)setIsAutoFilled:(BOOL)a3;
- (void)setIsManuallyFilledByUser:(BOOL)a3;
- (void)setModificationType:(unint64_t)a3;
@end

@implementation WBSSingleFieldTelemetryData

- (WBSSingleFieldTelemetryData)initWithFieldType:(int64_t)a3 fieldID:(id)a4 elementType:(unint64_t)a5
{
  id v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)WBSSingleFieldTelemetryData;
  v10 = [(WBSSingleFieldTelemetryData *)&v14 init];
  v11 = v10;
  if (v10)
  {
    v10->_fieldType = a3;
    objc_storeStrong((id *)&v10->_fieldID, a4);
    v11->_elementType = a5;
    v12 = v11;
  }

  return v11;
}

- (BOOL)wasPreviouslyAutoFilled
{
  return [(WBSSingleFieldTelemetryData *)self modificationType] > 2;
}

- (int64_t)fieldType
{
  return self->_fieldType;
}

- (void)setFieldType:(int64_t)a3
{
  self->_fieldType = a3;
}

- (unint64_t)elementType
{
  return self->_elementType;
}

- (NSString)fieldID
{
  return self->_fieldID;
}

- (BOOL)isAutoFilled
{
  return self->_isAutoFilled;
}

- (void)setIsAutoFilled:(BOOL)a3
{
  self->_isAutoFilled = a3;
}

- (BOOL)isManuallyFilledByUser
{
  return self->_isManuallyFilledByUser;
}

- (void)setIsManuallyFilledByUser:(BOOL)a3
{
  self->_isManuallyFilledByUser = a3;
}

- (unint64_t)modificationType
{
  return self->_modificationType;
}

- (void)setModificationType:(unint64_t)a3
{
  self->_modificationType = a3;
}

- (unint64_t)autoFillOfferedType
{
  return self->_autoFillOfferedType;
}

- (void)setAutoFillOfferedType:(unint64_t)a3
{
  self->_autoFillOfferedType = a3;
}

- (void).cxx_destruct
{
}

@end