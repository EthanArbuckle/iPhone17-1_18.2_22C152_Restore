@interface ICAppleMusicAPITokenRequest
- (BOOL)hasBagProfile;
- (BOOL)hasBagProfileVersion;
- (BOOL)hasClientIdentifier;
- (BOOL)hasClientVersion;
- (BOOL)hasShouldIgnoreDeveloperTokenCache;
- (BOOL)hasShouldIgnoreUserTokenCache;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)shouldIgnoreDeveloperTokenCache;
- (BOOL)shouldIgnoreUserTokenCache;
- (NSString)bagProfile;
- (NSString)bagProfileVersion;
- (NSString)clientIdentifier;
- (NSString)clientVersion;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setBagProfile:(id)a3;
- (void)setBagProfileVersion:(id)a3;
- (void)setClientIdentifier:(id)a3;
- (void)setClientVersion:(id)a3;
- (void)setHasShouldIgnoreDeveloperTokenCache:(BOOL)a3;
- (void)setHasShouldIgnoreUserTokenCache:(BOOL)a3;
- (void)setShouldIgnoreDeveloperTokenCache:(BOOL)a3;
- (void)setShouldIgnoreUserTokenCache:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation ICAppleMusicAPITokenRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientVersion, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_bagProfileVersion, 0);

  objc_storeStrong((id *)&self->_bagProfile, 0);
}

- (BOOL)shouldIgnoreDeveloperTokenCache
{
  return self->_shouldIgnoreDeveloperTokenCache;
}

- (BOOL)shouldIgnoreUserTokenCache
{
  return self->_shouldIgnoreUserTokenCache;
}

- (void)setBagProfileVersion:(id)a3
{
}

- (NSString)bagProfileVersion
{
  return self->_bagProfileVersion;
}

- (void)setBagProfile:(id)a3
{
}

- (NSString)bagProfile
{
  return self->_bagProfile;
}

- (void)setClientVersion:(id)a3
{
}

- (NSString)clientVersion
{
  return self->_clientVersion;
}

- (void)setClientIdentifier:(id)a3
{
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void)mergeFrom:(id)a3
{
  v4 = (BOOL *)a3;
  v6 = v4;
  if (*((void *)v4 + 3))
  {
    -[ICAppleMusicAPITokenRequest setClientIdentifier:](self, "setClientIdentifier:");
    v4 = v6;
  }
  if (*((void *)v4 + 4))
  {
    -[ICAppleMusicAPITokenRequest setClientVersion:](self, "setClientVersion:");
    v4 = v6;
  }
  if (*((void *)v4 + 1))
  {
    -[ICAppleMusicAPITokenRequest setBagProfile:](self, "setBagProfile:");
    v4 = v6;
  }
  if (*((void *)v4 + 2))
  {
    -[ICAppleMusicAPITokenRequest setBagProfileVersion:](self, "setBagProfileVersion:");
    v4 = v6;
  }
  BOOL v5 = v4[44];
  if ((v5 & 2) != 0)
  {
    self->_shouldIgnoreUserTokenCache = v4[41];
    *(unsigned char *)&self->_has |= 2u;
    BOOL v5 = v4[44];
  }
  if (v5)
  {
    self->_shouldIgnoreDeveloperTokenCache = v4[40];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_clientIdentifier hash];
  NSUInteger v4 = [(NSString *)self->_clientVersion hash];
  NSUInteger v5 = [(NSString *)self->_bagProfile hash];
  NSUInteger v6 = [(NSString *)self->_bagProfileVersion hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v7 = 2654435761 * self->_shouldIgnoreUserTokenCache;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v8 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
  }
  uint64_t v7 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v8 = 2654435761 * self->_shouldIgnoreDeveloperTokenCache;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_20;
  }
  clientIdentifier = self->_clientIdentifier;
  if ((unint64_t)clientIdentifier | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](clientIdentifier, "isEqual:")) {
      goto LABEL_20;
    }
  }
  clientVersion = self->_clientVersion;
  if ((unint64_t)clientVersion | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](clientVersion, "isEqual:")) {
      goto LABEL_20;
    }
  }
  bagProfile = self->_bagProfile;
  if ((unint64_t)bagProfile | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](bagProfile, "isEqual:")) {
      goto LABEL_20;
    }
  }
  bagProfileVersion = self->_bagProfileVersion;
  if ((unint64_t)bagProfileVersion | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](bagProfileVersion, "isEqual:")) {
      goto LABEL_20;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 2) == 0) {
      goto LABEL_20;
    }
    if (self->_shouldIgnoreUserTokenCache)
    {
      if (!*((unsigned char *)v4 + 41)) {
        goto LABEL_20;
      }
    }
    else if (*((unsigned char *)v4 + 41))
    {
      goto LABEL_20;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 2) != 0)
  {
    goto LABEL_20;
  }
  BOOL v9 = (*((unsigned char *)v4 + 44) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if (*((unsigned char *)v4 + 44))
    {
      if (self->_shouldIgnoreDeveloperTokenCache)
      {
        if (!*((unsigned char *)v4 + 40)) {
          goto LABEL_20;
        }
      }
      else if (*((unsigned char *)v4 + 40))
      {
        goto LABEL_20;
      }
      BOOL v9 = 1;
      goto LABEL_21;
    }
LABEL_20:
    BOOL v9 = 0;
  }
LABEL_21:

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NSUInteger v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSString *)self->_clientIdentifier copyWithZone:a3];
  uint64_t v7 = (void *)v5[3];
  v5[3] = v6;

  id v8 = [(NSString *)self->_clientVersion copyWithZone:a3];
  BOOL v9 = (void *)v5[4];
  v5[4] = v8;

  id v10 = [(NSString *)self->_bagProfile copyWithZone:a3];
  v11 = (void *)v5[1];
  v5[1] = v10;

  id v12 = [(NSString *)self->_bagProfileVersion copyWithZone:a3];
  v13 = (void *)v5[2];
  v5[2] = v12;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((unsigned char *)v5 + 41) = self->_shouldIgnoreUserTokenCache;
    *((unsigned char *)v5 + 44) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((unsigned char *)v5 + 40) = self->_shouldIgnoreDeveloperTokenCache;
    *((unsigned char *)v5 + 44) |= 1u;
  }
  return v5;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_clientIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_clientVersion)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_bagProfile)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_bagProfileVersion)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  while (*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) < *(void *)((char *)a3
                                                                              + OBJC_IVAR___PBDataReader__length))
  {
    if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
      break;
    }
    char v5 = 0;
    unsigned int v6 = 0;
    unint64_t v7 = 0;
    while (1)
    {
      unint64_t v8 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
      if (v8 == -1 || v8 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v9 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v8);
      *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v8 + 1;
      v7 |= (unint64_t)(v9 & 0x7F) << v5;
      if ((v9 & 0x80) == 0) {
        goto LABEL_11;
      }
      v5 += 7;
      BOOL v10 = v6++ >= 9;
      if (v10)
      {
        unint64_t v7 = 0;
        int v11 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v11 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
    if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v7 = 0;
    }
LABEL_13:
    if (v11 || (v7 & 7) == 4) {
      break;
    }
    switch((v7 >> 3))
    {
      case 1u:
        uint64_t v13 = PBReaderReadString();
        uint64_t v14 = 24;
        goto LABEL_24;
      case 2u:
        uint64_t v13 = PBReaderReadString();
        uint64_t v14 = 32;
        goto LABEL_24;
      case 3u:
        uint64_t v13 = PBReaderReadString();
        uint64_t v14 = 8;
        goto LABEL_24;
      case 4u:
        uint64_t v13 = PBReaderReadString();
        uint64_t v14 = 16;
LABEL_24:
        v16 = *(void **)&self->PBRequest_opaque[v14];
        *(void *)&self->PBRequest_opaque[v14] = v13;

        continue;
      case 5u:
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0;
        *(unsigned char *)&self->_has |= 2u;
        while (2)
        {
          unint64_t v20 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
          if (v20 == -1 || v20 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
          {
            *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v21 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v20);
            *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v20 + 1;
            v19 |= (unint64_t)(v21 & 0x7F) << v17;
            if (v21 < 0)
            {
              v17 += 7;
              BOOL v10 = v18++ >= 9;
              if (v10)
              {
                uint64_t v19 = 0;
                goto LABEL_42;
              }
              continue;
            }
          }
          break;
        }
        if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v19 = 0;
        }
LABEL_42:
        BOOL v27 = v19 != 0;
        uint64_t v28 = 41;
        goto LABEL_47;
      case 6u:
        char v22 = 0;
        unsigned int v23 = 0;
        uint64_t v24 = 0;
        *(unsigned char *)&self->_has |= 1u;
        break;
      default:
        int v15 = PBReaderSkipValueWithTag();
        if (!v15) {
          return v15;
        }
        continue;
    }
    while (1)
    {
      unint64_t v25 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
      if (v25 == -1 || v25 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v26 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v25);
      *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v25 + 1;
      v24 |= (unint64_t)(v26 & 0x7F) << v22;
      if ((v26 & 0x80) == 0) {
        goto LABEL_44;
      }
      v22 += 7;
      BOOL v10 = v23++ >= 9;
      if (v10)
      {
        uint64_t v24 = 0;
        goto LABEL_46;
      }
    }
    *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_44:
    if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
      uint64_t v24 = 0;
    }
LABEL_46:
    BOOL v27 = v24 != 0;
    uint64_t v28 = 40;
LABEL_47:
    self->PBRequest_opaque[v28] = v27;
  }
  LOBYTE(v15) = *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
  return v15;
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = +[NSMutableDictionary dictionary];
  id v4 = v3;
  clientIdentifier = self->_clientIdentifier;
  if (clientIdentifier) {
    [v3 setObject:clientIdentifier forKey:@"clientIdentifier"];
  }
  clientVersion = self->_clientVersion;
  if (clientVersion) {
    [v4 setObject:clientVersion forKey:@"clientVersion"];
  }
  bagProfile = self->_bagProfile;
  if (bagProfile) {
    [v4 setObject:bagProfile forKey:@"bagProfile"];
  }
  bagProfileVersion = self->_bagProfileVersion;
  if (bagProfileVersion) {
    [v4 setObject:bagProfileVersion forKey:@"bagProfileVersion"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    BOOL v10 = +[NSNumber numberWithBool:self->_shouldIgnoreUserTokenCache];
    [v4 setObject:v10 forKey:@"shouldIgnoreUserTokenCache"];

    char has = (char)self->_has;
  }
  if (has)
  {
    int v11 = +[NSNumber numberWithBool:self->_shouldIgnoreDeveloperTokenCache];
    [v4 setObject:v11 forKey:@"shouldIgnoreDeveloperTokenCache"];
  }

  return v4;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)ICAppleMusicAPITokenRequest;
  NSUInteger v3 = [(ICAppleMusicAPITokenRequest *)&v7 description];
  id v4 = [(ICAppleMusicAPITokenRequest *)self dictionaryRepresentation];
  char v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (BOOL)hasShouldIgnoreDeveloperTokenCache
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasShouldIgnoreDeveloperTokenCache:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setShouldIgnoreDeveloperTokenCache:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_shouldIgnoreDeveloperTokenCache = a3;
}

- (BOOL)hasShouldIgnoreUserTokenCache
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasShouldIgnoreUserTokenCache:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setShouldIgnoreUserTokenCache:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_shouldIgnoreUserTokenCache = a3;
}

- (BOOL)hasBagProfileVersion
{
  return self->_bagProfileVersion != 0;
}

- (BOOL)hasBagProfile
{
  return self->_bagProfile != 0;
}

- (BOOL)hasClientVersion
{
  return self->_clientVersion != 0;
}

- (BOOL)hasClientIdentifier
{
  return self->_clientIdentifier != 0;
}

@end