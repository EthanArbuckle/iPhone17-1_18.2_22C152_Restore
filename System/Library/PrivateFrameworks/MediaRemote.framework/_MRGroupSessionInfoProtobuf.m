@interface _MRGroupSessionInfoProtobuf
- (BOOL)hasEquivalentMediaIdentifier;
- (BOOL)hasPlaceholder;
- (BOOL)hosted;
- (BOOL)isEqual:(id)a3;
- (BOOL)placeholder;
- (BOOL)readFrom:(id)a3;
- (NSString)equivalentMediaIdentifier;
- (NSString)hostDisplayName;
- (NSString)identifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)routeTypeAsString:(int)a3;
- (int)StringAsRouteType:(id)a3;
- (int)routeType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEquivalentMediaIdentifier:(id)a3;
- (void)setHasPlaceholder:(BOOL)a3;
- (void)setHostDisplayName:(id)a3;
- (void)setHosted:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setPlaceholder:(BOOL)a3;
- (void)setRouteType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRGroupSessionInfoProtobuf

- (id)routeTypeAsString:(int)a3
{
  if a3 < 0xC && ((0xB27u >> a3))
  {
    v3 = off_1E57D8F88[a3];
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

- (BOOL)hasEquivalentMediaIdentifier
{
  return self->_equivalentMediaIdentifier != 0;
}

- (void)setPlaceholder:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_placeholder = a3;
}

- (void)setHasPlaceholder:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPlaceholder
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRGroupSessionInfoProtobuf;
  int v4 = [(_MRGroupSessionInfoProtobuf *)&v8 description];
  v5 = [(_MRGroupSessionInfoProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  int v4 = v3;
  identifier = self->_identifier;
  if (identifier) {
    [v3 setObject:identifier forKey:@"identifier"];
  }
  hostDisplayName = self->_hostDisplayName;
  if (hostDisplayName) {
    [v4 setObject:hostDisplayName forKey:@"hostDisplayName"];
  }
  uint64_t routeType = self->_routeType;
  if routeType < 0xC && ((0xB27u >> routeType))
  {
    objc_super v8 = off_1E57D8F88[routeType];
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_routeType);
    objc_super v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  [v4 setObject:v8 forKey:@"routeType"];

  v9 = [NSNumber numberWithBool:self->_hosted];
  [v4 setObject:v9 forKey:@"hosted"];

  equivalentMediaIdentifier = self->_equivalentMediaIdentifier;
  if (equivalentMediaIdentifier) {
    [v4 setObject:equivalentMediaIdentifier forKey:@"equivalentMediaIdentifier"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v11 = [NSNumber numberWithBool:self->_placeholder];
    [v4 setObject:v11 forKey:@"placeholder"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return _MRGroupSessionInfoProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_identifier) {
    -[_MRGroupSessionInfoProtobuf writeTo:]();
  }
  id v5 = v4;
  PBDataWriterWriteStringField();
  if (!self->_hostDisplayName) {
    -[_MRGroupSessionInfoProtobuf writeTo:]();
  }
  PBDataWriterWriteStringField();
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteBOOLField();
  if (self->_equivalentMediaIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteBOOLField();
  }
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [v5 setIdentifier:self->_identifier];
  [v5 setHostDisplayName:self->_hostDisplayName];
  id v4 = v5;
  *((_DWORD *)v5 + 8) = self->_routeType;
  *((unsigned char *)v5 + 36) = self->_hosted;
  if (self->_equivalentMediaIdentifier)
  {
    objc_msgSend(v5, "setEquivalentMediaIdentifier:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    v4[37] = self->_placeholder;
    v4[40] |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_identifier copyWithZone:a3];
  v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  uint64_t v8 = [(NSString *)self->_hostDisplayName copyWithZone:a3];
  v9 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v8;

  *(_DWORD *)(v5 + 32) = self->_routeType;
  *(unsigned char *)(v5 + 36) = self->_hosted;
  uint64_t v10 = [(NSString *)self->_equivalentMediaIdentifier copyWithZone:a3];
  v11 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v10;

  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v5 + 37) = self->_placeholder;
    *(unsigned char *)(v5 + 40) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](identifier, "isEqual:")) {
      goto LABEL_15;
    }
  }
  hostDisplayName = self->_hostDisplayName;
  if ((unint64_t)hostDisplayName | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](hostDisplayName, "isEqual:")) {
      goto LABEL_15;
    }
  }
  if (self->_routeType != *((_DWORD *)v4 + 8)) {
    goto LABEL_15;
  }
  if (self->_hosted)
  {
    if (!*((unsigned char *)v4 + 36)) {
      goto LABEL_15;
    }
  }
  else if (*((unsigned char *)v4 + 36))
  {
    goto LABEL_15;
  }
  equivalentMediaIdentifier = self->_equivalentMediaIdentifier;
  if ((unint64_t)equivalentMediaIdentifier | *((void *)v4 + 1)
    && !-[NSString isEqual:](equivalentMediaIdentifier, "isEqual:"))
  {
    goto LABEL_15;
  }
  BOOL v8 = (*((unsigned char *)v4 + 40) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if (*((unsigned char *)v4 + 40))
    {
      if (self->_placeholder)
      {
        if (!*((unsigned char *)v4 + 37)) {
          goto LABEL_15;
        }
      }
      else if (*((unsigned char *)v4 + 37))
      {
        goto LABEL_15;
      }
      BOOL v8 = 1;
      goto LABEL_16;
    }
LABEL_15:
    BOOL v8 = 0;
  }
LABEL_16:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_identifier hash];
  NSUInteger v4 = [(NSString *)self->_hostDisplayName hash];
  uint64_t routeType = self->_routeType;
  BOOL hosted = self->_hosted;
  NSUInteger v7 = [(NSString *)self->_equivalentMediaIdentifier hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v8 = 2654435761 * self->_placeholder;
  }
  else {
    uint64_t v8 = 0;
  }
  return v4 ^ v3 ^ (2654435761 * hosted) ^ (2654435761 * routeType) ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*((void *)v4 + 3))
  {
    -[_MRGroupSessionInfoProtobuf setIdentifier:](self, "setIdentifier:");
    id v4 = v5;
  }
  if (*((void *)v4 + 2))
  {
    -[_MRGroupSessionInfoProtobuf setHostDisplayName:](self, "setHostDisplayName:");
    id v4 = v5;
  }
  self->_uint64_t routeType = *((_DWORD *)v4 + 8);
  self->_BOOL hosted = *((unsigned char *)v4 + 36);
  if (*((void *)v4 + 1))
  {
    -[_MRGroupSessionInfoProtobuf setEquivalentMediaIdentifier:](self, "setEquivalentMediaIdentifier:");
    id v4 = v5;
  }
  if (*((unsigned char *)v4 + 40))
  {
    self->_placeholder = *((unsigned char *)v4 + 37);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)hostDisplayName
{
  return self->_hostDisplayName;
}

- (void)setHostDisplayName:(id)a3
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

- (BOOL)hosted
{
  return self->_hosted;
}

- (void)setHosted:(BOOL)a3
{
  self->_BOOL hosted = a3;
}

- (NSString)equivalentMediaIdentifier
{
  return self->_equivalentMediaIdentifier;
}

- (void)setEquivalentMediaIdentifier:(id)a3
{
}

- (BOOL)placeholder
{
  return self->_placeholder;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_hostDisplayName, 0);

  objc_storeStrong((id *)&self->_equivalentMediaIdentifier, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[_MRGroupSessionInfoProtobuf writeTo:]", "_MRGroupSessionInfoProtobuf.m", 144, "nil != self->_identifier");
}

- (void)writeTo:.cold.2()
{
  __assert_rtn("-[_MRGroupSessionInfoProtobuf writeTo:]", "_MRGroupSessionInfoProtobuf.m", 149, "nil != self->_hostDisplayName");
}

@end