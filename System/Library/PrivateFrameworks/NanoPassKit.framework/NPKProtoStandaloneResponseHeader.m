@interface NPKProtoStandaloneResponseHeader
- (BOOL)hasSessionIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)sessionIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)protocolVersionAsString:(int)a3;
- (int)StringAsProtocolVersion:(id)a3;
- (int)protocolVersion;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setProtocolVersion:(int)a3;
- (void)setSessionIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoStandaloneResponseHeader

- (id)protocolVersionAsString:(int)a3
{
  if (a3 == 1)
  {
    v4 = @"Version1";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (int)StringAsProtocolVersion:(id)a3
{
  return 1;
}

- (BOOL)hasSessionIdentifier
{
  return self->_sessionIdentifier != 0;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoStandaloneResponseHeader;
  v4 = [(NPKProtoStandaloneResponseHeader *)&v8 description];
  v5 = [(NPKProtoStandaloneResponseHeader *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
  if (self->_protocolVersion == 1)
  {
    v4 = @"Version1";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_protocolVersion);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  [v3 setObject:v4 forKey:@"protocolVersion"];

  sessionIdentifier = self->_sessionIdentifier;
  if (sessionIdentifier) {
    [v3 setObject:sessionIdentifier forKey:@"sessionIdentifier"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoStandaloneResponseHeaderReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  PBDataWriterWriteInt32Field();
  if (self->_sessionIdentifier) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  *((_DWORD *)a3 + 2) = self->_protocolVersion;
  sessionIdentifier = self->_sessionIdentifier;
  if (sessionIdentifier) {
    [a3 setSessionIdentifier:sessionIdentifier];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_DWORD *)(v5 + 8) = self->_protocolVersion;
  uint64_t v6 = [(NSString *)self->_sessionIdentifier copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && self->_protocolVersion == *((_DWORD *)v4 + 2))
  {
    sessionIdentifier = self->_sessionIdentifier;
    if ((unint64_t)sessionIdentifier | v4[2]) {
      char v6 = -[NSString isEqual:](sessionIdentifier, "isEqual:");
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
  uint64_t v2 = 2654435761 * self->_protocolVersion;
  return [(NSString *)self->_sessionIdentifier hash] ^ v2;
}

- (void)mergeFrom:(id)a3
{
  self->_protocolVersion = *((_DWORD *)a3 + 2);
  if (*((void *)a3 + 2)) {
    -[NPKProtoStandaloneResponseHeader setSessionIdentifier:](self, "setSessionIdentifier:");
  }
}

- (int)protocolVersion
{
  return self->_protocolVersion;
}

- (void)setProtocolVersion:(int)a3
{
  self->_protocolVersion = a3;
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void)setSessionIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end