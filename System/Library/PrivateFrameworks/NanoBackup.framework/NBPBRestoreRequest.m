@interface NBPBRestoreRequest
- (BOOL)hasBackupID;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)backupID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBackupID:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NBPBRestoreRequest

- (BOOL)hasBackupID
{
  return self->_backupID != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)NBPBRestoreRequest;
  v3 = [(NBPBRestoreRequest *)&v7 description];
  v4 = [(NBPBRestoreRequest *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  backupID = self->_backupID;
  if (backupID) {
    [v3 setObject:backupID forKey:@"backupID"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10001CD98((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_backupID) {
    PBDataWriterWriteDataField();
  }
}

- (void)copyTo:(id)a3
{
  backupID = self->_backupID;
  if (backupID) {
    [a3 setBackupID:backupID];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSData *)self->_backupID copyWithZone:a3];
  objc_super v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    backupID = self->_backupID;
    if ((unint64_t)backupID | v4[1]) {
      unsigned __int8 v6 = -[NSData isEqual:](backupID, "isEqual:");
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

- (unint64_t)hash
{
  return (unint64_t)[(NSData *)self->_backupID hash];
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[NBPBRestoreRequest setBackupID:](self, "setBackupID:");
  }
}

- (NSData)backupID
{
  return self->_backupID;
}

- (void)setBackupID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end