@interface NTPBAudioPlaylistItem
- (BOOL)hasArticleID;
- (BOOL)hasDateAdded;
- (BOOL)hasIdentifier;
- (BOOL)hasListOrder;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)articleID;
- (NSString)identifier;
- (NTPBDate)dateAdded;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)listOrder;
- (unint64_t)hash;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setArticleID:(id)a3;
- (void)setDateAdded:(id)a3;
- (void)setHasListOrder:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setListOrder:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBAudioPlaylistItem

- (void)dealloc
{
  [(NTPBAudioPlaylistItem *)self setIdentifier:0];
  [(NTPBAudioPlaylistItem *)self setArticleID:0];
  [(NTPBAudioPlaylistItem *)self setDateAdded:0];
  v3.receiver = self;
  v3.super_class = (Class)NTPBAudioPlaylistItem;
  [(NTPBAudioPlaylistItem *)&v3 dealloc];
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (BOOL)hasArticleID
{
  return self->_articleID != 0;
}

- (BOOL)hasDateAdded
{
  return self->_dateAdded != 0;
}

- (void)setListOrder:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_listOrder = a3;
}

- (void)setHasListOrder:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasListOrder
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)NTPBAudioPlaylistItem;
  return (id)[NSString stringWithFormat:@"%@ %@", -[NTPBAudioPlaylistItem description](&v3, sel_description), -[NTPBAudioPlaylistItem dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  identifier = self->_identifier;
  if (identifier) {
    [v3 setObject:identifier forKey:@"identifier"];
  }
  articleID = self->_articleID;
  if (articleID) {
    [v4 setObject:articleID forKey:@"article_ID"];
  }
  dateAdded = self->_dateAdded;
  if (dateAdded) {
    objc_msgSend(v4, "setObject:forKey:", -[NTPBDate dictionaryRepresentation](dateAdded, "dictionaryRepresentation"), @"date_added");
  }
  if (*(unsigned char *)&self->_has) {
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithLongLong:", self->_listOrder), @"list_order");
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBAudioPlaylistItemReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_identifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_articleID) {
    PBDataWriterWriteStringField();
  }
  if (self->_dateAdded) {
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt64Field();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  *(void *)(v5 + 32) = [(NSString *)self->_identifier copyWithZone:a3];
  *(void *)(v5 + 16) = [(NSString *)self->_articleID copyWithZone:a3];

  *(void *)(v5 + 24) = [(NTPBDate *)self->_dateAdded copyWithZone:a3];
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_listOrder;
    *(unsigned char *)(v5 + 40) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    identifier = self->_identifier;
    if (!((unint64_t)identifier | *((void *)a3 + 4))
      || (int v5 = -[NSString isEqual:](identifier, "isEqual:")) != 0)
    {
      articleID = self->_articleID;
      if (!((unint64_t)articleID | *((void *)a3 + 2))
        || (int v5 = -[NSString isEqual:](articleID, "isEqual:")) != 0)
      {
        dateAdded = self->_dateAdded;
        if (!((unint64_t)dateAdded | *((void *)a3 + 3))
          || (int v5 = -[NTPBDate isEqual:](dateAdded, "isEqual:")) != 0)
        {
          LOBYTE(v5) = (*((unsigned char *)a3 + 40) & 1) == 0;
          if (*(unsigned char *)&self->_has) {
            LOBYTE(v5) = (*((unsigned char *)a3 + 40) & 1) != 0 && self->_listOrder == *((void *)a3 + 1);
          }
        }
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_identifier hash];
  NSUInteger v4 = [(NSString *)self->_articleID hash];
  unint64_t v5 = [(NTPBDate *)self->_dateAdded hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v6 = 2654435761 * self->_listOrder;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 4)) {
    -[NTPBAudioPlaylistItem setIdentifier:](self, "setIdentifier:");
  }
  if (*((void *)a3 + 2)) {
    -[NTPBAudioPlaylistItem setArticleID:](self, "setArticleID:");
  }
  dateAdded = self->_dateAdded;
  uint64_t v6 = *((void *)a3 + 3);
  if (dateAdded)
  {
    if (v6) {
      -[NTPBDate mergeFrom:](dateAdded, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[NTPBAudioPlaylistItem setDateAdded:](self, "setDateAdded:");
  }
  if (*((unsigned char *)a3 + 40))
  {
    self->_listOrder = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)articleID
{
  return self->_articleID;
}

- (void)setArticleID:(id)a3
{
}

- (NTPBDate)dateAdded
{
  return self->_dateAdded;
}

- (void)setDateAdded:(id)a3
{
}

- (int64_t)listOrder
{
  return self->_listOrder;
}

@end