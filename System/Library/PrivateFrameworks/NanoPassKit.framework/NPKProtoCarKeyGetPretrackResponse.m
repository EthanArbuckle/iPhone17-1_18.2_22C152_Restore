@interface NPKProtoCarKeyGetPretrackResponse
- (BOOL)hasErrorData;
- (BOOL)hasPreTrackRequestData;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)errorData;
- (NSData)preTrackRequestData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setErrorData:(id)a3;
- (void)setPreTrackRequestData:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoCarKeyGetPretrackResponse

- (BOOL)hasPreTrackRequestData
{
  return self->_preTrackRequestData != 0;
}

- (BOOL)hasErrorData
{
  return self->_errorData != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoCarKeyGetPretrackResponse;
  v4 = [(NPKProtoCarKeyGetPretrackResponse *)&v8 description];
  v5 = [(NPKProtoCarKeyGetPretrackResponse *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  preTrackRequestData = self->_preTrackRequestData;
  if (preTrackRequestData) {
    [v3 setObject:preTrackRequestData forKey:@"preTrackRequestData"];
  }
  errorData = self->_errorData;
  if (errorData) {
    [v4 setObject:errorData forKey:@"errorData"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoCarKeyGetPretrackResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_preTrackRequestData)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_errorData)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_preTrackRequestData)
  {
    objc_msgSend(v4, "setPreTrackRequestData:");
    id v4 = v5;
  }
  if (self->_errorData)
  {
    objc_msgSend(v5, "setErrorData:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_preTrackRequestData copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  uint64_t v8 = [(NSData *)self->_errorData copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((preTrackRequestData = self->_preTrackRequestData, !((unint64_t)preTrackRequestData | v4[2]))
     || -[NSData isEqual:](preTrackRequestData, "isEqual:")))
  {
    errorData = self->_errorData;
    if ((unint64_t)errorData | v4[1]) {
      char v7 = -[NSData isEqual:](errorData, "isEqual:");
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
  uint64_t v3 = [(NSData *)self->_preTrackRequestData hash];
  return [(NSData *)self->_errorData hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4[2])
  {
    -[NPKProtoCarKeyGetPretrackResponse setPreTrackRequestData:](self, "setPreTrackRequestData:");
    id v4 = v5;
  }
  if (v4[1])
  {
    -[NPKProtoCarKeyGetPretrackResponse setErrorData:](self, "setErrorData:");
    id v4 = v5;
  }
}

- (NSData)preTrackRequestData
{
  return self->_preTrackRequestData;
}

- (void)setPreTrackRequestData:(id)a3
{
}

- (NSData)errorData
{
  return self->_errorData;
}

- (void)setErrorData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preTrackRequestData, 0);
  objc_storeStrong((id *)&self->_errorData, 0);
}

@end