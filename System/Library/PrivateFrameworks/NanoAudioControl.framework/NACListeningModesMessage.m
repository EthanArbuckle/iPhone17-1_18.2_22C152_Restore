@interface NACListeningModesMessage
+ (Class)availableListeningModeType;
- (BOOL)hasCategory;
- (BOOL)hasCurrentListeningMode;
- (BOOL)hasError;
- (BOOL)hasOriginIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)error;
- (NSMutableArray)availableListeningModes;
- (NSString)category;
- (NSString)currentListeningMode;
- (id)availableListeningModeAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)originIdentifier;
- (unint64_t)availableListeningModesCount;
- (unint64_t)hash;
- (void)addAvailableListeningMode:(id)a3;
- (void)clearAvailableListeningModes;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAvailableListeningModes:(id)a3;
- (void)setCategory:(id)a3;
- (void)setCurrentListeningMode:(id)a3;
- (void)setError:(id)a3;
- (void)setHasOriginIdentifier:(BOOL)a3;
- (void)setOriginIdentifier:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NACListeningModesMessage

- (void)clearAvailableListeningModes
{
}

- (void)addAvailableListeningMode:(id)a3
{
  id v4 = a3;
  availableListeningModes = self->_availableListeningModes;
  id v8 = v4;
  if (!availableListeningModes)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_availableListeningModes;
    self->_availableListeningModes = v6;

    id v4 = v8;
    availableListeningModes = self->_availableListeningModes;
  }
  [(NSMutableArray *)availableListeningModes addObject:v4];
}

- (unint64_t)availableListeningModesCount
{
  return [(NSMutableArray *)self->_availableListeningModes count];
}

- (id)availableListeningModeAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_availableListeningModes objectAtIndex:a3];
}

+ (Class)availableListeningModeType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasCurrentListeningMode
{
  return self->_currentListeningMode != 0;
}

- (BOOL)hasCategory
{
  return self->_category != 0;
}

- (void)setOriginIdentifier:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_originIdentifier = a3;
}

- (void)setHasOriginIdentifier:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasOriginIdentifier
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasError
{
  return self->_error != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NACListeningModesMessage;
  id v4 = [(NACListeningModesMessage *)&v8 description];
  v5 = [(NACListeningModesMessage *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  availableListeningModes = self->_availableListeningModes;
  if (availableListeningModes) {
    [v3 setObject:availableListeningModes forKey:@"availableListeningMode"];
  }
  currentListeningMode = self->_currentListeningMode;
  if (currentListeningMode) {
    [v4 setObject:currentListeningMode forKey:@"currentListeningMode"];
  }
  category = self->_category;
  if (category) {
    [v4 setObject:category forKey:@"category"];
  }
  if (*(unsigned char *)&self->_has)
  {
    objc_super v8 = [NSNumber numberWithInt:self->_originIdentifier];
    [v4 setObject:v8 forKey:@"originIdentifier"];
  }
  error = self->_error;
  if (error) {
    [v4 setObject:error forKey:@"error"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NACListeningModesMessageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_availableListeningModes;
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
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (self->_currentListeningMode) {
    PBDataWriterWriteStringField();
  }
  if (self->_category) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_error) {
    PBDataWriterWriteDataField();
  }
}

- (void)copyTo:(id)a3
{
  id v9 = a3;
  if ([(NACListeningModesMessage *)self availableListeningModesCount])
  {
    [v9 clearAvailableListeningModes];
    unint64_t v4 = [(NACListeningModesMessage *)self availableListeningModesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(NACListeningModesMessage *)self availableListeningModeAtIndex:i];
        [v9 addAvailableListeningMode:v7];
      }
    }
  }
  if (self->_currentListeningMode) {
    objc_msgSend(v9, "setCurrentListeningMode:");
  }
  uint64_t v8 = v9;
  if (self->_category)
  {
    objc_msgSend(v9, "setCategory:");
    uint64_t v8 = v9;
  }
  if (*(unsigned char *)&self->_has)
  {
    v8[10] = self->_originIdentifier;
    *((unsigned char *)v8 + 44) |= 1u;
  }
  if (self->_error)
  {
    objc_msgSend(v9, "setError:");
    uint64_t v8 = v9;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v6 = self->_availableListeningModes;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v10), "copyWithZone:", a3, (void)v19);
        [(id)v5 addAvailableListeningMode:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }

  uint64_t v12 = [(NSString *)self->_currentListeningMode copyWithZone:a3];
  long long v13 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v12;

  uint64_t v14 = [(NSString *)self->_category copyWithZone:a3];
  uint64_t v15 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v14;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 40) = self->_originIdentifier;
    *(unsigned char *)(v5 + 44) |= 1u;
  }
  uint64_t v16 = -[NSData copyWithZone:](self->_error, "copyWithZone:", a3, (void)v19);
  v17 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v16;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  availableListeningModes = self->_availableListeningModes;
  if ((unint64_t)availableListeningModes | *((void *)v4 + 1))
  {
    if (!-[NSMutableArray isEqual:](availableListeningModes, "isEqual:")) {
      goto LABEL_15;
    }
  }
  currentListeningMode = self->_currentListeningMode;
  if ((unint64_t)currentListeningMode | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](currentListeningMode, "isEqual:")) {
      goto LABEL_15;
    }
  }
  category = self->_category;
  if ((unint64_t)category | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](category, "isEqual:")) {
      goto LABEL_15;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 44) & 1) == 0 || self->_originIdentifier != *((_DWORD *)v4 + 10)) {
      goto LABEL_15;
    }
  }
  else if (*((unsigned char *)v4 + 44))
  {
LABEL_15:
    char v9 = 0;
    goto LABEL_16;
  }
  error = self->_error;
  if ((unint64_t)error | *((void *)v4 + 4)) {
    char v9 = -[NSData isEqual:](error, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_16:

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSMutableArray *)self->_availableListeningModes hash];
  NSUInteger v4 = [(NSString *)self->_currentListeningMode hash];
  NSUInteger v5 = [(NSString *)self->_category hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v6 = 2654435761 * self->_originIdentifier;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ [(NSData *)self->_error hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = *((id *)v4 + 1);
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
        -[NACListeningModesMessage addAvailableListeningMode:](self, "addAvailableListeningMode:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (*((void *)v4 + 3)) {
    -[NACListeningModesMessage setCurrentListeningMode:](self, "setCurrentListeningMode:");
  }
  if (*((void *)v4 + 2)) {
    -[NACListeningModesMessage setCategory:](self, "setCategory:");
  }
  if (*((unsigned char *)v4 + 44))
  {
    self->_originIdentifier = *((_DWORD *)v4 + 10);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 4)) {
    -[NACListeningModesMessage setError:](self, "setError:");
  }
}

- (NSMutableArray)availableListeningModes
{
  return self->_availableListeningModes;
}

- (void)setAvailableListeningModes:(id)a3
{
}

- (NSString)currentListeningMode
{
  return self->_currentListeningMode;
}

- (void)setCurrentListeningMode:(id)a3
{
}

- (NSString)category
{
  return self->_category;
}

- (void)setCategory:(id)a3
{
}

- (int)originIdentifier
{
  return self->_originIdentifier;
}

- (NSData)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_currentListeningMode, 0);
  objc_storeStrong((id *)&self->_category, 0);

  objc_storeStrong((id *)&self->_availableListeningModes, 0);
}

@end