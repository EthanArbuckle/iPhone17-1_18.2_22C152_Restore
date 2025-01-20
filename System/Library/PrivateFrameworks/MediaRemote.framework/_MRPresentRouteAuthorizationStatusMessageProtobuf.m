@interface _MRPresentRouteAuthorizationStatusMessageProtobuf
- (BOOL)hasRoute;
- (BOOL)hasStatus;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_MRAVOutputDeviceDescriptorProtobuf)route;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)statusAsString:(int)a3;
- (int)StringAsStatus:(id)a3;
- (int)status;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasStatus:(BOOL)a3;
- (void)setRoute:(id)a3;
- (void)setStatus:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRPresentRouteAuthorizationStatusMessageProtobuf

- (BOOL)hasRoute
{
  return self->_route != 0;
}

- (int)status
{
  if (*(unsigned char *)&self->_has) {
    return self->_status;
  }
  else {
    return -1;
  }
}

- (void)setStatus:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_status = a3;
}

- (void)setHasStatus:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasStatus
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)statusAsString:(int)a3
{
  if ((a3 + 1) >= 0xB)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E57D6270[a3 + 1];
  }

  return v3;
}

- (int)StringAsStatus:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Unknown"])
  {
    int v4 = -1;
  }
  else if ([v3 isEqualToString:@"OK"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"AuthenticationRequired"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"AuthenticationFailed"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Busy"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"OutOfRange"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"UnknownError"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"NotConnected"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"IPAliasingNotSupported"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"RelayFailed2GHzNetwork"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"RelayFailedMultiDFSNetwork"])
  {
    int v4 = 9;
  }
  else
  {
    int v4 = -1;
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRPresentRouteAuthorizationStatusMessageProtobuf;
  int v4 = [(_MRPresentRouteAuthorizationStatusMessageProtobuf *)&v8 description];
  v5 = [(_MRPresentRouteAuthorizationStatusMessageProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  route = self->_route;
  if (route)
  {
    v5 = [(_MRAVOutputDeviceDescriptorProtobuf *)route dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"route"];
  }
  if (*(unsigned char *)&self->_has)
  {
    unsigned int v6 = self->_status + 1;
    if (v6 >= 0xB)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_status);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E57D6270[v6];
    }
    [v3 setObject:v7 forKey:@"status"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRPresentRouteAuthorizationStatusMessageProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_route)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (self->_route)
  {
    id v5 = v4;
    objc_msgSend(v4, "setRoute:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 4) = self->_status;
    *((unsigned char *)v4 + 20) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(_MRAVOutputDeviceDescriptorProtobuf *)self->_route copyWithZone:a3];
  v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 16) = self->_status;
    *(unsigned char *)(v5 + 20) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_8;
  }
  route = self->_route;
  if ((unint64_t)route | *((void *)v4 + 1))
  {
    if (!-[_MRAVOutputDeviceDescriptorProtobuf isEqual:](route, "isEqual:")) {
      goto LABEL_8;
    }
  }
  BOOL v6 = (*((unsigned char *)v4 + 20) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 20) & 1) != 0 && self->_status == *((_DWORD *)v4 + 4))
    {
      BOOL v6 = 1;
      goto LABEL_9;
    }
LABEL_8:
    BOOL v6 = 0;
  }
LABEL_9:

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_MRAVOutputDeviceDescriptorProtobuf *)self->_route hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_status;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  route = self->_route;
  uint64_t v6 = *((void *)v4 + 1);
  if (route)
  {
    if (!v6) {
      goto LABEL_7;
    }
    id v7 = v4;
    -[_MRAVOutputDeviceDescriptorProtobuf mergeFrom:](route, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    id v7 = v4;
    [(_MRPresentRouteAuthorizationStatusMessageProtobuf *)self setRoute:"setRoute:"];
  }
  id v4 = v7;
LABEL_7:
  if (*((unsigned char *)v4 + 20))
  {
    self->_status = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 1u;
  }

  MEMORY[0x1F41817F8]();
}

- (_MRAVOutputDeviceDescriptorProtobuf)route
{
  return self->_route;
}

- (void)setRoute:(id)a3
{
}

- (void).cxx_destruct
{
}

@end