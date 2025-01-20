@interface NBPBBackupListResponse
+ (Class)backupsType;
- (BOOL)hasError;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)error;
- (NSMutableArray)backups;
- (id)backupsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)backupsCount;
- (unint64_t)hash;
- (void)addBackups:(id)a3;
- (void)clearBackups;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBackups:(id)a3;
- (void)setError:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NBPBBackupListResponse

- (void)clearBackups
{
}

- (void)addBackups:(id)a3
{
  id v4 = a3;
  backups = self->_backups;
  id v8 = v4;
  if (!backups)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_backups;
    self->_backups = v6;

    id v4 = v8;
    backups = self->_backups;
  }
  [(NSMutableArray *)backups addObject:v4];
}

- (unint64_t)backupsCount
{
  return (unint64_t)[(NSMutableArray *)self->_backups count];
}

- (id)backupsAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_backups objectAtIndex:a3];
}

+ (Class)backupsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasError
{
  return self->_error != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)NBPBBackupListResponse;
  v3 = [(NBPBBackupListResponse *)&v7 description];
  id v4 = [(NBPBBackupListResponse *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  if ([(NSMutableArray *)self->_backups count])
  {
    id v4 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_backups, "count"));
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v5 = self->_backups;
    id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "dictionaryRepresentation", (void)v13);
          [v4 addObject:v10];
        }
        id v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKey:@"backups"];
  }
  error = self->_error;
  if (error) {
    [v3 setObject:error forKey:@"error"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10001D60C(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_backups;
  id v6 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      v9 = 0;
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

  if (self->_error) {
    PBDataWriterWriteDataField();
  }
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  if ([(NBPBBackupListResponse *)self backupsCount])
  {
    [v8 clearBackups];
    unint64_t v4 = [(NBPBBackupListResponse *)self backupsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        id v7 = [(NBPBBackupListResponse *)self backupsAtIndex:i];
        [v8 addBackups:v7];
      }
    }
  }
  if (self->_error) {
    objc_msgSend(v8, "setError:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = self->_backups;
  id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      long long v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * (void)v10), "copyWithZone:", a3, (void)v15);
        [v5 addBackups:v11];

        long long v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  id v12 = [(NSData *)self->_error copyWithZone:a3];
  long long v13 = (void *)v5[2];
  v5[2] = v12;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((backups = self->_backups, !((unint64_t)backups | v4[1]))
     || -[NSMutableArray isEqual:](backups, "isEqual:")))
  {
    error = self->_error;
    if ((unint64_t)error | v4[2]) {
      unsigned __int8 v7 = -[NSData isEqual:](error, "isEqual:");
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
  unint64_t v3 = (unint64_t)[(NSMutableArray *)self->_backups hash];
  return (unint64_t)[(NSData *)self->_error hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = (id *)a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = v4[1];
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[NBPBBackupListResponse addBackups:](self, "addBackups:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (v4[2]) {
    -[NBPBBackupListResponse setError:](self, "setError:");
  }
}

- (NSMutableArray)backups
{
  return self->_backups;
}

- (void)setBackups:(id)a3
{
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

  objc_storeStrong((id *)&self->_backups, 0);
}

@end