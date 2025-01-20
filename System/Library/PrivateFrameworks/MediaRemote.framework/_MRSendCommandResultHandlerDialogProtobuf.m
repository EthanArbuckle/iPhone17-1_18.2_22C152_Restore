@interface _MRSendCommandResultHandlerDialogProtobuf
+ (Class)actionsType;
- (BOOL)hasLocalizedMessage;
- (BOOL)hasLocalizedTitle;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)actions;
- (NSString)localizedMessage;
- (NSString)localizedTitle;
- (id)actionsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)actionsCount;
- (unint64_t)hash;
- (void)addActions:(id)a3;
- (void)clearActions;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActions:(id)a3;
- (void)setLocalizedMessage:(id)a3;
- (void)setLocalizedTitle:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRSendCommandResultHandlerDialogProtobuf

- (void)clearActions
{
}

- (void)addActions:(id)a3
{
  id v4 = a3;
  actions = self->_actions;
  id v8 = v4;
  if (!actions)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_actions;
    self->_actions = v6;

    id v4 = v8;
    actions = self->_actions;
  }
  [(NSMutableArray *)actions addObject:v4];
}

- (unint64_t)actionsCount
{
  return [(NSMutableArray *)self->_actions count];
}

- (id)actionsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_actions objectAtIndex:a3];
}

+ (Class)actionsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasLocalizedTitle
{
  return self->_localizedTitle != 0;
}

- (BOOL)hasLocalizedMessage
{
  return self->_localizedMessage != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRSendCommandResultHandlerDialogProtobuf;
  id v4 = [(_MRSendCommandResultHandlerDialogProtobuf *)&v8 description];
  v5 = [(_MRSendCommandResultHandlerDialogProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSMutableArray *)self->_actions count])
  {
    id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_actions, "count"));
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v5 = self->_actions;
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
          v10 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "dictionaryRepresentation", (void)v14);
          [v4 addObject:v10];
        }
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKey:@"actions"];
  }
  localizedTitle = self->_localizedTitle;
  if (localizedTitle) {
    [v3 setObject:localizedTitle forKey:@"localizedTitle"];
  }
  localizedMessage = self->_localizedMessage;
  if (localizedMessage) {
    [v3 setObject:localizedMessage forKey:@"localizedMessage"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRSendCommandResultHandlerDialogProtobufReadFrom((char *)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_actions;
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

  if (self->_localizedTitle) {
    PBDataWriterWriteStringField();
  }
  if (self->_localizedMessage) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  id v9 = a3;
  if ([(_MRSendCommandResultHandlerDialogProtobuf *)self actionsCount])
  {
    [v9 clearActions];
    unint64_t v4 = [(_MRSendCommandResultHandlerDialogProtobuf *)self actionsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(_MRSendCommandResultHandlerDialogProtobuf *)self actionsAtIndex:i];
        [v9 addActions:v7];
      }
    }
  }
  if (self->_localizedTitle) {
    objc_msgSend(v9, "setLocalizedTitle:");
  }
  uint64_t v8 = v9;
  if (self->_localizedMessage)
  {
    objc_msgSend(v9, "setLocalizedMessage:");
    uint64_t v8 = v9;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v6 = self->_actions;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v10), "copyWithZone:", a3, (void)v17);
        [v5 addActions:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  uint64_t v12 = [(NSString *)self->_localizedTitle copyWithZone:a3];
  long long v13 = (void *)v5[3];
  v5[3] = v12;

  uint64_t v14 = [(NSString *)self->_localizedMessage copyWithZone:a3];
  uint64_t v15 = (void *)v5[2];
  v5[2] = v14;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((actions = self->_actions, !((unint64_t)actions | v4[1]))
     || -[NSMutableArray isEqual:](actions, "isEqual:"))
    && ((localizedTitle = self->_localizedTitle, !((unint64_t)localizedTitle | v4[3]))
     || -[NSString isEqual:](localizedTitle, "isEqual:")))
  {
    localizedMessage = self->_localizedMessage;
    if ((unint64_t)localizedMessage | v4[2]) {
      char v8 = -[NSString isEqual:](localizedMessage, "isEqual:");
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
  uint64_t v3 = [(NSMutableArray *)self->_actions hash];
  NSUInteger v4 = [(NSString *)self->_localizedTitle hash] ^ v3;
  return v4 ^ [(NSString *)self->_localizedMessage hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  NSUInteger v4 = (id *)a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = v4[1];
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
        -[_MRSendCommandResultHandlerDialogProtobuf addActions:](self, "addActions:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (v4[3]) {
    -[_MRSendCommandResultHandlerDialogProtobuf setLocalizedTitle:](self, "setLocalizedTitle:");
  }
  if (v4[2]) {
    -[_MRSendCommandResultHandlerDialogProtobuf setLocalizedMessage:](self, "setLocalizedMessage:");
  }
}

- (NSMutableArray)actions
{
  return self->_actions;
}

- (void)setActions:(id)a3
{
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (void)setLocalizedTitle:(id)a3
{
}

- (NSString)localizedMessage
{
  return self->_localizedMessage;
}

- (void)setLocalizedMessage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_localizedMessage, 0);

  objc_storeStrong((id *)&self->_actions, 0);
}

@end