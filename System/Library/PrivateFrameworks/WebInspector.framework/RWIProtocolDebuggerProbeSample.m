@interface RWIProtocolDebuggerProbeSample
- (RWIProtocolDebuggerProbeSample)initWithProbeId:(int)a3 sampleId:(int)a4 batchId:(int)a5 timestamp:(double)a6 payload:(id)a7;
- (RWIProtocolRuntimeRemoteObject)payload;
- (double)timestamp;
- (int)batchId;
- (int)probeId;
- (int)sampleId;
- (void)setBatchId:(int)a3;
- (void)setPayload:(id)a3;
- (void)setProbeId:(int)a3;
- (void)setSampleId:(int)a3;
- (void)setTimestamp:(double)a3;
@end

@implementation RWIProtocolDebuggerProbeSample

- (RWIProtocolDebuggerProbeSample)initWithProbeId:(int)a3 sampleId:(int)a4 batchId:(int)a5 timestamp:(double)a6 payload:(id)a7
{
  uint64_t v8 = *(void *)&a5;
  uint64_t v9 = *(void *)&a4;
  uint64_t v10 = *(void *)&a3;
  id v12 = a7;
  v16.receiver = self;
  v16.super_class = (Class)RWIProtocolDebuggerProbeSample;
  v13 = [(RWIProtocolJSONObject *)&v16 init];
  if (v13)
  {
    if (!v12) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required property '%@' cannot be nil", @"payload" format];
    }
    [(RWIProtocolDebuggerProbeSample *)v13 setProbeId:v10];
    [(RWIProtocolDebuggerProbeSample *)v13 setSampleId:v9];
    [(RWIProtocolDebuggerProbeSample *)v13 setBatchId:v8];
    [(RWIProtocolDebuggerProbeSample *)v13 setTimestamp:a6];
    [(RWIProtocolDebuggerProbeSample *)v13 setPayload:v12];
    v14 = v13;
  }

  return v13;
}

- (void)setProbeId:(int)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDebuggerProbeSample;
  [(RWIProtocolJSONObject *)&v3 setInteger:*(void *)&a3 forKey:@"probeId"];
}

- (int)probeId
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDebuggerProbeSample;
  return [(RWIProtocolJSONObject *)&v3 integerForKey:@"probeId"];
}

- (void)setSampleId:(int)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDebuggerProbeSample;
  [(RWIProtocolJSONObject *)&v3 setInteger:*(void *)&a3 forKey:@"sampleId"];
}

- (int)sampleId
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDebuggerProbeSample;
  return [(RWIProtocolJSONObject *)&v3 integerForKey:@"sampleId"];
}

- (void)setBatchId:(int)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDebuggerProbeSample;
  [(RWIProtocolJSONObject *)&v3 setInteger:*(void *)&a3 forKey:@"batchId"];
}

- (int)batchId
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDebuggerProbeSample;
  return [(RWIProtocolJSONObject *)&v3 integerForKey:@"batchId"];
}

- (void)setTimestamp:(double)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDebuggerProbeSample;
  [(RWIProtocolJSONObject *)&v3 setDouble:@"timestamp" forKey:a3];
}

- (double)timestamp
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDebuggerProbeSample;
  [(RWIProtocolJSONObject *)&v3 doubleForKey:@"timestamp"];
  return result;
}

- (void)setPayload:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDebuggerProbeSample;
  [(RWIProtocolJSONObject *)&v3 setObject:a3 forKey:@"payload"];
}

- (RWIProtocolRuntimeRemoteObject)payload
{
  v14.receiver = self;
  v14.super_class = (Class)RWIProtocolDebuggerProbeSample;
  objc_super v3 = [(RWIProtocolJSONObject *)&v14 objectForKey:@"payload"];
  if (v3)
  {
    v4 = [RWIProtocolRuntimeRemoteObject alloc];
    v11.receiver = self;
    v11.super_class = (Class)RWIProtocolDebuggerProbeSample;
    v5 = [(RWIProtocolJSONObject *)&v11 objectForKey:@"payload"];
    [v5 toJSONObject];
    v6 = v12;
    ++*v12;
    v13 = v6;
    v7 = [(RWIProtocolJSONObject *)v4 initWithJSONObject:&v13];
    uint64_t v8 = v13;
    v13 = 0;
    if (v8)
    {
      if (*v8 == 1) {
        WTF::JSONImpl::Value::operator delete();
      }
      else {
        --*v8;
      }
    }
    uint64_t v9 = v12;
    id v12 = 0;
    if (v9)
    {
      if (*v9 == 1) {
        WTF::JSONImpl::Value::operator delete();
      }
      else {
        --*v9;
      }
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end