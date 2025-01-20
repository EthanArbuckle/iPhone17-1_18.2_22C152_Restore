@interface PersistentSearchResultHistoryItem
- (BOOL)hasSearchResult;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (SearchResult)searchResult;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setSearchResult:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PersistentSearchResultHistoryItem

- (BOOL)hasSearchResult
{
  return self->_searchResult != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PersistentSearchResultHistoryItem;
  v3 = [(PersistentSearchResultHistoryItem *)&v7 description];
  v4 = [(PersistentSearchResultHistoryItem *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  searchResult = self->_searchResult;
  if (searchResult)
  {
    v5 = [(SearchResultRepr *)searchResult dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"searchResult"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100BDA9B0((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_searchResult) {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  searchResult = self->_searchResult;
  if (searchResult) {
    [a3 setSearchResult:searchResult];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [[objc_opt_class() allocWithZone:a3] init];
  id v6 = [(SearchResult *)self->_searchResult copyWithZone:a3];
  objc_super v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    searchResult = self->_searchResult;
    if ((unint64_t)searchResult | v4[1]) {
      unsigned __int8 v6 = -[SearchResult isEqual:](searchResult, "isEqual:");
    }
    else {
      unsigned __int8 v6 = 1;
    }
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return [(SearchResult *)self->_searchResult hash];
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  searchResult = self->_searchResult;
  uint64_t v6 = v4[1];
  if (searchResult)
  {
    if (!v6) {
      goto LABEL_7;
    }
    objc_super v7 = v4;
    -[SearchResultRepr mergeFrom:](searchResult, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    objc_super v7 = v4;
    -[PersistentSearchResultHistoryItem setSearchResult:](self, "setSearchResult:");
  }
  v4 = v7;
LABEL_7:
}

- (SearchResult)searchResult
{
  return self->_searchResult;
}

- (void)setSearchResult:(id)a3
{
}

- (void).cxx_destruct
{
}

@end