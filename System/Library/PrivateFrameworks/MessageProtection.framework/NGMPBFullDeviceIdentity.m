@interface NGMPBFullDeviceIdentity
+ (Class)prekeysType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NGMPBP256Key)signingKey;
- (NSMutableArray)prekeys;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)prekeysAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)prekeysCount;
- (void)addPrekeys:(id)a3;
- (void)clearPrekeys;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setPrekeys:(id)a3;
- (void)setSigningKey:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NGMPBFullDeviceIdentity

- (void)clearPrekeys
{
}

- (void)addPrekeys:(id)a3
{
  id v4 = a3;
  prekeys = self->_prekeys;
  id v8 = v4;
  if (!prekeys)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_prekeys;
    self->_prekeys = v6;

    id v4 = v8;
    prekeys = self->_prekeys;
  }
  [(NSMutableArray *)prekeys addObject:v4];
}

- (unint64_t)prekeysCount
{
  return [(NSMutableArray *)self->_prekeys count];
}

- (id)prekeysAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_prekeys objectAtIndex:a3];
}

+ (Class)prekeysType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NGMPBFullDeviceIdentity;
  id v4 = [(NGMPBFullDeviceIdentity *)&v8 description];
  v5 = [(NGMPBFullDeviceIdentity *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  signingKey = self->_signingKey;
  if (signingKey)
  {
    v5 = [(NGMPBP256Key *)signingKey dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"signingKey"];
  }
  if ([(NSMutableArray *)self->_prekeys count])
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_prekeys, "count"));
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v7 = self->_prekeys;
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
          v12 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "dictionaryRepresentation", (void)v14);
          [v6 addObject:v12];
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKey:@"prekeys"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NGMPBFullDeviceIdentityReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!self->_signingKey) {
    -[NGMPBFullDeviceIdentity writeTo:]();
  }
  v5 = v4;
  PBDataWriterWriteSubmessage();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v6 = self->_prekeys;
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
  [v8 setSigningKey:self->_signingKey];
  if ([(NGMPBFullDeviceIdentity *)self prekeysCount])
  {
    [v8 clearPrekeys];
    unint64_t v4 = [(NGMPBFullDeviceIdentity *)self prekeysCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(NGMPBFullDeviceIdentity *)self prekeysAtIndex:i];
        [v8 addPrekeys:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NGMPBP256Key *)self->_signingKey copyWithZone:a3];
  uint64_t v7 = (void *)v5[2];
  v5[2] = v6;

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = self->_prekeys;
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
        [v5 addPrekeys:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((signingKey = self->_signingKey, !((unint64_t)signingKey | v4[2]))
     || -[NGMPBP256Key isEqual:](signingKey, "isEqual:")))
  {
    prekeys = self->_prekeys;
    if ((unint64_t)prekeys | v4[1]) {
      char v7 = -[NSMutableArray isEqual:](prekeys, "isEqual:");
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

- (unint64_t)hash
{
  unint64_t v3 = [(NGMPBP256Key *)self->_signingKey hash];
  return [(NSMutableArray *)self->_prekeys hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  signingKey = self->_signingKey;
  uint64_t v6 = *((void *)v4 + 2);
  if (signingKey)
  {
    if (v6) {
      -[NGMPBP256Key mergeFrom:](signingKey, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[NGMPBFullDeviceIdentity setSigningKey:](self, "setSigningKey:");
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = *((id *)v4 + 1);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        -[NGMPBFullDeviceIdentity addPrekeys:](self, "addPrekeys:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (NGMPBP256Key)signingKey
{
  return self->_signingKey;
}

- (void)setSigningKey:(id)a3
{
}

- (NSMutableArray)prekeys
{
  return self->_prekeys;
}

- (void)setPrekeys:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signingKey, 0);
  objc_storeStrong((id *)&self->_prekeys, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[NGMPBFullDeviceIdentity writeTo:]", "NGMPBFullDeviceIdentity.m", 139, "self->_signingKey != nil");
}

@end