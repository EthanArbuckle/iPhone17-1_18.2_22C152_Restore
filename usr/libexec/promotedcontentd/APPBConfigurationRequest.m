@interface APPBConfigurationRequest
+ (Class)currentConfigurationType;
+ (id)options;
- (BOOL)hasIAdID;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)iAdID;
- (NSMutableArray)currentConfigurations;
- (id)copyWithZone:(_NSZone *)a3;
- (id)currentConfigurationAtIndex:(unint64_t)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)currentConfigurationsCount;
- (unint64_t)hash;
- (void)addCurrentConfiguration:(id)a3;
- (void)clearCurrentConfigurations;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCurrentConfigurations:(id)a3;
- (void)setIAdID:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation APPBConfigurationRequest

+ (id)options
{
  if (qword_1002897E8 != -1) {
    dispatch_once(&qword_1002897E8, &stru_100234F70);
  }
  v2 = (void *)qword_1002897E0;

  return v2;
}

- (void)clearCurrentConfigurations
{
}

- (void)addCurrentConfiguration:(id)a3
{
  id v4 = a3;
  currentConfigurations = self->_currentConfigurations;
  id v8 = v4;
  if (!currentConfigurations)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_currentConfigurations;
    self->_currentConfigurations = v6;

    id v4 = v8;
    currentConfigurations = self->_currentConfigurations;
  }
  [(NSMutableArray *)currentConfigurations addObject:v4];
}

- (unint64_t)currentConfigurationsCount
{
  return (unint64_t)[(NSMutableArray *)self->_currentConfigurations count];
}

- (id)currentConfigurationAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_currentConfigurations objectAtIndex:a3];
}

+ (Class)currentConfigurationType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasIAdID
{
  return self->_iAdID != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)APPBConfigurationRequest;
  v3 = [(APPBConfigurationRequest *)&v7 description];
  id v4 = [(APPBConfigurationRequest *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  if ([(NSMutableArray *)self->_currentConfigurations count])
  {
    id v4 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_currentConfigurations, "count")];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v5 = self->_currentConfigurations;
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
          v10 = [*(id *)(*((void *)&v13 + 1) + 8 * i) dictionaryRepresentation:v13];
          [v4 addObject:v10];
        }
        id v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKey:@"currentConfiguration"];
  }
  iAdID = self->_iAdID;
  if (iAdID) {
    [v3 setObject:iAdID forKey:@"iAdID"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return APPBConfigurationRequestReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_currentConfigurations;
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

  if (self->_iAdID) {
    PBDataWriterWriteDataField();
  }
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  if ([(APPBConfigurationRequest *)self currentConfigurationsCount])
  {
    [v8 clearCurrentConfigurations];
    unint64_t v4 = [(APPBConfigurationRequest *)self currentConfigurationsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        id v7 = [(APPBConfigurationRequest *)self currentConfigurationAtIndex:i];
        [v8 addCurrentConfiguration:v7];
      }
    }
  }
  if (self->_iAdID) {
    [v8 setIAdID:];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = [[objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3) init];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = self->_currentConfigurations;
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
        id v11 = [[*(id *)(*((void *)&v15 + 1) + 8 * (void)v10) copyWithZone:a3];
        [v5 addCurrentConfiguration:v11];

        long long v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  id v12 = [(NSData *)self->_iAdID copyWithZone:a3];
  long long v13 = (void *)v5[2];
  v5[2] = v12;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((currentConfigurations = self->_currentConfigurations, !((unint64_t)currentConfigurations | v4[1]))
     || -[NSMutableArray isEqual:](currentConfigurations, "isEqual:")))
  {
    iAdID = self->_iAdID;
    if ((unint64_t)iAdID | v4[2]) {
      unsigned __int8 v7 = -[NSData isEqual:](iAdID, "isEqual:");
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
  unint64_t v3 = (unint64_t)[(NSMutableArray *)self->_currentConfigurations hash];
  return (unint64_t)[(NSData *)self->_iAdID hash] ^ v3;
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
        -[APPBConfigurationRequest addCurrentConfiguration:](self, "addCurrentConfiguration:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (v4[2]) {
    -[APPBConfigurationRequest setIAdID:](self, "setIAdID:");
  }
}

- (NSMutableArray)currentConfigurations
{
  return self->_currentConfigurations;
}

- (void)setCurrentConfigurations:(id)a3
{
}

- (NSData)iAdID
{
  return self->_iAdID;
}

- (void)setIAdID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iAdID, 0);

  objc_storeStrong((id *)&self->_currentConfigurations, 0);
}

@end