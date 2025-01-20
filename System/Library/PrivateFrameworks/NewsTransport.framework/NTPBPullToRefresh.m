@interface NTPBPullToRefresh
- (BOOL)hasViewId;
- (BOOL)hasViewType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)viewId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)viewTypeAsString:(int)a3;
- (int)StringAsViewType:(id)a3;
- (int)viewType;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setHasViewType:(BOOL)a3;
- (void)setViewId:(id)a3;
- (void)setViewType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBPullToRefresh

- (int)viewType
{
  if (*(unsigned char *)&self->_has) {
    return self->_viewType;
  }
  else {
    return 0;
  }
}

- (void)setViewType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_viewType = a3;
}

- (void)setHasViewType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasViewType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)viewTypeAsString:(int)a3
{
  if (a3 >= 0xA)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_26444EDB0[a3];
  }

  return v3;
}

- (int)StringAsViewType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_VIEW_TYPE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"FEED_VIEW_TYPE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"EXCERPT_VIEW_TYPE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"ARTICLE_VIEW_TYPE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"EXPLORE_VIEW_TYPE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"FAVORITES_VIEW_TYPE"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"FOR_YOU_VIEW_TYPE"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"READING_HISTORY_VIEW_TYPE"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"READING_LIST_VIEW_TYPE"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"SEARCH_VIEW_TYPE"])
  {
    int v4 = 9;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasViewId
{
  return self->_viewId != 0;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBPullToRefresh;
  int v4 = [(NTPBPullToRefresh *)&v8 description];
  v5 = [(NTPBPullToRefresh *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t viewType = self->_viewType;
    if (viewType >= 0xA)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_viewType);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_26444EDB0[viewType];
    }
    [v3 setObject:v5 forKey:@"view_type"];
  }
  viewId = self->_viewId;
  if (viewId) {
    [v3 setObject:viewId forKey:@"view_id"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBPullToRefreshReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_viewId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 16) = self->_viewType;
    *(unsigned char *)(v5 + 20) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_viewId copyWithZone:a3];
  objc_super v8 = (void *)v6[1];
  v6[1] = v7;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_9;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 20) & 1) == 0 || self->_viewType != *((_DWORD *)v4 + 4)) {
      goto LABEL_9;
    }
  }
  else if (*((unsigned char *)v4 + 20))
  {
LABEL_9:
    char v6 = 0;
    goto LABEL_10;
  }
  viewId = self->_viewId;
  if ((unint64_t)viewId | *((void *)v4 + 1)) {
    char v6 = -[NSString isEqual:](viewId, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v2 = 2654435761 * self->_viewType;
  }
  else {
    uint64_t v2 = 0;
  }
  return [(NSString *)self->_viewId hash] ^ v2;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (v4[5])
  {
    self->_uint64_t viewType = v4[4];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 1))
  {
    uint64_t v5 = v4;
    -[NTPBPullToRefresh setViewId:](self, "setViewId:");
    id v4 = v5;
  }
}

- (NSString)viewId
{
  return self->_viewId;
}

- (void)setViewId:(id)a3
{
}

- (void).cxx_destruct
{
}

@end