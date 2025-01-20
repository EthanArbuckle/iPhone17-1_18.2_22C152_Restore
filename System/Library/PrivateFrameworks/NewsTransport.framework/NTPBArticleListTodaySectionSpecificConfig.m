@interface NTPBArticleListTodaySectionSpecificConfig
- (BOOL)hasArticleListID;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)articleListID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setArticleListID:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBArticleListTodaySectionSpecificConfig

- (void)dealloc
{
  [(NTPBArticleListTodaySectionSpecificConfig *)self setArticleListID:0];
  v3.receiver = self;
  v3.super_class = (Class)NTPBArticleListTodaySectionSpecificConfig;
  [(NTPBArticleListTodaySectionSpecificConfig *)&v3 dealloc];
}

- (BOOL)hasArticleListID
{
  return self->_articleListID != 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)NTPBArticleListTodaySectionSpecificConfig;
  return (id)[NSString stringWithFormat:@"%@ %@", -[NTPBArticleListTodaySectionSpecificConfig description](&v3, sel_description), -[NTPBArticleListTodaySectionSpecificConfig dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  articleListID = self->_articleListID;
  if (articleListID) {
    [v3 setObject:articleListID forKey:@"article_list_ID"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBArticleListTodaySectionSpecificConfigReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_articleListID) {
    PBDataWriterWriteStringField();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  v5[1] = (id)[(NSString *)self->_articleListID copyWithZone:a3];
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    articleListID = self->_articleListID;
    if ((unint64_t)articleListID | *((void *)a3 + 1))
    {
      LOBYTE(v5) = -[NSString isEqual:](articleListID, "isEqual:");
    }
    else
    {
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  return [(NSString *)self->_articleListID hash];
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[NTPBArticleListTodaySectionSpecificConfig setArticleListID:](self, "setArticleListID:");
  }
}

- (NSString)articleListID
{
  return self->_articleListID;
}

- (void)setArticleListID:(id)a3
{
}

@end