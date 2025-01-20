@interface NTPBTodaySectionConfigArticle
- (BOOL)hasActionURLString;
- (BOOL)hasArticleID;
- (BOOL)hasDisplayDateString;
- (BOOL)hasPaidArticle;
- (BOOL)hasStoryType;
- (BOOL)hasTitle;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)actionURLString;
- (NSString)articleID;
- (NSString)displayDateString;
- (NSString)storyType;
- (NSString)title;
- (NTPBTodaySectionConfigArticle)paidArticle;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setActionURLString:(id)a3;
- (void)setArticleID:(id)a3;
- (void)setDisplayDateString:(id)a3;
- (void)setPaidArticle:(id)a3;
- (void)setStoryType:(id)a3;
- (void)setTitle:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBTodaySectionConfigArticle

- (void)dealloc
{
  [(NTPBTodaySectionConfigArticle *)self setArticleID:0];
  [(NTPBTodaySectionConfigArticle *)self setDisplayDateString:0];
  [(NTPBTodaySectionConfigArticle *)self setStoryType:0];
  [(NTPBTodaySectionConfigArticle *)self setTitle:0];
  [(NTPBTodaySectionConfigArticle *)self setPaidArticle:0];
  [(NTPBTodaySectionConfigArticle *)self setActionURLString:0];
  v3.receiver = self;
  v3.super_class = (Class)NTPBTodaySectionConfigArticle;
  [(NTPBTodaySectionConfigArticle *)&v3 dealloc];
}

- (BOOL)hasArticleID
{
  return self->_articleID != 0;
}

- (BOOL)hasDisplayDateString
{
  return self->_displayDateString != 0;
}

- (BOOL)hasStoryType
{
  return self->_storyType != 0;
}

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (BOOL)hasPaidArticle
{
  return self->_paidArticle != 0;
}

- (BOOL)hasActionURLString
{
  return self->_actionURLString != 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)NTPBTodaySectionConfigArticle;
  return (id)[NSString stringWithFormat:@"%@ %@", -[NTPBTodaySectionConfigArticle description](&v3, sel_description), -[NTPBTodaySectionConfigArticle dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  articleID = self->_articleID;
  if (articleID) {
    [v3 setObject:articleID forKey:@"article_ID"];
  }
  displayDateString = self->_displayDateString;
  if (displayDateString) {
    [v4 setObject:displayDateString forKey:@"display_date_string"];
  }
  storyType = self->_storyType;
  if (storyType) {
    [v4 setObject:storyType forKey:@"story_type"];
  }
  title = self->_title;
  if (title) {
    [v4 setObject:title forKey:@"title"];
  }
  paidArticle = self->_paidArticle;
  if (paidArticle) {
    objc_msgSend(v4, "setObject:forKey:", -[NTPBTodaySectionConfigArticle dictionaryRepresentation](paidArticle, "dictionaryRepresentation"), @"paid_article");
  }
  actionURLString = self->_actionURLString;
  if (actionURLString) {
    [v4 setObject:actionURLString forKey:@"action_URL_string"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBTodaySectionConfigArticleReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_articleID) {
    PBDataWriterWriteStringField();
  }
  if (self->_displayDateString) {
    PBDataWriterWriteStringField();
  }
  if (self->_storyType) {
    PBDataWriterWriteStringField();
  }
  if (self->_title) {
    PBDataWriterWriteStringField();
  }
  if (self->_paidArticle) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_actionURLString)
  {
    PBDataWriterWriteStringField();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  v5[2] = (id)[(NSString *)self->_articleID copyWithZone:a3];
  v5[3] = (id)[(NSString *)self->_displayDateString copyWithZone:a3];

  v5[5] = (id)[(NSString *)self->_storyType copyWithZone:a3];
  v5[6] = (id)[(NSString *)self->_title copyWithZone:a3];

  v5[4] = [(NTPBTodaySectionConfigArticle *)self->_paidArticle copyWithZone:a3];
  v5[1] = (id)[(NSString *)self->_actionURLString copyWithZone:a3];
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    articleID = self->_articleID;
    if (!((unint64_t)articleID | *((void *)a3 + 2)) || (int v5 = -[NSString isEqual:](articleID, "isEqual:")) != 0)
    {
      displayDateString = self->_displayDateString;
      if (!((unint64_t)displayDateString | *((void *)a3 + 3))
        || (int v5 = -[NSString isEqual:](displayDateString, "isEqual:")) != 0)
      {
        storyType = self->_storyType;
        if (!((unint64_t)storyType | *((void *)a3 + 5))
          || (int v5 = -[NSString isEqual:](storyType, "isEqual:")) != 0)
        {
          title = self->_title;
          if (!((unint64_t)title | *((void *)a3 + 6)) || (int v5 = -[NSString isEqual:](title, "isEqual:")) != 0)
          {
            paidArticle = self->_paidArticle;
            if (!((unint64_t)paidArticle | *((void *)a3 + 4))
              || (int v5 = -[NTPBTodaySectionConfigArticle isEqual:](paidArticle, "isEqual:")) != 0)
            {
              actionURLString = self->_actionURLString;
              if ((unint64_t)actionURLString | *((void *)a3 + 1))
              {
                LOBYTE(v5) = -[NSString isEqual:](actionURLString, "isEqual:");
              }
              else
              {
                LOBYTE(v5) = 1;
              }
            }
          }
        }
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_articleID hash];
  NSUInteger v4 = [(NSString *)self->_displayDateString hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_storyType hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_title hash];
  unint64_t v7 = [(NTPBTodaySectionConfigArticle *)self->_paidArticle hash];
  return v6 ^ v7 ^ [(NSString *)self->_actionURLString hash];
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 2)) {
    -[NTPBTodaySectionConfigArticle setArticleID:](self, "setArticleID:");
  }
  if (*((void *)a3 + 3)) {
    -[NTPBTodaySectionConfigArticle setDisplayDateString:](self, "setDisplayDateString:");
  }
  if (*((void *)a3 + 5)) {
    -[NTPBTodaySectionConfigArticle setStoryType:](self, "setStoryType:");
  }
  if (*((void *)a3 + 6)) {
    -[NTPBTodaySectionConfigArticle setTitle:](self, "setTitle:");
  }
  paidArticle = self->_paidArticle;
  uint64_t v6 = *((void *)a3 + 4);
  if (paidArticle)
  {
    if (v6) {
      -[NTPBTodaySectionConfigArticle mergeFrom:](paidArticle, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[NTPBTodaySectionConfigArticle setPaidArticle:](self, "setPaidArticle:");
  }
  if (*((void *)a3 + 1))
  {
    -[NTPBTodaySectionConfigArticle setActionURLString:](self, "setActionURLString:");
  }
}

- (NSString)articleID
{
  return self->_articleID;
}

- (void)setArticleID:(id)a3
{
}

- (NSString)displayDateString
{
  return self->_displayDateString;
}

- (void)setDisplayDateString:(id)a3
{
}

- (NSString)storyType
{
  return self->_storyType;
}

- (void)setStoryType:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NTPBTodaySectionConfigArticle)paidArticle
{
  return self->_paidArticle;
}

- (void)setPaidArticle:(id)a3
{
}

- (NSString)actionURLString
{
  return self->_actionURLString;
}

- (void)setActionURLString:(id)a3
{
}

@end