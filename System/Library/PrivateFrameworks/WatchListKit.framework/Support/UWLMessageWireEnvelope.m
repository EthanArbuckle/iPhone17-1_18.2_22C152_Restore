@interface UWLMessageWireEnvelope
+ (Class)liveActivityEventsType;
+ (Class)optInEventsType;
+ (Class)optOutEventsType;
+ (Class)playEventsType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)liveActivityEvents;
- (NSMutableArray)optInEvents;
- (NSMutableArray)optOutEvents;
- (NSMutableArray)playEvents;
- (UWLMessageHeaders)headers;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)liveActivityEventsAtIndex:(unint64_t)a3;
- (id)optInEventsAtIndex:(unint64_t)a3;
- (id)optOutEventsAtIndex:(unint64_t)a3;
- (id)playEventsAtIndex:(unint64_t)a3;
- (int)version;
- (unint64_t)hash;
- (unint64_t)liveActivityEventsCount;
- (unint64_t)optInEventsCount;
- (unint64_t)optOutEventsCount;
- (unint64_t)playEventsCount;
- (void)addLiveActivityEvents:(id)a3;
- (void)addOptInEvents:(id)a3;
- (void)addOptOutEvents:(id)a3;
- (void)addPlayEvents:(id)a3;
- (void)clearLiveActivityEvents;
- (void)clearOptInEvents;
- (void)clearOptOutEvents;
- (void)clearPlayEvents;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHeaders:(id)a3;
- (void)setLiveActivityEvents:(id)a3;
- (void)setOptInEvents:(id)a3;
- (void)setOptOutEvents:(id)a3;
- (void)setPlayEvents:(id)a3;
- (void)setVersion:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation UWLMessageWireEnvelope

- (void)clearPlayEvents
{
}

- (void)addPlayEvents:(id)a3
{
  id v4 = a3;
  playEvents = self->_playEvents;
  id v8 = v4;
  if (!playEvents)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_playEvents;
    self->_playEvents = v6;

    id v4 = v8;
    playEvents = self->_playEvents;
  }
  [(NSMutableArray *)playEvents addObject:v4];
}

- (unint64_t)playEventsCount
{
  return (unint64_t)[(NSMutableArray *)self->_playEvents count];
}

- (id)playEventsAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_playEvents objectAtIndex:a3];
}

+ (Class)playEventsType
{
  return (Class)objc_opt_class();
}

- (void)clearOptInEvents
{
}

- (void)addOptInEvents:(id)a3
{
  id v4 = a3;
  optInEvents = self->_optInEvents;
  id v8 = v4;
  if (!optInEvents)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_optInEvents;
    self->_optInEvents = v6;

    id v4 = v8;
    optInEvents = self->_optInEvents;
  }
  [(NSMutableArray *)optInEvents addObject:v4];
}

- (unint64_t)optInEventsCount
{
  return (unint64_t)[(NSMutableArray *)self->_optInEvents count];
}

- (id)optInEventsAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_optInEvents objectAtIndex:a3];
}

+ (Class)optInEventsType
{
  return (Class)objc_opt_class();
}

- (void)clearOptOutEvents
{
}

- (void)addOptOutEvents:(id)a3
{
  id v4 = a3;
  optOutEvents = self->_optOutEvents;
  id v8 = v4;
  if (!optOutEvents)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_optOutEvents;
    self->_optOutEvents = v6;

    id v4 = v8;
    optOutEvents = self->_optOutEvents;
  }
  [(NSMutableArray *)optOutEvents addObject:v4];
}

- (unint64_t)optOutEventsCount
{
  return (unint64_t)[(NSMutableArray *)self->_optOutEvents count];
}

- (id)optOutEventsAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_optOutEvents objectAtIndex:a3];
}

+ (Class)optOutEventsType
{
  return (Class)objc_opt_class();
}

- (void)clearLiveActivityEvents
{
}

- (void)addLiveActivityEvents:(id)a3
{
  id v4 = a3;
  liveActivityEvents = self->_liveActivityEvents;
  id v8 = v4;
  if (!liveActivityEvents)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_liveActivityEvents;
    self->_liveActivityEvents = v6;

    id v4 = v8;
    liveActivityEvents = self->_liveActivityEvents;
  }
  [(NSMutableArray *)liveActivityEvents addObject:v4];
}

- (unint64_t)liveActivityEventsCount
{
  return (unint64_t)[(NSMutableArray *)self->_liveActivityEvents count];
}

- (id)liveActivityEventsAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_liveActivityEvents objectAtIndex:a3];
}

+ (Class)liveActivityEventsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)UWLMessageWireEnvelope;
  v3 = [(UWLMessageWireEnvelope *)&v7 description];
  id v4 = [(UWLMessageWireEnvelope *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  id v4 = +[NSNumber numberWithInt:self->_version];
  [v3 setObject:v4 forKey:@"version"];

  headers = self->_headers;
  if (headers)
  {
    v6 = [(UWLMessageHeaders *)headers dictionaryRepresentation];
    [v3 setObject:v6 forKey:@"headers"];
  }
  if ([(NSMutableArray *)self->_playEvents count])
  {
    id v7 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_playEvents, "count"));
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id v8 = self->_playEvents;
    id v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v48 objects:v55 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v49;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v49 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = [*(id *)(*((void *)&v48 + 1) + 8 * i) dictionaryRepresentation];
          [v7 addObject:v13];
        }
        id v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v48 objects:v55 count:16];
      }
      while (v10);
    }

    [v3 setObject:v7 forKey:@"play_events"];
  }
  if ([(NSMutableArray *)self->_optInEvents count])
  {
    id v14 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_optInEvents, "count"));
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    v15 = self->_optInEvents;
    id v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v44 objects:v54 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v45;
      do
      {
        for (j = 0; j != v17; j = (char *)j + 1)
        {
          if (*(void *)v45 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = [*(id *)(*((void *)&v44 + 1) + 8 * (void)j) dictionaryRepresentation];
          [v14 addObject:v20];
        }
        id v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v44 objects:v54 count:16];
      }
      while (v17);
    }

    [v3 setObject:v14 forKey:@"opt_in_events"];
  }
  if ([(NSMutableArray *)self->_optOutEvents count])
  {
    id v21 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_optOutEvents, "count"));
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    v22 = self->_optOutEvents;
    id v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v40 objects:v53 count:16];
    if (v23)
    {
      id v24 = v23;
      uint64_t v25 = *(void *)v41;
      do
      {
        for (k = 0; k != v24; k = (char *)k + 1)
        {
          if (*(void *)v41 != v25) {
            objc_enumerationMutation(v22);
          }
          v27 = [*(id *)(*((void *)&v40 + 1) + 8 * (void)k) dictionaryRepresentation];
          [v21 addObject:v27];
        }
        id v24 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v40 objects:v53 count:16];
      }
      while (v24);
    }

    [v3 setObject:v21 forKey:@"opt_out_events"];
  }
  if ([(NSMutableArray *)self->_liveActivityEvents count])
  {
    id v28 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_liveActivityEvents, "count"));
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    v29 = self->_liveActivityEvents;
    id v30 = [(NSMutableArray *)v29 countByEnumeratingWithState:&v36 objects:v52 count:16];
    if (v30)
    {
      id v31 = v30;
      uint64_t v32 = *(void *)v37;
      do
      {
        for (m = 0; m != v31; m = (char *)m + 1)
        {
          if (*(void *)v37 != v32) {
            objc_enumerationMutation(v29);
          }
          v34 = objc_msgSend(*(id *)(*((void *)&v36 + 1) + 8 * (void)m), "dictionaryRepresentation", (void)v36);
          [v28 addObject:v34];
        }
        id v31 = [(NSMutableArray *)v29 countByEnumeratingWithState:&v36 objects:v52 count:16];
      }
      while (v31);
    }

    [v3 setObject:v28 forKey:@"live_activity_events"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return UWLMessageWireEnvelopeReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteSubmessage();
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  v5 = self->_playEvents;
  v6 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v37 objects:v44 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v38;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v38 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      id v7 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v37 objects:v44 count:16];
    }
    while (v7);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v10 = self->_optInEvents;
  uint64_t v11 = (char *)[(NSMutableArray *)v10 countByEnumeratingWithState:&v33 objects:v43 count:16];
  if (v11)
  {
    v12 = v11;
    uint64_t v13 = *(void *)v34;
    do
    {
      id v14 = 0;
      do
      {
        if (*(void *)v34 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      v12 = (char *)[(NSMutableArray *)v10 countByEnumeratingWithState:&v33 objects:v43 count:16];
    }
    while (v12);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v15 = self->_optOutEvents;
  id v16 = (char *)[(NSMutableArray *)v15 countByEnumeratingWithState:&v29 objects:v42 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v30;
    do
    {
      v19 = 0;
      do
      {
        if (*(void *)v30 != v18) {
          objc_enumerationMutation(v15);
        }
        PBDataWriterWriteSubmessage();
        ++v19;
      }
      while (v17 != v19);
      id v17 = (char *)[(NSMutableArray *)v15 countByEnumeratingWithState:&v29 objects:v42 count:16];
    }
    while (v17);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v20 = self->_liveActivityEvents;
  id v21 = (char *)[(NSMutableArray *)v20 countByEnumeratingWithState:&v25 objects:v41 count:16];
  if (v21)
  {
    v22 = v21;
    uint64_t v23 = *(void *)v26;
    do
    {
      id v24 = 0;
      do
      {
        if (*(void *)v26 != v23) {
          objc_enumerationMutation(v20);
        }
        PBDataWriterWriteSubmessage();
        ++v24;
      }
      while (v22 != v24);
      v22 = (char *)[(NSMutableArray *)v20 countByEnumeratingWithState:&v25 objects:v41 count:16];
    }
    while (v22);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  v4[12] = self->_version;
  id v21 = v4;
  [v4 setHeaders:self->_headers];
  if ([(UWLMessageWireEnvelope *)self playEventsCount])
  {
    [v21 clearPlayEvents];
    unint64_t v5 = [(UWLMessageWireEnvelope *)self playEventsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(UWLMessageWireEnvelope *)self playEventsAtIndex:i];
        [v21 addPlayEvents:v8];
      }
    }
  }
  if ([(UWLMessageWireEnvelope *)self optInEventsCount])
  {
    [v21 clearOptInEvents];
    unint64_t v9 = [(UWLMessageWireEnvelope *)self optInEventsCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
      {
        v12 = [(UWLMessageWireEnvelope *)self optInEventsAtIndex:j];
        [v21 addOptInEvents:v12];
      }
    }
  }
  if ([(UWLMessageWireEnvelope *)self optOutEventsCount])
  {
    [v21 clearOptOutEvents];
    unint64_t v13 = [(UWLMessageWireEnvelope *)self optOutEventsCount];
    if (v13)
    {
      unint64_t v14 = v13;
      for (uint64_t k = 0; k != v14; ++k)
      {
        id v16 = [(UWLMessageWireEnvelope *)self optOutEventsAtIndex:k];
        [v21 addOptOutEvents:v16];
      }
    }
  }
  if ([(UWLMessageWireEnvelope *)self liveActivityEventsCount])
  {
    [v21 clearLiveActivityEvents];
    unint64_t v17 = [(UWLMessageWireEnvelope *)self liveActivityEventsCount];
    if (v17)
    {
      unint64_t v18 = v17;
      for (uint64_t m = 0; m != v18; ++m)
      {
        v20 = [(UWLMessageWireEnvelope *)self liveActivityEventsAtIndex:m];
        [v21 addLiveActivityEvents:v20];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5[12] = self->_version;
  id v6 = [(UWLMessageHeaders *)self->_headers copyWithZone:a3];
  id v7 = (void *)*((void *)v5 + 1);
  *((void *)v5 + 1) = v6;

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  uint64_t v8 = self->_playEvents;
  id v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v45 objects:v52 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v46;
    do
    {
      v12 = 0;
      do
      {
        if (*(void *)v46 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = [*(id *)(*((void *)&v45 + 1) + 8 * (void)v12) copyWithZone:a3];
        [v5 addPlayEvents:v13];

        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v45 objects:v52 count:16];
    }
    while (v10);
  }

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  unint64_t v14 = self->_optInEvents;
  id v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v41 objects:v51 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v42;
    do
    {
      unint64_t v18 = 0;
      do
      {
        if (*(void *)v42 != v17) {
          objc_enumerationMutation(v14);
        }
        id v19 = [*(id *)(*((void *)&v41 + 1) + 8 * (void)v18) copyWithZone:a3];
        [v5 addOptInEvents:v19];

        unint64_t v18 = (char *)v18 + 1;
      }
      while (v16 != v18);
      id v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v41 objects:v51 count:16];
    }
    while (v16);
  }

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  v20 = self->_optOutEvents;
  id v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v37 objects:v50 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v38;
    do
    {
      id v24 = 0;
      do
      {
        if (*(void *)v38 != v23) {
          objc_enumerationMutation(v20);
        }
        id v25 = [*(id *)(*((void *)&v37 + 1) + 8 * (void)v24) copyWithZone:a3];
        [v5 addOptOutEvents:v25];

        id v24 = (char *)v24 + 1;
      }
      while (v22 != v24);
      id v22 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v37 objects:v50 count:16];
    }
    while (v22);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v26 = self->_liveActivityEvents;
  id v27 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v33 objects:v49 count:16];
  if (v27)
  {
    id v28 = v27;
    uint64_t v29 = *(void *)v34;
    do
    {
      long long v30 = 0;
      do
      {
        if (*(void *)v34 != v29) {
          objc_enumerationMutation(v26);
        }
        id v31 = objc_msgSend(*(id *)(*((void *)&v33 + 1) + 8 * (void)v30), "copyWithZone:", a3, (void)v33);
        [v5 addLiveActivityEvents:v31];

        long long v30 = (char *)v30 + 1;
      }
      while (v28 != v30);
      id v28 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v33 objects:v49 count:16];
    }
    while (v28);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && self->_version == *((_DWORD *)v4 + 12)
    && ((headers = self->_headers, !((unint64_t)headers | v4[1]))
     || -[UWLMessageHeaders isEqual:](headers, "isEqual:"))
    && ((playEvents = self->_playEvents, !((unint64_t)playEvents | v4[5]))
     || -[NSMutableArray isEqual:](playEvents, "isEqual:"))
    && ((optInEvents = self->_optInEvents, !((unint64_t)optInEvents | v4[3]))
     || -[NSMutableArray isEqual:](optInEvents, "isEqual:"))
    && ((optOutEvents = self->_optOutEvents, !((unint64_t)optOutEvents | v4[4]))
     || -[NSMutableArray isEqual:](optOutEvents, "isEqual:")))
  {
    liveActivityEvents = self->_liveActivityEvents;
    if ((unint64_t)liveActivityEvents | v4[2]) {
      unsigned __int8 v10 = -[NSMutableArray isEqual:](liveActivityEvents, "isEqual:");
    }
    else {
      unsigned __int8 v10 = 1;
    }
  }
  else
  {
    unsigned __int8 v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3 = 2654435761 * self->_version;
  unint64_t v4 = [(UWLMessageHeaders *)self->_headers hash];
  unint64_t v5 = v4 ^ (unint64_t)[(NSMutableArray *)self->_playEvents hash];
  unint64_t v6 = v5 ^ (unint64_t)[(NSMutableArray *)self->_optInEvents hash];
  unint64_t v7 = v6 ^ (unint64_t)[(NSMutableArray *)self->_optOutEvents hash];
  return v7 ^ (unint64_t)[(NSMutableArray *)self->_liveActivityEvents hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  self->_version = *((_DWORD *)v4 + 12);
  headers = self->_headers;
  uint64_t v6 = *((void *)v4 + 1);
  if (headers)
  {
    if (v6) {
      -[UWLMessageHeaders mergeFrom:](headers, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[UWLMessageWireEnvelope setHeaders:](self, "setHeaders:");
  }
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v7 = *((id *)v4 + 5);
  id v8 = [v7 countByEnumeratingWithState:&v39 objects:v46 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v9; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v40 != v10) {
          objc_enumerationMutation(v7);
        }
        [(UWLMessageWireEnvelope *)self addPlayEvents:*(void *)(*((void *)&v39 + 1) + 8 * i)];
      }
      id v9 = [v7 countByEnumeratingWithState:&v39 objects:v46 count:16];
    }
    while (v9);
  }

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v12 = *((id *)v4 + 3);
  id v13 = [v12 countByEnumeratingWithState:&v35 objects:v45 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v36;
    do
    {
      for (uint64_t j = 0; j != v14; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v36 != v15) {
          objc_enumerationMutation(v12);
        }
        [(UWLMessageWireEnvelope *)self addOptInEvents:*(void *)(*((void *)&v35 + 1) + 8 * (void)j)];
      }
      id v14 = [v12 countByEnumeratingWithState:&v35 objects:v45 count:16];
    }
    while (v14);
  }

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v17 = *((id *)v4 + 4);
  id v18 = [v17 countByEnumeratingWithState:&v31 objects:v44 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v32;
    do
    {
      for (uint64_t k = 0; k != v19; uint64_t k = (char *)k + 1)
      {
        if (*(void *)v32 != v20) {
          objc_enumerationMutation(v17);
        }
        [(UWLMessageWireEnvelope *)self addOptOutEvents:*(void *)(*((void *)&v31 + 1) + 8 * (void)k)];
      }
      id v19 = [v17 countByEnumeratingWithState:&v31 objects:v44 count:16];
    }
    while (v19);
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v22 = *((id *)v4 + 2);
  id v23 = [v22 countByEnumeratingWithState:&v27 objects:v43 count:16];
  if (v23)
  {
    id v24 = v23;
    uint64_t v25 = *(void *)v28;
    do
    {
      for (uint64_t m = 0; m != v24; uint64_t m = (char *)m + 1)
      {
        if (*(void *)v28 != v25) {
          objc_enumerationMutation(v22);
        }
        -[UWLMessageWireEnvelope addLiveActivityEvents:](self, "addLiveActivityEvents:", *(void *)(*((void *)&v27 + 1) + 8 * (void)m), (void)v27);
      }
      id v24 = [v22 countByEnumeratingWithState:&v27 objects:v43 count:16];
    }
    while (v24);
  }
}

- (int)version
{
  return self->_version;
}

- (void)setVersion:(int)a3
{
  self->_version = a3;
}

- (UWLMessageHeaders)headers
{
  return self->_headers;
}

- (void)setHeaders:(id)a3
{
}

- (NSMutableArray)playEvents
{
  return self->_playEvents;
}

- (void)setPlayEvents:(id)a3
{
}

- (NSMutableArray)optInEvents
{
  return self->_optInEvents;
}

- (void)setOptInEvents:(id)a3
{
}

- (NSMutableArray)optOutEvents
{
  return self->_optOutEvents;
}

- (void)setOptOutEvents:(id)a3
{
}

- (NSMutableArray)liveActivityEvents
{
  return self->_liveActivityEvents;
}

- (void)setLiveActivityEvents:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playEvents, 0);
  objc_storeStrong((id *)&self->_optOutEvents, 0);
  objc_storeStrong((id *)&self->_optInEvents, 0);
  objc_storeStrong((id *)&self->_liveActivityEvents, 0);

  objc_storeStrong((id *)&self->_headers, 0);
}

@end