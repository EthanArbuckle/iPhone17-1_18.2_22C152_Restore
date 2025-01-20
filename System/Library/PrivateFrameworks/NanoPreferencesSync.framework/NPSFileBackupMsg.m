@interface NPSFileBackupMsg
- (BOOL)hasFileData;
- (BOOL)hasFileURL;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)fileData;
- (NSData)fileURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setFileData:(id)a3;
- (void)setFileURL:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPSFileBackupMsg

- (BOOL)hasFileURL
{
  return self->_fileURL != 0;
}

- (BOOL)hasFileData
{
  return self->_fileData != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)NPSFileBackupMsg;
  v3 = [(NPSFileBackupMsg *)&v7 description];
  v4 = [(NPSFileBackupMsg *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  fileURL = self->_fileURL;
  if (fileURL) {
    [v3 setObject:fileURL forKey:@"fileURL"];
  }
  fileData = self->_fileData;
  if (fileData) {
    [v4 setObject:fileData forKey:@"fileData"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10001993C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_fileURL)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_fileData)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_fileURL)
  {
    objc_msgSend(v4, "setFileURL:");
    id v4 = v5;
  }
  if (self->_fileData)
  {
    objc_msgSend(v5, "setFileData:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSData *)self->_fileURL copyWithZone:a3];
  objc_super v7 = (void *)v5[2];
  v5[2] = v6;

  id v8 = [(NSData *)self->_fileData copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((fileURL = self->_fileURL, !((unint64_t)fileURL | v4[2]))
     || -[NSData isEqual:](fileURL, "isEqual:")))
  {
    fileData = self->_fileData;
    if ((unint64_t)fileData | v4[1]) {
      unsigned __int8 v7 = -[NSData isEqual:](fileData, "isEqual:");
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

- (unint64_t)hash
{
  unint64_t v3 = (unint64_t)[(NSData *)self->_fileURL hash];
  return (unint64_t)[(NSData *)self->_fileData hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4[2])
  {
    -[NPSFileBackupMsg setFileURL:](self, "setFileURL:");
    id v4 = v5;
  }
  if (v4[1])
  {
    -[NPSFileBackupMsg setFileData:](self, "setFileData:");
    id v4 = v5;
  }
}

- (NSData)fileURL
{
  return self->_fileURL;
}

- (void)setFileURL:(id)a3
{
}

- (NSData)fileData
{
  return self->_fileData;
}

- (void)setFileData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_fileData, 0);
}

@end