@interface _MRRegisterForGameControllerEventsMessageProtobuf
- (BOOL)hasInputModeFlags;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)inputModeFlagsAsString:(int)a3;
- (int)StringAsInputModeFlags:(id)a3;
- (int)inputModeFlags;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasInputModeFlags:(BOOL)a3;
- (void)setInputModeFlags:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRRegisterForGameControllerEventsMessageProtobuf

- (int)inputModeFlags
{
  if (*(unsigned char *)&self->_has) {
    return self->_inputModeFlags;
  }
  else {
    return 0;
  }
}

- (void)setInputModeFlags:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_inputModeFlags = a3;
}

- (void)setHasInputModeFlags:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasInputModeFlags
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)inputModeFlagsAsString:(int)a3
{
  if a3 < 5 && ((0x17u >> a3))
  {
    v3 = off_1E57D78E8[a3];
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (int)StringAsInputModeFlags:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"None"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Motion"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Buttons"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Digitizer"])
  {
    int v4 = 4;
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
  v8.super_class = (Class)_MRRegisterForGameControllerEventsMessageProtobuf;
  int v4 = [(_MRRegisterForGameControllerEventsMessageProtobuf *)&v8 description];
  v5 = [(_MRRegisterForGameControllerEventsMessageProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t inputModeFlags = self->_inputModeFlags;
    if inputModeFlags < 5 && ((0x17u >> inputModeFlags))
    {
      v5 = off_1E57D78E8[inputModeFlags];
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_inputModeFlags);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    [v3 setObject:v5 forKey:@"inputModeFlags"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRRegisterForGameControllerEventsMessageProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
}

- (void)copyTo:(id)a3
{
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)a3 + 2) = self->_inputModeFlags;
    *((unsigned char *)a3 + 12) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)result + 2) = self->_inputModeFlags;
    *((unsigned char *)result + 12) |= 1u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_6;
  }
  BOOL v5 = (*((unsigned char *)v4 + 12) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 12) & 1) != 0 && self->_inputModeFlags == *((_DWORD *)v4 + 2))
    {
      BOOL v5 = 1;
      goto LABEL_7;
    }
LABEL_6:
    BOOL v5 = 0;
  }
LABEL_7:

  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    return 2654435761 * self->_inputModeFlags;
  }
  else {
    return 0;
  }
}

- (void)mergeFrom:(id)a3
{
  if (*((unsigned char *)a3 + 12))
  {
    self->_uint64_t inputModeFlags = *((_DWORD *)a3 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
}

@end