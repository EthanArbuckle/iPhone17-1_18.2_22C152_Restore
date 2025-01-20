@interface NTPBTodaySectionConfigItem
- (BOOL)hasArticle;
- (BOOL)hasItemType;
- (BOOL)hasWebEmbed;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NTPBTodaySectionConfigArticle)article;
- (NTPBTodaySectionConfigWebEmbed)webEmbed;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)itemType;
- (unint64_t)hash;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setArticle:(id)a3;
- (void)setHasItemType:(BOOL)a3;
- (void)setItemType:(int)a3;
- (void)setWebEmbed:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBTodaySectionConfigItem

- (void)dealloc
{
  [(NTPBTodaySectionConfigItem *)self setArticle:0];
  [(NTPBTodaySectionConfigItem *)self setWebEmbed:0];
  v3.receiver = self;
  v3.super_class = (Class)NTPBTodaySectionConfigItem;
  [(NTPBTodaySectionConfigItem *)&v3 dealloc];
}

- (int)itemType
{
  if (*(unsigned char *)&self->_has) {
    return self->_itemType;
  }
  else {
    return 0;
  }
}

- (void)setItemType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_itemType = a3;
}

- (void)setHasItemType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasItemType
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasArticle
{
  return self->_article != 0;
}

- (BOOL)hasWebEmbed
{
  return self->_webEmbed != 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)NTPBTodaySectionConfigItem;
  return (id)[NSString stringWithFormat:@"%@ %@", -[NTPBTodaySectionConfigItem description](&v3, sel_description), -[NTPBTodaySectionConfigItem dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:", self->_itemType), @"item_type");
  }
  article = self->_article;
  if (article) {
    objc_msgSend(v3, "setObject:forKey:", -[NTPBTodaySectionConfigArticle dictionaryRepresentation](article, "dictionaryRepresentation"), @"article");
  }
  webEmbed = self->_webEmbed;
  if (webEmbed) {
    objc_msgSend(v3, "setObject:forKey:", -[NTPBTodaySectionConfigWebEmbed dictionaryRepresentation](webEmbed, "dictionaryRepresentation"), @"web_embed");
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBTodaySectionConfigItemReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_article) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_webEmbed)
  {
    PBDataWriterWriteSubmessage();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 16) = self->_itemType;
    *(unsigned char *)(v5 + 32) |= 1u;
  }

  *(void *)(v6 + 8) = [(NTPBTodaySectionConfigArticle *)self->_article copyWithZone:a3];
  *(void *)(v6 + 24) = [(NTPBTodaySectionConfigWebEmbed *)self->_webEmbed copyWithZone:a3];
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 32) & 1) == 0 || self->_itemType != *((_DWORD *)a3 + 4)) {
        goto LABEL_11;
      }
    }
    else if (*((unsigned char *)a3 + 32))
    {
LABEL_11:
      LOBYTE(v5) = 0;
      return v5;
    }
    article = self->_article;
    if (!((unint64_t)article | *((void *)a3 + 1))
      || (int v5 = -[NTPBTodaySectionConfigArticle isEqual:](article, "isEqual:")) != 0)
    {
      webEmbed = self->_webEmbed;
      if ((unint64_t)webEmbed | *((void *)a3 + 3))
      {
        LOBYTE(v5) = -[NTPBTodaySectionConfigWebEmbed isEqual:](webEmbed, "isEqual:");
      }
      else
      {
        LOBYTE(v5) = 1;
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_itemType;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(NTPBTodaySectionConfigArticle *)self->_article hash] ^ v3;
  return v4 ^ [(NTPBTodaySectionConfigWebEmbed *)self->_webEmbed hash];
}

- (void)mergeFrom:(id)a3
{
  if (*((unsigned char *)a3 + 32))
  {
    self->_itemType = *((_DWORD *)a3 + 4);
    *(unsigned char *)&self->_has |= 1u;
  }
  article = self->_article;
  uint64_t v6 = *((void *)a3 + 1);
  if (article)
  {
    if (v6) {
      -[NTPBTodaySectionConfigArticle mergeFrom:](article, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[NTPBTodaySectionConfigItem setArticle:](self, "setArticle:");
  }
  webEmbed = self->_webEmbed;
  uint64_t v8 = *((void *)a3 + 3);
  if (webEmbed)
  {
    if (v8)
    {
      -[NTPBTodaySectionConfigWebEmbed mergeFrom:](webEmbed, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[NTPBTodaySectionConfigItem setWebEmbed:](self, "setWebEmbed:");
  }
}

- (NTPBTodaySectionConfigArticle)article
{
  return self->_article;
}

- (void)setArticle:(id)a3
{
}

- (NTPBTodaySectionConfigWebEmbed)webEmbed
{
  return self->_webEmbed;
}

- (void)setWebEmbed:(id)a3
{
}

@end