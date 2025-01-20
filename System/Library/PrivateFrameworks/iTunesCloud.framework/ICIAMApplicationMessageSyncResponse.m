@interface ICIAMApplicationMessageSyncResponse
+ (Class)syncCommandsType;
- (BOOL)hasBundleID;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)syncCommands;
- (NSString)bundleID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)syncCommandsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)syncCommandsCount;
- (void)addSyncCommands:(id)a3;
- (void)clearSyncCommands;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setSyncCommands:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ICIAMApplicationMessageSyncResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncCommands, 0);

  objc_storeStrong((id *)&self->_bundleID, 0);
}

- (void)setSyncCommands:(id)a3
{
}

- (NSMutableArray)syncCommands
{
  return self->_syncCommands;
}

- (void)setBundleID:(id)a3
{
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 1)) {
    -[ICIAMApplicationMessageSyncResponse setBundleID:](self, "setBundleID:");
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = *((id *)v4 + 2);
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
        -[ICIAMApplicationMessageSyncResponse addSyncCommands:](self, "addSyncCommands:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_bundleID hash];
  return [(NSMutableArray *)self->_syncCommands hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((bundleID = self->_bundleID, !((unint64_t)bundleID | v4[1]))
     || -[NSString isEqual:](bundleID, "isEqual:")))
  {
    syncCommands = self->_syncCommands;
    if ((unint64_t)syncCommands | v4[2]) {
      char v7 = -[NSMutableArray isEqual:](syncCommands, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_bundleID copyWithZone:a3];
  char v7 = (void *)v5[1];
  v5[1] = v6;

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v8 = self->_syncCommands;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v12), "copyWithZone:", a3, (void)v15);
        [v5 addSyncCommands:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return v5;
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  if (self->_bundleID) {
    objc_msgSend(v8, "setBundleID:");
  }
  if ([(ICIAMApplicationMessageSyncResponse *)self syncCommandsCount])
  {
    [v8 clearSyncCommands];
    unint64_t v4 = [(ICIAMApplicationMessageSyncResponse *)self syncCommandsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        char v7 = [(ICIAMApplicationMessageSyncResponse *)self syncCommandsAtIndex:i];
        [v8 addSyncCommands:v7];
      }
    }
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_bundleID) {
    PBDataWriterWriteStringField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  unint64_t v5 = self->_syncCommands;
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
  return ICIAMApplicationMessageSyncResponseReadFrom(self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  bundleID = self->_bundleID;
  if (bundleID) {
    [v3 setObject:bundleID forKey:@"bundleID"];
  }
  if ([(NSMutableArray *)self->_syncCommands count])
  {
    uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_syncCommands, "count"));
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v7 = self->_syncCommands;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          long long v12 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "dictionaryRepresentation", (void)v14);
          [v6 addObject:v12];
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }

    [v4 setObject:v6 forKey:@"syncCommands"];
  }

  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ICIAMApplicationMessageSyncResponse;
  id v4 = [(ICIAMApplicationMessageSyncResponse *)&v8 description];
  unint64_t v5 = [(ICIAMApplicationMessageSyncResponse *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)syncCommandsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_syncCommands objectAtIndex:a3];
}

- (unint64_t)syncCommandsCount
{
  return [(NSMutableArray *)self->_syncCommands count];
}

- (void)addSyncCommands:(id)a3
{
  id v4 = a3;
  syncCommands = self->_syncCommands;
  id v8 = v4;
  if (!syncCommands)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_syncCommands;
    self->_syncCommands = v6;

    id v4 = v8;
    syncCommands = self->_syncCommands;
  }
  [(NSMutableArray *)syncCommands addObject:v4];
}

- (void)clearSyncCommands
{
}

- (BOOL)hasBundleID
{
  return self->_bundleID != 0;
}

+ (Class)syncCommandsType
{
  return (Class)objc_opt_class();
}

@end