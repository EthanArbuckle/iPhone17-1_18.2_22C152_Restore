@interface SecDbKeychainSerializedMetadata
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)ciphertext;
- (NSData)wrappedKey;
- (NSString)tamperCheck;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCiphertext:(id)a3;
- (void)setTamperCheck:(id)a3;
- (void)setWrappedKey:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SecDbKeychainSerializedMetadata

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wrappedKey, 0);
  objc_storeStrong((id *)&self->_tamperCheck, 0);

  objc_storeStrong((id *)&self->_ciphertext, 0);
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
      unint64_t v13 = v7 >> 3;
      if ((v7 >> 3) == 3) {
        break;
      }
      if (v13 == 2)
      {
        uint64_t v14 = PBReaderReadData();
        uint64_t v15 = 24;
        goto LABEL_23;
      }
      if (v13 == 1)
      {
        uint64_t v14 = PBReaderReadData();
        uint64_t v15 = 8;
LABEL_23:
        v16 = *(void **)&self->PBCodable_opaque[v15];
        *(void *)&self->PBCodable_opaque[v15] = v14;

        goto LABEL_25;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_25:
      if (*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) >= *(void *)((char *)a3
                                                                                + OBJC_IVAR___PBDataReader__length))
        return *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
    }
    uint64_t v14 = PBReaderReadString();
    uint64_t v15 = 16;
    goto LABEL_23;
  }
  return *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
}

- (NSData)wrappedKey
{
  return self->_wrappedKey;
}

- (NSString)tamperCheck
{
  return self->_tamperCheck;
}

- (NSData)ciphertext
{
  return self->_ciphertext;
}

- (void)setTamperCheck:(id)a3
{
}

- (void)setWrappedKey:(id)a3
{
}

- (void)setCiphertext:(id)a3
{
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  if (v4[1]) {
    -[SecDbKeychainSerializedMetadata setCiphertext:](self, "setCiphertext:");
  }
  if (v4[3]) {
    -[SecDbKeychainSerializedMetadata setWrappedKey:](self, "setWrappedKey:");
  }
  if (v4[2]) {
    -[SecDbKeychainSerializedMetadata setTamperCheck:](self, "setTamperCheck:");
  }
}

- (unint64_t)hash
{
  unint64_t v3 = (unint64_t)[(NSData *)self->_ciphertext hash];
  unint64_t v4 = (unint64_t)[(NSData *)self->_wrappedKey hash] ^ v3;
  return v4 ^ [(NSString *)self->_tamperCheck hash];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((ciphertext = self->_ciphertext, !((unint64_t)ciphertext | v4[1]))
     || -[NSData isEqual:](ciphertext, "isEqual:"))
    && ((wrappedKey = self->_wrappedKey, !((unint64_t)wrappedKey | v4[3]))
     || -[NSData isEqual:](wrappedKey, "isEqual:")))
  {
    tamperCheck = self->_tamperCheck;
    if ((unint64_t)tamperCheck | v4[2]) {
      unsigned __int8 v8 = -[NSString isEqual:](tamperCheck, "isEqual:");
    }
    else {
      unsigned __int8 v8 = 1;
    }
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  char v5 = [[[objc_opt_class() allocWithZone:a3] init];
  id v6 = [(NSData *)self->_ciphertext copyWithZone:a3];
  unint64_t v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = [(NSData *)self->_wrappedKey copyWithZone:a3];
  char v9 = (void *)v5[3];
  v5[3] = v8;

  id v10 = [(NSString *)self->_tamperCheck copyWithZone:a3];
  int v11 = (void *)v5[2];
  v5[2] = v10;

  return v5;
}

- (void)copyTo:(id)a3
{
  ciphertext = self->_ciphertext;
  id v5 = a3;
  [v5 setCiphertext:ciphertext];
  [v5 setWrappedKey:self->_wrappedKey];
  [v5 setTamperCheck:self->_tamperCheck];
}

- (void)writeTo:(id)a3
{
  id v3 = a3;
  PBDataWriterWriteDataField();
  PBDataWriterWriteDataField();
  PBDataWriterWriteStringField();
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  unint64_t v4 = v3;
  ciphertext = self->_ciphertext;
  if (ciphertext) {
    [v3 setObject:ciphertext forKey:@"ciphertext"];
  }
  wrappedKey = self->_wrappedKey;
  if (wrappedKey) {
    [v4 setObject:wrappedKey forKey:@"wrappedKey"];
  }
  tamperCheck = self->_tamperCheck;
  if (tamperCheck) {
    [v4 setObject:tamperCheck forKey:@"tamperCheck"];
  }

  return v4;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)SecDbKeychainSerializedMetadata;
  id v3 = [(SecDbKeychainSerializedMetadata *)&v7 description];
  unint64_t v4 = [(SecDbKeychainSerializedMetadata *)self dictionaryRepresentation];
  id v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

@end