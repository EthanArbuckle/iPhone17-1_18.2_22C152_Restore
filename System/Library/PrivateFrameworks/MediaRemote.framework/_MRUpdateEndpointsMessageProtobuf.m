@interface _MRUpdateEndpointsMessageProtobuf
+ (Class)endpointsType;
- (BOOL)hasEndpointFeatures;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)endpoints;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)endpointFeaturesAsString:(int)a3;
- (id)endpointsAtIndex:(unint64_t)a3;
- (int)StringAsEndpointFeatures:(id)a3;
- (int)endpointFeatures;
- (unint64_t)endpointsCount;
- (unint64_t)hash;
- (void)addEndpoints:(id)a3;
- (void)clearEndpoints;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEndpointFeatures:(int)a3;
- (void)setEndpoints:(id)a3;
- (void)setHasEndpointFeatures:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRUpdateEndpointsMessageProtobuf

- (void)clearEndpoints
{
}

- (void)addEndpoints:(id)a3
{
  id v4 = a3;
  endpoints = self->_endpoints;
  id v8 = v4;
  if (!endpoints)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_endpoints;
    self->_endpoints = v6;

    id v4 = v8;
    endpoints = self->_endpoints;
  }
  [(NSMutableArray *)endpoints addObject:v4];
}

- (unint64_t)endpointsCount
{
  return [(NSMutableArray *)self->_endpoints count];
}

- (id)endpointsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_endpoints objectAtIndex:a3];
}

+ (Class)endpointsType
{
  return (Class)objc_opt_class();
}

- (int)endpointFeatures
{
  if (*(unsigned char *)&self->_has) {
    return self->_endpointFeatures;
  }
  else {
    return 0;
  }
}

- (void)setEndpointFeatures:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_endpointFeatures = a3;
}

- (void)setHasEndpointFeatures:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEndpointFeatures
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)endpointFeaturesAsString:(int)a3
{
  id v4 = @"None";
  switch(a3)
  {
    case 0:
      goto LABEL_10;
    case 1:
      id v4 = @"Audio";
      return v4;
    case 2:
      id v4 = @"Screen";
      return v4;
    case 3:
    case 5:
    case 6:
    case 7:
      goto LABEL_9;
    case 4:
      id v4 = @"Video";
      return v4;
    case 8:
      id v4 = @"RemoteControl";
      return v4;
    default:
      if (a3 == 16)
      {
        id v4 = @"Companion";
      }
      else
      {
LABEL_9:
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
        id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_10:
      }
      return v4;
  }
}

- (int)StringAsEndpointFeatures:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"None"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Audio"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Screen"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Video"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"RemoteControl"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"Companion"])
  {
    int v4 = 16;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRUpdateEndpointsMessageProtobuf;
  int v4 = [(_MRUpdateEndpointsMessageProtobuf *)&v8 description];
  v5 = [(_MRUpdateEndpointsMessageProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSMutableArray *)self->_endpoints count])
  {
    int v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_endpoints, "count"));
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v5 = self->_endpoints;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = [*(id *)(*((void *)&v14 + 1) + 8 * i) dictionaryRepresentation];
          [v4 addObject:v10];
        }
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKey:@"endpoints"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t endpointFeatures = self->_endpointFeatures;
    v12 = @"None";
    switch((int)endpointFeatures)
    {
      case 0:
        break;
      case 1:
        v12 = @"Audio";
        break;
      case 2:
        v12 = @"Screen";
        break;
      case 3:
      case 5:
      case 6:
      case 7:
        goto LABEL_15;
      case 4:
        v12 = @"Video";
        break;
      case 8:
        v12 = @"RemoteControl";
        break;
      default:
        if (endpointFeatures == 16)
        {
          v12 = @"Companion";
        }
        else
        {
LABEL_15:
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", endpointFeatures);
          v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        break;
    }
    [v3 setObject:v12 forKey:@"endpointFeatures"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRUpdateEndpointsMessageProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_endpoints;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
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
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  if ([(_MRUpdateEndpointsMessageProtobuf *)self endpointsCount])
  {
    [v8 clearEndpoints];
    unint64_t v4 = [(_MRUpdateEndpointsMessageProtobuf *)self endpointsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(_MRUpdateEndpointsMessageProtobuf *)self endpointsAtIndex:i];
        [v8 addEndpoints:v7];
      }
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v8 + 2) = self->_endpointFeatures;
    *((unsigned char *)v8 + 24) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = self->_endpoints;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v10), "copyWithZone:", a3, (void)v13);
        [(id)v5 addEndpoints:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 8) = self->_endpointFeatures;
    *(unsigned char *)(v5 + 24) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_8;
  }
  endpoints = self->_endpoints;
  if ((unint64_t)endpoints | *((void *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](endpoints, "isEqual:")) {
      goto LABEL_8;
    }
  }
  BOOL v6 = (*((unsigned char *)v4 + 24) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) != 0 && self->_endpointFeatures == *((_DWORD *)v4 + 2))
    {
      BOOL v6 = 1;
      goto LABEL_9;
    }
LABEL_8:
    BOOL v6 = 0;
  }
LABEL_9:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSMutableArray *)self->_endpoints hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_endpointFeatures;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = *((id *)v4 + 2);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[_MRUpdateEndpointsMessageProtobuf addEndpoints:](self, "addEndpoints:", *(void *)(*((void *)&v10 + 1) + 8 * v9++), (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (*((unsigned char *)v4 + 24))
  {
    self->_uint64_t endpointFeatures = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSMutableArray)endpoints
{
  return self->_endpoints;
}

- (void)setEndpoints:(id)a3
{
}

- (void).cxx_destruct
{
}

@end