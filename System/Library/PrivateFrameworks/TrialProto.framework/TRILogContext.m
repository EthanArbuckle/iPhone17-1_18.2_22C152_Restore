@interface TRILogContext
- (BOOL)hasDeviceLogTime;
- (BOOL)hasDeviceTrackingTime;
- (BOOL)hasProcessEventIndex;
- (BOOL)hasProjectId;
- (BOOL)hasTrackingId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)trackingId;
- (TRILogTime)deviceLogTime;
- (TRILogTime)deviceTrackingTime;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)processEventIndex;
- (unsigned)projectId;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDeviceLogTime:(id)a3;
- (void)setDeviceTrackingTime:(id)a3;
- (void)setHasProcessEventIndex:(BOOL)a3;
- (void)setHasProjectId:(BOOL)a3;
- (void)setProcessEventIndex:(unint64_t)a3;
- (void)setProjectId:(unsigned int)a3;
- (void)setTrackingId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation TRILogContext

- (void)setProjectId:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_projectId = a3;
}

- (void)setHasProjectId:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasProjectId
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasTrackingId
{
  return self->_trackingId != 0;
}

- (BOOL)hasDeviceLogTime
{
  return self->_deviceLogTime != 0;
}

- (BOOL)hasDeviceTrackingTime
{
  return self->_deviceTrackingTime != 0;
}

- (void)setProcessEventIndex:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_processEventIndex = a3;
}

- (void)setHasProcessEventIndex:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasProcessEventIndex
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)TRILogContext;
  v4 = [(TRILogContext *)&v8 description];
  v5 = [(TRILogContext *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v4 = [NSNumber numberWithUnsignedInt:self->_projectId];
    [v3 setObject:v4 forKey:@"project_id"];
  }
  trackingId = self->_trackingId;
  if (trackingId) {
    [v3 setObject:trackingId forKey:@"tracking_id"];
  }
  deviceLogTime = self->_deviceLogTime;
  if (deviceLogTime)
  {
    v7 = [(TRILogTime *)deviceLogTime dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"device_log_time"];
  }
  deviceTrackingTime = self->_deviceTrackingTime;
  if (deviceTrackingTime)
  {
    v9 = [(TRILogTime *)deviceTrackingTime dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"device_tracking_time"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v10 = [NSNumber numberWithUnsignedLongLong:self->_processEventIndex];
    [v3 setObject:v10 forKey:@"process_event_index"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return TRILogContextReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_trackingId) {
    PBDataWriterWriteStringField();
  }
  if (self->_deviceLogTime) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_deviceTrackingTime) {
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v4[8] = self->_projectId;
    *((unsigned char *)v4 + 48) |= 2u;
  }
  v5 = v4;
  if (self->_trackingId)
  {
    objc_msgSend(v4, "setTrackingId:");
    id v4 = v5;
  }
  if (self->_deviceLogTime)
  {
    objc_msgSend(v5, "setDeviceLogTime:");
    id v4 = v5;
  }
  if (self->_deviceTrackingTime)
  {
    objc_msgSend(v5, "setDeviceTrackingTime:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = self->_processEventIndex;
    *((unsigned char *)v4 + 48) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_projectId;
    *(unsigned char *)(v5 + 48) |= 2u;
  }
  uint64_t v7 = [(NSString *)self->_trackingId copyWithZone:a3];
  objc_super v8 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v7;

  id v9 = [(TRILogTime *)self->_deviceLogTime copyWithZone:a3];
  v10 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v9;

  id v11 = [(TRILogTime *)self->_deviceTrackingTime copyWithZone:a3];
  v12 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v11;

  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v6 + 8) = self->_processEventIndex;
    *(unsigned char *)(v6 + 48) |= 1u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 2) == 0 || self->_projectId != *((_DWORD *)v4 + 8)) {
      goto LABEL_17;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 2) != 0)
  {
LABEL_17:
    BOOL v8 = 0;
    goto LABEL_18;
  }
  trackingId = self->_trackingId;
  if ((unint64_t)trackingId | *((void *)v4 + 5) && !-[NSString isEqual:](trackingId, "isEqual:")) {
    goto LABEL_17;
  }
  deviceLogTime = self->_deviceLogTime;
  if ((unint64_t)deviceLogTime | *((void *)v4 + 2))
  {
    if (!-[TRILogTime isEqual:](deviceLogTime, "isEqual:")) {
      goto LABEL_17;
    }
  }
  deviceTrackingTime = self->_deviceTrackingTime;
  if ((unint64_t)deviceTrackingTime | *((void *)v4 + 3))
  {
    if (!-[TRILogTime isEqual:](deviceTrackingTime, "isEqual:")) {
      goto LABEL_17;
    }
  }
  BOOL v8 = (*((unsigned char *)v4 + 48) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0 || self->_processEventIndex != *((void *)v4 + 1)) {
      goto LABEL_17;
    }
    BOOL v8 = 1;
  }
LABEL_18:

  return v8;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v3 = 2654435761 * self->_projectId;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_trackingId hash];
  unint64_t v5 = [(TRILogTime *)self->_deviceLogTime hash];
  unint64_t v6 = [(TRILogTime *)self->_deviceTrackingTime hash];
  if (*(unsigned char *)&self->_has) {
    unint64_t v7 = 2654435761u * self->_processEventIndex;
  }
  else {
    unint64_t v7 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  unint64_t v5 = v4;
  if ((v4[12] & 2) != 0)
  {
    self->_projectId = v4[8];
    *(unsigned char *)&self->_has |= 2u;
  }
  v10 = v4;
  if (*((void *)v4 + 5))
  {
    -[TRILogContext setTrackingId:](self, "setTrackingId:");
    unint64_t v5 = v10;
  }
  deviceLogTime = self->_deviceLogTime;
  uint64_t v7 = *((void *)v5 + 2);
  if (deviceLogTime)
  {
    if (!v7) {
      goto LABEL_11;
    }
    -[TRILogTime mergeFrom:](deviceLogTime, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_11;
    }
    -[TRILogContext setDeviceLogTime:](self, "setDeviceLogTime:");
  }
  unint64_t v5 = v10;
LABEL_11:
  deviceTrackingTime = self->_deviceTrackingTime;
  uint64_t v9 = *((void *)v5 + 3);
  if (deviceTrackingTime)
  {
    if (!v9) {
      goto LABEL_17;
    }
    -[TRILogTime mergeFrom:](deviceTrackingTime, "mergeFrom:");
  }
  else
  {
    if (!v9) {
      goto LABEL_17;
    }
    -[TRILogContext setDeviceTrackingTime:](self, "setDeviceTrackingTime:");
  }
  unint64_t v5 = v10;
LABEL_17:
  if (v5[12])
  {
    self->_processEventIndex = *((void *)v5 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  MEMORY[0x1F41817F8]();
}

- (unsigned)projectId
{
  return self->_projectId;
}

- (NSString)trackingId
{
  return self->_trackingId;
}

- (void)setTrackingId:(id)a3
{
}

- (TRILogTime)deviceLogTime
{
  return self->_deviceLogTime;
}

- (void)setDeviceLogTime:(id)a3
{
}

- (TRILogTime)deviceTrackingTime
{
  return self->_deviceTrackingTime;
}

- (void)setDeviceTrackingTime:(id)a3
{
}

- (unint64_t)processEventIndex
{
  return self->_processEventIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackingId, 0);
  objc_storeStrong((id *)&self->_deviceTrackingTime, 0);
  objc_storeStrong((id *)&self->_deviceLogTime, 0);
}

@end