@interface NPKIDVRemoteDeviceProtoPrearmStatusUpdate
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)prearmStatusAsString:(int)a3;
- (int)StringAsPrearmStatus:(id)a3;
- (int)prearmStatus;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setPrearmStatus:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKIDVRemoteDeviceProtoPrearmStatusUpdate

- (id)prearmStatusAsString:(int)a3
{
  if ((a3 + 1) >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_2644D7438[a3 + 1];
  }
  return v3;
}

- (int)StringAsPrearmStatus:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Unknown"])
  {
    int v4 = -1;
  }
  else if ([v3 isEqualToString:@"ShouldBeDisarmed"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"ReadyForPrearm"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Prearmed"])
  {
    int v4 = 2;
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
  v8.super_class = (Class)NPKIDVRemoteDeviceProtoPrearmStatusUpdate;
  int v4 = [(NPKIDVRemoteDeviceProtoPrearmStatusUpdate *)&v8 description];
  v5 = [(NPKIDVRemoteDeviceProtoPrearmStatusUpdate *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  unsigned int v4 = self->_prearmStatus + 1;
  if (v4 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_prearmStatus);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = off_2644D7438[v4];
  }
  [v3 setObject:v5 forKey:@"prearmStatus"];

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NPKIDVRemoteDeviceProtoPrearmStatusUpdateReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
}

- (void)copyTo:(id)a3
{
  *((_DWORD *)a3 + 2) = self->_prearmStatus;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((_DWORD *)result + 2) = self->_prearmStatus;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]) {
    BOOL v5 = self->_prearmStatus == v4[2];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  return 2654435761 * self->_prearmStatus;
}

- (void)mergeFrom:(id)a3
{
  self->_prearmStatus = *((_DWORD *)a3 + 2);
}

- (int)prearmStatus
{
  return self->_prearmStatus;
}

- (void)setPrearmStatus:(int)a3
{
  self->_prearmStatus = a3;
}

@end