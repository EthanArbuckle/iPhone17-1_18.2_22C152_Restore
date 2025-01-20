@interface APPBAnalyticsEvent
+ (id)options;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (double)timestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)eventAsString:(int)a3;
- (int)StringAsEvent:(id)a3;
- (int)event;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEvent:(int)a3;
- (void)setTimestamp:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation APPBAnalyticsEvent

+ (id)options
{
  if (qword_100289970 != -1) {
    dispatch_once(&qword_100289970, &stru_1002356C0);
  }
  v2 = (void *)qword_100289968;

  return v2;
}

- (id)eventAsString:(int)a3
{
  if (a3 >= 9)
  {
    v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    v3 = *(&off_1002356E0 + a3);
  }

  return v3;
}

- (int)StringAsEvent:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PrerollRequested"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"PrivacyUserTransparencyDidAppear"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"PrivacyUserTransparencyDidRenderTransparency"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"PrivacyUserTransparencyDidDisappear"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"PrivacyUserTransparencyDidLinkOut"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"PrivacyAdTransparencyDidAppear"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"PrivacyAdTransparencyDidRenderTransparency"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"PrivacyAdTransparencyDidDisappear"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"PrivacyAdTransparencyDidLinkOut"])
  {
    int v4 = 8;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)APPBAnalyticsEvent;
  id v3 = [(APPBAnalyticsEvent *)&v7 description];
  int v4 = [(APPBAnalyticsEvent *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  uint64_t event = self->_event;
  if (event >= 9)
  {
    v5 = +[NSString stringWithFormat:@"(unknown: %i)", self->_event];
  }
  else
  {
    v5 = *(&off_1002356E0 + event);
  }
  [v3 setObject:v5 forKey:@"event"];

  v6 = +[NSNumber numberWithDouble:self->_timestamp];
  [v3 setObject:v6 forKey:@"timestamp"];

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return APPBAnalyticsEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v3 = a3;
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteDoubleField();
}

- (void)copyTo:(id)a3
{
  *((_DWORD *)a3 + 4) = self->_event;
  *((void *)a3 + 1) = *(void *)&self->_timestamp;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [[objc_opt_class() allocWithZone:a3] init];
  *((_DWORD *)result + 4) = self->_event;
  *((void *)result + 1) = *(void *)&self->_timestamp;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 isMemberOfClass:objc_opt_class()]
    && self->_event == *((_DWORD *)v4 + 4)
    && self->_timestamp == *((double *)v4 + 1);

  return v5;
}

- (unint64_t)hash
{
  uint64_t event = self->_event;
  double timestamp = self->_timestamp;
  double v4 = -timestamp;
  if (timestamp >= 0.0) {
    double v4 = self->_timestamp;
  }
  long double v5 = floor(v4 + 0.5);
  double v6 = (v4 - v5) * 1.84467441e19;
  double v7 = fmod(v5, 1.84467441e19);
  unint64_t v8 = 2654435761u * (unint64_t)v7;
  unint64_t v9 = v8 + (unint64_t)v6;
  if (v6 <= 0.0) {
    unint64_t v9 = 2654435761u * (unint64_t)v7;
  }
  unint64_t v10 = v8 - (unint64_t)fabs(v6);
  if (v6 >= 0.0) {
    unint64_t v10 = v9;
  }
  return v10 ^ (2654435761 * event);
}

- (void)mergeFrom:(id)a3
{
  self->_uint64_t event = *((_DWORD *)a3 + 4);
  self->_double timestamp = *((double *)a3 + 1);
}

- (int)event
{
  return self->_event;
}

- (void)setEvent:(int)a3
{
  self->_uint64_t event = a3;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_double timestamp = a3;
}

@end