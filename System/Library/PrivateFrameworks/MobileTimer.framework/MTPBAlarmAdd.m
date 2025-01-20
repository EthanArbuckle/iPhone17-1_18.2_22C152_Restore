@interface MTPBAlarmAdd
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (MTPBAlarm)alarm;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAlarm:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation MTPBAlarmAdd

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MTPBAlarmAdd;
  v4 = [(MTPBAlarmAdd *)&v8 description];
  v5 = [(MTPBAlarmAdd *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  alarm = self->_alarm;
  if (alarm)
  {
    v5 = [(MTPBAlarm *)alarm dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"alarm"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MTPBAlarmAddReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
}

- (void)copyTo:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(MTPBAlarm *)self->_alarm copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    alarm = self->_alarm;
    if ((unint64_t)alarm | v4[1]) {
      char v6 = -[MTPBAlarm isEqual:](alarm, "isEqual:");
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
  return [(MTPBAlarm *)self->_alarm hash];
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  alarm = self->_alarm;
  uint64_t v6 = v4[1];
  if (alarm)
  {
    if (!v6) {
      goto LABEL_7;
    }
    v7 = v4;
    alarm = (MTPBAlarm *)-[MTPBAlarm mergeFrom:](alarm, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    v7 = v4;
    alarm = (MTPBAlarm *)-[MTPBAlarmAdd setAlarm:](self, "setAlarm:");
  }
  v4 = v7;
LABEL_7:
  MEMORY[0x1F41817F8](alarm, v4);
}

- (MTPBAlarm)alarm
{
  return self->_alarm;
}

- (void)setAlarm:(id)a3
{
}

- (void).cxx_destruct
{
}

@end