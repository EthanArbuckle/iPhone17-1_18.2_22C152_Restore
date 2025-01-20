@interface PPStorableFeedbackItem
- (BOOL)hasFeedbackType;
- (BOOL)hasItemString;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)itemString;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)feedbackType;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setFeedbackType:(unsigned int)a3;
- (void)setHasFeedbackType:(BOOL)a3;
- (void)setItemString:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PPStorableFeedbackItem

- (void).cxx_destruct
{
}

- (void)setItemString:(id)a3
{
}

- (NSString)itemString
{
  return self->_itemString;
}

- (unsigned)feedbackType
{
  return self->_feedbackType;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  if (v4[6])
  {
    self->_feedbackType = v4[2];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 2))
  {
    v5 = v4;
    -[PPStorableFeedbackItem setItemString:](self, "setItemString:");
    v4 = v5;
  }
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v2 = 2654435761 * self->_feedbackType;
  }
  else {
    uint64_t v2 = 0;
  }
  return [(NSString *)self->_itemString hash] ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_9;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_feedbackType != *((_DWORD *)v4 + 2)) {
      goto LABEL_9;
    }
  }
  else if (*((unsigned char *)v4 + 24))
  {
LABEL_9:
    char v6 = 0;
    goto LABEL_10;
  }
  itemString = self->_itemString;
  if ((unint64_t)itemString | *((void *)v4 + 2)) {
    char v6 = -[NSString isEqual:](itemString, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_10:

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 8) = self->_feedbackType;
    *(unsigned char *)(v5 + 24) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_itemString copyWithZone:a3];
  v8 = (void *)v6[2];
  v6[2] = v7;

  return v6;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[2] = self->_feedbackType;
    *((unsigned char *)v4 + 24) |= 1u;
  }
  if (self->_itemString)
  {
    uint64_t v5 = v4;
    objc_msgSend(v4, "setItemString:");
    id v4 = v5;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
  if (self->_itemString)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return PPStorableFeedbackItemReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    id v4 = [NSNumber numberWithUnsignedInt:self->_feedbackType];
    [v3 setObject:v4 forKey:@"feedbackType"];
  }
  itemString = self->_itemString;
  if (itemString) {
    [v3 setObject:itemString forKey:@"itemString"];
  }
  return v3;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PPStorableFeedbackItem;
  id v4 = [(PPStorableFeedbackItem *)&v8 description];
  id v5 = [(PPStorableFeedbackItem *)self dictionaryRepresentation];
  char v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasItemString
{
  return self->_itemString != 0;
}

- (BOOL)hasFeedbackType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasFeedbackType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setFeedbackType:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_feedbackType = a3;
}

@end