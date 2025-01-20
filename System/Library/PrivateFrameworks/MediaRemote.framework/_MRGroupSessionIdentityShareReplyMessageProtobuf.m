@interface _MRGroupSessionIdentityShareReplyMessageProtobuf
- (BOOL)hasLeaderParticipant;
- (BOOL)hasLocalParticipant;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_MRGroupSessionParticipantProtobuf)leaderParticipant;
- (_MRGroupSessionParticipantProtobuf)localParticipant;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setLeaderParticipant:(id)a3;
- (void)setLocalParticipant:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRGroupSessionIdentityShareReplyMessageProtobuf

- (BOOL)hasLocalParticipant
{
  return self->_localParticipant != 0;
}

- (BOOL)hasLeaderParticipant
{
  return self->_leaderParticipant != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRGroupSessionIdentityShareReplyMessageProtobuf;
  v4 = [(_MRGroupSessionIdentityShareReplyMessageProtobuf *)&v8 description];
  v5 = [(_MRGroupSessionIdentityShareReplyMessageProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  localParticipant = self->_localParticipant;
  if (localParticipant)
  {
    v5 = [(_MRGroupSessionParticipantProtobuf *)localParticipant dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"localParticipant"];
  }
  leaderParticipant = self->_leaderParticipant;
  if (leaderParticipant)
  {
    v7 = [(_MRGroupSessionParticipantProtobuf *)leaderParticipant dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"leaderParticipant"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRGroupSessionIdentityShareReplyMessageProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_localParticipant)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_leaderParticipant)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_localParticipant)
  {
    objc_msgSend(v4, "setLocalParticipant:");
    id v4 = v5;
  }
  if (self->_leaderParticipant)
  {
    objc_msgSend(v5, "setLeaderParticipant:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(_MRGroupSessionParticipantProtobuf *)self->_localParticipant copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  id v8 = [(_MRGroupSessionParticipantProtobuf *)self->_leaderParticipant copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((localParticipant = self->_localParticipant, !((unint64_t)localParticipant | v4[2]))
     || -[_MRGroupSessionParticipantProtobuf isEqual:](localParticipant, "isEqual:")))
  {
    leaderParticipant = self->_leaderParticipant;
    if ((unint64_t)leaderParticipant | v4[1]) {
      char v7 = -[_MRGroupSessionParticipantProtobuf isEqual:](leaderParticipant, "isEqual:");
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
  unint64_t v3 = [(_MRGroupSessionParticipantProtobuf *)self->_localParticipant hash];
  return [(_MRGroupSessionParticipantProtobuf *)self->_leaderParticipant hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  localParticipant = self->_localParticipant;
  uint64_t v6 = v4[2];
  v9 = v4;
  if (localParticipant)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[_MRGroupSessionParticipantProtobuf mergeFrom:](localParticipant, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[_MRGroupSessionIdentityShareReplyMessageProtobuf setLocalParticipant:](self, "setLocalParticipant:");
  }
  id v4 = v9;
LABEL_7:
  leaderParticipant = self->_leaderParticipant;
  uint64_t v8 = v4[1];
  if (leaderParticipant)
  {
    if (v8) {
      -[_MRGroupSessionParticipantProtobuf mergeFrom:](leaderParticipant, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[_MRGroupSessionIdentityShareReplyMessageProtobuf setLeaderParticipant:](self, "setLeaderParticipant:");
  }

  MEMORY[0x1F41817F8]();
}

- (_MRGroupSessionParticipantProtobuf)localParticipant
{
  return self->_localParticipant;
}

- (void)setLocalParticipant:(id)a3
{
}

- (_MRGroupSessionParticipantProtobuf)leaderParticipant
{
  return self->_leaderParticipant;
}

- (void)setLeaderParticipant:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localParticipant, 0);

  objc_storeStrong((id *)&self->_leaderParticipant, 0);
}

@end