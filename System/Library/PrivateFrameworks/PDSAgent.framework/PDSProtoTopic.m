@interface PDSProtoTopic
+ (Class)appInfoType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)appInfos;
- (NSString)name;
- (NSString)qualifier;
- (id)appInfoAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)appInfosCount;
- (unint64_t)hash;
- (void)addAppInfo:(id)a3;
- (void)clearAppInfos;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAppInfos:(id)a3;
- (void)setName:(id)a3;
- (void)setQualifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PDSProtoTopic

- (void)clearAppInfos
{
}

- (void)addAppInfo:(id)a3
{
  id v4 = a3;
  appInfos = self->_appInfos;
  id v8 = v4;
  if (!appInfos)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_appInfos;
    self->_appInfos = v6;

    id v4 = v8;
    appInfos = self->_appInfos;
  }
  [(NSMutableArray *)appInfos addObject:v4];
}

- (unint64_t)appInfosCount
{
  return [(NSMutableArray *)self->_appInfos count];
}

- (id)appInfoAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_appInfos objectAtIndex:a3];
}

+ (Class)appInfoType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PDSProtoTopic;
  id v4 = [(PDSProtoTopic *)&v8 description];
  v5 = [(PDSProtoTopic *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  name = self->_name;
  if (name) {
    [v3 setObject:name forKey:@"name"];
  }
  qualifier = self->_qualifier;
  if (qualifier) {
    [v4 setObject:qualifier forKey:@"qualifier"];
  }
  if ([(NSMutableArray *)self->_appInfos count])
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_appInfos, "count"));
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    objc_super v8 = self->_appInfos;
    uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "dictionaryRepresentation", (void)v15);
          [v7 addObject:v13];
        }
        uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v10);
    }

    [v4 setObject:v7 forKey:@"app_info"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return PDSProtoTopicReadFrom((char *)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!self->_name) {
    -[PDSProtoTopic writeTo:]();
  }
  v5 = v4;
  PBDataWriterWriteStringField();
  if (!self->_qualifier) {
    -[PDSProtoTopic writeTo:]();
  }
  PBDataWriterWriteStringField();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v6 = self->_appInfos;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  [v8 setName:self->_name];
  [v8 setQualifier:self->_qualifier];
  if ([(PDSProtoTopic *)self appInfosCount])
  {
    [v8 clearAppInfos];
    unint64_t v4 = [(PDSProtoTopic *)self appInfosCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(PDSProtoTopic *)self appInfoAtIndex:i];
        [v8 addAppInfo:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_name copyWithZone:a3];
  uint64_t v7 = (void *)v5[2];
  v5[2] = v6;

  uint64_t v8 = [(NSString *)self->_qualifier copyWithZone:a3];
  uint64_t v9 = (void *)v5[3];
  v5[3] = v8;

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v10 = self->_appInfos;
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
        long long v15 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v14), "copyWithZone:", a3, (void)v17);
        [v5 addAppInfo:v15];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((name = self->_name, !((unint64_t)name | v4[2])) || -[NSString isEqual:](name, "isEqual:"))
    && ((qualifier = self->_qualifier, !((unint64_t)qualifier | v4[3]))
     || -[NSString isEqual:](qualifier, "isEqual:")))
  {
    appInfos = self->_appInfos;
    if ((unint64_t)appInfos | v4[1]) {
      char v8 = -[NSMutableArray isEqual:](appInfos, "isEqual:");
    }
    else {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_name hash];
  NSUInteger v4 = [(NSString *)self->_qualifier hash] ^ v3;
  return v4 ^ [(NSMutableArray *)self->_appInfos hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (*((void *)v4 + 2)) {
    -[PDSProtoTopic setName:](self, "setName:");
  }
  if (*((void *)v4 + 3)) {
    -[PDSProtoTopic setQualifier:](self, "setQualifier:");
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
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
        -[PDSProtoTopic addAppInfo:](self, "addAppInfo:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)qualifier
{
  return self->_qualifier;
}

- (void)setQualifier:(id)a3
{
}

- (NSMutableArray)appInfos
{
  return self->_appInfos;
}

- (void)setAppInfos:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_qualifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_appInfos, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[PDSProtoTopic writeTo:]", "PDSProtoTopic.m", 137, "nil != self->_name");
}

- (void)writeTo:.cold.2()
{
  __assert_rtn("-[PDSProtoTopic writeTo:]", "PDSProtoTopic.m", 142, "nil != self->_qualifier");
}

@end