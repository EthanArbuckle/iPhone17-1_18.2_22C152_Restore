@interface _MRPlaybackSessionMigrateRequestEventProtobuf
- (BOOL)hasDuration;
- (BOOL)hasEndTimestamp;
- (BOOL)hasErrorCode;
- (BOOL)hasErrorDescription;
- (BOOL)hasName;
- (BOOL)hasStartTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSError)error;
- (NSString)errorDescription;
- (NSString)name;
- (double)calculatedDuration;
- (double)duration;
- (double)endTimestamp;
- (double)startTimestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)errorCode;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDuration:(double)a3;
- (void)setEndTimestamp:(double)a3;
- (void)setErrorCode:(int64_t)a3;
- (void)setErrorDescription:(id)a3;
- (void)setHasDuration:(BOOL)a3;
- (void)setHasEndTimestamp:(BOOL)a3;
- (void)setHasErrorCode:(BOOL)a3;
- (void)setHasStartTimestamp:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setStartTimestamp:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRPlaybackSessionMigrateRequestEventProtobuf

- (NSError)error
{
  if ([(_MRPlaybackSessionMigrateRequestEventProtobuf *)self errorCode])
  {
    uint64_t v3 = [(_MRPlaybackSessionMigrateRequestEventProtobuf *)self errorCode];
    v4 = [(_MRPlaybackSessionMigrateRequestEventProtobuf *)self errorDescription];
    ErrorWithDescription = (void *)MRMediaRemoteCreateErrorWithDescription(v3, (uint64_t)v4);
  }
  else
  {
    ErrorWithDescription = 0;
  }

  return (NSError *)ErrorWithDescription;
}

- (double)calculatedDuration
{
  [(_MRPlaybackSessionMigrateRequestEventProtobuf *)self endTimestamp];
  double v4 = v3;
  [(_MRPlaybackSessionMigrateRequestEventProtobuf *)self startTimestamp];
  return v4 - v5;
}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (void)setStartTimestamp:(double)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_startTimestamp = a3;
}

- (void)setHasStartTimestamp:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasStartTimestamp
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setEndTimestamp:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_endTimestamp = a3;
}

- (void)setHasEndTimestamp:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasEndTimestamp
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setDuration:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_duration = a3;
}

- (void)setHasDuration:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDuration
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setErrorCode:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_errorCode = a3;
}

- (void)setHasErrorCode:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasErrorCode
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasErrorDescription
{
  return self->_errorDescription != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRPlaybackSessionMigrateRequestEventProtobuf;
  double v4 = [(_MRPlaybackSessionMigrateRequestEventProtobuf *)&v8 description];
  double v5 = [(_MRPlaybackSessionMigrateRequestEventProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  double v4 = v3;
  name = self->_name;
  if (name) {
    [v3 setObject:name forKey:@"name"];
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v10 = [NSNumber numberWithDouble:self->_startTimestamp];
    [v4 setObject:v10 forKey:@"startTimestamp"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 1) == 0) {
        goto LABEL_6;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  v11 = [NSNumber numberWithDouble:self->_endTimestamp];
  [v4 setObject:v11 forKey:@"endTimestamp"];

  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 4) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  v12 = [NSNumber numberWithDouble:self->_duration];
  [v4 setObject:v12 forKey:@"duration"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_7:
    v7 = [NSNumber numberWithLongLong:self->_errorCode];
    [v4 setObject:v7 forKey:@"errorCode"];
  }
LABEL_8:
  errorDescription = self->_errorDescription;
  if (errorDescription) {
    [v4 setObject:errorDescription forKey:@"errorDescription"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return _MRPlaybackSessionMigrateRequestEventProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_name)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 1) == 0) {
        goto LABEL_6;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 4) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_7:
    PBDataWriterWriteInt64Field();
    id v4 = v6;
  }
LABEL_8:
  if (self->_errorDescription)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_name)
  {
    objc_msgSend(v4, "setName:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((void *)v4 + 4) = *(void *)&self->_startTimestamp;
    *((unsigned char *)v4 + 56) |= 8u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 1) == 0) {
        goto LABEL_6;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  *((void *)v4 + 2) = *(void *)&self->_endTimestamp;
  *((unsigned char *)v4 + 56) |= 2u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 4) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  *((void *)v4 + 1) = *(void *)&self->_duration;
  *((unsigned char *)v4 + 56) |= 1u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_7:
    *((void *)v4 + 3) = self->_errorCode;
    *((unsigned char *)v4 + 56) |= 4u;
  }
LABEL_8:
  if (self->_errorDescription)
  {
    objc_msgSend(v6, "setErrorDescription:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_name copyWithZone:a3];
  v7 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v6;

  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(double *)(v5 + 32) = self->_startTimestamp;
    *(unsigned char *)(v5 + 56) |= 8u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
LABEL_9:
      *(double *)(v5 + 8) = self->_duration;
      *(unsigned char *)(v5 + 56) |= 1u;
      if ((*(unsigned char *)&self->_has & 4) == 0) {
        goto LABEL_6;
      }
      goto LABEL_5;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(double *)(v5 + 16) = self->_endTimestamp;
  *(unsigned char *)(v5 + 56) |= 2u;
  char has = (char)self->_has;
  if (has) {
    goto LABEL_9;
  }
LABEL_4:
  if ((has & 4) != 0)
  {
LABEL_5:
    *(void *)(v5 + 24) = self->_errorCode;
    *(unsigned char *)(v5 + 56) |= 4u;
  }
LABEL_6:
  uint64_t v9 = [(NSString *)self->_errorDescription copyWithZone:a3];
  v10 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v9;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_26;
  }
  name = self->_name;
  if ((unint64_t)name | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](name, "isEqual:")) {
      goto LABEL_26;
    }
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 8) == 0 || self->_startTimestamp != *((double *)v4 + 4)) {
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 8) != 0)
  {
LABEL_26:
    char v7 = 0;
    goto LABEL_27;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 2) == 0 || self->_endTimestamp != *((double *)v4 + 2)) {
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 2) != 0)
  {
    goto LABEL_26;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 56) & 1) == 0 || self->_duration != *((double *)v4 + 1)) {
      goto LABEL_26;
    }
  }
  else if (*((unsigned char *)v4 + 56))
  {
    goto LABEL_26;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 4) == 0 || self->_errorCode != *((void *)v4 + 3)) {
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 4) != 0)
  {
    goto LABEL_26;
  }
  errorDescription = self->_errorDescription;
  if ((unint64_t)errorDescription | *((void *)v4 + 5)) {
    char v7 = -[NSString isEqual:](errorDescription, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_27:

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_name hash];
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    double startTimestamp = self->_startTimestamp;
    double v7 = -startTimestamp;
    if (startTimestamp >= 0.0) {
      double v7 = self->_startTimestamp;
    }
    long double v8 = floor(v7 + 0.5);
    double v9 = (v7 - v8) * 1.84467441e19;
    unint64_t v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0) {
        v5 += (unint64_t)v9;
      }
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    unint64_t v5 = 0;
  }
  if ((has & 2) != 0)
  {
    double endTimestamp = self->_endTimestamp;
    double v12 = -endTimestamp;
    if (endTimestamp >= 0.0) {
      double v12 = self->_endTimestamp;
    }
    long double v13 = floor(v12 + 0.5);
    double v14 = (v12 - v13) * 1.84467441e19;
    unint64_t v10 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0) {
        v10 += (unint64_t)v14;
      }
    }
    else
    {
      v10 -= (unint64_t)fabs(v14);
    }
  }
  else
  {
    unint64_t v10 = 0;
  }
  if (has)
  {
    double duration = self->_duration;
    double v17 = -duration;
    if (duration >= 0.0) {
      double v17 = self->_duration;
    }
    long double v18 = floor(v17 + 0.5);
    double v19 = (v17 - v18) * 1.84467441e19;
    unint64_t v15 = 2654435761u * (unint64_t)fmod(v18, 1.84467441e19);
    if (v19 >= 0.0)
    {
      if (v19 > 0.0) {
        v15 += (unint64_t)v19;
      }
    }
    else
    {
      v15 -= (unint64_t)fabs(v19);
    }
  }
  else
  {
    unint64_t v15 = 0;
  }
  if ((has & 4) != 0) {
    uint64_t v20 = 2654435761 * self->_errorCode;
  }
  else {
    uint64_t v20 = 0;
  }
  return v5 ^ v3 ^ v10 ^ v15 ^ v20 ^ [(NSString *)self->_errorDescription hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (*((void *)v4 + 6))
  {
    -[_MRPlaybackSessionMigrateRequestEventProtobuf setName:](self, "setName:");
    id v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 56);
  if ((v5 & 8) != 0)
  {
    self->_double startTimestamp = *((double *)v4 + 4);
    *(unsigned char *)&self->_has |= 8u;
    char v5 = *((unsigned char *)v4 + 56);
    if ((v5 & 2) == 0)
    {
LABEL_5:
      if ((v5 & 1) == 0) {
        goto LABEL_6;
      }
      goto LABEL_15;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 2) == 0)
  {
    goto LABEL_5;
  }
  self->_double endTimestamp = *((double *)v4 + 2);
  *(unsigned char *)&self->_has |= 2u;
  char v5 = *((unsigned char *)v4 + 56);
  if ((v5 & 1) == 0)
  {
LABEL_6:
    if ((v5 & 4) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  self->_double duration = *((double *)v4 + 1);
  *(unsigned char *)&self->_has |= 1u;
  if ((*((unsigned char *)v4 + 56) & 4) != 0)
  {
LABEL_7:
    self->_errorCode = *((void *)v4 + 3);
    *(unsigned char *)&self->_has |= 4u;
  }
LABEL_8:
  if (*((void *)v4 + 5))
  {
    -[_MRPlaybackSessionMigrateRequestEventProtobuf setErrorDescription:](self, "setErrorDescription:");
    id v4 = v6;
  }
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (double)startTimestamp
{
  return self->_startTimestamp;
}

- (double)endTimestamp
{
  return self->_endTimestamp;
}

- (double)duration
{
  return self->_duration;
}

- (int64_t)errorCode
{
  return self->_errorCode;
}

- (NSString)errorDescription
{
  return self->_errorDescription;
}

- (void)setErrorDescription:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_errorDescription, 0);
}

@end