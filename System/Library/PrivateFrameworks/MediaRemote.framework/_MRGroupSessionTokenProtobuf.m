@interface _MRGroupSessionTokenProtobuf
- (BOOL)hasDisplayName;
- (BOOL)hasEquivalentMediaIdentifier;
- (BOOL)hasSessionIdentifier;
- (BOOL)hasSharedSecret;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)invitationData;
- (NSString)displayName;
- (NSString)equivalentMediaIdentifier;
- (NSString)sessionIdentifier;
- (NSString)sharedSecret;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)routeTypeAsString:(int)a3;
- (int)StringAsRouteType:(id)a3;
- (int)routeType;
- (unint64_t)hash;
- (unsigned)version;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setEquivalentMediaIdentifier:(id)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setInvitationData:(id)a3;
- (void)setRouteType:(int)a3;
- (void)setSessionIdentifier:(id)a3;
- (void)setSharedSecret:(id)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRGroupSessionTokenProtobuf

- (id)routeTypeAsString:(int)a3
{
  if a3 < 0xC && ((0xB27u >> a3))
  {
    v3 = off_1E57D59A8[a3];
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (int)StringAsRouteType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"GroupSessionRouteTypeUnknown"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"GroupSessionRouteTypeCarKit"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"GroupSessionRouteTypeCarPlay"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"GroupSessionRouteTypeSpeaker"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"GroupSessionRouteTypeHomePod"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"GroupSessionRouteTypeHomePodMini"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"GroupSessionRouteTypeAppleTV"])
  {
    int v4 = 11;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasDisplayName
{
  return self->_displayName != 0;
}

- (BOOL)hasSessionIdentifier
{
  return self->_sessionIdentifier != 0;
}

- (BOOL)hasSharedSecret
{
  return self->_sharedSecret != 0;
}

- (BOOL)hasEquivalentMediaIdentifier
{
  return self->_equivalentMediaIdentifier != 0;
}

- (void)setVersion:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasVersion
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRGroupSessionTokenProtobuf;
  int v4 = [(_MRGroupSessionTokenProtobuf *)&v8 description];
  v5 = [(_MRGroupSessionTokenProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  int v4 = v3;
  invitationData = self->_invitationData;
  if (invitationData) {
    [v3 setObject:invitationData forKey:@"invitationData"];
  }
  uint64_t routeType = self->_routeType;
  if routeType < 0xC && ((0xB27u >> routeType))
  {
    v7 = off_1E57D59A8[routeType];
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_routeType);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  [v4 setObject:v7 forKey:@"routeType"];

  displayName = self->_displayName;
  if (displayName) {
    [v4 setObject:displayName forKey:@"displayName"];
  }
  sessionIdentifier = self->_sessionIdentifier;
  if (sessionIdentifier) {
    [v4 setObject:sessionIdentifier forKey:@"sessionIdentifier"];
  }
  sharedSecret = self->_sharedSecret;
  if (sharedSecret) {
    [v4 setObject:sharedSecret forKey:@"sharedSecret"];
  }
  equivalentMediaIdentifier = self->_equivalentMediaIdentifier;
  if (equivalentMediaIdentifier) {
    [v4 setObject:equivalentMediaIdentifier forKey:@"equivalentMediaIdentifier"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v12 = [NSNumber numberWithUnsignedInt:self->_version];
    [v4 setObject:v12 forKey:@"version"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return _MRGroupSessionTokenProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_invitationData) {
    -[_MRGroupSessionTokenProtobuf writeTo:]();
  }
  id v6 = v4;
  PBDataWriterWriteDataField();
  PBDataWriterWriteInt32Field();
  if (self->_displayName) {
    PBDataWriterWriteStringField();
  }
  if (self->_sessionIdentifier) {
    PBDataWriterWriteStringField();
  }
  v5 = v6;
  if (self->_sharedSecret)
  {
    PBDataWriterWriteStringField();
    v5 = v6;
  }
  if (self->_equivalentMediaIdentifier)
  {
    PBDataWriterWriteStringField();
    v5 = v6;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint32Field();
    v5 = v6;
  }
}

- (void)copyTo:(id)a3
{
  v5 = a3;
  [v5 setInvitationData:self->_invitationData];
  id v4 = v5;
  v5[8] = self->_routeType;
  if (self->_displayName)
  {
    objc_msgSend(v5, "setDisplayName:");
    id v4 = v5;
  }
  if (self->_sessionIdentifier)
  {
    objc_msgSend(v5, "setSessionIdentifier:");
    id v4 = v5;
  }
  if (self->_sharedSecret)
  {
    objc_msgSend(v5, "setSharedSecret:");
    id v4 = v5;
  }
  if (self->_equivalentMediaIdentifier)
  {
    objc_msgSend(v5, "setEquivalentMediaIdentifier:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    v4[14] = self->_version;
    *((unsigned char *)v4 + 60) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_invitationData copyWithZone:a3];
  v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  *(_DWORD *)(v5 + 32) = self->_routeType;
  uint64_t v8 = [(NSString *)self->_displayName copyWithZone:a3];
  v9 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v8;

  uint64_t v10 = [(NSString *)self->_sessionIdentifier copyWithZone:a3];
  v11 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v10;

  uint64_t v12 = [(NSString *)self->_sharedSecret copyWithZone:a3];
  v13 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v12;

  uint64_t v14 = [(NSString *)self->_equivalentMediaIdentifier copyWithZone:a3];
  v15 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v14;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 56) = self->_version;
    *(unsigned char *)(v5 + 60) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  invitationData = self->_invitationData;
  if ((unint64_t)invitationData | *((void *)v4 + 3))
  {
    if (!-[NSData isEqual:](invitationData, "isEqual:")) {
      goto LABEL_17;
    }
  }
  if (self->_routeType != *((_DWORD *)v4 + 8)) {
    goto LABEL_17;
  }
  displayName = self->_displayName;
  if ((unint64_t)displayName | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](displayName, "isEqual:")) {
      goto LABEL_17;
    }
  }
  sessionIdentifier = self->_sessionIdentifier;
  if ((unint64_t)sessionIdentifier | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](sessionIdentifier, "isEqual:")) {
      goto LABEL_17;
    }
  }
  sharedSecret = self->_sharedSecret;
  if ((unint64_t)sharedSecret | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](sharedSecret, "isEqual:")) {
      goto LABEL_17;
    }
  }
  equivalentMediaIdentifier = self->_equivalentMediaIdentifier;
  if ((unint64_t)equivalentMediaIdentifier | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](equivalentMediaIdentifier, "isEqual:")) {
      goto LABEL_17;
    }
  }
  BOOL v10 = (*((unsigned char *)v4 + 60) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 60) & 1) != 0 && self->_version == *((_DWORD *)v4 + 14))
    {
      BOOL v10 = 1;
      goto LABEL_18;
    }
LABEL_17:
    BOOL v10 = 0;
  }
LABEL_18:

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_invitationData hash];
  uint64_t routeType = self->_routeType;
  NSUInteger v5 = [(NSString *)self->_displayName hash];
  NSUInteger v6 = [(NSString *)self->_sessionIdentifier hash];
  NSUInteger v7 = [(NSString *)self->_sharedSecret hash];
  NSUInteger v8 = [(NSString *)self->_equivalentMediaIdentifier hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v9 = 2654435761 * self->_version;
  }
  else {
    uint64_t v9 = 0;
  }
  return (2654435761 * routeType) ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*((void *)v4 + 3))
  {
    -[_MRGroupSessionTokenProtobuf setInvitationData:](self, "setInvitationData:");
    id v4 = v5;
  }
  self->_uint64_t routeType = *((_DWORD *)v4 + 8);
  if (*((void *)v4 + 1))
  {
    -[_MRGroupSessionTokenProtobuf setDisplayName:](self, "setDisplayName:");
    id v4 = v5;
  }
  if (*((void *)v4 + 5))
  {
    -[_MRGroupSessionTokenProtobuf setSessionIdentifier:](self, "setSessionIdentifier:");
    id v4 = v5;
  }
  if (*((void *)v4 + 6))
  {
    -[_MRGroupSessionTokenProtobuf setSharedSecret:](self, "setSharedSecret:");
    id v4 = v5;
  }
  if (*((void *)v4 + 2))
  {
    -[_MRGroupSessionTokenProtobuf setEquivalentMediaIdentifier:](self, "setEquivalentMediaIdentifier:");
    id v4 = v5;
  }
  if (*((unsigned char *)v4 + 60))
  {
    self->_version = *((_DWORD *)v4 + 14);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSData)invitationData
{
  return self->_invitationData;
}

- (void)setInvitationData:(id)a3
{
}

- (int)routeType
{
  return self->_routeType;
}

- (void)setRouteType:(int)a3
{
  self->_uint64_t routeType = a3;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void)setSessionIdentifier:(id)a3
{
}

- (NSString)sharedSecret
{
  return self->_sharedSecret;
}

- (void)setSharedSecret:(id)a3
{
}

- (NSString)equivalentMediaIdentifier
{
  return self->_equivalentMediaIdentifier;
}

- (void)setEquivalentMediaIdentifier:(id)a3
{
}

- (unsigned)version
{
  return self->_version;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedSecret, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_invitationData, 0);
  objc_storeStrong((id *)&self->_equivalentMediaIdentifier, 0);

  objc_storeStrong((id *)&self->_displayName, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[_MRGroupSessionTokenProtobuf writeTo:]", "_MRGroupSessionTokenProtobuf.m", 171, "nil != self->_invitationData");
}

@end