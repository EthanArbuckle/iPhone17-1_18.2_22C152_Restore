@interface _MRGroupSessionJoinRequestProtobuf
+ (Class)oobKeysType;
- (BOOL)hasIdentifier;
- (BOOL)hasIdentity;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)oobKeys;
- (NSString)identifier;
- (_MRUserIdentityProtobuf)identity;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)oobKeysAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)oobKeysCount;
- (void)addOobKeys:(id)a3;
- (void)clearOobKeys;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setIdentity:(id)a3;
- (void)setOobKeys:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRGroupSessionJoinRequestProtobuf

- (BOOL)hasIdentity
{
  return self->_identity != 0;
}

- (void)clearOobKeys
{
}

- (void)addOobKeys:(id)a3
{
  id v4 = a3;
  oobKeys = self->_oobKeys;
  id v8 = v4;
  if (!oobKeys)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_oobKeys;
    self->_oobKeys = v6;

    id v4 = v8;
    oobKeys = self->_oobKeys;
  }
  [(NSMutableArray *)oobKeys addObject:v4];
}

- (unint64_t)oobKeysCount
{
  return [(NSMutableArray *)self->_oobKeys count];
}

- (id)oobKeysAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_oobKeys objectAtIndex:a3];
}

+ (Class)oobKeysType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRGroupSessionJoinRequestProtobuf;
  id v4 = [(_MRGroupSessionJoinRequestProtobuf *)&v8 description];
  v5 = [(_MRGroupSessionJoinRequestProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  identity = self->_identity;
  if (identity)
  {
    v5 = [(_MRUserIdentityProtobuf *)identity dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"identity"];
  }
  oobKeys = self->_oobKeys;
  if (oobKeys) {
    [v3 setObject:oobKeys forKey:@"oobKeys"];
  }
  identifier = self->_identifier;
  if (identifier) {
    [v3 setObject:identifier forKey:@"identifier"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRGroupSessionJoinRequestProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_identity) {
    PBDataWriterWriteSubmessage();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_oobKeys;
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

  if (self->_identifier) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  if (self->_identity) {
    objc_msgSend(v8, "setIdentity:");
  }
  if ([(_MRGroupSessionJoinRequestProtobuf *)self oobKeysCount])
  {
    [v8 clearOobKeys];
    unint64_t v4 = [(_MRGroupSessionJoinRequestProtobuf *)self oobKeysCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(_MRGroupSessionJoinRequestProtobuf *)self oobKeysAtIndex:i];
        [v8 addOobKeys:v7];
      }
    }
  }
  if (self->_identifier) {
    objc_msgSend(v8, "setIdentifier:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(_MRUserIdentityProtobuf *)self->_identity copyWithZone:a3];
  uint64_t v7 = (void *)v5[2];
  v5[2] = v6;

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = self->_oobKeys;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v12), "copyWithZone:", a3, (void)v17);
        [v5 addOobKeys:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }

  uint64_t v14 = [(NSString *)self->_identifier copyWithZone:a3];
  uint64_t v15 = (void *)v5[1];
  v5[1] = v14;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((identity = self->_identity, !((unint64_t)identity | v4[2]))
     || -[_MRUserIdentityProtobuf isEqual:](identity, "isEqual:"))
    && ((oobKeys = self->_oobKeys, !((unint64_t)oobKeys | v4[3]))
     || -[NSMutableArray isEqual:](oobKeys, "isEqual:")))
  {
    identifier = self->_identifier;
    if ((unint64_t)identifier | v4[1]) {
      char v8 = -[NSString isEqual:](identifier, "isEqual:");
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
  unint64_t v3 = [(_MRUserIdentityProtobuf *)self->_identity hash];
  uint64_t v4 = [(NSMutableArray *)self->_oobKeys hash] ^ v3;
  return v4 ^ [(NSString *)self->_identifier hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  identity = self->_identity;
  uint64_t v6 = *((void *)v4 + 2);
  if (identity)
  {
    if (v6) {
      -[_MRUserIdentityProtobuf mergeFrom:](identity, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[_MRGroupSessionJoinRequestProtobuf setIdentity:](self, "setIdentity:");
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = *((id *)v4 + 3);
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
        -[_MRGroupSessionJoinRequestProtobuf addOobKeys:](self, "addOobKeys:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }

  if (*((void *)v4 + 1)) {
    -[_MRGroupSessionJoinRequestProtobuf setIdentifier:](self, "setIdentifier:");
  }
}

- (_MRUserIdentityProtobuf)identity
{
  return self->_identity;
}

- (void)setIdentity:(id)a3
{
}

- (NSMutableArray)oobKeys
{
  return self->_oobKeys;
}

- (void)setOobKeys:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_oobKeys, 0);
  objc_storeStrong((id *)&self->_identity, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end