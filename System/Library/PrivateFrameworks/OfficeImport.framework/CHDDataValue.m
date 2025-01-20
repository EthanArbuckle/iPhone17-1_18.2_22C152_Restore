@interface CHDDataValue
+ (CHDDataValue)dataValueWithIndex:(int64_t)a3 value:(EDValue *)a4;
+ (id)dataValue;
- (CHDDataPoint)dataPoint;
- (CHDDataValue)init;
- (CHDDataValue)initWithIndex:(int64_t)a3 value:(EDValue *)a4;
- (EDValue)value;
- (id).cxx_construct;
- (id)contentFormatWithResources:(id)a3;
- (id)description;
- (int64_t)index;
- (unint64_t)contentFormatId;
- (void)setContentFormatId:(unint64_t)a3;
- (void)setContentFormatWithResources:(id)a3 resources:(id)a4;
- (void)setDataPoint:(CHDDataPoint *)a3;
- (void)setIndex:(int64_t)a3;
- (void)setValue:(EDValue *)a3;
@end

@implementation CHDDataValue

- (id).cxx_construct
{
  return self;
}

- (CHDDataValue)initWithIndex:(int64_t)a3 value:(EDValue *)a4
{
  v9.receiver = self;
  v9.super_class = (Class)CHDDataValue;
  v6 = [(CHDDataValue *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->mDataPoint.index = a3;
    EDValue::operator=((uint64_t)&v6->mDataPoint.value, &a4->type);
  }
  return v7;
}

+ (CHDDataValue)dataValueWithIndex:(int64_t)a3 value:(EDValue *)a4
{
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithIndex:a3 value:a4];
  return (CHDDataValue *)v4;
}

- (void)setContentFormatId:(unint64_t)a3
{
  self->mDataPoint.contentFormatId = a3;
}

- (EDValue)value
{
  return &self->mDataPoint.value;
}

- (void).cxx_destruct
{
}

- (void)setIndex:(int64_t)a3
{
  self->mDataPoint.index = a3;
}

- (CHDDataPoint)dataPoint
{
  return &self->mDataPoint;
}

+ (id)dataValue
{
  id v2 = objc_alloc_init((Class)objc_opt_class());
  return v2;
}

- (CHDDataValue)init
{
  v3.receiver = self;
  v3.super_class = (Class)CHDDataValue;
  result = [(CHDDataValue *)&v3 init];
  if (result)
  {
    result->mDataPoint.index = -1;
    result->mDataPoint.contentFormatId = -1;
  }
  return result;
}

- (void)setValue:(EDValue *)a3
{
  EDValue::operator=((uint64_t)&self->mDataPoint.value, &a3->type);
}

- (void)setContentFormatWithResources:(id)a3 resources:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  unint64_t v7 = [v10 formatId];
  if (v7 == -1)
  {
    v8 = [v6 contentFormats];
    objc_super v9 = objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v8, "addOrEquivalentObject:", v10));
    self->mDataPoint.contentFormatId = [v9 formatId];
  }
  else
  {
    self->mDataPoint.contentFormatId = v7;
  }
}

- (int64_t)index
{
  return self->mDataPoint.index;
}

- (void)setDataPoint:(CHDDataPoint *)a3
{
  self->mDataPoint.index = a3->index;
  EDValue::operator=((uint64_t)&self->mDataPoint.value, &a3->value.type);
  self->mDataPoint.contentFormatId = a3->contentFormatId;
}

- (id)contentFormatWithResources:(id)a3
{
  v4 = [a3 contentFormats];
  v5 = [v4 objectWithKey:self->mDataPoint.contentFormatId];

  return v5;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)CHDDataValue;
  id v2 = [(CHDDataValue *)&v4 description];
  return v2;
}

- (unint64_t)contentFormatId
{
  return self->mDataPoint.contentFormatId;
}

@end