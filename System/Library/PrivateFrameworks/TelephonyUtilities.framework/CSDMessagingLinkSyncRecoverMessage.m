@interface CSDMessagingLinkSyncRecoverMessage
+ (Class)pseudonymType;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)pseudonyms;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)pseudonymAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)pseudonymsCount;
- (unsigned)version;
- (void)addPseudonym:(id)a3;
- (void)clearPseudonyms;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setPseudonyms:(id)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CSDMessagingLinkSyncRecoverMessage

- (void)setVersion:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasVersion
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)clearPseudonyms
{
}

- (void)addPseudonym:(id)a3
{
  id v4 = a3;
  pseudonyms = self->_pseudonyms;
  id v8 = v4;
  if (!pseudonyms)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_pseudonyms;
    self->_pseudonyms = v6;

    id v4 = v8;
    pseudonyms = self->_pseudonyms;
  }
  [(NSMutableArray *)pseudonyms addObject:v4];
}

- (unint64_t)pseudonymsCount
{
  return (unint64_t)[(NSMutableArray *)self->_pseudonyms count];
}

- (id)pseudonymAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_pseudonyms objectAtIndex:a3];
}

+ (Class)pseudonymType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)CSDMessagingLinkSyncRecoverMessage;
  v3 = [(CSDMessagingLinkSyncRecoverMessage *)&v7 description];
  id v4 = [(CSDMessagingLinkSyncRecoverMessage *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  if (*(unsigned char *)&self->_has)
  {
    id v4 = +[NSNumber numberWithUnsignedInt:self->_version];
    [v3 setObject:v4 forKey:@"version"];
  }
  pseudonyms = self->_pseudonyms;
  if (pseudonyms) {
    [v3 setObject:pseudonyms forKey:@"pseudonym"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10000A9EC((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint32Field();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_pseudonyms;
  v6 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    objc_super v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      objc_super v7 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[4] = self->_version;
    *((unsigned char *)v4 + 20) |= 1u;
  }
  id v9 = v4;
  if ([(CSDMessagingLinkSyncRecoverMessage *)self pseudonymsCount])
  {
    [v9 clearPseudonyms];
    unint64_t v5 = [(CSDMessagingLinkSyncRecoverMessage *)self pseudonymsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(CSDMessagingLinkSyncRecoverMessage *)self pseudonymAtIndex:i];
        [v9 addPseudonym:v8];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v5 + 4) = self->_version;
    *((unsigned char *)v5 + 20) |= 1u;
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  objc_super v7 = self->_pseudonyms;
  id v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      long long v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * (void)v11), "copyWithZone:", a3, (void)v14);
        [v6 addPseudonym:v12];

        long long v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_9;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 20) & 1) == 0 || self->_version != *((_DWORD *)v4 + 4)) {
      goto LABEL_9;
    }
  }
  else if (*((unsigned char *)v4 + 20))
  {
LABEL_9:
    unsigned __int8 v6 = 0;
    goto LABEL_10;
  }
  pseudonyms = self->_pseudonyms;
  if ((unint64_t)pseudonyms | *((void *)v4 + 1)) {
    unsigned __int8 v6 = -[NSMutableArray isEqual:](pseudonyms, "isEqual:");
  }
  else {
    unsigned __int8 v6 = 1;
  }
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v2 = 2654435761 * self->_version;
  }
  else {
    uint64_t v2 = 0;
  }
  return (unint64_t)[(NSMutableArray *)self->_pseudonyms hash] ^ v2;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*((unsigned char *)v4 + 20))
  {
    self->_version = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = *((id *)v4 + 1);
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        -[CSDMessagingLinkSyncRecoverMessage addPseudonym:](self, "addPseudonym:", *(void *)(*((void *)&v11 + 1) + 8 * (void)v10), (void)v11);
        uint64_t v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (unsigned)version
{
  return self->_version;
}

- (NSMutableArray)pseudonyms
{
  return self->_pseudonyms;
}

- (void)setPseudonyms:(id)a3
{
}

- (void).cxx_destruct
{
}

@end