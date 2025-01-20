@interface SVXSystemEvent
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSArray)orderedAlarmAndTimerIDs;
- (SVXDeviceSetupFlowScene)deviceSetupFlowScene;
- (SVXSpeechSynthesisRequest)speechSynthesisRequest;
- (SVXStoreDemo)storeDemo;
- (SVXSystemEvent)initWithCoder:(id)a3;
- (SVXSystemEvent)initWithType:(int64_t)a3 timestamp:(unint64_t)a4;
- (SVXSystemEvent)initWithType:(int64_t)a3 timestamp:(unint64_t)a4 alarm:(id)a5;
- (SVXSystemEvent)initWithType:(int64_t)a3 timestamp:(unint64_t)a4 alarm:(id)a5 deviceSetupFlowScene:(id)a6;
- (SVXSystemEvent)initWithType:(int64_t)a3 timestamp:(unint64_t)a4 deviceSetupFlowScene:(id)a5;
- (SVXSystemEvent)initWithType:(int64_t)a3 timestamp:(unint64_t)a4 deviceSetupFlowScene:(id)a5 storeDemo:(id)a6 orderedAlarmAndTimerIDs:(id)a7;
- (SVXSystemEvent)initWithType:(int64_t)a3 timestamp:(unint64_t)a4 deviceSetupFlowScene:(id)a5 storeDemo:(id)a6 orderedAlarmAndTimerIDs:(id)a7 audioSessionID:(unsigned int)a8;
- (SVXSystemEvent)initWithType:(int64_t)a3 timestamp:(unint64_t)a4 deviceSetupFlowScene:(id)a5 storeDemo:(id)a6 orderedAlarmAndTimerIDs:(id)a7 speechSynthesisRequest:(id)a8 audioSessionID:(unsigned int)a9;
- (SVXSystemEvent)initWithType:(int64_t)a3 timestamp:(unint64_t)a4 storeDemo:(id)a5;
- (SVXSystemEvent)initWithType:(int64_t)a3 timestamp:(unint64_t)a4 timer:(id)a5;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)description;
- (id)mutatedCopyWithMutator:(id)a3;
- (int64_t)type;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)audioSessionID;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SVXSystemEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_speechSynthesisRequest, 0);
  objc_storeStrong((id *)&self->_orderedAlarmAndTimerIDs, 0);
  objc_storeStrong((id *)&self->_storeDemo, 0);

  objc_storeStrong((id *)&self->_deviceSetupFlowScene, 0);
}

- (unsigned)audioSessionID
{
  return self->_audioSessionID;
}

- (SVXSpeechSynthesisRequest)speechSynthesisRequest
{
  return self->_speechSynthesisRequest;
}

- (NSArray)orderedAlarmAndTimerIDs
{
  return self->_orderedAlarmAndTimerIDs;
}

- (SVXStoreDemo)storeDemo
{
  return self->_storeDemo;
}

- (SVXDeviceSetupFlowScene)deviceSetupFlowScene
{
  return self->_deviceSetupFlowScene;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (int64_t)type
{
  return self->_type;
}

- (void)encodeWithCoder:(id)a3
{
  v4 = NSNumber;
  int64_t type = self->_type;
  id v6 = a3;
  v7 = [v4 numberWithInteger:type];
  [v6 encodeObject:v7 forKey:@"SVXSystemEvent::type"];

  v8 = [NSNumber numberWithUnsignedLongLong:self->_timestamp];
  [v6 encodeObject:v8 forKey:@"SVXSystemEvent::timestamp"];

  [v6 encodeObject:self->_deviceSetupFlowScene forKey:@"SVXSystemEvent::deviceSetupFlowScene"];
  [v6 encodeObject:self->_storeDemo forKey:@"SVXSystemEvent::storeDemo"];
  [v6 encodeObject:self->_orderedAlarmAndTimerIDs forKey:@"SVXSystemEvent::orderedAlarmAndTimerIDs"];
  [v6 encodeObject:self->_speechSynthesisRequest forKey:@"SVXSystemEvent::speechSynthesisRequest"];
  id v9 = [NSNumber numberWithUnsignedInt:self->_audioSessionID];
  [v6 encodeObject:v9 forKey:@"SVXSystemEvent::audioSessionID"];
}

- (SVXSystemEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SVXSystemEvent::type"];
  uint64_t v6 = [v5 integerValue];

  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SVXSystemEvent::timestamp"];
  uint64_t v8 = [v7 unsignedLongLongValue];

  id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SVXSystemEvent::deviceSetupFlowScene"];
  v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SVXSystemEvent::storeDemo"];
  v11 = (void *)MEMORY[0x263EFFA08];
  uint64_t v12 = objc_opt_class();
  v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
  v14 = [v4 decodeObjectOfClasses:v13 forKey:@"SVXSystemEvent::orderedAlarmAndTimerIDs"];

  v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SVXSystemEvent::speechSynthesisRequest"];
  v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SVXSystemEvent::audioSessionID"];

  LODWORD(v4) = [v16 unsignedIntValue];
  LODWORD(v19) = v4;
  v17 = [(SVXSystemEvent *)self initWithType:v6 timestamp:v8 deviceSetupFlowScene:v9 storeDemo:v10 orderedAlarmAndTimerIDs:v14 speechSynthesisRequest:v15 audioSessionID:v19];

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SVXSystemEvent *)a3;
  if (self == v4)
  {
    BOOL v17 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      int64_t type = self->_type;
      if (type == [(SVXSystemEvent *)v5 type]
        && (unint64_t timestamp = self->_timestamp, timestamp == [(SVXSystemEvent *)v5 timestamp])
        && (unsigned int audioSessionID = self->_audioSessionID,
            audioSessionID == [(SVXSystemEvent *)v5 audioSessionID]))
      {
        id v9 = [(SVXSystemEvent *)v5 deviceSetupFlowScene];
        deviceSetupFlowScene = self->_deviceSetupFlowScene;
        if (deviceSetupFlowScene == v9 || [(SVXDeviceSetupFlowScene *)deviceSetupFlowScene isEqual:v9])
        {
          v11 = [(SVXSystemEvent *)v5 storeDemo];
          storeDemo = self->_storeDemo;
          if (storeDemo == v11 || [(SVXStoreDemo *)storeDemo isEqual:v11])
          {
            v13 = [(SVXSystemEvent *)v5 orderedAlarmAndTimerIDs];
            orderedAlarmAndTimerIDs = self->_orderedAlarmAndTimerIDs;
            if (orderedAlarmAndTimerIDs == v13
              || [(NSArray *)orderedAlarmAndTimerIDs isEqual:v13])
            {
              v15 = [(SVXSystemEvent *)v5 speechSynthesisRequest];
              speechSynthesisRequest = self->_speechSynthesisRequest;
              BOOL v17 = speechSynthesisRequest == v15
                 || [(SVXSpeechSynthesisRequest *)speechSynthesisRequest isEqual:v15];
            }
            else
            {
              BOOL v17 = 0;
            }
          }
          else
          {
            BOOL v17 = 0;
          }
        }
        else
        {
          BOOL v17 = 0;
        }
      }
      else
      {
        BOOL v17 = 0;
      }
    }
    else
    {
      BOOL v17 = 0;
    }
  }

  return v17;
}

- (unint64_t)hash
{
  v3 = [NSNumber numberWithInteger:self->_type];
  uint64_t v4 = [v3 hash];
  v5 = [NSNumber numberWithUnsignedLongLong:self->_timestamp];
  uint64_t v6 = [v5 hash] ^ v4;
  unint64_t v7 = [(SVXDeviceSetupFlowScene *)self->_deviceSetupFlowScene hash];
  unint64_t v8 = v7 ^ [(SVXStoreDemo *)self->_storeDemo hash];
  uint64_t v9 = v8 ^ [(NSArray *)self->_orderedAlarmAndTimerIDs hash];
  unint64_t v10 = v6 ^ v9 ^ [(SVXSpeechSynthesisRequest *)self->_speechSynthesisRequest hash];
  v11 = [NSNumber numberWithUnsignedInt:self->_audioSessionID];
  unint64_t v12 = v10 ^ [v11 hash];

  return v12;
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = [NSString alloc];
  v11.receiver = self;
  v11.super_class = (Class)SVXSystemEvent;
  v5 = [(SVXSystemEvent *)&v11 description];
  unint64_t type = self->_type;
  if (type > 0xD) {
    unint64_t v7 = @"(unknown)";
  }
  else {
    unint64_t v7 = off_264553920[type];
  }
  unint64_t v8 = v7;
  v9 = (void *)[v4 initWithFormat:@"%@ {unint64_t type = %@, timestamp = %llu, deviceSetupFlowScene = %@, storeDemo = %@, orderedAlarmAndTimerIDs = %@, speechSynthesisRequest = %@, audioSessionID = %u}", v5, v8, self->_timestamp, self->_deviceSetupFlowScene, self->_storeDemo, self->_orderedAlarmAndTimerIDs, self->_speechSynthesisRequest, self->_audioSessionID];

  return v9;
}

- (id)description
{
  return [(SVXSystemEvent *)self _descriptionWithIndent:0];
}

- (SVXSystemEvent)initWithType:(int64_t)a3 timestamp:(unint64_t)a4 deviceSetupFlowScene:(id)a5 storeDemo:(id)a6 orderedAlarmAndTimerIDs:(id)a7 speechSynthesisRequest:(id)a8 audioSessionID:(unsigned int)a9
{
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v30.receiver = self;
  v30.super_class = (Class)SVXSystemEvent;
  uint64_t v19 = [(SVXSystemEvent *)&v30 init];
  v20 = v19;
  if (v19)
  {
    v19->_unint64_t type = a3;
    v19->_unint64_t timestamp = a4;
    uint64_t v21 = [v15 copy];
    deviceSetupFlowScene = v20->_deviceSetupFlowScene;
    v20->_deviceSetupFlowScene = (SVXDeviceSetupFlowScene *)v21;

    uint64_t v23 = [v16 copy];
    storeDemo = v20->_storeDemo;
    v20->_storeDemo = (SVXStoreDemo *)v23;

    uint64_t v25 = [v17 copy];
    orderedAlarmAndTimerIDs = v20->_orderedAlarmAndTimerIDs;
    v20->_orderedAlarmAndTimerIDs = (NSArray *)v25;

    uint64_t v27 = [v18 copy];
    speechSynthesisRequest = v20->_speechSynthesisRequest;
    v20->_speechSynthesisRequest = (SVXSpeechSynthesisRequest *)v27;

    v20->_unsigned int audioSessionID = a9;
  }

  return v20;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  id v4 = (void (**)(id, _SVXSystemEventMutation *))a3;
  if (v4)
  {
    v5 = [[_SVXSystemEventMutation alloc] initWithBaseModel:self];
    v4[2](v4, v5);
    uint64_t v6 = [(_SVXSystemEventMutation *)v5 generate];
  }
  else
  {
    uint64_t v6 = (void *)[(SVXSystemEvent *)self copy];
  }

  return v6;
}

+ (id)newWithBuilder:(id)a3
{
  v3 = (void (**)(id, _SVXSystemEventMutation *))a3;
  id v4 = objc_alloc_init(_SVXSystemEventMutation);
  if (v3) {
    v3[2](v3, v4);
  }
  v5 = [(_SVXSystemEventMutation *)v4 generate];

  return v5;
}

- (SVXSystemEvent)initWithType:(int64_t)a3 timestamp:(unint64_t)a4 deviceSetupFlowScene:(id)a5 storeDemo:(id)a6 orderedAlarmAndTimerIDs:(id)a7 audioSessionID:(unsigned int)a8
{
  LODWORD(v9) = a8;
  return [(SVXSystemEvent *)self initWithType:a3 timestamp:a4 deviceSetupFlowScene:a5 storeDemo:a6 orderedAlarmAndTimerIDs:a7 speechSynthesisRequest:0 audioSessionID:v9];
}

- (SVXSystemEvent)initWithType:(int64_t)a3 timestamp:(unint64_t)a4 deviceSetupFlowScene:(id)a5 storeDemo:(id)a6 orderedAlarmAndTimerIDs:(id)a7
{
  return [(SVXSystemEvent *)self initWithType:a3 timestamp:a4 deviceSetupFlowScene:a5 storeDemo:a6 orderedAlarmAndTimerIDs:a7 audioSessionID:0];
}

- (SVXSystemEvent)initWithType:(int64_t)a3 timestamp:(unint64_t)a4 timer:(id)a5
{
  LODWORD(v6) = 0;
  return [(SVXSystemEvent *)self initWithType:a3 timestamp:a4 deviceSetupFlowScene:0 storeDemo:0 orderedAlarmAndTimerIDs:0 speechSynthesisRequest:0 audioSessionID:v6];
}

- (SVXSystemEvent)initWithType:(int64_t)a3 timestamp:(unint64_t)a4 alarm:(id)a5 deviceSetupFlowScene:(id)a6
{
  LODWORD(v7) = 0;
  return [(SVXSystemEvent *)self initWithType:a3 timestamp:a4 deviceSetupFlowScene:a6 storeDemo:0 orderedAlarmAndTimerIDs:0 speechSynthesisRequest:0 audioSessionID:v7];
}

- (SVXSystemEvent)initWithType:(int64_t)a3 timestamp:(unint64_t)a4 storeDemo:(id)a5
{
  LODWORD(v6) = 0;
  return [(SVXSystemEvent *)self initWithType:a3 timestamp:a4 deviceSetupFlowScene:0 storeDemo:a5 orderedAlarmAndTimerIDs:0 speechSynthesisRequest:0 audioSessionID:v6];
}

- (SVXSystemEvent)initWithType:(int64_t)a3 timestamp:(unint64_t)a4 deviceSetupFlowScene:(id)a5
{
  LODWORD(v6) = 0;
  return [(SVXSystemEvent *)self initWithType:a3 timestamp:a4 deviceSetupFlowScene:a5 storeDemo:0 orderedAlarmAndTimerIDs:0 speechSynthesisRequest:0 audioSessionID:v6];
}

- (SVXSystemEvent)initWithType:(int64_t)a3 timestamp:(unint64_t)a4 alarm:(id)a5
{
  LODWORD(v6) = 0;
  return [(SVXSystemEvent *)self initWithType:a3 timestamp:a4 deviceSetupFlowScene:0 storeDemo:0 orderedAlarmAndTimerIDs:0 speechSynthesisRequest:0 audioSessionID:v6];
}

- (SVXSystemEvent)initWithType:(int64_t)a3 timestamp:(unint64_t)a4
{
  LODWORD(v5) = 0;
  return [(SVXSystemEvent *)self initWithType:a3 timestamp:a4 deviceSetupFlowScene:0 storeDemo:0 orderedAlarmAndTimerIDs:0 speechSynthesisRequest:0 audioSessionID:v5];
}

@end