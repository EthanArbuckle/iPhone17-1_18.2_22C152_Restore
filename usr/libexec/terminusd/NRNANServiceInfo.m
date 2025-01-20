@interface NRNANServiceInfo
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation NRNANServiceInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_deviceTypeHash, 0);
  objc_storeStrong((id *)&self->_authTag, 0);

  objc_storeStrong((id *)&self->_advertisingNonce, 0);
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_serviceName hash];
  unint64_t v4 = (unint64_t)[(NSData *)self->_authTag hash] ^ v3;
  unint64_t v5 = (unint64_t)[(NSData *)self->_advertisingNonce hash];
  return v4 ^ v5 ^ (unint64_t)[(NSData *)self->_deviceTypeHash hash];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((serviceName = self->_serviceName, !((unint64_t)serviceName | v4[4]))
     || -[NSString isEqual:](serviceName, "isEqual:"))
    && ((authTag = self->_authTag, !((unint64_t)authTag | v4[2]))
     || -[NSData isEqual:](authTag, "isEqual:"))
    && ((advertisingNonce = self->_advertisingNonce, !((unint64_t)advertisingNonce | v4[1]))
     || -[NSData isEqual:](advertisingNonce, "isEqual:")))
  {
    deviceTypeHash = self->_deviceTypeHash;
    if ((unint64_t)deviceTypeHash | v4[3]) {
      unsigned __int8 v9 = -[NSData isEqual:](deviceTypeHash, "isEqual:");
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
  unint64_t v5 = [[objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3) init];
  id v6 = [(NSString *)self->_serviceName copyWithZone:a3];
  v7 = (void *)v5[4];
  v5[4] = v6;

  id v8 = [(NSData *)self->_authTag copyWithZone:a3];
  unsigned __int8 v9 = (void *)v5[2];
  v5[2] = v8;

  id v10 = [(NSData *)self->_advertisingNonce copyWithZone:a3];
  v11 = (void *)v5[1];
  v5[1] = v10;

  id v12 = [(NSData *)self->_deviceTypeHash copyWithZone:a3];
  v13 = (void *)v5[3];
  v5[3] = v12;

  return v5;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_serviceName)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_authTag)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_advertisingNonce)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_deviceTypeHash)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  int v4 = OBJC_IVAR___PBDataReader__pos;
  unint64_t v5 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
  unint64_t v6 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length);
  if (v5 < v6)
  {
    while (1)
    {
      v11 = (char *)a3 + OBJC_IVAR___PBDataReader__error;
      if (*v11) {
        return *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
      }
      if (v5 >= v6) {
        break;
      }
      char v12 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v5);
      *(void *)((char *)a3 + v4) = v5 + 1;
      unint64_t v13 = v12 & 0x7F;
      if ((v12 & 0x80) == 0) {
        goto LABEL_40;
      }
      unint64_t v14 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
      if (v14 == -1 || v14 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length)) {
        goto LABEL_38;
      }
      unint64_t v15 = v14 + 1;
      int v16 = *(char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v14);
      *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v15;
      v13 |= (unint64_t)(v16 & 0x7F) << 7;
      if ((v16 & 0x80000000) == 0) {
        goto LABEL_40;
      }
      unint64_t v17 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
      if (v17 == -1 || v17 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length)) {
        goto LABEL_38;
      }
      unint64_t v18 = v17 + 1;
      int v19 = *(char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v17);
      *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v18;
      v13 |= (unint64_t)(v19 & 0x7F) << 14;
      if ((v19 & 0x80000000) == 0) {
        goto LABEL_40;
      }
      unint64_t v20 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
      if (v20 == -1 || v20 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length)) {
        goto LABEL_38;
      }
      unint64_t v21 = v20 + 1;
      int v22 = *(char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v20);
      *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v21;
      v13 |= (unint64_t)(v22 & 0x7F) << 21;
      if ((v22 & 0x80000000) == 0) {
        goto LABEL_40;
      }
      unint64_t v23 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
      if (v23 == -1 || v23 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length)) {
        goto LABEL_38;
      }
      unint64_t v24 = v23 + 1;
      int v25 = *(char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v23);
      *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v24;
      v13 |= (unint64_t)(v25 & 0x7F) << 28;
      if ((v25 & 0x80000000) == 0) {
        goto LABEL_40;
      }
      unint64_t v26 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
      if (v26 == -1 || v26 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length)) {
        goto LABEL_38;
      }
      unint64_t v27 = v26 + 1;
      int v28 = *(char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v26);
      *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v27;
      if ((v28 & 0x80000000) == 0) {
        goto LABEL_40;
      }
      unint64_t v29 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
      if (v29 == -1 || v29 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length)) {
        goto LABEL_38;
      }
      unint64_t v30 = v29 + 1;
      int v31 = *(char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v29);
      *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v30;
      if ((v31 & 0x80000000) == 0) {
        goto LABEL_40;
      }
      unint64_t v32 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
      if (v32 == -1 || v32 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length)) {
        goto LABEL_38;
      }
      unint64_t v33 = v32 + 1;
      int v34 = *(char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v32);
      *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v33;
      if ((v34 & 0x80000000) == 0) {
        goto LABEL_40;
      }
      unint64_t v35 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
      if (v35 == -1 || v35 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length)) {
        goto LABEL_38;
      }
      unint64_t v36 = v35 + 1;
      int v37 = *(char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v35);
      *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v36;
      if ((v37 & 0x80000000) == 0) {
        goto LABEL_40;
      }
      unint64_t v38 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
      if (v38 == -1 || v38 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
      {
LABEL_38:
        v11 = (char *)a3 + OBJC_IVAR___PBDataReader__error;
        goto LABEL_39;
      }
      unint64_t v39 = v38 + 1;
      int v40 = *(char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v38);
      *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v39;
      if (v40 < 0)
      {
        unint64_t v13 = 0;
        int v41 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_42;
      }
LABEL_40:
      int v41 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
      if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
        unint64_t v13 = 0;
      }
LABEL_42:
      if (v41) {
        BOOL v42 = 1;
      }
      else {
        BOOL v42 = (v13 & 7) == 4;
      }
      if (v42) {
        return *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
      }
      switch((v13 >> 3))
      {
        case 1u:
          uint64_t v8 = PBReaderReadString();
          uint64_t v9 = 32;
          goto LABEL_4;
        case 2u:
          uint64_t v8 = PBReaderReadData();
          uint64_t v9 = 16;
          goto LABEL_4;
        case 3u:
          uint64_t v8 = PBReaderReadData();
          uint64_t v9 = 8;
          goto LABEL_4;
        case 4u:
          uint64_t v8 = PBReaderReadData();
          uint64_t v9 = 24;
LABEL_4:
          id v10 = *(void **)&self->PBCodable_opaque[v9];
          *(void *)&self->PBCodable_opaque[v9] = v8;

          goto LABEL_5;
        default:
          if ((PBReaderSkipValueWithTag() & 1) == 0) {
            return 0;
          }
LABEL_5:
          int v4 = OBJC_IVAR___PBDataReader__pos;
          unint64_t v5 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
          unint64_t v6 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length);
          if (v5 >= v6) {
            return *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
          }
          break;
      }
    }
    unint64_t v13 = 0;
LABEL_39:
    unsigned char *v11 = 1;
    goto LABEL_40;
  }
  return *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = +[NSMutableDictionary dictionary];
  int v4 = v3;
  serviceName = self->_serviceName;
  if (serviceName) {
    [v3 setObject:serviceName forKey:@"serviceName"];
  }
  authTag = self->_authTag;
  if (authTag) {
    [v4 setObject:authTag forKey:@"authTag"];
  }
  advertisingNonce = self->_advertisingNonce;
  if (advertisingNonce) {
    [v4 setObject:advertisingNonce forKey:@"advertisingNonce"];
  }
  deviceTypeHash = self->_deviceTypeHash;
  if (deviceTypeHash) {
    [v4 setObject:deviceTypeHash forKey:@"deviceTypeHash"];
  }

  return v4;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)NRNANServiceInfo;
  NSUInteger v3 = [(NRNANServiceInfo *)&v7 description];
  int v4 = [(NRNANServiceInfo *)self dictionaryRepresentation];
  unint64_t v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

@end