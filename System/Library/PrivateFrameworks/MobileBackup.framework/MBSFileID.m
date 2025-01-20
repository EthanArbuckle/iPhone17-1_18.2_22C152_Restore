@interface MBSFileID
+ (id)fileIDWithData:(id)a3;
+ (id)fileIDWithMBFileID:(id)a3;
- (BOOL)hasFileID;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)fileID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setFileID:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation MBSFileID

- (void)dealloc
{
  [(MBSFileID *)self setFileID:0];
  v3.receiver = self;
  v3.super_class = (Class)MBSFileID;
  [(MBSFileID *)&v3 dealloc];
}

- (BOOL)hasFileID
{
  return self->_fileID != 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)MBSFileID;
  return +[NSString stringWithFormat:@"%@ %@", [(MBSFileID *)&v3 description], [(MBSFileID *)self dictionaryRepresentation]];
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  fileID = self->_fileID;
  if (fileID) {
    [v3 setObject:fileID forKey:@"fileID"];
  }
  return v4;
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
      break;
    }
    if ((v7 & 0x7FFF8) == 8)
    {
      Data = (void *)PBReaderReadData();

      self->_fileID = (NSData *)Data;
    }
    else
    {
      int v14 = PBReaderSkipValueWithTag();
      if (!v14) {
        return v14;
      }
    }
  }
  LOBYTE(v14) = *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
  return v14;
}

- (void)writeTo:(id)a3
{
  if (self->_fileID) {
    PBDataWriterWriteDataField();
  }
}

- (void)copyTo:(id)a3
{
  fileID = self->_fileID;
  if (fileID) {
    [a3 setFileID:fileID];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  char v5 = (id *)objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  v5[1] = [(NSData *)self->_fileID copyWithZone:a3];
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    fileID = self->_fileID;
    if ((unint64_t)fileID | *((void *)a3 + 1))
    {
      LOBYTE(v5) = -[NSData isEqual:](fileID, "isEqual:");
    }
    else
    {
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  return (unint64_t)[(NSData *)self->_fileID hash];
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[MBSFileID setFileID:](self, "setFileID:");
  }
}

- (NSData)fileID
{
  return self->_fileID;
}

- (void)setFileID:(id)a3
{
}

+ (id)fileIDWithData:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(MBSFileID);
  [(MBSFileID *)v4 setFileID:v3];

  return v4;
}

+ (id)fileIDWithMBFileID:(id)a3
{
  id v3 = [a3 data];
  v4 = +[MBSFileID fileIDWithData:v3];

  return v4;
}

@end