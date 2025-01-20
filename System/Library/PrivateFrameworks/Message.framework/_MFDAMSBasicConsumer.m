@interface _MFDAMSBasicConsumer
- (MFActivityMonitor)monitor;
- (MFError)error;
- (_MFDAMSBasicConsumer)initWithMaximumSize:(unsigned int)a3 latency:(double)a4;
- (void)dealloc;
- (void)setError:(id)a3;
- (void)setMonitor:(id)a3;
@end

@implementation _MFDAMSBasicConsumer

- (_MFDAMSBasicConsumer)initWithMaximumSize:(unsigned int)a3 latency:(double)a4
{
  v5.receiver = self;
  v5.super_class = (Class)_MFDAMSBasicConsumer;
  return [(MFBufferedQueue *)&v5 initWithMaximumSize:0xFFFFFFFFLL latency:1.79769313e308];
}

- (void)dealloc
{
  [(_MFDAMSBasicConsumer *)self setMonitor:0];
  v3.receiver = self;
  v3.super_class = (Class)_MFDAMSBasicConsumer;
  [(_MFDAMSBasicConsumer *)&v3 dealloc];
}

- (MFActivityMonitor)monitor
{
  return self->monitor;
}

- (void)setMonitor:(id)a3
{
}

- (MFError)error
{
  return self->error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->error, 0);
  objc_storeStrong((id *)&self->monitor, 0);
  objc_storeStrong((id *)&self->library, 0);
  objc_storeStrong((id *)&self->store, 0);
  objc_storeStrong((id *)&self->mailbox, 0);
}

@end