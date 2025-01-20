@interface SIRINLUINTERNALNluRequestRule
+ (Class)turnInputRulesType;
- (BOOL)hasDeviceType;
- (BOOL)hasIdA;
- (BOOL)hasLocaleId;
- (BOOL)hasUserInterfaceIdiom;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)turnInputRules;
- (NSString)deviceType;
- (NSString)idA;
- (NSString)localeId;
- (NSString)userInterfaceIdiom;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)turnInputRulesAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)turnInputRulesCount;
- (void)addTurnInputRules:(id)a3;
- (void)clearTurnInputRules;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDeviceType:(id)a3;
- (void)setIdA:(id)a3;
- (void)setLocaleId:(id)a3;
- (void)setTurnInputRules:(id)a3;
- (void)setUserInterfaceIdiom:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUINTERNALNluRequestRule

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInterfaceIdiom, 0);
  objc_storeStrong((id *)&self->_turnInputRules, 0);
  objc_storeStrong((id *)&self->_localeId, 0);
  objc_storeStrong((id *)&self->_idA, 0);
  objc_storeStrong((id *)&self->_deviceType, 0);
}

- (void)setTurnInputRules:(id)a3
{
}

- (NSMutableArray)turnInputRules
{
  return self->_turnInputRules;
}

- (void)setUserInterfaceIdiom:(id)a3
{
}

- (NSString)userInterfaceIdiom
{
  return self->_userInterfaceIdiom;
}

- (void)setDeviceType:(id)a3
{
}

- (NSString)deviceType
{
  return self->_deviceType;
}

- (void)setLocaleId:(id)a3
{
}

- (NSString)localeId
{
  return self->_localeId;
}

- (void)setIdA:(id)a3
{
}

- (NSString)idA
{
  return self->_idA;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 2)) {
    -[SIRINLUINTERNALNluRequestRule setIdA:](self, "setIdA:");
  }
  if (*((void *)v4 + 3)) {
    -[SIRINLUINTERNALNluRequestRule setLocaleId:](self, "setLocaleId:");
  }
  if (*((void *)v4 + 1)) {
    -[SIRINLUINTERNALNluRequestRule setDeviceType:](self, "setDeviceType:");
  }
  if (*((void *)v4 + 5)) {
    -[SIRINLUINTERNALNluRequestRule setUserInterfaceIdiom:](self, "setUserInterfaceIdiom:");
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
        -[SIRINLUINTERNALNluRequestRule addTurnInputRules:](self, "addTurnInputRules:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_idA hash];
  NSUInteger v4 = [(NSString *)self->_localeId hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_deviceType hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_userInterfaceIdiom hash];
  return v6 ^ [(NSMutableArray *)self->_turnInputRules hash];
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((idA = self->_idA, !((unint64_t)idA | v4[2])) || -[NSString isEqual:](idA, "isEqual:"))
    && ((localeId = self->_localeId, !((unint64_t)localeId | v4[3]))
     || -[NSString isEqual:](localeId, "isEqual:"))
    && ((deviceType = self->_deviceType, !((unint64_t)deviceType | v4[1]))
     || -[NSString isEqual:](deviceType, "isEqual:"))
    && ((userInterfaceIdiom = self->_userInterfaceIdiom, !((unint64_t)userInterfaceIdiom | v4[5]))
     || -[NSString isEqual:](userInterfaceIdiom, "isEqual:")))
  {
    turnInputRules = self->_turnInputRules;
    if ((unint64_t)turnInputRules | v4[4]) {
      char v10 = -[NSMutableArray isEqual:](turnInputRules, "isEqual:");
    }
    else {
      char v10 = 1;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  NSUInteger v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_idA copyWithZone:a3];
  uint64_t v7 = (void *)v5[2];
  v5[2] = v6;

  uint64_t v8 = [(NSString *)self->_localeId copyWithZone:a3];
  v9 = (void *)v5[3];
  v5[3] = v8;

  uint64_t v10 = [(NSString *)self->_deviceType copyWithZone:a3];
  long long v11 = (void *)v5[1];
  v5[1] = v10;

  uint64_t v12 = [(NSString *)self->_userInterfaceIdiom copyWithZone:a3];
  long long v13 = (void *)v5[5];
  v5[5] = v12;

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v14 = self->_turnInputRules;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v22;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v22 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * v18), "copyWithZone:", a3, (void)v21);
        [v5 addTurnInputRules:v19];

        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v16);
  }

  return v5;
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  if (self->_idA) {
    objc_msgSend(v8, "setIdA:");
  }
  if (self->_localeId) {
    objc_msgSend(v8, "setLocaleId:");
  }
  if (self->_deviceType) {
    objc_msgSend(v8, "setDeviceType:");
  }
  if (self->_userInterfaceIdiom) {
    objc_msgSend(v8, "setUserInterfaceIdiom:");
  }
  if ([(SIRINLUINTERNALNluRequestRule *)self turnInputRulesCount])
  {
    [v8 clearTurnInputRules];
    unint64_t v4 = [(SIRINLUINTERNALNluRequestRule *)self turnInputRulesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(SIRINLUINTERNALNluRequestRule *)self turnInputRulesAtIndex:i];
        [v8 addTurnInputRules:v7];
      }
    }
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_idA) {
    PBDataWriterWriteStringField();
  }
  if (self->_localeId) {
    PBDataWriterWriteStringField();
  }
  if (self->_deviceType) {
    PBDataWriterWriteStringField();
  }
  if (self->_userInterfaceIdiom) {
    PBDataWriterWriteStringField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  unint64_t v5 = self->_turnInputRules;
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
  return SIRINLUINTERNALNluRequestRuleReadFrom((char *)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  idA = self->_idA;
  if (idA) {
    [v3 setObject:idA forKey:@"id_a"];
  }
  localeId = self->_localeId;
  if (localeId) {
    [v4 setObject:localeId forKey:@"locale_id"];
  }
  deviceType = self->_deviceType;
  if (deviceType) {
    [v4 setObject:deviceType forKey:@"device_type"];
  }
  userInterfaceIdiom = self->_userInterfaceIdiom;
  if (userInterfaceIdiom) {
    [v4 setObject:userInterfaceIdiom forKey:@"user_interface_idiom"];
  }
  if ([(NSMutableArray *)self->_turnInputRules count])
  {
    uint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_turnInputRules, "count"));
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v10 = self->_turnInputRules;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "dictionaryRepresentation", (void)v17);
          [v9 addObject:v15];
        }
        uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v12);
    }

    [v4 setObject:v9 forKey:@"turn_input_rules"];
  }
  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUINTERNALNluRequestRule;
  id v4 = [(SIRINLUINTERNALNluRequestRule *)&v8 description];
  unint64_t v5 = [(SIRINLUINTERNALNluRequestRule *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)turnInputRulesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_turnInputRules objectAtIndex:a3];
}

- (unint64_t)turnInputRulesCount
{
  return [(NSMutableArray *)self->_turnInputRules count];
}

- (void)addTurnInputRules:(id)a3
{
  id v4 = a3;
  turnInputRules = self->_turnInputRules;
  id v8 = v4;
  if (!turnInputRules)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_turnInputRules;
    self->_turnInputRules = v6;

    id v4 = v8;
    turnInputRules = self->_turnInputRules;
  }
  [(NSMutableArray *)turnInputRules addObject:v4];
}

- (void)clearTurnInputRules
{
}

- (BOOL)hasUserInterfaceIdiom
{
  return self->_userInterfaceIdiom != 0;
}

- (BOOL)hasDeviceType
{
  return self->_deviceType != 0;
}

- (BOOL)hasLocaleId
{
  return self->_localeId != 0;
}

- (BOOL)hasIdA
{
  return self->_idA != 0;
}

+ (Class)turnInputRulesType
{
  return (Class)objc_opt_class();
}

@end