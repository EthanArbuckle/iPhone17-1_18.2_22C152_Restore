@interface NPKProtoHandleAppletStateChangeRequest
- (BOOL)hasPassAppletState;
- (BOOL)hasPassID;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)passAppletState;
- (NSString)passID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setPassAppletState:(id)a3;
- (void)setPassID:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoHandleAppletStateChangeRequest

- (BOOL)hasPassID
{
  return self->_passID != 0;
}

- (BOOL)hasPassAppletState
{
  return self->_passAppletState != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoHandleAppletStateChangeRequest;
  v4 = [(NPKProtoHandleAppletStateChangeRequest *)&v8 description];
  v5 = [(NPKProtoHandleAppletStateChangeRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  passID = self->_passID;
  if (passID) {
    [v3 setObject:passID forKey:@"passID"];
  }
  passAppletState = self->_passAppletState;
  if (passAppletState) {
    [v4 setObject:passAppletState forKey:@"passAppletState"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoHandleAppletStateChangeRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_passID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_passAppletState)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_passID)
  {
    objc_msgSend(v4, "setPassID:");
    id v4 = v5;
  }
  if (self->_passAppletState)
  {
    objc_msgSend(v5, "setPassAppletState:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_passID copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  uint64_t v8 = [(NSData *)self->_passAppletState copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((passID = self->_passID, !((unint64_t)passID | v4[2]))
     || -[NSString isEqual:](passID, "isEqual:")))
  {
    passAppletState = self->_passAppletState;
    if ((unint64_t)passAppletState | v4[1]) {
      char v7 = -[NSData isEqual:](passAppletState, "isEqual:");
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
  NSUInteger v3 = [(NSString *)self->_passID hash];
  return [(NSData *)self->_passAppletState hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4[2])
  {
    -[NPKProtoHandleAppletStateChangeRequest setPassID:](self, "setPassID:");
    id v4 = v5;
  }
  if (v4[1])
  {
    -[NPKProtoHandleAppletStateChangeRequest setPassAppletState:](self, "setPassAppletState:");
    id v4 = v5;
  }
}

- (NSString)passID
{
  return self->_passID;
}

- (void)setPassID:(id)a3
{
}

- (NSData)passAppletState
{
  return self->_passAppletState;
}

- (void)setPassAppletState:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passID, 0);
  objc_storeStrong((id *)&self->_passAppletState, 0);
}

@end