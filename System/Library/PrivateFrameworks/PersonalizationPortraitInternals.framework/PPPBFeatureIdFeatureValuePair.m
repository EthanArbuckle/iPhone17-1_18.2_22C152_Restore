@interface PPPBFeatureIdFeatureValuePair
- (BOOL)hasFeatureId;
- (BOOL)hasValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)featureId;
- (float)value;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setFeatureId:(id)a3;
- (void)setHasValue:(BOOL)a3;
- (void)setValue:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation PPPBFeatureIdFeatureValuePair

- (void).cxx_destruct
{
}

- (float)value
{
  return self->_value;
}

- (void)setFeatureId:(id)a3
{
}

- (NSString)featureId
{
  return self->_featureId;
}

- (void)mergeFrom:(id)a3
{
  v4 = (float *)a3;
  if (*((void *)v4 + 1))
  {
    v5 = v4;
    -[PPPBFeatureIdFeatureValuePair setFeatureId:](self, "setFeatureId:");
    v4 = v5;
  }
  if ((_BYTE)v4[5])
  {
    self->_value = v4[4];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_featureId hash];
  if (*(unsigned char *)&self->_has)
  {
    float value = self->_value;
    float v6 = -value;
    if (value >= 0.0) {
      float v6 = self->_value;
    }
    float v7 = floorf(v6 + 0.5);
    float v8 = (float)(v6 - v7) * 1.8447e19;
    unint64_t v4 = 2654435761u * (unint64_t)fmodf(v7, 1.8447e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v4 += (unint64_t)v8;
      }
    }
    else
    {
      v4 -= (unint64_t)fabsf(v8);
    }
  }
  else
  {
    unint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_8;
  }
  featureId = self->_featureId;
  if ((unint64_t)featureId | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](featureId, "isEqual:")) {
      goto LABEL_8;
    }
  }
  BOOL v6 = (*((unsigned char *)v4 + 20) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 20) & 1) != 0 && self->_value == *((float *)v4 + 4))
    {
      BOOL v6 = 1;
      goto LABEL_9;
    }
LABEL_8:
    BOOL v6 = 0;
  }
LABEL_9:

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_featureId copyWithZone:a3];
  float v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(float *)(v5 + 16) = self->_value;
    *(unsigned char *)(v5 + 20) |= 1u;
  }
  return (id)v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (self->_featureId)
  {
    id v5 = v4;
    objc_msgSend(v4, "setFeatureId:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 4) = LODWORD(self->_value);
    *((unsigned char *)v4 + 20) |= 1u;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_featureId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteFloatField();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return PPPBFeatureIdFeatureValuePairReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v5 = v3;
  featureId = self->_featureId;
  if (featureId) {
    [v3 setObject:featureId forKey:@"featureId"];
  }
  if (*(unsigned char *)&self->_has)
  {
    *(float *)&double v4 = self->_value;
    float v7 = [NSNumber numberWithFloat:v4];
    [v5 setObject:v7 forKey:@"value"];
  }
  return v5;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PPPBFeatureIdFeatureValuePair;
  double v4 = [(PPPBFeatureIdFeatureValuePair *)&v8 description];
  id v5 = [(PPPBFeatureIdFeatureValuePair *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasValue
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasValue:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setValue:(float)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_float value = a3;
}

- (BOOL)hasFeatureId
{
  return self->_featureId != 0;
}

@end