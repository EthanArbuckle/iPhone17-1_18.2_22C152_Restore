@interface NEKPBCalendarWrapper
- (BOOL)hasAttributes;
- (BOOL)hasCalendarIdentifier;
- (BOOL)hasIsDefaultEventCalendar;
- (BOOL)hasIsDefaultTaskCalendar;
- (BOOL)hasOldCalendarIdentifier;
- (BOOL)hasSourceIdentifier;
- (BOOL)isDefaultEventCalendar;
- (BOOL)isDefaultTaskCalendar;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NEKPBCalendarAttributes)attributes;
- (NEKPBSourceID)sourceIdentifier;
- (NSString)calendarIdentifier;
- (NSString)oldCalendarIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAttributes:(id)a3;
- (void)setCalendarIdentifier:(id)a3;
- (void)setHasIsDefaultEventCalendar:(BOOL)a3;
- (void)setHasIsDefaultTaskCalendar:(BOOL)a3;
- (void)setIsDefaultEventCalendar:(BOOL)a3;
- (void)setIsDefaultTaskCalendar:(BOOL)a3;
- (void)setOldCalendarIdentifier:(id)a3;
- (void)setSourceIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NEKPBCalendarWrapper

- (BOOL)hasSourceIdentifier
{
  return self->_sourceIdentifier != 0;
}

- (BOOL)hasCalendarIdentifier
{
  return self->_calendarIdentifier != 0;
}

- (BOOL)hasAttributes
{
  return self->_attributes != 0;
}

- (void)setIsDefaultTaskCalendar:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_isDefaultTaskCalendar = a3;
}

- (void)setHasIsDefaultTaskCalendar:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIsDefaultTaskCalendar
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setIsDefaultEventCalendar:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_isDefaultEventCalendar = a3;
}

- (void)setHasIsDefaultEventCalendar:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsDefaultEventCalendar
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasOldCalendarIdentifier
{
  return self->_oldCalendarIdentifier != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)NEKPBCalendarWrapper;
  char v3 = [(NEKPBCalendarWrapper *)&v7 description];
  v4 = [(NEKPBCalendarWrapper *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  sourceIdentifier = self->_sourceIdentifier;
  if (sourceIdentifier)
  {
    v5 = [(NEKPBSourceID *)sourceIdentifier dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"sourceIdentifier"];
  }
  calendarIdentifier = self->_calendarIdentifier;
  if (calendarIdentifier) {
    [v3 setObject:calendarIdentifier forKey:@"calendarIdentifier"];
  }
  attributes = self->_attributes;
  if (attributes)
  {
    v8 = [(NEKPBCalendarAttributes *)attributes dictionaryRepresentation];
    [v3 setObject:v8 forKey:@"attributes"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v10 = +[NSNumber numberWithBool:self->_isDefaultTaskCalendar];
    [v3 setObject:v10 forKey:@"isDefaultTaskCalendar"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v11 = +[NSNumber numberWithBool:self->_isDefaultEventCalendar];
    [v3 setObject:v11 forKey:@"isDefaultEventCalendar"];
  }
  oldCalendarIdentifier = self->_oldCalendarIdentifier;
  if (oldCalendarIdentifier) {
    [v3 setObject:oldCalendarIdentifier forKey:@"oldCalendarIdentifier"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10000A65C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_sourceIdentifier)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_calendarIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_attributes)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
  if (self->_oldCalendarIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_sourceIdentifier)
  {
    [v4 setSourceIdentifier:];
    id v4 = v6;
  }
  if (self->_calendarIdentifier)
  {
    [v6 setCalendarIdentifier:];
    id v4 = v6;
  }
  if (self->_attributes)
  {
    [v6 setAttributes:];
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[41] = self->_isDefaultTaskCalendar;
    v4[44] |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    v4[40] = self->_isDefaultEventCalendar;
    v4[44] |= 1u;
  }
  if (self->_oldCalendarIdentifier)
  {
    [v6 setOldCalendarIdentifier:];
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [[objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3) init];
  id v6 = [(NEKPBSourceID *)self->_sourceIdentifier copyWithZone:a3];
  objc_super v7 = (void *)v5[4];
  v5[4] = v6;

  id v8 = [(NSString *)self->_calendarIdentifier copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  id v10 = [(NEKPBCalendarAttributes *)self->_attributes copyWithZone:a3];
  v11 = (void *)v5[1];
  v5[1] = v10;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((unsigned char *)v5 + 41) = self->_isDefaultTaskCalendar;
    *((unsigned char *)v5 + 44) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((unsigned char *)v5 + 40) = self->_isDefaultEventCalendar;
    *((unsigned char *)v5 + 44) |= 1u;
  }
  id v13 = [(NSString *)self->_oldCalendarIdentifier copyWithZone:a3];
  v14 = (void *)v5[3];
  v5[3] = v13;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_20;
  }
  sourceIdentifier = self->_sourceIdentifier;
  if ((unint64_t)sourceIdentifier | *((void *)v4 + 4))
  {
    if (!-[NEKPBSourceID isEqual:](sourceIdentifier, "isEqual:")) {
      goto LABEL_20;
    }
  }
  calendarIdentifier = self->_calendarIdentifier;
  if ((unint64_t)calendarIdentifier | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](calendarIdentifier, "isEqual:")) {
      goto LABEL_20;
    }
  }
  attributes = self->_attributes;
  if ((unint64_t)attributes | *((void *)v4 + 1))
  {
    if (!-[NEKPBCalendarAttributes isEqual:](attributes, "isEqual:")) {
      goto LABEL_20;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 2) == 0) {
      goto LABEL_20;
    }
    if (self->_isDefaultTaskCalendar)
    {
      if (!*((unsigned char *)v4 + 41)) {
        goto LABEL_20;
      }
    }
    else if (*((unsigned char *)v4 + 41))
    {
      goto LABEL_20;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 2) != 0)
  {
    goto LABEL_20;
  }
  if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    if ((*((unsigned char *)v4 + 44) & 1) == 0) {
      goto LABEL_26;
    }
LABEL_20:
    unsigned __int8 v8 = 0;
    goto LABEL_21;
  }
  if ((*((unsigned char *)v4 + 44) & 1) == 0) {
    goto LABEL_20;
  }
  if (!self->_isDefaultEventCalendar)
  {
    if (!*((unsigned char *)v4 + 40)) {
      goto LABEL_26;
    }
    goto LABEL_20;
  }
  if (!*((unsigned char *)v4 + 40)) {
    goto LABEL_20;
  }
LABEL_26:
  oldCalendarIdentifier = self->_oldCalendarIdentifier;
  if ((unint64_t)oldCalendarIdentifier | *((void *)v4 + 3)) {
    unsigned __int8 v8 = -[NSString isEqual:](oldCalendarIdentifier, "isEqual:");
  }
  else {
    unsigned __int8 v8 = 1;
  }
LABEL_21:

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3 = [(NEKPBSourceID *)self->_sourceIdentifier hash];
  NSUInteger v4 = [(NSString *)self->_calendarIdentifier hash];
  unint64_t v5 = [(NEKPBCalendarAttributes *)self->_attributes hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v6 = 2654435761 * self->_isDefaultTaskCalendar;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v7 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ [(NSString *)self->_oldCalendarIdentifier hash];
  }
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v7 = 2654435761 * self->_isDefaultEventCalendar;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ [(NSString *)self->_oldCalendarIdentifier hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  sourceIdentifier = self->_sourceIdentifier;
  uint64_t v6 = *((void *)v4 + 4);
  id v10 = v4;
  if (sourceIdentifier)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[NEKPBSourceID mergeFrom:](sourceIdentifier, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[NEKPBCalendarWrapper setSourceIdentifier:](self, "setSourceIdentifier:");
  }
  id v4 = v10;
LABEL_7:
  if (*((void *)v4 + 2))
  {
    -[NEKPBCalendarWrapper setCalendarIdentifier:](self, "setCalendarIdentifier:");
    id v4 = v10;
  }
  attributes = self->_attributes;
  uint64_t v8 = *((void *)v4 + 1);
  if (attributes)
  {
    if (!v8) {
      goto LABEL_15;
    }
    -[NEKPBCalendarAttributes mergeFrom:](attributes, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_15;
    }
    -[NEKPBCalendarWrapper setAttributes:](self, "setAttributes:");
  }
  id v4 = v10;
LABEL_15:
  char v9 = *((unsigned char *)v4 + 44);
  if ((v9 & 2) != 0)
  {
    self->_isDefaultTaskCalendar = *((unsigned char *)v4 + 41);
    *(unsigned char *)&self->_has |= 2u;
    char v9 = *((unsigned char *)v4 + 44);
  }
  if (v9)
  {
    self->_isDefaultEventCalendar = *((unsigned char *)v4 + 40);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 3)) {
    -[NEKPBCalendarWrapper setOldCalendarIdentifier:](self, "setOldCalendarIdentifier:");
  }

  _objc_release_x1();
}

- (NEKPBSourceID)sourceIdentifier
{
  return self->_sourceIdentifier;
}

- (void)setSourceIdentifier:(id)a3
{
}

- (NSString)calendarIdentifier
{
  return self->_calendarIdentifier;
}

- (void)setCalendarIdentifier:(id)a3
{
}

- (NEKPBCalendarAttributes)attributes
{
  return self->_attributes;
}

- (void)setAttributes:(id)a3
{
}

- (BOOL)isDefaultTaskCalendar
{
  return self->_isDefaultTaskCalendar;
}

- (BOOL)isDefaultEventCalendar
{
  return self->_isDefaultEventCalendar;
}

- (NSString)oldCalendarIdentifier
{
  return self->_oldCalendarIdentifier;
}

- (void)setOldCalendarIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceIdentifier, 0);
  objc_storeStrong((id *)&self->_oldCalendarIdentifier, 0);
  objc_storeStrong((id *)&self->_calendarIdentifier, 0);

  objc_storeStrong((id *)&self->_attributes, 0);
}

@end