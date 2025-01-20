@interface TVPPlaybackStartupEvent
- (NSNumber)durationMS;
- (NSString)name;
- (TVPPlaybackStartupEvent)initWithName:(id)a3 timestamp:(double)a4 durationMS:(id)a5;
- (double)timestamp;
- (void)setDurationMS:(id)a3;
- (void)setName:(id)a3;
- (void)setTimestamp:(double)a3;
@end

@implementation TVPPlaybackStartupEvent

- (TVPPlaybackStartupEvent)initWithName:(id)a3 timestamp:(double)a4 durationMS:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)TVPPlaybackStartupEvent;
  v11 = [(TVPPlaybackStartupEvent *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_name, a3);
    v12->_timestamp = a4;
    objc_storeStrong((id *)&v12->_durationMS, a5);
  }

  return v12;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (NSNumber)durationMS
{
  return self->_durationMS;
}

- (void)setDurationMS:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_durationMS, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end