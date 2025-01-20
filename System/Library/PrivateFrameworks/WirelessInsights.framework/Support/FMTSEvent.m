@interface FMTSEvent
- (FMTSEvent)initWithTimestamp:(unint64_t)a3;
- (id)description;
- (unint64_t)timestamp;
@end

@implementation FMTSEvent

- (FMTSEvent)initWithTimestamp:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)FMTSEvent;
  v4 = [(FMTSEvent *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->_timestamp = a3;
    v6 = v4;
  }

  return v5;
}

- (id)description
{
  return +[NSString stringWithFormat:@"timestamp %llu", [(FMTSEvent *)self timestamp]];
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

@end