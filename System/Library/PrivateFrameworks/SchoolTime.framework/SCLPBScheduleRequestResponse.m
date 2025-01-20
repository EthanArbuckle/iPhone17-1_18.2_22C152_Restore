@interface SCLPBScheduleRequestResponse
- (BOOL)hasScheduleSettings;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (SCLPBScheduleSettings)scheduleSettings;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setScheduleSettings:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SCLPBScheduleRequestResponse

- (BOOL)hasScheduleSettings
{
  return self->_scheduleSettings != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SCLPBScheduleRequestResponse;
  v4 = [(SCLPBScheduleRequestResponse *)&v8 description];
  v5 = [(SCLPBScheduleRequestResponse *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  scheduleSettings = self->_scheduleSettings;
  if (scheduleSettings)
  {
    v5 = [(SCLPBScheduleSettings *)scheduleSettings dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"scheduleSettings"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SCLPBScheduleRequestResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_scheduleSettings) {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  scheduleSettings = self->_scheduleSettings;
  if (scheduleSettings) {
    [a3 setScheduleSettings:scheduleSettings];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(SCLPBScheduleSettings *)self->_scheduleSettings copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    scheduleSettings = self->_scheduleSettings;
    if ((unint64_t)scheduleSettings | v4[1]) {
      char v6 = -[SCLPBScheduleSettings isEqual:](scheduleSettings, "isEqual:");
    }
    else {
      char v6 = 1;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return [(SCLPBScheduleSettings *)self->_scheduleSettings hash];
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  scheduleSettings = self->_scheduleSettings;
  uint64_t v6 = v4[1];
  if (scheduleSettings)
  {
    if (v6) {
      -[SCLPBScheduleSettings mergeFrom:](scheduleSettings, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[SCLPBScheduleRequestResponse setScheduleSettings:](self, "setScheduleSettings:");
  }
  MEMORY[0x270F9A758]();
}

- (SCLPBScheduleSettings)scheduleSettings
{
  return self->_scheduleSettings;
}

- (void)setScheduleSettings:(id)a3
{
}

- (void).cxx_destruct
{
}

@end