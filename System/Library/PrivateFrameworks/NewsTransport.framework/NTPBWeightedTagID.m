@interface NTPBWeightedTagID
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)tagId;
- (float)weight;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setTagId:(id)a3;
- (void)setWeight:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBWeightedTagID

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBWeightedTagID;
  v4 = [(NTPBWeightedTagID *)&v8 description];
  v5 = [(NTPBWeightedTagID *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v5 = v3;
  tagId = self->_tagId;
  if (tagId) {
    [v3 setObject:tagId forKey:@"tag_id"];
  }
  *(float *)&double v4 = self->_weight;
  v7 = [NSNumber numberWithFloat:v4];
  [v5 setObject:v7 forKey:@"weight"];

  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBWeightedTagIDReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v3 = a3;
  PBDataWriterWriteStringField();
  PBDataWriterWriteFloatField();
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_tagId copyWithZone:a3];
  v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  *(float *)(v5 + 16) = self->_weight;
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v6 = [v4 isMemberOfClass:objc_opt_class()]
    && ((tagId = self->_tagId, !((unint64_t)tagId | *((void *)v4 + 1)))
     || -[NSString isEqual:](tagId, "isEqual:"))
    && self->_weight == *((float *)v4 + 4);

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_tagId hash];
  float weight = self->_weight;
  float v5 = -weight;
  if (weight >= 0.0) {
    float v5 = self->_weight;
  }
  float v6 = floorf(v5 + 0.5);
  float v7 = (float)(v5 - v6) * 1.8447e19;
  unint64_t v8 = 2654435761u * (unint64_t)fmodf(v6, 1.8447e19);
  unint64_t v9 = v8 + (unint64_t)v7;
  float v10 = fabsf(v7);
  if (v7 <= 0.0) {
    unint64_t v9 = v8;
  }
  unint64_t v11 = v8 - (unint64_t)v10;
  if (v7 >= 0.0) {
    unint64_t v11 = v9;
  }
  return v11 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = (float *)a3;
  if (*((void *)v4 + 1))
  {
    float v5 = v4;
    -[NTPBWeightedTagID setTagId:](self, "setTagId:");
    id v4 = v5;
  }
  self->_float weight = v4[4];
}

- (NSString)tagId
{
  return self->_tagId;
}

- (void)setTagId:(id)a3
{
}

- (float)weight
{
  return self->_weight;
}

- (void)setWeight:(float)a3
{
  self->_float weight = a3;
}

- (void).cxx_destruct
{
}

@end