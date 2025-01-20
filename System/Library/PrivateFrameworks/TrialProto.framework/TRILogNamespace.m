@interface TRILogNamespace
- (BOOL)hasHashData;
- (BOOL)hasHashIncludesDefaults;
- (BOOL)hasLatestRolloutId;
- (BOOL)hasName;
- (BOOL)hasRolloutCount;
- (BOOL)hashIncludesDefaults;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)hashData;
- (NSString)latestRolloutId;
- (NSString)name;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)rolloutCount;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasHashIncludesDefaults:(BOOL)a3;
- (void)setHasRolloutCount:(BOOL)a3;
- (void)setHashData:(id)a3;
- (void)setHashIncludesDefaults:(BOOL)a3;
- (void)setLatestRolloutId:(id)a3;
- (void)setName:(id)a3;
- (void)setRolloutCount:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation TRILogNamespace

- (BOOL)hasName
{
  return self->_name != 0;
}

- (BOOL)hasHashData
{
  return self->_hashData != 0;
}

- (void)setHashIncludesDefaults:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_hashIncludesDefaults = a3;
}

- (void)setHasHashIncludesDefaults:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasHashIncludesDefaults
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasLatestRolloutId
{
  return self->_latestRolloutId != 0;
}

- (void)setRolloutCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_rolloutCount = a3;
}

- (void)setHasRolloutCount:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasRolloutCount
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)TRILogNamespace;
  v4 = [(TRILogNamespace *)&v8 description];
  v5 = [(TRILogNamespace *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  name = self->_name;
  if (name) {
    [v3 setObject:name forKey:@"name"];
  }
  hashData = self->_hashData;
  if (hashData) {
    [v4 setObject:hashData forKey:@"hash_data"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v7 = [NSNumber numberWithBool:self->_hashIncludesDefaults];
    [v4 setObject:v7 forKey:@"hash_includes_defaults"];
  }
  latestRolloutId = self->_latestRolloutId;
  if (latestRolloutId) {
    [v4 setObject:latestRolloutId forKey:@"latest_rollout_id"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v9 = [NSNumber numberWithUnsignedInt:self->_rolloutCount];
    [v4 setObject:v9 forKey:@"rollout_count"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return TRILogNamespaceReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_name)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_hashData)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_latestRolloutId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_name)
  {
    objc_msgSend(v4, "setName:");
    id v4 = v5;
  }
  if (self->_hashData)
  {
    objc_msgSend(v5, "setHashData:");
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((unsigned char *)v4 + 36) = self->_hashIncludesDefaults;
    *((unsigned char *)v4 + 40) |= 2u;
  }
  if (self->_latestRolloutId)
  {
    objc_msgSend(v5, "setLatestRolloutId:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 8) = self->_rolloutCount;
    *((unsigned char *)v4 + 40) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_name copyWithZone:a3];
  v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  uint64_t v8 = [(NSData *)self->_hashData copyWithZone:a3];
  v9 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v8;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(unsigned char *)(v5 + 36) = self->_hashIncludesDefaults;
    *(unsigned char *)(v5 + 40) |= 2u;
  }
  uint64_t v10 = [(NSString *)self->_latestRolloutId copyWithZone:a3];
  v11 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v10;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 32) = self->_rolloutCount;
    *(unsigned char *)(v5 + 40) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_21;
  }
  name = self->_name;
  if ((unint64_t)name | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](name, "isEqual:")) {
      goto LABEL_21;
    }
  }
  hashData = self->_hashData;
  if ((unint64_t)hashData | *((void *)v4 + 1))
  {
    if (!-[NSData isEqual:](hashData, "isEqual:")) {
      goto LABEL_21;
    }
  }
  char has = (char)self->_has;
  char v8 = *((unsigned char *)v4 + 40);
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 2) == 0) {
      goto LABEL_21;
    }
    if (self->_hashIncludesDefaults)
    {
      if (!*((unsigned char *)v4 + 36)) {
        goto LABEL_21;
      }
    }
    else if (*((unsigned char *)v4 + 36))
    {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 2) != 0)
  {
    goto LABEL_21;
  }
  latestRolloutId = self->_latestRolloutId;
  if (!((unint64_t)latestRolloutId | *((void *)v4 + 2))) {
    goto LABEL_17;
  }
  if (!-[NSString isEqual:](latestRolloutId, "isEqual:"))
  {
LABEL_21:
    BOOL v10 = 0;
    goto LABEL_22;
  }
  char has = (char)self->_has;
  char v8 = *((unsigned char *)v4 + 40);
LABEL_17:
  BOOL v10 = (v8 & 1) == 0;
  if (has)
  {
    if ((v8 & 1) == 0 || self->_rolloutCount != *((_DWORD *)v4 + 8)) {
      goto LABEL_21;
    }
    BOOL v10 = 1;
  }
LABEL_22:

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_name hash];
  uint64_t v4 = [(NSData *)self->_hashData hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v5 = 2654435761 * self->_hashIncludesDefaults;
  }
  else {
    uint64_t v5 = 0;
  }
  NSUInteger v6 = [(NSString *)self->_latestRolloutId hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v7 = 2654435761 * self->_rolloutCount;
  }
  else {
    uint64_t v7 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*((void *)v4 + 3))
  {
    -[TRILogNamespace setName:](self, "setName:");
    id v4 = v5;
  }
  if (*((void *)v4 + 1))
  {
    -[TRILogNamespace setHashData:](self, "setHashData:");
    id v4 = v5;
  }
  if ((*((unsigned char *)v4 + 40) & 2) != 0)
  {
    self->_hashIncludesDefaults = *((unsigned char *)v4 + 36);
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v4 + 2))
  {
    [(TRILogNamespace *)self setLatestRolloutId:"setLatestRolloutId:"];
    id v4 = v5;
  }
  if (*((unsigned char *)v4 + 40))
  {
    self->_rolloutCount = *((_DWORD *)v4 + 8);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSData)hashData
{
  return self->_hashData;
}

- (void)setHashData:(id)a3
{
}

- (BOOL)hashIncludesDefaults
{
  return self->_hashIncludesDefaults;
}

- (NSString)latestRolloutId
{
  return self->_latestRolloutId;
}

- (void)setLatestRolloutId:(id)a3
{
}

- (unsigned)rolloutCount
{
  return self->_rolloutCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_latestRolloutId, 0);
  objc_storeStrong((id *)&self->_hashData, 0);
}

@end