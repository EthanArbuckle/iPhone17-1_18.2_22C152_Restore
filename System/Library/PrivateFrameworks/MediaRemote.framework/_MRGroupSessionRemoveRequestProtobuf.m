@interface _MRGroupSessionRemoveRequestProtobuf
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)participantIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setParticipantIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRGroupSessionRemoveRequestProtobuf

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRGroupSessionRemoveRequestProtobuf;
  v4 = [(_MRGroupSessionRemoveRequestProtobuf *)&v8 description];
  v5 = [(_MRGroupSessionRemoveRequestProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  participantIdentifier = self->_participantIdentifier;
  if (participantIdentifier) {
    [v3 setObject:participantIdentifier forKey:@"participantIdentifier"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return _MRGroupSessionRemoveRequestProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_participantIdentifier) {
    -[_MRGroupSessionRemoveRequestProtobuf writeTo:]();
  }
  id v5 = v4;
  PBDataWriterWriteStringField();
}

- (void)copyTo:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_participantIdentifier copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    participantIdentifier = self->_participantIdentifier;
    if ((unint64_t)participantIdentifier | v4[1]) {
      char v6 = -[NSString isEqual:](participantIdentifier, "isEqual:");
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
  return [(NSString *)self->_participantIdentifier hash];
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[_MRGroupSessionRemoveRequestProtobuf setParticipantIdentifier:](self, "setParticipantIdentifier:");
  }
}

- (NSString)participantIdentifier
{
  return self->_participantIdentifier;
}

- (void)setParticipantIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[_MRGroupSessionRemoveRequestProtobuf writeTo:]", "_MRGroupSessionRemoveRequestProtobuf.m", 72, "nil != self->_participantIdentifier");
}

@end