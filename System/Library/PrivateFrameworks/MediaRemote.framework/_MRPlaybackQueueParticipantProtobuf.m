@interface _MRPlaybackQueueParticipantProtobuf
- (BOOL)hasIdentifier;
- (BOOL)hasIdentity;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)identifier;
- (_MRUserIdentityProtobuf)identity;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setIdentity:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRPlaybackQueueParticipantProtobuf

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (BOOL)hasIdentity
{
  return self->_identity != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRPlaybackQueueParticipantProtobuf;
  v4 = [(_MRPlaybackQueueParticipantProtobuf *)&v8 description];
  v5 = [(_MRPlaybackQueueParticipantProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  identifier = self->_identifier;
  if (identifier) {
    [v3 setObject:identifier forKey:@"identifier"];
  }
  identity = self->_identity;
  if (identity)
  {
    v7 = [(_MRUserIdentityProtobuf *)identity dictionaryRepresentation];
    [v4 setObject:v7 forKey:@"identity"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return _MRPlaybackQueueParticipantProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_identifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_identity)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_identifier)
  {
    objc_msgSend(v4, "setIdentifier:");
    id v4 = v5;
  }
  if (self->_identity)
  {
    objc_msgSend(v5, "setIdentity:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_identifier copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = [(_MRUserIdentityProtobuf *)self->_identity copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((identifier = self->_identifier, !((unint64_t)identifier | v4[1]))
     || -[NSString isEqual:](identifier, "isEqual:")))
  {
    identity = self->_identity;
    if ((unint64_t)identity | v4[2]) {
      char v7 = -[_MRUserIdentityProtobuf isEqual:](identity, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_identifier hash];
  return [(_MRUserIdentityProtobuf *)self->_identity hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v7 = v4;
  if (v4[1])
  {
    -[_MRPlaybackQueueParticipantProtobuf setIdentifier:](self, "setIdentifier:");
    id v4 = v7;
  }
  identity = self->_identity;
  uint64_t v6 = v4[2];
  if (identity)
  {
    if (v6) {
      -[_MRUserIdentityProtobuf mergeFrom:](identity, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[_MRPlaybackQueueParticipantProtobuf setIdentity:](self, "setIdentity:");
  }

  MEMORY[0x1F41817F8]();
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (_MRUserIdentityProtobuf)identity
{
  return self->_identity;
}

- (void)setIdentity:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identity, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end