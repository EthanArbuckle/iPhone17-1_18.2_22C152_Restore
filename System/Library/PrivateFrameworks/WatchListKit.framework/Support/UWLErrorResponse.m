@interface UWLErrorResponse
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)retryPeriodInSeconds;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setRetryPeriodInSeconds:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation UWLErrorResponse

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)UWLErrorResponse;
  v3 = [(UWLErrorResponse *)&v7 description];
  v4 = [(UWLErrorResponse *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = +[NSNumber numberWithInt:self->_retryPeriodInSeconds];
  [v3 setObject:v4 forKey:@"retry_period_in_seconds"];

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return UWLErrorResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
}

- (void)copyTo:(id)a3
{
  *((_DWORD *)a3 + 2) = self->_retryPeriodInSeconds;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((_DWORD *)result + 2) = self->_retryPeriodInSeconds;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]) {
    BOOL v5 = self->_retryPeriodInSeconds == v4[2];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  return 2654435761 * self->_retryPeriodInSeconds;
}

- (void)mergeFrom:(id)a3
{
  self->_retryPeriodInSeconds = *((_DWORD *)a3 + 2);
}

- (int)retryPeriodInSeconds
{
  return self->_retryPeriodInSeconds;
}

- (void)setRetryPeriodInSeconds:(int)a3
{
  self->_retryPeriodInSeconds = a3;
}

@end