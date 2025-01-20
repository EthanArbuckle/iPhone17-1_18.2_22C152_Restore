@interface NBPBCreateBackupResponse
- (BOOL)hasBackup;
- (BOOL)hasError;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NBPBBackupMetadata)backup;
- (NSData)error;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBackup:(id)a3;
- (void)setError:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NBPBCreateBackupResponse

- (BOOL)hasBackup
{
  return self->_backup != 0;
}

- (BOOL)hasError
{
  return self->_error != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)NBPBCreateBackupResponse;
  v3 = [(NBPBCreateBackupResponse *)&v7 description];
  v4 = [(NBPBCreateBackupResponse *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  backup = self->_backup;
  if (backup)
  {
    v5 = [(NBPBBackupMetadata *)backup dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"backup"];
  }
  error = self->_error;
  if (error) {
    [v3 setObject:error forKey:@"error"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100010F98((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_backup)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_error)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_backup)
  {
    objc_msgSend(v4, "setBackup:");
    id v4 = v5;
  }
  if (self->_error)
  {
    objc_msgSend(v5, "setError:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NBPBBackupMetadata *)self->_backup copyWithZone:a3];
  objc_super v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = [(NSData *)self->_error copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((backup = self->_backup, !((unint64_t)backup | v4[1]))
     || -[NBPBBackupMetadata isEqual:](backup, "isEqual:")))
  {
    error = self->_error;
    if ((unint64_t)error | v4[2]) {
      unsigned __int8 v7 = -[NSData isEqual:](error, "isEqual:");
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
  unint64_t v3 = [(NBPBBackupMetadata *)self->_backup hash];
  return (unint64_t)[(NSData *)self->_error hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  backup = self->_backup;
  uint64_t v6 = v4[1];
  unsigned __int8 v7 = v4;
  if (backup)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[NBPBBackupMetadata mergeFrom:](backup, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[NBPBCreateBackupResponse setBackup:](self, "setBackup:");
  }
  id v4 = v7;
LABEL_7:
  if (v4[2]) {
    -[NBPBCreateBackupResponse setError:](self, "setError:");
  }

  _objc_release_x1();
}

- (NBPBBackupMetadata)backup
{
  return self->_backup;
}

- (void)setBackup:(id)a3
{
}

- (NSData)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);

  objc_storeStrong((id *)&self->_backup, 0);
}

@end