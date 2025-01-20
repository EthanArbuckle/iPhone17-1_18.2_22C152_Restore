@interface NTPBAnalyticsEnvelopeContentTypeConfig
- (BOOL)hasContentHeaderName;
- (BOOL)hasContentHeaderValue;
- (BOOL)hasEndpointURLString;
- (BOOL)hasGroupingTag;
- (BOOL)hasSamplingCeiling;
- (BOOL)hasSamplingFloor;
- (BOOL)hasSeedTime;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)contentHeaderName;
- (NSString)contentHeaderValue;
- (NSString)endpointURLString;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)groupingTag;
- (unint64_t)hash;
- (unint64_t)seedTime;
- (unsigned)samplingCeiling;
- (unsigned)samplingFloor;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setContentHeaderName:(id)a3;
- (void)setContentHeaderValue:(id)a3;
- (void)setEndpointURLString:(id)a3;
- (void)setGroupingTag:(unint64_t)a3;
- (void)setHasGroupingTag:(BOOL)a3;
- (void)setHasSamplingCeiling:(BOOL)a3;
- (void)setHasSamplingFloor:(BOOL)a3;
- (void)setHasSeedTime:(BOOL)a3;
- (void)setSamplingCeiling:(unsigned int)a3;
- (void)setSamplingFloor:(unsigned int)a3;
- (void)setSeedTime:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBAnalyticsEnvelopeContentTypeConfig

- (void)dealloc
{
  [(NTPBAnalyticsEnvelopeContentTypeConfig *)self setEndpointURLString:0];
  [(NTPBAnalyticsEnvelopeContentTypeConfig *)self setContentHeaderName:0];
  [(NTPBAnalyticsEnvelopeContentTypeConfig *)self setContentHeaderValue:0];
  v3.receiver = self;
  v3.super_class = (Class)NTPBAnalyticsEnvelopeContentTypeConfig;
  [(NTPBAnalyticsEnvelopeContentTypeConfig *)&v3 dealloc];
}

- (void)setContentHeaderValue:(id)a3
{
}

- (void)setContentHeaderName:(id)a3
{
}

- (void)setEndpointURLString:(id)a3
{
}

- (void)setSamplingFloor:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_samplingFloor = a3;
}

- (void)setSamplingCeiling:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_samplingCeiling = a3;
}

- (void)setSeedTime:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_seedTime = a3;
}

- (void)setGroupingTag:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_groupingTag = a3;
}

- (BOOL)hasEndpointURLString
{
  return self->_endpointURLString != 0;
}

- (void)setHasSeedTime:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSeedTime
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasContentHeaderName
{
  return self->_contentHeaderName != 0;
}

- (BOOL)hasContentHeaderValue
{
  return self->_contentHeaderValue != 0;
}

- (void)setHasSamplingFloor:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasSamplingFloor
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHasSamplingCeiling:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSamplingCeiling
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasGroupingTag:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasGroupingTag
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)NTPBAnalyticsEnvelopeContentTypeConfig;
  return (id)[NSString stringWithFormat:@"%@ %@", -[NTPBAnalyticsEnvelopeContentTypeConfig description](&v3, sel_description), -[NTPBAnalyticsEnvelopeContentTypeConfig dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  endpointURLString = self->_endpointURLString;
  if (endpointURLString) {
    [v3 setObject:endpointURLString forKey:@"endpoint_URL_string"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", self->_seedTime), @"seed_time");
  }
  contentHeaderName = self->_contentHeaderName;
  if (contentHeaderName) {
    [v4 setObject:contentHeaderName forKey:@"content_header_name"];
  }
  contentHeaderValue = self->_contentHeaderValue;
  if (contentHeaderValue) {
    [v4 setObject:contentHeaderValue forKey:@"content_header_value"];
  }
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_11;
    }
LABEL_15:
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_samplingCeiling), @"sampling_ceiling");
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      return v4;
    }
    goto LABEL_12;
  }
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_samplingFloor), @"sampling_floor");
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_15;
  }
LABEL_11:
  if (has) {
LABEL_12:
  }
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", self->_groupingTag), @"grouping_tag");
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBAnalyticsEnvelopeContentTypeConfigReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_endpointURLString) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_contentHeaderName) {
    PBDataWriterWriteStringField();
  }
  if (self->_contentHeaderValue) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_11;
    }
LABEL_14:
    PBDataWriterWriteUint32Field();
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      return;
    }
    goto LABEL_15;
  }
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_14;
  }
LABEL_11:
  if ((has & 1) == 0) {
    return;
  }
LABEL_15:

  PBDataWriterWriteUint64Field();
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  *(void *)(v5 + 40) = [(NSString *)self->_endpointURLString copyWithZone:a3];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_seedTime;
    *(unsigned char *)(v5 + 56) |= 2u;
  }

  *(void *)(v5 + 24) = [(NSString *)self->_contentHeaderName copyWithZone:a3];
  *(void *)(v5 + 32) = [(NSString *)self->_contentHeaderValue copyWithZone:a3];
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_5;
    }
LABEL_9:
    *(_DWORD *)(v5 + 48) = self->_samplingCeiling;
    *(unsigned char *)(v5 + 56) |= 4u;
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      return (id)v5;
    }
    goto LABEL_6;
  }
  *(_DWORD *)(v5 + 52) = self->_samplingFloor;
  *(unsigned char *)(v5 + 56) |= 8u;
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_9;
  }
LABEL_5:
  if (has)
  {
LABEL_6:
    *(void *)(v5 + 8) = self->_groupingTag;
    *(unsigned char *)(v5 + 56) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    endpointURLString = self->_endpointURLString;
    if (!((unint64_t)endpointURLString | *((void *)a3 + 5))
      || (int v5 = -[NSString isEqual:](endpointURLString, "isEqual:")) != 0)
    {
      if ((*(unsigned char *)&self->_has & 2) != 0)
      {
        if ((*((unsigned char *)a3 + 56) & 2) == 0 || self->_seedTime != *((void *)a3 + 2)) {
          goto LABEL_27;
        }
      }
      else if ((*((unsigned char *)a3 + 56) & 2) != 0)
      {
LABEL_27:
        LOBYTE(v5) = 0;
        return v5;
      }
      contentHeaderName = self->_contentHeaderName;
      if (!((unint64_t)contentHeaderName | *((void *)a3 + 3))
        || (int v5 = -[NSString isEqual:](contentHeaderName, "isEqual:")) != 0)
      {
        contentHeaderValue = self->_contentHeaderValue;
        if (!((unint64_t)contentHeaderValue | *((void *)a3 + 4))
          || (int v5 = -[NSString isEqual:](contentHeaderValue, "isEqual:")) != 0)
        {
          if ((*(unsigned char *)&self->_has & 8) != 0)
          {
            if ((*((unsigned char *)a3 + 56) & 8) == 0 || self->_samplingFloor != *((_DWORD *)a3 + 13)) {
              goto LABEL_27;
            }
          }
          else if ((*((unsigned char *)a3 + 56) & 8) != 0)
          {
            goto LABEL_27;
          }
          if ((*(unsigned char *)&self->_has & 4) != 0)
          {
            if ((*((unsigned char *)a3 + 56) & 4) == 0 || self->_samplingCeiling != *((_DWORD *)a3 + 12)) {
              goto LABEL_27;
            }
          }
          else if ((*((unsigned char *)a3 + 56) & 4) != 0)
          {
            goto LABEL_27;
          }
          LOBYTE(v5) = (*((unsigned char *)a3 + 56) & 1) == 0;
          if (*(unsigned char *)&self->_has)
          {
            if ((*((unsigned char *)a3 + 56) & 1) == 0 || self->_groupingTag != *((void *)a3 + 1)) {
              goto LABEL_27;
            }
            LOBYTE(v5) = 1;
          }
        }
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_endpointURLString hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    unint64_t v4 = 2654435761u * self->_seedTime;
  }
  else {
    unint64_t v4 = 0;
  }
  NSUInteger v5 = [(NSString *)self->_contentHeaderName hash];
  NSUInteger v6 = [(NSString *)self->_contentHeaderValue hash];
  if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    uint64_t v7 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_6;
    }
LABEL_9:
    uint64_t v8 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_7;
    }
LABEL_10:
    unint64_t v9 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  }
  uint64_t v7 = 2654435761 * self->_samplingFloor;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_9;
  }
LABEL_6:
  uint64_t v8 = 2654435761 * self->_samplingCeiling;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_10;
  }
LABEL_7:
  unint64_t v9 = 2654435761u * self->_groupingTag;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 5)) {
    -[NTPBAnalyticsEnvelopeContentTypeConfig setEndpointURLString:](self, "setEndpointURLString:");
  }
  if ((*((unsigned char *)a3 + 56) & 2) != 0)
  {
    self->_seedTime = *((void *)a3 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)a3 + 3)) {
    -[NTPBAnalyticsEnvelopeContentTypeConfig setContentHeaderName:](self, "setContentHeaderName:");
  }
  if (*((void *)a3 + 4)) {
    -[NTPBAnalyticsEnvelopeContentTypeConfig setContentHeaderValue:](self, "setContentHeaderValue:");
  }
  char v5 = *((unsigned char *)a3 + 56);
  if ((v5 & 8) != 0)
  {
    self->_samplingFloor = *((_DWORD *)a3 + 13);
    *(unsigned char *)&self->_has |= 8u;
    char v5 = *((unsigned char *)a3 + 56);
    if ((v5 & 4) == 0)
    {
LABEL_11:
      if ((v5 & 1) == 0) {
        return;
      }
      goto LABEL_12;
    }
  }
  else if ((*((unsigned char *)a3 + 56) & 4) == 0)
  {
    goto LABEL_11;
  }
  self->_samplingCeiling = *((_DWORD *)a3 + 12);
  *(unsigned char *)&self->_has |= 4u;
  if ((*((unsigned char *)a3 + 56) & 1) == 0) {
    return;
  }
LABEL_12:
  self->_groupingTag = *((void *)a3 + 1);
  *(unsigned char *)&self->_has |= 1u;
}

- (NSString)endpointURLString
{
  return self->_endpointURLString;
}

- (unint64_t)seedTime
{
  return self->_seedTime;
}

- (NSString)contentHeaderName
{
  return self->_contentHeaderName;
}

- (NSString)contentHeaderValue
{
  return self->_contentHeaderValue;
}

- (unsigned)samplingFloor
{
  return self->_samplingFloor;
}

- (unsigned)samplingCeiling
{
  return self->_samplingCeiling;
}

- (unint64_t)groupingTag
{
  return self->_groupingTag;
}

@end