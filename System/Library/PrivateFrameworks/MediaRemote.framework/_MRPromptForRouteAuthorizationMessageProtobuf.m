@interface _MRPromptForRouteAuthorizationMessageProtobuf
- (BOOL)hasInputType;
- (BOOL)hasRoute;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_MRAVOutputDeviceDescriptorProtobuf)route;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)inputTypeAsString:(int)a3;
- (int)StringAsInputType:(id)a3;
- (int)inputType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasInputType:(BOOL)a3;
- (void)setInputType:(int)a3;
- (void)setRoute:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRPromptForRouteAuthorizationMessageProtobuf

- (BOOL)hasRoute
{
  return self->_route != 0;
}

- (int)inputType
{
  if (*(unsigned char *)&self->_has) {
    return self->_inputType;
  }
  else {
    return 0;
  }
}

- (void)setInputType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_inputType = a3;
}

- (void)setHasInputType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasInputType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)inputTypeAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E57D48D0[a3];
  }

  return v3;
}

- (int)StringAsInputType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"None"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Alphabet"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Number"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Email"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRPromptForRouteAuthorizationMessageProtobuf;
  int v4 = [(_MRPromptForRouteAuthorizationMessageProtobuf *)&v8 description];
  v5 = [(_MRPromptForRouteAuthorizationMessageProtobuf *)self dictionaryRepresentation];
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
    uint64_t inputType = self->_inputType;
    if (inputType >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_inputType);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E57D48D0[inputType];
    }
    [v3 setObject:v7 forKey:@"inputType"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRPromptForRouteAuthorizationMessageProtobufReadFrom((uint64_t)self, (uint64_t)a3);
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
    *((_DWORD *)v4 + 2) = self->_inputType;
    *((unsigned char *)v4 + 24) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(_MRAVOutputDeviceDescriptorProtobuf *)self->_route copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 8) = self->_inputType;
    *(unsigned char *)(v5 + 24) |= 1u;
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
  if ((unint64_t)route | *((void *)v4 + 2))
  {
    if (!-[_MRAVOutputDeviceDescriptorProtobuf isEqual:](route, "isEqual:")) {
      goto LABEL_8;
    }
  }
  BOOL v6 = (*((unsigned char *)v4 + 24) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) != 0 && self->_inputType == *((_DWORD *)v4 + 2))
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
    uint64_t v4 = 2654435761 * self->_inputType;
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
  uint64_t v6 = *((void *)v4 + 2);
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
    [(_MRPromptForRouteAuthorizationMessageProtobuf *)self setRoute:"setRoute:"];
  }
  id v4 = v7;
LABEL_7:
  if (*((unsigned char *)v4 + 24))
  {
    self->_uint64_t inputType = *((_DWORD *)v4 + 2);
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