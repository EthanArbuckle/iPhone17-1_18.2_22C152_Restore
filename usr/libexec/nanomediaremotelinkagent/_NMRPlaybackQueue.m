@interface _NMRPlaybackQueue
+ (Class)contentItemType;
- (BOOL)hasLocation;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)contentItems;
- (id)contentItemAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)location;
- (unint64_t)contentItemsCount;
- (unint64_t)hash;
- (void)addContentItem:(id)a3;
- (void)clearContentItems;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setContentItems:(id)a3;
- (void)setHasLocation:(BOOL)a3;
- (void)setLocation:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _NMRPlaybackQueue

- (void)setLocation:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_location = a3;
}

- (void)setHasLocation:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasLocation
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)clearContentItems
{
}

- (void)addContentItem:(id)a3
{
  id v4 = a3;
  contentItems = self->_contentItems;
  id v8 = v4;
  if (!contentItems)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_contentItems;
    self->_contentItems = v6;

    id v4 = v8;
    contentItems = self->_contentItems;
  }
  [(NSMutableArray *)contentItems addObject:v4];
}

- (unint64_t)contentItemsCount
{
  return (unint64_t)[(NSMutableArray *)self->_contentItems count];
}

- (id)contentItemAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_contentItems objectAtIndex:a3];
}

+ (Class)contentItemType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)_NMRPlaybackQueue;
  v3 = [(_NMRPlaybackQueue *)&v7 description];
  id v4 = [(_NMRPlaybackQueue *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  if (*(unsigned char *)&self->_has)
  {
    id v4 = +[NSNumber numberWithInt:self->_location];
    [v3 setObject:v4 forKey:@"location"];
  }
  if ([(NSMutableArray *)self->_contentItems count])
  {
    id v5 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_contentItems, "count")];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v6 = self->_contentItems;
    id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = [*(id *)(*((void *)&v13 + 1) + 8 * i) dictionaryRepresentation:v13];
          [v5 addObject:v11];
        }
        id v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }

    [v3 setObject:v5 forKey:@"contentItem"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000228B0((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = self->_contentItems;
  v6 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      id v7 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[4] = self->_location;
    *((unsigned char *)v4 + 20) |= 1u;
  }
  id v9 = v4;
  if ([(_NMRPlaybackQueue *)self contentItemsCount])
  {
    [v9 clearContentItems];
    unint64_t v5 = [(_NMRPlaybackQueue *)self contentItemsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(_NMRPlaybackQueue *)self contentItemAtIndex:i];
        [v9 addContentItem:v8];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[objc_opt_class() allocWithZone:a3] init];
  unint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v5 + 4) = self->_location;
    *((unsigned char *)v5 + 20) |= 1u;
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = self->_contentItems;
  id v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      long long v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = [*(id *)(*((void *)&v14 + 1) + 8 * (void)v11) copyWithZone:a3];
        [v6 addContentItem:v12];

        long long v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

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
    if ((*((unsigned char *)v4 + 20) & 1) == 0 || self->_location != *((_DWORD *)v4 + 4)) {
      goto LABEL_9;
    }
  }
  else if (*((unsigned char *)v4 + 20))
  {
LABEL_9:
    unsigned __int8 v6 = 0;
    goto LABEL_10;
  }
  contentItems = self->_contentItems;
  if ((unint64_t)contentItems | *((void *)v4 + 1)) {
    unsigned __int8 v6 = -[NSMutableArray isEqual:](contentItems, "isEqual:");
  }
  else {
    unsigned __int8 v6 = 1;
  }
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v2 = 2654435761 * self->_location;
  }
  else {
    uint64_t v2 = 0;
  }
  return (unint64_t)[(NSMutableArray *)self->_contentItems hash] ^ v2;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*((unsigned char *)v4 + 20))
  {
    self->_location = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = *((id *)v4 + 1);
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        -[_NMRPlaybackQueue addContentItem:](self, "addContentItem:", *(void *)(*((void *)&v11 + 1) + 8 * (void)v10), (void)v11);
        uint64_t v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (int)location
{
  return self->_location;
}

- (NSMutableArray)contentItems
{
  return self->_contentItems;
}

- (void)setContentItems:(id)a3
{
}

- (void).cxx_destruct
{
}

@end