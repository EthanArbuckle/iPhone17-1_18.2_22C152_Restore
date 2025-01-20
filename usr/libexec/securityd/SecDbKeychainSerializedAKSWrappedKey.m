@interface SecDbKeychainSerializedAKSWrappedKey
- (BOOL)hasRefKeyBlob;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)refKeyBlob;
- (NSData)wrappedKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)type;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setRefKeyBlob:(id)a3;
- (void)setType:(unsigned int)a3;
- (void)setWrappedKey:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SecDbKeychainSerializedAKSWrappedKey

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wrappedKey, 0);

  objc_storeStrong((id *)&self->_refKeyBlob, 0);
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
    unint64_t v13 = v7 >> 3;
    if ((v7 >> 3) == 1)
    {
      uint64_t v19 = PBReaderReadData();
      uint64_t v20 = 24;
    }
    else
    {
      if (v13 != 2)
      {
        if (v13 == 3)
        {
          char v14 = 0;
          unsigned int v15 = 0;
          uint64_t v16 = 0;
          while (1)
          {
            unint64_t v17 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            if (v17 == -1 || v17 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length)) {
              break;
            }
            char v18 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v17);
            *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v17 + 1;
            v16 |= (unint64_t)(v18 & 0x7F) << v14;
            if ((v18 & 0x80) == 0) {
              goto LABEL_33;
            }
            v14 += 7;
            BOOL v10 = v15++ >= 9;
            if (v10)
            {
              LODWORD(v16) = 0;
              goto LABEL_35;
            }
          }
          *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_33:
          if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
            LODWORD(v16) = 0;
          }
LABEL_35:
          self->_type = v16;
        }
        else
        {
          int v22 = PBReaderSkipValueWithTag();
          if (!v22) {
            return v22;
          }
        }
        continue;
      }
      uint64_t v19 = PBReaderReadData();
      uint64_t v20 = 8;
    }
    v21 = *(void **)&self->PBCodable_opaque[v20];
    *(void *)&self->PBCodable_opaque[v20] = v19;
  }
  LOBYTE(v22) = *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
  return v22;
}

- (NSData)wrappedKey
{
  return self->_wrappedKey;
}

- (unsigned)type
{
  return self->_type;
}

- (void)setType:(unsigned int)a3
{
  self->_type = a3;
}

- (void)setRefKeyBlob:(id)a3
{
}

- (NSData)refKeyBlob
{
  return self->_refKeyBlob;
}

- (void)setWrappedKey:(id)a3
{
}

- (void)mergeFrom:(id)a3
{
  v4 = (unsigned int *)a3;
  char v5 = v4;
  if (*((void *)v4 + 3))
  {
    -[SecDbKeychainSerializedAKSWrappedKey setWrappedKey:](self, "setWrappedKey:");
    v4 = v5;
  }
  if (*((void *)v4 + 1))
  {
    -[SecDbKeychainSerializedAKSWrappedKey setRefKeyBlob:](self, "setRefKeyBlob:");
    v4 = v5;
  }
  self->_type = v4[4];
}

- (unint64_t)hash
{
  unint64_t v3 = (unint64_t)[(NSData *)self->_wrappedKey hash];
  return (unint64_t)[(NSData *)self->_refKeyBlob hash] ^ v3 ^ (2654435761 * self->_type);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v7 = [v4 isMemberOfClass:objc_opt_class()]
    && ((wrappedKey = self->_wrappedKey, !((unint64_t)wrappedKey | *((void *)v4 + 3)))
     || -[NSData isEqual:](wrappedKey, "isEqual:"))
    && ((refKeyBlob = self->_refKeyBlob, !((unint64_t)refKeyBlob | *((void *)v4 + 1)))
     || -[NSData isEqual:](refKeyBlob, "isEqual:"))
    && self->_type == *((_DWORD *)v4 + 4);

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  char v5 = [[objc_opt_class() allocWithZone:a3] init];
  id v6 = [(NSData *)self->_wrappedKey copyWithZone:a3];
  BOOL v7 = (void *)v5[3];
  v5[3] = v6;

  id v8 = [(NSData *)self->_refKeyBlob copyWithZone:a3];
  char v9 = (void *)v5[1];
  v5[1] = v8;

  *((_DWORD *)v5 + 4) = self->_type;
  return v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  [v4 setWrappedKey:self->_wrappedKey];
  if (self->_refKeyBlob) {
    [v4 setRefKeyBlob:];
  }
  v4[4] = self->_type;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  PBDataWriterWriteDataField();
  if (self->_refKeyBlob) {
    PBDataWriterWriteDataField();
  }
  PBDataWriterWriteUint32Field();
}

- (id)dictionaryRepresentation
{
  unint64_t v3 = +[NSMutableDictionary dictionary];
  id v4 = v3;
  wrappedKey = self->_wrappedKey;
  if (wrappedKey) {
    [v3 setObject:wrappedKey forKey:@"wrappedKey"];
  }
  refKeyBlob = self->_refKeyBlob;
  if (refKeyBlob) {
    [v4 setObject:refKeyBlob forKey:@"refKeyBlob"];
  }
  BOOL v7 = +[NSNumber numberWithUnsignedInt:self->_type];
  [v4 setObject:v7 forKey:@"type"];

  return v4;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)SecDbKeychainSerializedAKSWrappedKey;
  unint64_t v3 = [(SecDbKeychainSerializedAKSWrappedKey *)&v7 description];
  id v4 = [(SecDbKeychainSerializedAKSWrappedKey *)self dictionaryRepresentation];
  char v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (BOOL)hasRefKeyBlob
{
  return self->_refKeyBlob != 0;
}

@end