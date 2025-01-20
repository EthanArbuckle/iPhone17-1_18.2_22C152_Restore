@interface ICIAMLogEventRequest
+ (Class)eventParametersType;
- (BOOL)hasApplicationMessageIdentifier;
- (BOOL)hasDSID;
- (BOOL)hasDeviceID;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)eventParameters;
- (NSString)applicationMessageIdentifier;
- (NSString)deviceID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)eventParametersAtIndex:(unint64_t)a3;
- (int64_t)dSID;
- (unint64_t)eventParametersCount;
- (unint64_t)hash;
- (void)addEventParameters:(id)a3;
- (void)clearEventParameters;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setApplicationMessageIdentifier:(id)a3;
- (void)setDSID:(int64_t)a3;
- (void)setDeviceID:(id)a3;
- (void)setEventParameters:(id)a3;
- (void)setHasDSID:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation ICIAMLogEventRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventParameters, 0);
  objc_storeStrong((id *)&self->_deviceID, 0);

  objc_storeStrong((id *)&self->_applicationMessageIdentifier, 0);
}

- (void)setEventParameters:(id)a3
{
}

- (NSMutableArray)eventParameters
{
  return self->_eventParameters;
}

- (void)setDeviceID:(id)a3
{
}

- (NSString)deviceID
{
  return self->_deviceID;
}

- (int64_t)dSID
{
  return self->_dSID;
}

- (void)setApplicationMessageIdentifier:(id)a3
{
}

- (NSString)applicationMessageIdentifier
{
  return self->_applicationMessageIdentifier;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 2)) {
    -[ICIAMLogEventRequest setApplicationMessageIdentifier:](self, "setApplicationMessageIdentifier:");
  }
  if (*((unsigned char *)v4 + 40))
  {
    self->_dSID = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 3)) {
    -[ICIAMLogEventRequest setDeviceID:](self, "setDeviceID:");
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = *((id *)v4 + 4);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[ICIAMLogEventRequest addEventParameters:](self, "addEventParameters:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_applicationMessageIdentifier hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_dSID;
  }
  else {
    uint64_t v4 = 0;
  }
  NSUInteger v5 = v4 ^ v3;
  NSUInteger v6 = [(NSString *)self->_deviceID hash];
  return v5 ^ v6 ^ [(NSMutableArray *)self->_eventParameters hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  applicationMessageIdentifier = self->_applicationMessageIdentifier;
  if ((unint64_t)applicationMessageIdentifier | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](applicationMessageIdentifier, "isEqual:")) {
      goto LABEL_13;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_dSID != *((void *)v4 + 1)) {
      goto LABEL_13;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
LABEL_13:
    char v8 = 0;
    goto LABEL_14;
  }
  deviceID = self->_deviceID;
  if ((unint64_t)deviceID | *((void *)v4 + 3) && !-[NSString isEqual:](deviceID, "isEqual:")) {
    goto LABEL_13;
  }
  eventParameters = self->_eventParameters;
  if ((unint64_t)eventParameters | *((void *)v4 + 4)) {
    char v8 = -[NSMutableArray isEqual:](eventParameters, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_14:

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_applicationMessageIdentifier copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_dSID;
    *(unsigned char *)(v5 + 40) |= 1u;
  }
  uint64_t v8 = [(NSString *)self->_deviceID copyWithZone:a3];
  v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v10 = self->_eventParameters;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v14), "copyWithZone:", a3, (void)v17);
        [(id)v5 addEventParameters:v15];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }

  return (id)v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v9 = v4;
  if (self->_applicationMessageIdentifier)
  {
    objc_msgSend(v4, "setApplicationMessageIdentifier:");
    id v4 = v9;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = self->_dSID;
    *((unsigned char *)v4 + 40) |= 1u;
  }
  if (self->_deviceID) {
    objc_msgSend(v9, "setDeviceID:");
  }
  if ([(ICIAMLogEventRequest *)self eventParametersCount])
  {
    [v9 clearEventParameters];
    unint64_t v5 = [(ICIAMLogEventRequest *)self eventParametersCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(ICIAMLogEventRequest *)self eventParametersAtIndex:i];
        [v9 addEventParameters:v8];
      }
    }
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_applicationMessageIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt64Field();
  }
  if (self->_deviceID) {
    PBDataWriterWriteStringField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  unint64_t v5 = self->_eventParameters;
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
}

- (BOOL)readFrom:(id)a3
{
  return ICIAMLogEventRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  applicationMessageIdentifier = self->_applicationMessageIdentifier;
  if (applicationMessageIdentifier) {
    [v3 setObject:applicationMessageIdentifier forKey:@"applicationMessageIdentifier"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v6 = [NSNumber numberWithLongLong:self->_dSID];
    [v4 setObject:v6 forKey:@"DSID"];
  }
  deviceID = self->_deviceID;
  if (deviceID) {
    [v4 setObject:deviceID forKey:@"deviceID"];
  }
  if ([(NSMutableArray *)self->_eventParameters count])
  {
    uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_eventParameters, "count"));
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v9 = self->_eventParameters;
    uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "dictionaryRepresentation", (void)v16);
          [v8 addObject:v14];
        }
        uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v11);
    }

    [v4 setObject:v8 forKey:@"eventParameters"];
  }

  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ICIAMLogEventRequest;
  id v4 = [(ICIAMLogEventRequest *)&v8 description];
  unint64_t v5 = [(ICIAMLogEventRequest *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)eventParametersAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_eventParameters objectAtIndex:a3];
}

- (unint64_t)eventParametersCount
{
  return [(NSMutableArray *)self->_eventParameters count];
}

- (void)addEventParameters:(id)a3
{
  id v4 = a3;
  eventParameters = self->_eventParameters;
  id v8 = v4;
  if (!eventParameters)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_eventParameters;
    self->_eventParameters = v6;

    id v4 = v8;
    eventParameters = self->_eventParameters;
  }
  [(NSMutableArray *)eventParameters addObject:v4];
}

- (void)clearEventParameters
{
}

- (BOOL)hasDeviceID
{
  return self->_deviceID != 0;
}

- (BOOL)hasDSID
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasDSID:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setDSID:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_dSID = a3;
}

- (BOOL)hasApplicationMessageIdentifier
{
  return self->_applicationMessageIdentifier != 0;
}

+ (Class)eventParametersType
{
  return (Class)objc_opt_class();
}

@end