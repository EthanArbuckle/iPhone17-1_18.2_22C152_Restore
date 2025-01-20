@interface CKKSSerializedKey
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)key;
- (NSString)keyclass;
- (NSString)uuid;
- (NSString)zoneName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setKey:(id)a3;
- (void)setKeyclass:(id)a3;
- (void)setUuid:(id)a3;
- (void)setZoneName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKKSSerializedKey

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneName, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_keyclass, 0);

  objc_storeStrong((id *)&self->_key, 0);
}

- (void)setKey:(id)a3
{
}

- (NSData)key
{
  return self->_key;
}

- (void)setKeyclass:(id)a3
{
}

- (NSString)keyclass
{
  return self->_keyclass;
}

- (void)setZoneName:(id)a3
{
}

- (NSString)zoneName
{
  return self->_zoneName;
}

- (void)setUuid:(id)a3
{
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  if (v4[3]) {
    -[CKKSSerializedKey setUuid:](self, "setUuid:");
  }
  if (v4[4]) {
    -[CKKSSerializedKey setZoneName:](self, "setZoneName:");
  }
  if (v4[2]) {
    -[CKKSSerializedKey setKeyclass:](self, "setKeyclass:");
  }
  if (v4[1]) {
    -[CKKSSerializedKey setKey:](self, "setKey:");
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_uuid hash];
  unint64_t v4 = [(NSString *)self->_zoneName hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_keyclass hash];
  return v4 ^ v5 ^ (unint64_t)[(NSData *)self->_key hash];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((uuid = self->_uuid, !((unint64_t)uuid | v4[3])) || -[NSString isEqual:](uuid, "isEqual:"))
    && ((zoneName = self->_zoneName, !((unint64_t)zoneName | v4[4]))
     || -[NSString isEqual:](zoneName, "isEqual:"))
    && ((keyclass = self->_keyclass, !((unint64_t)keyclass | v4[2]))
     || -[NSString isEqual:](keyclass, "isEqual:")))
  {
    key = self->_key;
    if ((unint64_t)key | v4[1]) {
      unsigned __int8 v9 = -[NSData isEqual:](key, "isEqual:");
    }
    else {
      unsigned __int8 v9 = 1;
    }
  }
  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NSUInteger v5 = [[[objc_opt_class() allocWithZone:a3] init];
  id v6 = [(NSString *)self->_uuid copyWithZone:a3];
  v7 = (void *)v5[3];
  v5[3] = v6;

  id v8 = [(NSString *)self->_zoneName copyWithZone:a3];
  unsigned __int8 v9 = (void *)v5[4];
  v5[4] = v8;

  id v10 = [(NSString *)self->_keyclass copyWithZone:a3];
  v11 = (void *)v5[2];
  v5[2] = v10;

  id v12 = [(NSData *)self->_key copyWithZone:a3];
  v13 = (void *)v5[1];
  v5[1] = v12;

  return v5;
}

- (void)copyTo:(id)a3
{
  uuid = self->_uuid;
  id v5 = a3;
  [v5 setUuid:uuid];
  [v5 setZoneName:self->_zoneName];
  [v5 setKeyclass:self->_keyclass];
  [v5 setKey:self->_key];
}

- (void)writeTo:(id)a3
{
  id v3 = a3;
  PBDataWriterWriteStringField();
  PBDataWriterWriteStringField();
  PBDataWriterWriteStringField();
  PBDataWriterWriteDataField();
}

- (BOOL)readFrom:(id)a3
{
  if (*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) < *(void *)((char *)a3
                                                                           + OBJC_IVAR___PBDataReader__length))
  {
    while (1)
    {
      if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
        return *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
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
        if (v6++ >= 9)
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
        return *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
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
          uint64_t v14 = 16;
          goto LABEL_24;
        case 4u:
          uint64_t v13 = PBReaderReadData();
          uint64_t v14 = 8;
LABEL_24:
          v15 = *(void **)&self->PBCodable_opaque[v14];
          *(void *)&self->PBCodable_opaque[v14] = v13;

          goto LABEL_25;
        default:
          if ((PBReaderSkipValueWithTag() & 1) == 0) {
            return 0;
          }
LABEL_25:
          if (*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) >= *(void *)((char *)a3
                                                                                    + OBJC_IVAR___PBDataReader__length))
            return *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
          break;
      }
    }
  }
  return *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  unint64_t v4 = v3;
  uuid = self->_uuid;
  if (uuid) {
    [v3 setObject:uuid forKey:@"uuid"];
  }
  zoneName = self->_zoneName;
  if (zoneName) {
    [v4 setObject:zoneName forKey:@"zoneName"];
  }
  keyclass = self->_keyclass;
  if (keyclass) {
    [v4 setObject:keyclass forKey:@"keyclass"];
  }
  key = self->_key;
  if (key) {
    [v4 setObject:key forKey:@"key"];
  }

  return v4;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)CKKSSerializedKey;
  id v3 = [(CKKSSerializedKey *)&v7 description];
  unint64_t v4 = [(CKKSSerializedKey *)self dictionaryRepresentation];
  char v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

@end