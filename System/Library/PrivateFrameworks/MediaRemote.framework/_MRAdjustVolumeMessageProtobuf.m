@interface _MRAdjustVolumeMessageProtobuf
- (BOOL)hasAdjustment;
- (BOOL)hasDetails;
- (BOOL)hasOutputDeviceUID;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)outputDeviceUID;
- (_MRRequestDetailsProtobuf)details;
- (id)adjustmentAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)StringAsAdjustment:(id)a3;
- (int)adjustment;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAdjustment:(int)a3;
- (void)setDetails:(id)a3;
- (void)setHasAdjustment:(BOOL)a3;
- (void)setOutputDeviceUID:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRAdjustVolumeMessageProtobuf

- (int)adjustment
{
  if (*(unsigned char *)&self->_has) {
    return self->_adjustment;
  }
  else {
    return 1;
  }
}

- (void)setAdjustment:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_adjustment = a3;
}

- (void)setHasAdjustment:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAdjustment
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)adjustmentAsString:(int)a3
{
  if ((a3 - 1) >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E57D4D08[a3 - 1];
  }

  return v3;
}

- (int)StringAsAdjustment:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"IncrementSmall"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"IncrementMedium"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"IncrementLarge"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"DecrementSmall"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"DecrementMedium"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"DecrementLarge"])
  {
    int v4 = 6;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (BOOL)hasOutputDeviceUID
{
  return self->_outputDeviceUID != 0;
}

- (BOOL)hasDetails
{
  return self->_details != 0;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRAdjustVolumeMessageProtobuf;
  int v4 = [(_MRAdjustVolumeMessageProtobuf *)&v8 description];
  v5 = [(_MRAdjustVolumeMessageProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    unsigned int v4 = self->_adjustment - 1;
    if (v4 >= 6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_adjustment);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E57D4D08[v4];
    }
    [v3 setObject:v5 forKey:@"adjustment"];
  }
  outputDeviceUID = self->_outputDeviceUID;
  if (outputDeviceUID) {
    [v3 setObject:outputDeviceUID forKey:@"outputDeviceUID"];
  }
  details = self->_details;
  if (details)
  {
    objc_super v8 = [(_MRRequestDetailsProtobuf *)details dictionaryRepresentation];
    [v3 setObject:v8 forKey:@"details"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRAdjustVolumeMessageProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_outputDeviceUID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_details)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[2] = self->_adjustment;
    *((unsigned char *)v4 + 32) |= 1u;
  }
  id v5 = v4;
  if (self->_outputDeviceUID)
  {
    objc_msgSend(v4, "setOutputDeviceUID:");
    id v4 = v5;
  }
  if (self->_details)
  {
    objc_msgSend(v5, "setDetails:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 8) = self->_adjustment;
    *(unsigned char *)(v5 + 32) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_outputDeviceUID copyWithZone:a3];
  objc_super v8 = (void *)v6[3];
  v6[3] = v7;

  id v9 = [(_MRRequestDetailsProtobuf *)self->_details copyWithZone:a3];
  v10 = (void *)v6[2];
  v6[2] = v9;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_adjustment != *((_DWORD *)v4 + 2)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
LABEL_11:
    char v7 = 0;
    goto LABEL_12;
  }
  outputDeviceUID = self->_outputDeviceUID;
  if ((unint64_t)outputDeviceUID | *((void *)v4 + 3)
    && !-[NSString isEqual:](outputDeviceUID, "isEqual:"))
  {
    goto LABEL_11;
  }
  details = self->_details;
  if ((unint64_t)details | *((void *)v4 + 2)) {
    char v7 = -[_MRRequestDetailsProtobuf isEqual:](details, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_adjustment;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_outputDeviceUID hash] ^ v3;
  return v4 ^ [(_MRRequestDetailsProtobuf *)self->_details hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  uint64_t v5 = v4;
  if (v4[8])
  {
    self->_adjustment = v4[2];
    *(unsigned char *)&self->_has |= 1u;
  }
  objc_super v8 = v4;
  if (*((void *)v4 + 3))
  {
    -[_MRAdjustVolumeMessageProtobuf setOutputDeviceUID:](self, "setOutputDeviceUID:");
    uint64_t v5 = v8;
  }
  details = self->_details;
  uint64_t v7 = *((void *)v5 + 2);
  if (details)
  {
    if (v7) {
      -[_MRRequestDetailsProtobuf mergeFrom:](details, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[_MRAdjustVolumeMessageProtobuf setDetails:](self, "setDetails:");
  }

  MEMORY[0x1F41817F8]();
}

- (NSString)outputDeviceUID
{
  return self->_outputDeviceUID;
}

- (void)setOutputDeviceUID:(id)a3
{
}

- (_MRRequestDetailsProtobuf)details
{
  return self->_details;
}

- (void)setDetails:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputDeviceUID, 0);

  objc_storeStrong((id *)&self->_details, 0);
}

@end