@interface MBSFilePutReceipt
- (BOOL)hasFileID;
- (BOOL)hasPutReceipt;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)fileID;
- (NSString)putReceipt;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setFileID:(id)a3;
- (void)setPutReceipt:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation MBSFilePutReceipt

- (void)dealloc
{
  [(MBSFilePutReceipt *)self setFileID:0];
  [(MBSFilePutReceipt *)self setPutReceipt:0];
  v3.receiver = self;
  v3.super_class = (Class)MBSFilePutReceipt;
  [(MBSFilePutReceipt *)&v3 dealloc];
}

- (BOOL)hasFileID
{
  return self->_fileID != 0;
}

- (BOOL)hasPutReceipt
{
  return self->_putReceipt != 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)MBSFilePutReceipt;
  return +[NSString stringWithFormat:@"%@ %@", [(MBSFilePutReceipt *)&v3 description], [(MBSFilePutReceipt *)self dictionaryRepresentation]];
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  fileID = self->_fileID;
  if (fileID) {
    [v3 setObject:fileID forKey:@"fileID"];
  }
  putReceipt = self->_putReceipt;
  if (putReceipt) {
    [v4 setObject:putReceipt forKey:@"putReceipt"];
  }
  return v4;
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
      uint64_t v7 = 0;
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
          LODWORD(v7) = 0;
          int v11 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
          goto LABEL_13;
        }
      }
      *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
      int v11 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
      if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
        LODWORD(v7) = 0;
      }
LABEL_13:
      if (v11 || (v7 & 7) == 4) {
        return *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
      }
      int v13 = (unsigned __int16)(v7 >> 3);
      if (v13 == 2) {
        break;
      }
      if (v13 == 1)
      {
        Data = (void *)PBReaderReadData();
        v15 = &OBJC_IVAR___MBSFilePutReceipt__fileID;
LABEL_21:

        *(void *)&self->PBCodable_opaque[*v15] = Data;
        goto LABEL_23;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_23:
      if (*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) >= *(void *)((char *)a3
                                                                                + OBJC_IVAR___PBDataReader__length))
        return *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
    }
    Data = (void *)PBReaderReadString();
    v15 = &OBJC_IVAR___MBSFilePutReceipt__putReceipt;
    goto LABEL_21;
  }
  return *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
}

- (void)writeTo:(id)a3
{
  if (self->_fileID) {
    PBDataWriterWriteDataField();
  }
  if (self->_putReceipt)
  {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  if (self->_fileID) {
    objc_msgSend(a3, "setFileID:");
  }
  if (self->_putReceipt)
  {
    objc_msgSend(a3, "setPutReceipt:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  char v5 = (id *)objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  v5[1] = [(NSData *)self->_fileID copyWithZone:a3];
  v5[2] = [(NSString *)self->_putReceipt copyWithZone:a3];
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    fileID = self->_fileID;
    if (!((unint64_t)fileID | *((void *)a3 + 1))
      || (unsigned int v5 = -[NSData isEqual:](fileID, "isEqual:")) != 0)
    {
      putReceipt = self->_putReceipt;
      if ((unint64_t)putReceipt | *((void *)a3 + 2))
      {
        LOBYTE(v5) = -[NSString isEqual:](putReceipt, "isEqual:");
      }
      else
      {
        LOBYTE(v5) = 1;
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3 = (unint64_t)[(NSData *)self->_fileID hash];
  return [(NSString *)self->_putReceipt hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[MBSFilePutReceipt setFileID:](self, "setFileID:");
  }
  if (*((void *)a3 + 2))
  {
    -[MBSFilePutReceipt setPutReceipt:](self, "setPutReceipt:");
  }
}

- (NSData)fileID
{
  return self->_fileID;
}

- (void)setFileID:(id)a3
{
}

- (NSString)putReceipt
{
  return self->_putReceipt;
}

- (void)setPutReceipt:(id)a3
{
}

@end