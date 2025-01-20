@interface MBSFileCommitResult
- (BOOL)hasFileID;
- (BOOL)hasResult;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)fileID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)result;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setFileID:(id)a3;
- (void)setHasResult:(BOOL)a3;
- (void)setResult:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation MBSFileCommitResult

- (void)dealloc
{
  [(MBSFileCommitResult *)self setFileID:0];
  v3.receiver = self;
  v3.super_class = (Class)MBSFileCommitResult;
  [(MBSFileCommitResult *)&v3 dealloc];
}

- (BOOL)hasFileID
{
  return self->_fileID != 0;
}

- (int)result
{
  if (*(unsigned char *)&self->_has) {
    return self->_result;
  }
  else {
    return 0;
  }
}

- (void)setResult:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_result = a3;
}

- (void)setHasResult:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasResult
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)MBSFileCommitResult;
  return +[NSString stringWithFormat:@"%@ %@", [(MBSFileCommitResult *)&v3 description], [(MBSFileCommitResult *)self dictionaryRepresentation]];
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  fileID = self->_fileID;
  if (fileID) {
    [v3 setObject:fileID forKey:@"fileID"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v6 = self->_result;
    if (v6 >= 3) {
      v7 = +[NSString stringWithFormat:@"(unknown: %i)", self->_result];
    }
    else {
      v7 = (NSString *)*(&off_100417F60 + v6);
    }
    [v4 setObject:v7 forKey:@"result"];
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
      BOOL v10 = v6++ >= 9;
      if (v10)
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
    int v13 = (unsigned __int16)(v7 >> 3);
    if (v13 == 2)
    {
      char v15 = 0;
      unsigned int v16 = 0;
      uint64_t v17 = 0;
      *(unsigned char *)&self->_has |= 1u;
      while (1)
      {
        unint64_t v18 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
        if (v18 == -1 || v18 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length)) {
          break;
        }
        char v19 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v18);
        *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v18 + 1;
        v17 |= (unint64_t)(v19 & 0x7F) << v15;
        if ((v19 & 0x80) == 0) {
          goto LABEL_30;
        }
        v15 += 7;
        BOOL v10 = v16++ >= 9;
        if (v10)
        {
          LODWORD(v17) = 0;
          goto LABEL_32;
        }
      }
      *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_30:
      if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
        LODWORD(v17) = 0;
      }
LABEL_32:
      self->_result = v17;
    }
    else if (v13 == 1)
    {
      Data = (void *)PBReaderReadData();

      self->_fileID = (NSData *)Data;
    }
    else
    {
      int v20 = PBReaderSkipValueWithTag();
      if (!v20) {
        return v20;
      }
    }
  }
  LOBYTE(v20) = *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
  return v20;
}

- (void)writeTo:(id)a3
{
  if (self->_fileID) {
    PBDataWriterWriteDataField();
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
  }
}

- (void)copyTo:(id)a3
{
  if (self->_fileID) {
    objc_msgSend(a3, "setFileID:");
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)a3 + 4) = self->_result;
    *((unsigned char *)a3 + 20) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  char v5 = (id *)objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  v5[1] = [(NSData *)self->_fileID copyWithZone:a3];
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v5 + 4) = self->_result;
    *((unsigned char *)v5 + 20) |= 1u;
  }
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
      LOBYTE(v5) = (*((unsigned char *)a3 + 20) & 1) == 0;
      if (*(unsigned char *)&self->_has) {
        LOBYTE(v5) = (*((unsigned char *)a3 + 20) & 1) != 0 && self->_result == *((_DWORD *)a3 + 4);
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3 = (unint64_t)[(NSData *)self->_fileID hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_result;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[MBSFileCommitResult setFileID:](self, "setFileID:");
  }
  if (*((unsigned char *)a3 + 20))
  {
    self->_result = *((_DWORD *)a3 + 4);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSData)fileID
{
  return self->_fileID;
}

- (void)setFileID:(id)a3
{
}

@end