@interface APPBLogAdEventRequest
+ (Class)eventType;
+ (id)options;
- (APPBLogMetaData)metaData;
- (BOOL)hasMetaData;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)events;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)eventAtIndex:(unint64_t)a3;
- (unint64_t)eventsCount;
- (unint64_t)hash;
- (void)addEvent:(id)a3;
- (void)clearEvents;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEvents:(id)a3;
- (void)setMetaData:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation APPBLogAdEventRequest

+ (id)options
{
  if (qword_100289A30 != -1) {
    dispatch_once(&qword_100289A30, &stru_100235CA8);
  }
  v2 = (void *)qword_100289A28;

  return v2;
}

- (BOOL)hasMetaData
{
  return self->_metaData != 0;
}

- (void)clearEvents
{
}

- (void)addEvent:(id)a3
{
  id v4 = a3;
  events = self->_events;
  id v8 = v4;
  if (!events)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_events;
    self->_events = v6;

    id v4 = v8;
    events = self->_events;
  }
  [(NSMutableArray *)events addObject:v4];
}

- (unint64_t)eventsCount
{
  return (unint64_t)[(NSMutableArray *)self->_events count];
}

- (id)eventAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_events objectAtIndex:a3];
}

+ (Class)eventType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)APPBLogAdEventRequest;
  v3 = [(APPBLogAdEventRequest *)&v7 description];
  id v4 = [(APPBLogAdEventRequest *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  metaData = self->_metaData;
  if (metaData)
  {
    v5 = [(APPBLogMetaData *)metaData dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"metaData"];
  }
  if ([(NSMutableArray *)self->_events count])
  {
    id v6 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_events, "count")];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    objc_super v7 = self->_events;
    id v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = [*(id *)(*((void *)&v14 + 1) + 8 * i) dictionaryRepresentation:v14];
          [v6 addObject:v12];
        }
        id v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKey:@"event"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return APPBLogAdEventRequestReadFrom((id *)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_metaData) {
    PBDataWriterWriteSubmessage();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_events;
  id v6 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    objc_super v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      objc_super v7 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  if (self->_metaData) {
    [v8 setMetaData:];
  }
  if ([(APPBLogAdEventRequest *)self eventsCount])
  {
    [v8 clearEvents];
    unint64_t v4 = [(APPBLogAdEventRequest *)self eventsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        objc_super v7 = [(APPBLogAdEventRequest *)self eventAtIndex:i];
        [v8 addEvent:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = [[[objc_opt_class() allocWithZone:a3] init];
  id v6 = [(APPBLogMetaData *)self->_metaData copyWithZone:a3];
  objc_super v7 = (void *)v5[2];
  v5[2] = v6;

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = self->_events;
  id v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      long long v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = [*(id *)(*((void *)&v15 + 1) + 8 * (void)v12) copyWithZone:a3];
        [v5 addEvent:v13];

        long long v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((metaData = self->_metaData, !((unint64_t)metaData | v4[2]))
     || -[APPBLogMetaData isEqual:](metaData, "isEqual:")))
  {
    events = self->_events;
    if ((unint64_t)events | v4[1]) {
      unsigned __int8 v7 = -[NSMutableArray isEqual:](events, "isEqual:");
    }
    else {
      unsigned __int8 v7 = 1;
    }
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3 = [(APPBLogMetaData *)self->_metaData hash];
  return (unint64_t)[(NSMutableArray *)self->_events hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  metaData = self->_metaData;
  uint64_t v6 = *((void *)v4 + 2);
  if (metaData)
  {
    if (v6) {
      -[APPBLogMetaData mergeFrom:](metaData, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[APPBLogAdEventRequest setMetaData:](self, "setMetaData:");
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = *((id *)v4 + 1);
  id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v9; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        -[APPBLogAdEventRequest addEvent:](self, "addEvent:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      id v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (APPBLogMetaData)metaData
{
  return self->_metaData;
}

- (void)setMetaData:(id)a3
{
}

- (NSMutableArray)events
{
  return self->_events;
}

- (void)setEvents:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metaData, 0);

  objc_storeStrong((id *)&self->_events, 0);
}

@end