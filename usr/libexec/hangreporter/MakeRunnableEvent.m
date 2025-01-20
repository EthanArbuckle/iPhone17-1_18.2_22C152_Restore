@interface MakeRunnableEvent
- (BOOL)inInterrupt;
- (MakeRunnableEvent)initWithMadeRunnableByThreadID:(unint64_t)a3 atTime:(unint64_t)a4 inInterrupt:(BOOL)a5;
- (unint64_t)madeRunnableByThreadId;
- (unint64_t)timestamp;
- (void)setInInterrupt:(BOOL)a3;
- (void)setMadeRunnableByThreadId:(unint64_t)a3;
- (void)setTimestamp:(unint64_t)a3;
@end

@implementation MakeRunnableEvent

- (MakeRunnableEvent)initWithMadeRunnableByThreadID:(unint64_t)a3 atTime:(unint64_t)a4 inInterrupt:(BOOL)a5
{
  BOOL v5 = a5;
  v11.receiver = self;
  v11.super_class = (Class)MakeRunnableEvent;
  v8 = [(MakeRunnableEvent *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(MakeRunnableEvent *)v8 setMadeRunnableByThreadId:a3];
    [(MakeRunnableEvent *)v9 setTimestamp:a4];
    [(MakeRunnableEvent *)v9 setInInterrupt:v5];
  }
  return v9;
}

- (unint64_t)madeRunnableByThreadId
{
  return self->_madeRunnableByThreadId;
}

- (void)setMadeRunnableByThreadId:(unint64_t)a3
{
  self->_madeRunnableByThreadId = a3;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(unint64_t)a3
{
  self->_timestamp = a3;
}

- (BOOL)inInterrupt
{
  return self->_inInterrupt;
}

- (void)setInInterrupt:(BOOL)a3
{
  self->_inInterrupt = a3;
}

@end