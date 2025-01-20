@interface KCSharingPBLocalEntryData
- (BOOL)hasCloudKitRecord;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)cloudKitRecord;
- (PBUnknownFields)unknownFields;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setCloudKitRecord:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation KCSharingPBLocalEntryData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudKitRecord, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

- (void)setCloudKitRecord:(id)a3
{
}

- (NSData)cloudKitRecord
{
  return self->_cloudKitRecord;
}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 2)) {
    -[KCSharingPBLocalEntryData setCloudKitRecord:](self, "setCloudKitRecord:");
  }
}

- (unint64_t)hash
{
  return (unint64_t)[(NSData *)self->_cloudKitRecord hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    cloudKitRecord = self->_cloudKitRecord;
    if ((unint64_t)cloudKitRecord | v4[2]) {
      unsigned __int8 v6 = -[NSData isEqual:](cloudKitRecord, "isEqual:");
    }
    else {
      unsigned __int8 v6 = 1;
    }
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3) init];
  id v6 = [(NSData *)self->_cloudKitRecord copyWithZone:a3];
  v7 = (void *)*((void *)v5 + 2);
  *((void *)v5 + 2) = v6;

  objc_storeStrong((id *)v5 + 1, self->_unknownFields);
  return v5;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_cloudKitRecord)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
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
      break;
    }
    if ((v7 >> 3) == 1)
    {
      PBReaderReadData();
      v13 = (NSData *)objc_claimAutoreleasedReturnValue();
      cloudKitRecord = self->_cloudKitRecord;
      self->_cloudKitRecord = v13;
    }
    else
    {
      if (!self->_unknownFields)
      {
        v15 = (PBUnknownFields *)objc_alloc_init((Class)PBUnknownFields);
        unknownFields = self->_unknownFields;
        self->_unknownFields = v15;
      }
      int v17 = PBUnknownFieldAdd();
      if (!v17) {
        return v17;
      }
    }
  }
  LOBYTE(v17) = *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
  return v17;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  id v4 = v3;
  cloudKitRecord = self->_cloudKitRecord;
  if (cloudKitRecord) {
    [v3 setObject:cloudKitRecord forKey:@"cloudKitRecord"];
  }
  unknownFields = self->_unknownFields;
  if (unknownFields)
  {
    unint64_t v7 = [(PBUnknownFields *)unknownFields dictionaryRepresentation];
    [v4 setObject:v7 forKey:@"Unknown Fields"];
  }

  return v4;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)KCSharingPBLocalEntryData;
  v3 = [(KCSharingPBLocalEntryData *)&v7 description];
  id v4 = [(KCSharingPBLocalEntryData *)self dictionaryRepresentation];
  char v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (BOOL)hasCloudKitRecord
{
  return self->_cloudKitRecord != 0;
}

@end