@interface OTCurrentSecureElementIdentities
+ (Class)trustedPeerSecureElementIdentitiesType;
- (BOOL)hasLocalPeerIdentity;
- (BOOL)hasPendingLocalPeerIdentity;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)trustedPeerSecureElementIdentities;
- (OTSecureElementPeerIdentity)localPeerIdentity;
- (OTSecureElementPeerIdentity)pendingLocalPeerIdentity;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)trustedPeerSecureElementIdentitiesAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)trustedPeerSecureElementIdentitiesCount;
- (void)addTrustedPeerSecureElementIdentities:(id)a3;
- (void)clearTrustedPeerSecureElementIdentities;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setLocalPeerIdentity:(id)a3;
- (void)setPendingLocalPeerIdentity:(id)a3;
- (void)setTrustedPeerSecureElementIdentities:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation OTCurrentSecureElementIdentities

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trustedPeerSecureElementIdentities, 0);
  objc_storeStrong((id *)&self->_pendingLocalPeerIdentity, 0);
  objc_storeStrong((id *)&self->_localPeerIdentity, 0);
}

- (void)setPendingLocalPeerIdentity:(id)a3
{
}

- (OTSecureElementPeerIdentity)pendingLocalPeerIdentity
{
  return self->_pendingLocalPeerIdentity;
}

- (void)setTrustedPeerSecureElementIdentities:(id)a3
{
}

- (NSMutableArray)trustedPeerSecureElementIdentities
{
  return self->_trustedPeerSecureElementIdentities;
}

- (void)setLocalPeerIdentity:(id)a3
{
}

- (OTSecureElementPeerIdentity)localPeerIdentity
{
  return self->_localPeerIdentity;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  localPeerIdentity = self->_localPeerIdentity;
  uint64_t v6 = *((void *)v4 + 1);
  if (localPeerIdentity)
  {
    if (v6) {
      -[OTSecureElementPeerIdentity mergeFrom:](localPeerIdentity, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[OTCurrentSecureElementIdentities setLocalPeerIdentity:](self, "setLocalPeerIdentity:");
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = *((id *)v4 + 3);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
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
        -[OTCurrentSecureElementIdentities addTrustedPeerSecureElementIdentities:](self, "addTrustedPeerSecureElementIdentities:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  pendingLocalPeerIdentity = self->_pendingLocalPeerIdentity;
  uint64_t v13 = *((void *)v4 + 2);
  if (pendingLocalPeerIdentity)
  {
    if (v13) {
      -[OTSecureElementPeerIdentity mergeFrom:](pendingLocalPeerIdentity, "mergeFrom:");
    }
  }
  else if (v13)
  {
    -[OTCurrentSecureElementIdentities setPendingLocalPeerIdentity:](self, "setPendingLocalPeerIdentity:");
  }
}

- (unint64_t)hash
{
  unint64_t v3 = [(OTSecureElementPeerIdentity *)self->_localPeerIdentity hash];
  uint64_t v4 = [(NSMutableArray *)self->_trustedPeerSecureElementIdentities hash] ^ v3;
  return v4 ^ [(OTSecureElementPeerIdentity *)self->_pendingLocalPeerIdentity hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((localPeerIdentity = self->_localPeerIdentity, !((unint64_t)localPeerIdentity | v4[1]))
     || -[OTSecureElementPeerIdentity isEqual:](localPeerIdentity, "isEqual:"))
    && ((trustedPeerSecureElementIdentities = self->_trustedPeerSecureElementIdentities,
         !((unint64_t)trustedPeerSecureElementIdentities | v4[3]))
     || -[NSMutableArray isEqual:](trustedPeerSecureElementIdentities, "isEqual:")))
  {
    pendingLocalPeerIdentity = self->_pendingLocalPeerIdentity;
    if ((unint64_t)pendingLocalPeerIdentity | v4[2]) {
      char v8 = -[OTSecureElementPeerIdentity isEqual:](pendingLocalPeerIdentity, "isEqual:");
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

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(OTSecureElementPeerIdentity *)self->_localPeerIdentity copyWithZone:a3];
  id v7 = (void *)v5[1];
  v5[1] = v6;

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  char v8 = self->_trustedPeerSecureElementIdentities;
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
        uint64_t v13 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v12), "copyWithZone:", a3, (void)v17);
        [v5 addTrustedPeerSecureElementIdentities:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }

  id v14 = [(OTSecureElementPeerIdentity *)self->_pendingLocalPeerIdentity copyWithZone:a3];
  long long v15 = (void *)v5[2];
  v5[2] = v14;

  return v5;
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  if (self->_localPeerIdentity) {
    objc_msgSend(v8, "setLocalPeerIdentity:");
  }
  if ([(OTCurrentSecureElementIdentities *)self trustedPeerSecureElementIdentitiesCount])
  {
    [v8 clearTrustedPeerSecureElementIdentities];
    unint64_t v4 = [(OTCurrentSecureElementIdentities *)self trustedPeerSecureElementIdentitiesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        id v7 = [(OTCurrentSecureElementIdentities *)self trustedPeerSecureElementIdentitiesAtIndex:i];
        [v8 addTrustedPeerSecureElementIdentities:v7];
      }
    }
  }
  if (self->_pendingLocalPeerIdentity) {
    objc_msgSend(v8, "setPendingLocalPeerIdentity:");
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_localPeerIdentity) {
    PBDataWriterWriteSubmessage();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  unint64_t v5 = self->_trustedPeerSecureElementIdentities;
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

  if (self->_pendingLocalPeerIdentity) {
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return OTCurrentSecureElementIdentitiesReadFrom((char *)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  localPeerIdentity = self->_localPeerIdentity;
  if (localPeerIdentity)
  {
    unint64_t v5 = [(OTSecureElementPeerIdentity *)localPeerIdentity dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"localPeerIdentity"];
  }
  if ([(NSMutableArray *)self->_trustedPeerSecureElementIdentities count])
  {
    uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_trustedPeerSecureElementIdentities, "count"));
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v7 = self->_trustedPeerSecureElementIdentities;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          long long v12 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "dictionaryRepresentation", (void)v16);
          [v6 addObject:v12];
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKey:@"trustedPeerSecureElementIdentities"];
  }
  pendingLocalPeerIdentity = self->_pendingLocalPeerIdentity;
  if (pendingLocalPeerIdentity)
  {
    id v14 = [(OTSecureElementPeerIdentity *)pendingLocalPeerIdentity dictionaryRepresentation];
    [v3 setObject:v14 forKey:@"pendingLocalPeerIdentity"];
  }
  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)OTCurrentSecureElementIdentities;
  id v4 = [(OTCurrentSecureElementIdentities *)&v8 description];
  unint64_t v5 = [(OTCurrentSecureElementIdentities *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasPendingLocalPeerIdentity
{
  return self->_pendingLocalPeerIdentity != 0;
}

- (id)trustedPeerSecureElementIdentitiesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_trustedPeerSecureElementIdentities objectAtIndex:a3];
}

- (unint64_t)trustedPeerSecureElementIdentitiesCount
{
  return [(NSMutableArray *)self->_trustedPeerSecureElementIdentities count];
}

- (void)addTrustedPeerSecureElementIdentities:(id)a3
{
  id v4 = a3;
  trustedPeerSecureElementIdentities = self->_trustedPeerSecureElementIdentities;
  id v8 = v4;
  if (!trustedPeerSecureElementIdentities)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_trustedPeerSecureElementIdentities;
    self->_trustedPeerSecureElementIdentities = v6;

    id v4 = v8;
    trustedPeerSecureElementIdentities = self->_trustedPeerSecureElementIdentities;
  }
  [(NSMutableArray *)trustedPeerSecureElementIdentities addObject:v4];
}

- (void)clearTrustedPeerSecureElementIdentities
{
}

- (BOOL)hasLocalPeerIdentity
{
  return self->_localPeerIdentity != 0;
}

+ (Class)trustedPeerSecureElementIdentitiesType
{
  return (Class)objc_opt_class();
}

@end