@interface APPBAdRequester
+ (id)options;
- (BOOL)hasContextJSON;
- (BOOL)hasHeight;
- (BOOL)hasIdentifier;
- (BOOL)hasWidth;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)contextJSON;
- (NSString)identifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)height;
- (int)width;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setContextJSON:(id)a3;
- (void)setHasHeight:(BOOL)a3;
- (void)setHasWidth:(BOOL)a3;
- (void)setHeight:(int)a3;
- (void)setIdentifier:(id)a3;
- (void)setWidth:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation APPBAdRequester

+ (id)options
{
  if (qword_100289AE0 != -1) {
    dispatch_once(&qword_100289AE0, &stru_100236030);
  }
  v2 = (void *)qword_100289AD8;

  return v2;
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (void)setWidth:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_width = a3;
}

- (void)setHasWidth:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasWidth
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHeight:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_height = a3;
}

- (void)setHasHeight:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasHeight
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasContextJSON
{
  return self->_contextJSON != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)APPBAdRequester;
  char v3 = [(APPBAdRequester *)&v7 description];
  v4 = [(APPBAdRequester *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  identifier = self->_identifier;
  if (identifier) {
    [v3 setObject:identifier forKey:@"identifier"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_super v7 = +[NSNumber numberWithInt:self->_width];
    [v4 setObject:v7 forKey:@"width"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v8 = +[NSNumber numberWithInt:self->_height];
    [v4 setObject:v8 forKey:@"height"];
  }
  contextJSON = self->_contextJSON;
  if (contextJSON) {
    [v4 setObject:contextJSON forKey:@"contextJSON"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return APPBAdRequesterReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_identifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
  if (self->_contextJSON)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_identifier)
  {
    [v4 setIdentifier:];
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 8) = self->_width;
    *((unsigned char *)v4 + 36) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((_DWORD *)v4 + 4) = self->_height;
    *((unsigned char *)v4 + 36) |= 1u;
  }
  if (self->_contextJSON)
  {
    [v6 setContextJSON:];
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [[objc_opt_class() allocWithZone:a3] init];
  id v6 = [(NSString *)self->_identifier copyWithZone:a3];
  objc_super v7 = (void *)v5[3];
  v5[3] = v6;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v5 + 8) = self->_width;
    *((unsigned char *)v5 + 36) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((_DWORD *)v5 + 4) = self->_height;
    *((unsigned char *)v5 + 36) |= 1u;
  }
  id v9 = [(NSString *)self->_contextJSON copyWithZone:a3];
  v10 = (void *)v5[1];
  v5[1] = v9;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](identifier, "isEqual:")) {
      goto LABEL_16;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 2) == 0 || self->_width != *((_DWORD *)v4 + 8)) {
      goto LABEL_16;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 2) != 0)
  {
LABEL_16:
    unsigned __int8 v7 = 0;
    goto LABEL_17;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0 || self->_height != *((_DWORD *)v4 + 4)) {
      goto LABEL_16;
    }
  }
  else if (*((unsigned char *)v4 + 36))
  {
    goto LABEL_16;
  }
  contextJSON = self->_contextJSON;
  if ((unint64_t)contextJSON | *((void *)v4 + 1)) {
    unsigned __int8 v7 = -[NSString isEqual:](contextJSON, "isEqual:");
  }
  else {
    unsigned __int8 v7 = 1;
  }
LABEL_17:

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_identifier hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v4 = 2654435761 * self->_width;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v5 = 0;
    return v4 ^ v3 ^ v5 ^ [(NSString *)self->_contextJSON hash];
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_height;
  return v4 ^ v3 ^ v5 ^ [(NSString *)self->_contextJSON hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (int *)a3;
  id v6 = v4;
  if (*((void *)v4 + 3))
  {
    -[APPBAdRequester setIdentifier:](self, "setIdentifier:");
    uint64_t v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 36);
  if ((v5 & 2) != 0)
  {
    self->_width = v4[8];
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 36);
  }
  if (v5)
  {
    self->_height = v4[4];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 1))
  {
    -[APPBAdRequester setContextJSON:](self, "setContextJSON:");
    uint64_t v4 = v6;
  }
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (int)width
{
  return self->_width;
}

- (int)height
{
  return self->_height;
}

- (NSString)contextJSON
{
  return self->_contextJSON;
}

- (void)setContextJSON:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_contextJSON, 0);
}

@end