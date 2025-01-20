@interface TransparencyTranscriptEvent
- (BOOL)success;
- (NSDate)timestamp;
- (NSString)name;
- (TransparencyTranscriptEvent)initWithName:(id)a3;
- (id)serialize;
- (void)setName:(id)a3;
- (void)setSuccess:(BOOL)a3;
- (void)setTimestamp:(id)a3;
@end

@implementation TransparencyTranscriptEvent

- (TransparencyTranscriptEvent)initWithName:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TransparencyTranscriptEvent;
  v5 = [(TransparencyTranscriptEvent *)&v8 init];
  if (v5)
  {
    v6 = +[NSDate date];
    [(TransparencyTranscriptEvent *)v5 setTimestamp:v6];

    [(TransparencyTranscriptEvent *)v5 setName:v4];
  }

  return v5;
}

- (id)serialize
{
  v8[0] = @"timestamp";
  v3 = [(TransparencyTranscriptEvent *)self timestamp];
  [v3 timeIntervalSince1970];
  id v4 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v8[1] = @"name";
  v9[0] = v4;
  v5 = [(TransparencyTranscriptEvent *)self name];
  v9[1] = v5;
  v6 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:2];

  return v6;
}

- (NSDate)timestamp
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTimestamp:(id)a3
{
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setName:(id)a3
{
}

- (BOOL)success
{
  return self->_success;
}

- (void)setSuccess:(BOOL)a3
{
  self->_success = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_timestamp, 0);
}

@end