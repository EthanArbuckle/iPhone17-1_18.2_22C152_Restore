@interface NTPBGradedTagID
- (BOOL)hasGrade;
- (BOOL)hasSource;
- (BOOL)hasTagId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)tagId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)grade;
- (int)source;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setGrade:(int)a3;
- (void)setHasGrade:(BOOL)a3;
- (void)setHasSource:(BOOL)a3;
- (void)setSource:(int)a3;
- (void)setTagId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBGradedTagID

- (BOOL)hasTagId
{
  return self->_tagId != 0;
}

- (int)grade
{
  if (*(unsigned char *)&self->_has) {
    return self->_grade;
  }
  else {
    return 0;
  }
}

- (void)setGrade:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_grade = a3;
}

- (void)setHasGrade:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasGrade
{
  return *(unsigned char *)&self->_has & 1;
}

- (int)source
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_source;
  }
  else {
    return 0;
  }
}

- (void)setSource:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_source = a3;
}

- (void)setHasSource:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSource
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBGradedTagID;
  v4 = [(NTPBGradedTagID *)&v8 description];
  v5 = [(NTPBGradedTagID *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  tagId = self->_tagId;
  if (tagId) {
    [v3 setObject:tagId forKey:@"tag_id"];
  }
  char has = (char)self->_has;
  if (has)
  {
    v7 = [NSNumber numberWithInt:self->_grade];
    [v4 setObject:v7 forKey:@"grade"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_super v8 = [NSNumber numberWithInt:self->_source];
    [v4 setObject:v8 forKey:@"source"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBGradedTagIDReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_tagId)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_tagId copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  char has = (char)self->_has;
  if (has)
  {
    *(_DWORD *)(v5 + 8) = self->_grade;
    *(unsigned char *)(v5 + 24) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 12) = self->_source;
    *(unsigned char *)(v5 + 24) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  tagId = self->_tagId;
  if ((unint64_t)tagId | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](tagId, "isEqual:")) {
      goto LABEL_13;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_grade != *((_DWORD *)v4 + 2)) {
      goto LABEL_13;
    }
  }
  else if (*((unsigned char *)v4 + 24))
  {
LABEL_13:
    BOOL v6 = 0;
    goto LABEL_14;
  }
  BOOL v6 = (*((unsigned char *)v4 + 24) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 2) == 0 || self->_source != *((_DWORD *)v4 + 3)) {
      goto LABEL_13;
    }
    BOOL v6 = 1;
  }
LABEL_14:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_tagId hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v4 = 2654435761 * self->_grade;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v5 = 0;
    return v4 ^ v3 ^ v5;
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_source;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (int *)a3;
  if (*((void *)v4 + 2))
  {
    BOOL v6 = v4;
    -[NTPBGradedTagID setTagId:](self, "setTagId:");
    uint64_t v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 24);
  if (v5)
  {
    self->_grade = v4[2];
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 24);
  }
  if ((v5 & 2) != 0)
  {
    self->_source = v4[3];
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (NSString)tagId
{
  return self->_tagId;
}

- (void)setTagId:(id)a3
{
}

- (void).cxx_destruct
{
}

@end