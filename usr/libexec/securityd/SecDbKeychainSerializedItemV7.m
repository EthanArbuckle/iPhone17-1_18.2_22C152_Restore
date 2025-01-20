@interface SecDbKeychainSerializedItemV7
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)encryptedMetadata;
- (NSData)encryptedSecretData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)keyclassAsString:(int)a3;
- (int)StringAsKeyclass:(id)a3;
- (int)keyclass;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEncryptedMetadata:(id)a3;
- (void)setEncryptedSecretData:(id)a3;
- (void)setKeyclass:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SecDbKeychainSerializedItemV7

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encryptedSecretData, 0);

  objc_storeStrong((id *)&self->_encryptedMetadata, 0);
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
      uint64_t v20 = 16;
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
          self->_keyclass = v16;
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

- (int)keyclass
{
  return self->_keyclass;
}

- (NSData)encryptedSecretData
{
  return self->_encryptedSecretData;
}

- (NSData)encryptedMetadata
{
  return self->_encryptedMetadata;
}

- (void)setKeyclass:(int)a3
{
  self->_keyclass = a3;
}

- (void)setEncryptedMetadata:(id)a3
{
}

- (void)setEncryptedSecretData:(id)a3
{
}

- (void)mergeFrom:(id)a3
{
  v4 = (int *)a3;
  char v5 = v4;
  if (*((void *)v4 + 2))
  {
    -[SecDbKeychainSerializedItemV7 setEncryptedSecretData:](self, "setEncryptedSecretData:");
    v4 = v5;
  }
  if (*((void *)v4 + 1))
  {
    -[SecDbKeychainSerializedItemV7 setEncryptedMetadata:](self, "setEncryptedMetadata:");
    v4 = v5;
  }
  self->_keyclass = v4[6];
}

- (unint64_t)hash
{
  unint64_t v3 = (unint64_t)[(NSData *)self->_encryptedSecretData hash];
  return (unint64_t)[(NSData *)self->_encryptedMetadata hash] ^ v3 ^ (2654435761 * self->_keyclass);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v7 = [v4 isMemberOfClass:objc_opt_class()]
    && ((encryptedSecretData = self->_encryptedSecretData, !((unint64_t)encryptedSecretData | *((void *)v4 + 2)))
     || -[NSData isEqual:](encryptedSecretData, "isEqual:"))
    && ((encryptedMetadata = self->_encryptedMetadata, !((unint64_t)encryptedMetadata | *((void *)v4 + 1)))
     || -[NSData isEqual:](encryptedMetadata, "isEqual:"))
    && self->_keyclass == *((_DWORD *)v4 + 6);

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  char v5 = [[[objc_opt_class() allocWithZone:a3] init];
  id v6 = [(NSData *)self->_encryptedSecretData copyWithZone:a3];
  BOOL v7 = (void *)v5[2];
  v5[2] = v6;

  id v8 = [(NSData *)self->_encryptedMetadata copyWithZone:a3];
  char v9 = (void *)v5[1];
  v5[1] = v8;

  *((_DWORD *)v5 + 6) = self->_keyclass;
  return v5;
}

- (void)copyTo:(id)a3
{
  encryptedSecretData = self->_encryptedSecretData;
  char v5 = a3;
  [v5 setEncryptedSecretData:encryptedSecretData];
  [v5 setEncryptedMetadata:self->_encryptedMetadata];
  v5[6] = self->_keyclass;
}

- (void)writeTo:(id)a3
{
  id v3 = a3;
  PBDataWriterWriteDataField();
  PBDataWriterWriteDataField();
  PBDataWriterWriteInt32Field();
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  id v4 = v3;
  encryptedSecretData = self->_encryptedSecretData;
  if (encryptedSecretData) {
    [v3 setObject:encryptedSecretData forKey:@"encryptedSecretData"];
  }
  encryptedMetadata = self->_encryptedMetadata;
  if (encryptedMetadata) {
    [v4 setObject:encryptedMetadata forKey:@"encryptedMetadata"];
  }
  unsigned int v7 = self->_keyclass - 6;
  if (v7 >= 7)
  {
    id v8 = +[NSString stringWithFormat:@"(unknown: %i)", self->_keyclass];
  }
  else
  {
    id v8 = off_100305F88[v7];
  }
  [v4 setObject:v8 forKey:@"keyclass"];

  return v4;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)SecDbKeychainSerializedItemV7;
  id v3 = [(SecDbKeychainSerializedItemV7 *)&v7 description];
  id v4 = [(SecDbKeychainSerializedItemV7 *)self dictionaryRepresentation];
  char v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (int)StringAsKeyclass:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"KEYCLASS_AK"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"KEYCLASS_CK"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"KEYCLASS_DK"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"KEYCLASS_AKU"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"KEYCLASS_CKU"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"KEYCLASS_DKU"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"KEYCLASS_AKPU"])
  {
    int v4 = 12;
  }
  else
  {
    int v4 = 6;
  }

  return v4;
}

- (id)keyclassAsString:(int)a3
{
  if ((a3 - 6) >= 7)
  {
    id v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    id v3 = off_100305F88[a3 - 6];
  }

  return v3;
}

@end