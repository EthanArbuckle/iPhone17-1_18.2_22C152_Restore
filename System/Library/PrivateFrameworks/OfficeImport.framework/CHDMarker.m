@interface CHDMarker
- (CHDMarker)init;
- (id)description;
- (id)graphicProperties;
- (int)style;
- (unsigned)size;
- (void)setGraphicProperties:(id)a3;
- (void)setSize:(unsigned int)a3;
- (void)setStyle:(int)a3;
@end

@implementation CHDMarker

- (CHDMarker)init
{
  v3.receiver = self;
  v3.super_class = (Class)CHDMarker;
  result = [(CHDMarker *)&v3 init];
  if (result) {
    *(void *)&result->mSize = 0xFFFFFFFF00000000;
  }
  return result;
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

- (void)setSize:(unsigned int)a3
{
  self->mSize = a3;
}

- (void)setStyle:(int)a3
{
  self->mStyle = a3;
}

- (id)graphicProperties
{
  return self->mGraphicProperties;
}

- (unsigned)size
{
  return self->mSize;
}

- (int)style
{
  return self->mStyle;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)CHDMarker;
  v2 = [(CHDMarker *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
}

@end