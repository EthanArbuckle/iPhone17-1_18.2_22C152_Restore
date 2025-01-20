@interface PAPBReplayKitAccess
- (BOOL)hasAccess;
- (BOOL)hasBroadcaster;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (PAPBAccess)access;
- (PAPBApplication)broadcaster;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setAccess:(id)a3;
- (void)setBroadcaster:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PAPBReplayKitAccess

- (BOOL)hasAccess
{
  return self->_access != 0;
}

- (BOOL)hasBroadcaster
{
  return self->_broadcaster != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PAPBReplayKitAccess;
  v4 = [(PAPBReplayKitAccess *)&v8 description];
  v5 = [(PAPBReplayKitAccess *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  access = self->_access;
  if (access)
  {
    v5 = [(PAPBAccess *)access dictionaryRepresentation];
    [v3 setObject:v5 forKeyedSubscript:@"access"];
  }
  broadcaster = self->_broadcaster;
  if (broadcaster)
  {
    v7 = [(PAPBApplication *)broadcaster dictionaryRepresentation];
    [v3 setObject:v7 forKeyedSubscript:@"broadcaster"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PAPBReplayKitAccessReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_access)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_broadcaster)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(PAPBAccess *)self->_access copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = [(PAPBApplication *)self->_broadcaster copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((access = self->_access, !((unint64_t)access | v4[1])) || -[PAPBAccess isEqual:](access, "isEqual:")))
  {
    broadcaster = self->_broadcaster;
    if ((unint64_t)broadcaster | v4[2]) {
      char v7 = -[PAPBApplication isEqual:](broadcaster, "isEqual:");
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
  unint64_t v3 = [(PAPBAccess *)self->_access hash];
  return [(PAPBApplication *)self->_broadcaster hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  access = self->_access;
  uint64_t v6 = v4[1];
  v9 = v4;
  if (access)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[PAPBAccess mergeFrom:](access, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[PAPBReplayKitAccess setAccess:](self, "setAccess:");
  }
  id v4 = v9;
LABEL_7:
  broadcaster = self->_broadcaster;
  uint64_t v8 = v4[2];
  if (broadcaster)
  {
    if (v8) {
      -[PAPBApplication mergeFrom:](broadcaster, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[PAPBReplayKitAccess setBroadcaster:](self, "setBroadcaster:");
  }

  MEMORY[0x1F41817F8]();
}

- (PAPBAccess)access
{
  return self->_access;
}

- (void)setAccess:(id)a3
{
}

- (PAPBApplication)broadcaster
{
  return self->_broadcaster;
}

- (void)setBroadcaster:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_broadcaster, 0);

  objc_storeStrong((id *)&self->_access, 0);
}

@end