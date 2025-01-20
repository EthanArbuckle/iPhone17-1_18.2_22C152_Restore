@interface CSDMessagingConversationActivitySessionLocallyPersistedMetadata
- (BOOL)hasLocallyInitiated;
- (BOOL)isEqual:(id)a3;
- (BOOL)locallyInitiated;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasLocallyInitiated:(BOOL)a3;
- (void)setLocallyInitiated:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation CSDMessagingConversationActivitySessionLocallyPersistedMetadata

- (void)setLocallyInitiated:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_locallyInitiated = a3;
}

- (void)setHasLocallyInitiated:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasLocallyInitiated
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)CSDMessagingConversationActivitySessionLocallyPersistedMetadata;
  v3 = [(CSDMessagingConversationActivitySessionLocallyPersistedMetadata *)&v7 description];
  v4 = [(CSDMessagingConversationActivitySessionLocallyPersistedMetadata *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  if (*(unsigned char *)&self->_has)
  {
    v4 = +[NSNumber numberWithBool:self->_locallyInitiated];
    [v3 setObject:v4 forKey:@"locallyInitiated"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10006E7E8((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteBOOLField();
  }
}

- (void)copyTo:(id)a3
{
  if (*(unsigned char *)&self->_has)
  {
    *((unsigned char *)a3 + 8) = self->_locallyInitiated;
    *((unsigned char *)a3 + 12) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (*(unsigned char *)&self->_has)
  {
    *((unsigned char *)result + 8) = self->_locallyInitiated;
    *((unsigned char *)result + 12) |= 1u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_4;
  }
  BOOL v5 = (v4[12] & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((v4[12] & 1) == 0)
    {
LABEL_4:
      BOOL v5 = 0;
      goto LABEL_5;
    }
    if (self->_locallyInitiated)
    {
      if (!v4[8]) {
        goto LABEL_4;
      }
    }
    else if (v4[8])
    {
      goto LABEL_4;
    }
    BOOL v5 = 1;
  }
LABEL_5:

  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    return 2654435761 * self->_locallyInitiated;
  }
  else {
    return 0;
  }
}

- (void)mergeFrom:(id)a3
{
  if (*((unsigned char *)a3 + 12))
  {
    self->_locallyInitiated = *((unsigned char *)a3 + 8);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (BOOL)locallyInitiated
{
  return self->_locallyInitiated;
}

@end