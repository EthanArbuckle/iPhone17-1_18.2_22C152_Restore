@interface CHDDataValueProperties
+ (id)dataValueProperties;
- (CHDDataValueProperties)init;
- (NSString)description;
- (id)dataLabel;
- (id)graphicProperties;
- (id)marker;
- (id)shallowCopyWithIndex:(unint64_t)a3;
- (int64_t)key;
- (unint64_t)dataValueIndex;
- (void)setDataLabel:(id)a3;
- (void)setDataValueIndex:(unint64_t)a3;
- (void)setGraphicProperties:(id)a3;
- (void)setMarker:(id)a3;
@end

@implementation CHDDataValueProperties

- (CHDDataValueProperties)init
{
  v3.receiver = self;
  v3.super_class = (Class)CHDDataValueProperties;
  result = [(CHDDataValueProperties *)&v3 init];
  if (result) {
    result->mDataValueIndex = -1;
  }
  return result;
}

- (void)setDataValueIndex:(unint64_t)a3
{
  self->mDataValueIndex = a3;
}

- (void)setGraphicProperties:(id)a3
{
  v5 = (OADGraphicProperties *)a3;
  mGraphicProperties = self->mGraphicProperties;
  p_mGraphicProperties = &self->mGraphicProperties;
  if (mGraphicProperties != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_mGraphicProperties, a3);
    v5 = v8;
  }
}

- (void)setMarker:(id)a3
{
  v5 = (CHDMarker *)a3;
  mMarker = self->mMarker;
  p_mMarker = &self->mMarker;
  if (mMarker != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_mMarker, a3);
    v5 = v8;
  }
}

- (int64_t)key
{
  return self->mDataValueIndex;
}

- (id)graphicProperties
{
  return self->mGraphicProperties;
}

- (unint64_t)dataValueIndex
{
  return self->mDataValueIndex;
}

- (id)shallowCopyWithIndex:(unint64_t)a3
{
  v5 = [(id)objc_opt_class() dataValueProperties];
  v6 = v5;
  if (v5)
  {
    [v5 setDataValueIndex:a3];
    [v6 setGraphicProperties:self->mGraphicProperties];
    [v6 setMarker:self->mMarker];
    [v6 setDataLabel:self->mDataLabel];
    id v7 = v6;
  }

  return v6;
}

+ (id)dataValueProperties
{
  id v2 = objc_alloc_init((Class)objc_opt_class());
  return v2;
}

- (void)setDataLabel:(id)a3
{
  v5 = (CHDDataLabel *)a3;
  mDataLabel = self->mDataLabel;
  p_mDataLabel = &self->mDataLabel;
  if (mDataLabel != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_mDataLabel, a3);
    v5 = v8;
  }
}

- (id)dataLabel
{
  return self->mDataLabel;
}

- (id)marker
{
  return self->mMarker;
}

- (NSString)description
{
  v4.receiver = self;
  v4.super_class = (Class)CHDDataValueProperties;
  id v2 = [(CHDDataValueProperties *)&v4 description];
  return (NSString *)v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mGraphicProperties, 0);
  objc_storeStrong((id *)&self->mMarker, 0);
  objc_storeStrong((id *)&self->mDataLabel, 0);
}

@end