@interface _MRPlaybackSessionMigrateEndMessageProtobuf
- (BOOL)hasErrorCode;
- (BOOL)hasErrorDescription;
- (BOOL)hasPlayerPath;
- (BOOL)hasRequest;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)errorDescription;
- (_MRNowPlayingPlayerPathProtobuf)playerPath;
- (_MRPlaybackSessionRequestProtobuf)request;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)errorCode;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setErrorCode:(int64_t)a3;
- (void)setErrorDescription:(id)a3;
- (void)setHasErrorCode:(BOOL)a3;
- (void)setPlayerPath:(id)a3;
- (void)setRequest:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRPlaybackSessionMigrateEndMessageProtobuf

- (BOOL)hasRequest
{
  return self->_request != 0;
}

- (BOOL)hasPlayerPath
{
  return self->_playerPath != 0;
}

- (void)setErrorCode:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_errorCode = a3;
}

- (void)setHasErrorCode:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasErrorCode
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasErrorDescription
{
  return self->_errorDescription != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRPlaybackSessionMigrateEndMessageProtobuf;
  v4 = [(_MRPlaybackSessionMigrateEndMessageProtobuf *)&v8 description];
  v5 = [(_MRPlaybackSessionMigrateEndMessageProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  request = self->_request;
  if (request)
  {
    v5 = [(_MRPlaybackSessionRequestProtobuf *)request dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"request"];
  }
  playerPath = self->_playerPath;
  if (playerPath)
  {
    v7 = [(_MRNowPlayingPlayerPathProtobuf *)playerPath dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"playerPath"];
  }
  if (*(unsigned char *)&self->_has)
  {
    objc_super v8 = [NSNumber numberWithLongLong:self->_errorCode];
    [v3 setObject:v8 forKey:@"errorCode"];
  }
  errorDescription = self->_errorDescription;
  if (errorDescription) {
    [v3 setObject:errorDescription forKey:@"errorDescription"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRPlaybackSessionMigrateEndMessageProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_request)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_playerPath)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v5;
  }
  if (self->_errorDescription)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_request)
  {
    objc_msgSend(v4, "setRequest:");
    id v4 = v5;
  }
  if (self->_playerPath)
  {
    objc_msgSend(v5, "setPlayerPath:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = self->_errorCode;
    *((unsigned char *)v4 + 40) |= 1u;
  }
  if (self->_errorDescription)
  {
    objc_msgSend(v5, "setErrorDescription:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(_MRPlaybackSessionRequestProtobuf *)self->_request copyWithZone:a3];
  v7 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v6;

  id v8 = [(_MRNowPlayingPlayerPathProtobuf *)self->_playerPath copyWithZone:a3];
  v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_errorCode;
    *(unsigned char *)(v5 + 40) |= 1u;
  }
  uint64_t v10 = [(NSString *)self->_errorDescription copyWithZone:a3];
  v11 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v10;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  request = self->_request;
  if ((unint64_t)request | *((void *)v4 + 4))
  {
    if (!-[_MRPlaybackSessionRequestProtobuf isEqual:](request, "isEqual:")) {
      goto LABEL_13;
    }
  }
  playerPath = self->_playerPath;
  if ((unint64_t)playerPath | *((void *)v4 + 3))
  {
    if (!-[_MRNowPlayingPlayerPathProtobuf isEqual:](playerPath, "isEqual:")) {
      goto LABEL_13;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_errorCode != *((void *)v4 + 1)) {
      goto LABEL_13;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
LABEL_13:
    char v8 = 0;
    goto LABEL_14;
  }
  errorDescription = self->_errorDescription;
  if ((unint64_t)errorDescription | *((void *)v4 + 2)) {
    char v8 = -[NSString isEqual:](errorDescription, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_MRPlaybackSessionRequestProtobuf *)self->_request hash];
  unint64_t v4 = [(_MRNowPlayingPlayerPathProtobuf *)self->_playerPath hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_errorCode;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5 ^ [(NSString *)self->_errorDescription hash];
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  request = self->_request;
  uint64_t v6 = v4[4];
  v9 = v4;
  if (request)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[_MRPlaybackSessionRequestProtobuf mergeFrom:](request, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[_MRPlaybackSessionMigrateEndMessageProtobuf setRequest:](self, "setRequest:");
  }
  unint64_t v4 = v9;
LABEL_7:
  playerPath = self->_playerPath;
  uint64_t v8 = v4[3];
  if (playerPath)
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[_MRNowPlayingPlayerPathProtobuf mergeFrom:](playerPath, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[_MRPlaybackSessionMigrateEndMessageProtobuf setPlayerPath:](self, "setPlayerPath:");
  }
  unint64_t v4 = v9;
LABEL_13:
  if (v4[5])
  {
    self->_errorCode = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (v4[2]) {
    -[_MRPlaybackSessionMigrateEndMessageProtobuf setErrorDescription:](self, "setErrorDescription:");
  }

  MEMORY[0x1F41817F8]();
}

- (_MRPlaybackSessionRequestProtobuf)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
}

- (_MRNowPlayingPlayerPathProtobuf)playerPath
{
  return self->_playerPath;
}

- (void)setPlayerPath:(id)a3
{
}

- (int64_t)errorCode
{
  return self->_errorCode;
}

- (NSString)errorDescription
{
  return self->_errorDescription;
}

- (void)setErrorDescription:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_playerPath, 0);

  objc_storeStrong((id *)&self->_errorDescription, 0);
}

@end