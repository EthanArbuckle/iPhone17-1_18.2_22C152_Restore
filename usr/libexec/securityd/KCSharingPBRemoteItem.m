@interface KCSharingPBRemoteItem
- (BOOL)hasInternetPassword;
- (BOOL)hasPrivateKey;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (KCSharingPBInternetPasswordCredential)internetPassword;
- (KCSharingPBPrivateKeyCredential)privateKey;
- (PBUnknownFields)unknownFields;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setInternetPassword:(id)a3;
- (void)setPrivateKey:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation KCSharingPBRemoteItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateKey, 0);
  objc_storeStrong((id *)&self->_internetPassword, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

- (void)setInternetPassword:(id)a3
{
}

- (KCSharingPBInternetPasswordCredential)internetPassword
{
  return self->_internetPassword;
}

- (void)setPrivateKey:(id)a3
{
}

- (KCSharingPBPrivateKeyCredential)privateKey
{
  return self->_privateKey;
}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  privateKey = self->_privateKey;
  uint64_t v6 = v4[3];
  v9 = v4;
  if (privateKey)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[KCSharingPBPrivateKeyCredential mergeFrom:](privateKey, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[KCSharingPBRemoteItem setPrivateKey:](self, "setPrivateKey:");
  }
  v4 = v9;
LABEL_7:
  internetPassword = self->_internetPassword;
  uint64_t v8 = v4[2];
  if (internetPassword)
  {
    if (v8) {
      -[KCSharingPBInternetPasswordCredential mergeFrom:](internetPassword, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[KCSharingPBRemoteItem setInternetPassword:](self, "setInternetPassword:");
  }

  _objc_release_x1();
}

- (unint64_t)hash
{
  unint64_t v3 = [(KCSharingPBPrivateKeyCredential *)self->_privateKey hash];
  return [(KCSharingPBInternetPasswordCredential *)self->_internetPassword hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((privateKey = self->_privateKey, !((unint64_t)privateKey | v4[3]))
     || -[KCSharingPBPrivateKeyCredential isEqual:](privateKey, "isEqual:")))
  {
    internetPassword = self->_internetPassword;
    if ((unint64_t)internetPassword | v4[2]) {
      unsigned __int8 v7 = -[KCSharingPBInternetPasswordCredential isEqual:](internetPassword, "isEqual:");
    }
    else {
      unsigned __int8 v7 = 1;
    }
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[objc_opt_class() allocWithZone:a3] init];
  id v6 = [(KCSharingPBPrivateKeyCredential *)self->_privateKey copyWithZone:a3];
  unsigned __int8 v7 = (void *)*((void *)v5 + 3);
  *((void *)v5 + 3) = v6;

  id v8 = [(KCSharingPBInternetPasswordCredential *)self->_internetPassword copyWithZone:a3];
  v9 = (void *)*((void *)v5 + 2);
  *((void *)v5 + 2) = v8;

  objc_storeStrong((id *)v5 + 1, self->_unknownFields);
  return v5;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_privateKey)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_internetPassword)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
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
      if ((v7 >> 3) == 3) {
        break;
      }
      if ((v7 >> 3) == 2)
      {
        v13 = objc_alloc_init(KCSharingPBPrivateKeyCredential);
        objc_storeStrong((id *)&self->_privateKey, v13);
        if (!PBReaderPlaceMark() || (sub_1000C8A68((uint64_t)v13, (uint64_t)a3) & 1) == 0) {
          goto LABEL_30;
        }
LABEL_24:
        PBReaderRecallMark();

        goto LABEL_28;
      }
      if (!self->_unknownFields)
      {
        v14 = (PBUnknownFields *)objc_alloc_init((Class)PBUnknownFields);
        unknownFields = self->_unknownFields;
        self->_unknownFields = v14;
      }
      if ((PBUnknownFieldAdd() & 1) == 0) {
        return 0;
      }
LABEL_28:
      if (*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) >= *(void *)((char *)a3
                                                                                + OBJC_IVAR___PBDataReader__length))
        return *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
    }
    v13 = objc_alloc_init(KCSharingPBInternetPasswordCredential);
    objc_storeStrong((id *)&self->_internetPassword, v13);
    if (!PBReaderPlaceMark() || (sub_10016F048((uint64_t)v13, (uint64_t)a3) & 1) == 0)
    {
LABEL_30:

      return 0;
    }
    goto LABEL_24;
  }
  return *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
}

- (id)dictionaryRepresentation
{
  unint64_t v3 = +[NSMutableDictionary dictionary];
  privateKey = self->_privateKey;
  if (privateKey)
  {
    char v5 = [(KCSharingPBPrivateKeyCredential *)privateKey dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"privateKey"];
  }
  internetPassword = self->_internetPassword;
  if (internetPassword)
  {
    unint64_t v7 = [(KCSharingPBInternetPasswordCredential *)internetPassword dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"internetPassword"];
  }
  unknownFields = self->_unknownFields;
  if (unknownFields)
  {
    char v9 = [(PBUnknownFields *)unknownFields dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"Unknown Fields"];
  }

  return v3;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)KCSharingPBRemoteItem;
  unint64_t v3 = [(KCSharingPBRemoteItem *)&v7 description];
  id v4 = [(KCSharingPBRemoteItem *)self dictionaryRepresentation];
  char v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (BOOL)hasInternetPassword
{
  return self->_internetPassword != 0;
}

- (BOOL)hasPrivateKey
{
  return self->_privateKey != 0;
}

@end