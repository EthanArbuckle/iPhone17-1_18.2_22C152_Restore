@interface _MRPlaybackQueueContextProtobuf
- (BOOL)hasRevision;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)revision;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setRevision:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRPlaybackQueueContextProtobuf

- (BOOL)hasRevision
{
  return self->_revision != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRPlaybackQueueContextProtobuf;
  v4 = [(_MRPlaybackQueueContextProtobuf *)&v8 description];
  v5 = [(_MRPlaybackQueueContextProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  revision = self->_revision;
  if (revision) {
    [v3 setObject:revision forKey:@"revision"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return _MRPlaybackQueueContextProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_revision) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  revision = self->_revision;
  if (revision) {
    [a3 setRevision:revision];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_revision copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    revision = self->_revision;
    if ((unint64_t)revision | v4[1]) {
      char v6 = -[NSString isEqual:](revision, "isEqual:");
    }
    else {
      char v6 = 1;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return [(NSString *)self->_revision hash];
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[_MRPlaybackQueueContextProtobuf setRevision:](self, "setRevision:");
  }
}

- (NSString)revision
{
  return self->_revision;
}

- (void)setRevision:(id)a3
{
}

- (void).cxx_destruct
{
}

@end