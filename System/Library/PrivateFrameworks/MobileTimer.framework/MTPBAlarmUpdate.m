@interface MTPBAlarmUpdate
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (MTPBAlarmProperties)alarmProperties;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAlarmProperties:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation MTPBAlarmUpdate

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MTPBAlarmUpdate;
  v4 = [(MTPBAlarmUpdate *)&v8 description];
  v5 = [(MTPBAlarmUpdate *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  alarmProperties = self->_alarmProperties;
  if (alarmProperties)
  {
    v5 = [(MTPBAlarmProperties *)alarmProperties dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"alarmProperties"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MTPBAlarmUpdateReadFrom((uint64_t)self, (uint64_t)a3);
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
  id v6 = [(MTPBAlarmProperties *)self->_alarmProperties copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    alarmProperties = self->_alarmProperties;
    if ((unint64_t)alarmProperties | v4[1]) {
      char v6 = -[MTPBAlarmProperties isEqual:](alarmProperties, "isEqual:");
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
  return [(MTPBAlarmProperties *)self->_alarmProperties hash];
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  alarmProperties = self->_alarmProperties;
  uint64_t v6 = v4[1];
  if (alarmProperties)
  {
    if (!v6) {
      goto LABEL_7;
    }
    v7 = v4;
    alarmProperties = (MTPBAlarmProperties *)-[MTPBAlarmProperties mergeFrom:](alarmProperties, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    v7 = v4;
    alarmProperties = (MTPBAlarmProperties *)-[MTPBAlarmUpdate setAlarmProperties:](self, "setAlarmProperties:");
  }
  v4 = v7;
LABEL_7:
  MEMORY[0x1F41817F8](alarmProperties, v4);
}

- (MTPBAlarmProperties)alarmProperties
{
  return self->_alarmProperties;
}

- (void)setAlarmProperties:(id)a3
{
}

- (void).cxx_destruct
{
}

@end