@interface NEKPBDeletionWrapper
- (BOOL)hasCalendarIdentifier;
- (BOOL)hasSyncId;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)calendarIdentifier;
- (NSString)syncId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)type;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCalendarIdentifier:(id)a3;
- (void)setHasType:(BOOL)a3;
- (void)setSyncId:(id)a3;
- (void)setType:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NEKPBDeletionWrapper

- (BOOL)hasSyncId
{
  return self->_syncId != 0;
}

- (void)setType:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasType
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasCalendarIdentifier
{
  return self->_calendarIdentifier != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)NEKPBDeletionWrapper;
  v3 = [(NEKPBDeletionWrapper *)&v7 description];
  v4 = [(NEKPBDeletionWrapper *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  syncId = self->_syncId;
  if (syncId) {
    [v3 setObject:syncId forKey:@"syncId"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v6 = +[NSNumber numberWithUnsignedInt:self->_type];
    [v4 setObject:v6 forKey:@"type"];
  }
  calendarIdentifier = self->_calendarIdentifier;
  if (calendarIdentifier) {
    [v4 setObject:calendarIdentifier forKey:@"calendarIdentifier"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10006A8E0((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_syncId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
  if (self->_calendarIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_syncId)
  {
    [v4 setSyncId:];
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 6) = self->_type;
    *((unsigned char *)v4 + 28) |= 1u;
  }
  if (self->_calendarIdentifier)
  {
    [v5 setCalendarIdentifier:];
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[objc_opt_class() allocWithZone:a3] init];
  id v6 = [(NSString *)self->_syncId copyWithZone:a3];
  objc_super v7 = (void *)v5[2];
  v5[2] = v6;

  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v5 + 6) = self->_type;
    *((unsigned char *)v5 + 28) |= 1u;
  }
  id v8 = [(NSString *)self->_calendarIdentifier copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  syncId = self->_syncId;
  if ((unint64_t)syncId | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](syncId, "isEqual:")) {
      goto LABEL_11;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_type != *((_DWORD *)v4 + 6)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 28))
  {
LABEL_11:
    unsigned __int8 v7 = 0;
    goto LABEL_12;
  }
  calendarIdentifier = self->_calendarIdentifier;
  if ((unint64_t)calendarIdentifier | *((void *)v4 + 1)) {
    unsigned __int8 v7 = -[NSString isEqual:](calendarIdentifier, "isEqual:");
  }
  else {
    unsigned __int8 v7 = 1;
  }
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_syncId hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_type;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3 ^ [(NSString *)self->_calendarIdentifier hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (unsigned int *)a3;
  id v5 = v4;
  if (*((void *)v4 + 2))
  {
    -[NEKPBDeletionWrapper setSyncId:](self, "setSyncId:");
    uint64_t v4 = v5;
  }
  if (v4[7])
  {
    self->_type = v4[6];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 1))
  {
    -[NEKPBDeletionWrapper setCalendarIdentifier:](self, "setCalendarIdentifier:");
    uint64_t v4 = v5;
  }
}

- (NSString)syncId
{
  return self->_syncId;
}

- (void)setSyncId:(id)a3
{
}

- (unsigned)type
{
  return self->_type;
}

- (NSString)calendarIdentifier
{
  return self->_calendarIdentifier;
}

- (void)setCalendarIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncId, 0);

  objc_storeStrong((id *)&self->_calendarIdentifier, 0);
}

@end