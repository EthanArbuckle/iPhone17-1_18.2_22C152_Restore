@interface PBBProtoTinkerSetLauncherViewMode
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)launcherViewMode;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setLauncherViewMode:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation PBBProtoTinkerSetLauncherViewMode

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PBBProtoTinkerSetLauncherViewMode;
  v4 = [(PBBProtoTinkerSetLauncherViewMode *)&v8 description];
  v5 = [(PBBProtoTinkerSetLauncherViewMode *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = [NSNumber numberWithUnsignedInt:self->_launcherViewMode];
  [v3 setObject:v4 forKey:@"launcherViewMode"];

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PBBProtoTinkerSetLauncherViewModeReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
}

- (void)copyTo:(id)a3
{
  *((_DWORD *)a3 + 2) = self->_launcherViewMode;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((_DWORD *)result + 2) = self->_launcherViewMode;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]) {
    BOOL v5 = self->_launcherViewMode == v4[2];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  return 2654435761 * self->_launcherViewMode;
}

- (void)mergeFrom:(id)a3
{
  self->_launcherViewMode = *((_DWORD *)a3 + 2);
}

- (unsigned)launcherViewMode
{
  return self->_launcherViewMode;
}

- (void)setLauncherViewMode:(unsigned int)a3
{
  self->_launcherViewMode = a3;
}

@end