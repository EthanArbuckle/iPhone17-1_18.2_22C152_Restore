@interface SCLPBTimeInterval
- (BOOL)hasEndTime;
- (BOOL)hasStartTime;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (SCLPBScheduleTime)endTime;
- (SCLPBScheduleTime)startTime;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEndTime:(id)a3;
- (void)setStartTime:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SCLPBTimeInterval

- (BOOL)hasStartTime
{
  return self->_startTime != 0;
}

- (BOOL)hasEndTime
{
  return self->_endTime != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SCLPBTimeInterval;
  v4 = [(SCLPBTimeInterval *)&v8 description];
  v5 = [(SCLPBTimeInterval *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  startTime = self->_startTime;
  if (startTime)
  {
    v5 = [(SCLPBScheduleTime *)startTime dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"startTime"];
  }
  endTime = self->_endTime;
  if (endTime)
  {
    v7 = [(SCLPBScheduleTime *)endTime dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"endTime"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SCLPBTimeIntervalReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_startTime)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_endTime)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_startTime)
  {
    objc_msgSend(v4, "setStartTime:");
    id v4 = v5;
  }
  if (self->_endTime)
  {
    objc_msgSend(v5, "setEndTime:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(SCLPBScheduleTime *)self->_startTime copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  id v8 = [(SCLPBScheduleTime *)self->_endTime copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((startTime = self->_startTime, !((unint64_t)startTime | v4[2]))
     || -[SCLPBScheduleTime isEqual:](startTime, "isEqual:")))
  {
    endTime = self->_endTime;
    if ((unint64_t)endTime | v4[1]) {
      char v7 = -[SCLPBScheduleTime isEqual:](endTime, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SCLPBScheduleTime *)self->_startTime hash];
  return [(SCLPBScheduleTime *)self->_endTime hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  startTime = self->_startTime;
  uint64_t v6 = v4[2];
  v9 = v4;
  if (startTime)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[SCLPBScheduleTime mergeFrom:](startTime, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[SCLPBTimeInterval setStartTime:](self, "setStartTime:");
  }
  id v4 = v9;
LABEL_7:
  endTime = self->_endTime;
  uint64_t v8 = v4[1];
  if (endTime)
  {
    if (v8) {
      -[SCLPBScheduleTime mergeFrom:](endTime, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[SCLPBTimeInterval setEndTime:](self, "setEndTime:");
  }
  MEMORY[0x270F9A758]();
}

- (SCLPBScheduleTime)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(id)a3
{
}

- (SCLPBScheduleTime)endTime
{
  return self->_endTime;
}

- (void)setEndTime:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_storeStrong((id *)&self->_endTime, 0);
}

@end