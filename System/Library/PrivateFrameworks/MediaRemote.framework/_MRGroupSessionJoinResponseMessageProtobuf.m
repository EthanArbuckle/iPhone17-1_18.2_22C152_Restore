@interface _MRGroupSessionJoinResponseMessageProtobuf
- (BOOL)approved;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)participantIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setApproved:(BOOL)a3;
- (void)setParticipantIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRGroupSessionJoinResponseMessageProtobuf

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRGroupSessionJoinResponseMessageProtobuf;
  v4 = [(_MRGroupSessionJoinResponseMessageProtobuf *)&v8 description];
  v5 = [(_MRGroupSessionJoinResponseMessageProtobuf *)self dictionaryRepresentation];
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
  v6 = [NSNumber numberWithBool:self->_approved];
  [v4 setObject:v6 forKey:@"approved"];

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return _MRGroupSessionJoinResponseMessageProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_participantIdentifier) {
    -[_MRGroupSessionJoinResponseMessageProtobuf writeTo:]();
  }
  id v5 = v4;
  PBDataWriterWriteStringField();
  PBDataWriterWriteBOOLField();
}

- (void)copyTo:(id)a3
{
  participantIdentifier = self->_participantIdentifier;
  id v5 = a3;
  [v5 setParticipantIdentifier:participantIdentifier];
  v5[16] = self->_approved;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_participantIdentifier copyWithZone:a3];
  v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  *(unsigned char *)(v5 + 16) = self->_approved;
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((participantIdentifier = self->_participantIdentifier,
         !((unint64_t)participantIdentifier | *((void *)v4 + 1)))
     || -[NSString isEqual:](participantIdentifier, "isEqual:")))
  {
    if (self->_approved) {
      BOOL v6 = v4[16] != 0;
    }
    else {
      BOOL v6 = v4[16] == 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return (2654435761 * self->_approved) ^ [(NSString *)self->_participantIdentifier hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = (BOOL *)a3;
  if (*((void *)v4 + 1))
  {
    uint64_t v5 = v4;
    -[_MRGroupSessionJoinResponseMessageProtobuf setParticipantIdentifier:](self, "setParticipantIdentifier:");
    id v4 = v5;
  }
  self->_approved = v4[16];
}

- (NSString)participantIdentifier
{
  return self->_participantIdentifier;
}

- (void)setParticipantIdentifier:(id)a3
{
}

- (BOOL)approved
{
  return self->_approved;
}

- (void)setApproved:(BOOL)a3
{
  self->_approved = a3;
}

- (void).cxx_destruct
{
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[_MRGroupSessionJoinResponseMessageProtobuf writeTo:]", "_MRGroupSessionJoinResponseMessageProtobuf.m", 79, "nil != self->_participantIdentifier");
}

@end