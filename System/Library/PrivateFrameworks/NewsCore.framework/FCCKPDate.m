@interface FCCKPDate
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)mergeFrom:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation FCCKPDate

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)FCCKPDate;
  v4 = [(FCCKPDate *)&v8 description];
  v5 = [(FCCKPDate *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    v4 = [NSNumber numberWithDouble:self->_time];
    [v3 setObject:v4 forKey:@"time"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return FCCKPDateReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteDoubleField();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (*(unsigned char *)&self->_has)
  {
    *((void *)result + 1) = *(void *)&self->_time;
    *((unsigned char *)result + 16) |= 1u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_6;
  }
  BOOL v5 = (*((unsigned char *)v4 + 16) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 16) & 1) != 0 && self->_time == *((double *)v4 + 1))
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
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    return 0;
  }
  double time = self->_time;
  double v4 = -time;
  if (time >= 0.0) {
    double v4 = self->_time;
  }
  long double v5 = floor(v4 + 0.5);
  double v6 = (v4 - v5) * 1.84467441e19;
  unint64_t result = 2654435761u * (unint64_t)fmod(v5, 1.84467441e19);
  if (v6 >= 0.0)
  {
    if (v6 > 0.0) {
      result += (unint64_t)v6;
    }
  }
  else
  {
    result -= (unint64_t)fabs(v6);
  }
  return result;
}

- (void)mergeFrom:(uint64_t)a1
{
  v3 = a2;
  if (a1 && (v3[2] & 1) != 0)
  {
    *(void *)(a1 + 8) = v3[1];
    *(unsigned char *)(a1 + 16) |= 1u;
  }
}

@end