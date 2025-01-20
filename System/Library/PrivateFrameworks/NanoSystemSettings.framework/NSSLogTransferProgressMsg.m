@interface NSSLogTransferProgressMsg
- (BOOL)hasPath;
- (BOOL)hasProgress;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)path;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)progress;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasProgress:(BOOL)a3;
- (void)setPath:(id)a3;
- (void)setProgress:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation NSSLogTransferProgressMsg

- (BOOL)hasPath
{
  return self->_path != 0;
}

- (void)setProgress:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_progress = a3;
}

- (void)setHasProgress:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasProgress
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NSSLogTransferProgressMsg;
  v4 = [(NSSLogTransferProgressMsg *)&v8 description];
  v5 = [(NSSLogTransferProgressMsg *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  path = self->_path;
  if (path) {
    [v3 setObject:path forKey:@"path"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v6 = [NSNumber numberWithUnsignedLongLong:self->_progress];
    [v4 setObject:v6 forKey:@"progress"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NSSLogTransferProgressMsgReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_path)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (self->_path)
  {
    id v5 = v4;
    objc_msgSend(v4, "setPath:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = self->_progress;
    *((unsigned char *)v4 + 24) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_path copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_progress;
    *(unsigned char *)(v5 + 24) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_8;
  }
  path = self->_path;
  if ((unint64_t)path | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](path, "isEqual:")) {
      goto LABEL_8;
    }
  }
  BOOL v6 = (*((unsigned char *)v4 + 24) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) != 0 && self->_progress == *((void *)v4 + 1))
    {
      BOOL v6 = 1;
      goto LABEL_9;
    }
LABEL_8:
    BOOL v6 = 0;
  }
LABEL_9:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_path hash];
  if (*(unsigned char *)&self->_has) {
    unint64_t v4 = 2654435761u * self->_progress;
  }
  else {
    unint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = (unint64_t *)a3;
  if (v4[2])
  {
    uint64_t v5 = v4;
    -[NSSLogTransferProgressMsg setPath:](self, "setPath:");
    unint64_t v4 = v5;
  }
  if (v4[3])
  {
    self->_progress = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
}

- (unint64_t)progress
{
  return self->_progress;
}

- (void).cxx_destruct
{
}

@end