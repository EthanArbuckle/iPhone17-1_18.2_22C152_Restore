@interface _NMRSupportedCommandsProtobuf
+ (Class)supportedCommandType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)supportedCommands;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)supportedCommandAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)supportedCommandsCount;
- (void)addSupportedCommand:(id)a3;
- (void)clearSupportedCommands;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setSupportedCommands:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _NMRSupportedCommandsProtobuf

- (void)clearSupportedCommands
{
}

- (void)addSupportedCommand:(id)a3
{
  id v4 = a3;
  supportedCommands = self->_supportedCommands;
  id v8 = v4;
  if (!supportedCommands)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_supportedCommands;
    self->_supportedCommands = v6;

    id v4 = v8;
    supportedCommands = self->_supportedCommands;
  }
  [(NSMutableArray *)supportedCommands addObject:v4];
}

- (unint64_t)supportedCommandsCount
{
  return (unint64_t)[(NSMutableArray *)self->_supportedCommands count];
}

- (id)supportedCommandAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_supportedCommands objectAtIndex:a3];
}

+ (Class)supportedCommandType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)_NMRSupportedCommandsProtobuf;
  v3 = [(_NMRSupportedCommandsProtobuf *)&v7 description];
  id v4 = [(_NMRSupportedCommandsProtobuf *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  if ([(NSMutableArray *)self->_supportedCommands count])
  {
    id v4 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_supportedCommands, "count")];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    v5 = self->_supportedCommands;
    id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = [*(id *)(*((void *)&v12 + 1) + 8 * i) dictionaryRepresentation:v12];
          [v4 addObject:v10];
        }
        id v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKey:@"supportedCommand"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10002C954(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_supportedCommands;
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
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  if ([(_NMRSupportedCommandsProtobuf *)self supportedCommandsCount])
  {
    [v8 clearSupportedCommands];
    unint64_t v4 = [(_NMRSupportedCommandsProtobuf *)self supportedCommandsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        id v7 = [(_NMRSupportedCommandsProtobuf *)self supportedCommandAtIndex:i];
        [v8 addSupportedCommand:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[objc_opt_class() allocWithZone:a3] init];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = self->_supportedCommands;
  id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      long long v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = [[*(id *)(*((void *)&v13 + 1) + 8 * (void)v10) copyWithZone:a3];
        [v5 addSupportedCommand:v11];

        long long v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    supportedCommands = self->_supportedCommands;
    if ((unint64_t)supportedCommands | v4[1]) {
      unsigned __int8 v6 = -[NSMutableArray isEqual:](supportedCommands, "isEqual:");
    }
    else {
      unsigned __int8 v6 = 1;
    }
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return (unint64_t)[(NSMutableArray *)self->_supportedCommands hash];
}

- (void)mergeFrom:(id)a3
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = *((id *)a3 + 1);
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        -[_NMRSupportedCommandsProtobuf addSupportedCommand:](self, "addSupportedCommand:", *(void *)(*((void *)&v9 + 1) + 8 * (void)v8), (void)v9);
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (NSMutableArray)supportedCommands
{
  return self->_supportedCommands;
}

- (void)setSupportedCommands:(id)a3
{
}

- (void).cxx_destruct
{
}

@end