@interface NRPBRTCMigrationMetricSessionID
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation NRPBRTCMigrationMetricSessionID

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)NRPBRTCMigrationMetricSessionID;
  v3 = [(NRPBRTCMigrationMetricSessionID *)&v7 description];
  v4 = [(NRPBRTCMigrationMetricSessionID *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  sessionID = self->_sessionID;
  if (sessionID) {
    [v3 setObject:sessionID forKey:@"sessionID"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000D4CC4((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_sessionID) {
    PBDataWriterWriteStringField();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3) init];
  id v6 = [(NSString *)self->_sessionID copyWithZone:a3];
  objc_super v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    sessionID = self->_sessionID;
    if ((unint64_t)sessionID | v4[1]) {
      unsigned __int8 v6 = -[NSString isEqual:](sessionID, "isEqual:");
    }
    else {
      unsigned __int8 v6 = 1;
    }
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return [(NSString *)self->_sessionID hash];
}

- (void).cxx_destruct
{
}

@end