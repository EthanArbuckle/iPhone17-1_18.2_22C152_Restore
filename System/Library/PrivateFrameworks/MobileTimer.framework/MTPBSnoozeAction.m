@interface MTPBSnoozeAction
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (double)snoozeDate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setSnoozeDate:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation MTPBSnoozeAction

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MTPBSnoozeAction;
  v4 = [(MTPBSnoozeAction *)&v8 description];
  v5 = [(MTPBSnoozeAction *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [MEMORY[0x1E4F28ED0] numberWithDouble:self->_snoozeDate];
  [v3 setObject:v4 forKey:@"snoozeDate"];

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MTPBSnoozeActionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
}

- (void)copyTo:(id)a3
{
  *((void *)a3 + 1) = *(void *)&self->_snoozeDate;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((void *)result + 1) = *(void *)&self->_snoozeDate;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (double *)a3;
  if ([v4 isMemberOfClass:objc_opt_class()]) {
    BOOL v5 = self->_snoozeDate == v4[1];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  double snoozeDate = self->_snoozeDate;
  double v3 = -snoozeDate;
  if (snoozeDate >= 0.0) {
    double v3 = self->_snoozeDate;
  }
  long double v4 = floor(v3 + 0.5);
  double v5 = (v3 - v4) * 1.84467441e19;
  double v6 = fmod(v4, 1.84467441e19);
  unint64_t v7 = 2654435761u * (unint64_t)v6;
  unint64_t v8 = v7 + (unint64_t)v5;
  if (v5 <= 0.0) {
    unint64_t v8 = 2654435761u * (unint64_t)v6;
  }
  unint64_t v9 = v7 - (unint64_t)fabs(v5);
  if (v5 < 0.0) {
    return v9;
  }
  else {
    return v8;
  }
}

- (void)mergeFrom:(id)a3
{
  self->_double snoozeDate = *((double *)a3 + 1);
}

- (double)snoozeDate
{
  return self->_snoozeDate;
}

- (void)setSnoozeDate:(double)a3
{
  self->_double snoozeDate = a3;
}

@end