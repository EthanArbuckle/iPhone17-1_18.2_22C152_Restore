@interface _SVXSystemEventMutation
- (_SVXSystemEventMutation)init;
- (_SVXSystemEventMutation)initWithBaseModel:(id)a3;
- (id)generate;
- (void)setAudioSessionID:(unsigned int)a3;
- (void)setDeviceSetupFlowScene:(id)a3;
- (void)setOrderedAlarmAndTimerIDs:(id)a3;
- (void)setSpeechSynthesisRequest:(id)a3;
- (void)setStoreDemo:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setType:(int64_t)a3;
@end

@implementation _SVXSystemEventMutation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_speechSynthesisRequest, 0);
  objc_storeStrong((id *)&self->_orderedAlarmAndTimerIDs, 0);
  objc_storeStrong((id *)&self->_storeDemo, 0);
  objc_storeStrong((id *)&self->_deviceSetupFlowScene, 0);

  objc_storeStrong((id *)&self->_baseModel, 0);
}

- (id)generate
{
  baseModel = self->_baseModel;
  if (!baseModel)
  {
    v6 = [SVXSystemEvent alloc];
    LODWORD(v20) = self->_audioSessionID;
    uint64_t v5 = [(SVXSystemEvent *)v6 initWithType:self->_type timestamp:self->_timestamp deviceSetupFlowScene:self->_deviceSetupFlowScene storeDemo:self->_storeDemo orderedAlarmAndTimerIDs:self->_orderedAlarmAndTimerIDs speechSynthesisRequest:self->_speechSynthesisRequest audioSessionID:v20];
    goto LABEL_5;
  }
  char mutationFlags = (char)self->_mutationFlags;
  if (mutationFlags)
  {
    if ((*(unsigned char *)&self->_mutationFlags & 2) != 0)
    {
      int64_t type = self->_type;
      if ((*(unsigned char *)&self->_mutationFlags & 4) != 0)
      {
LABEL_8:
        unint64_t timestamp = self->_timestamp;
        if ((mutationFlags & 8) != 0)
        {
LABEL_9:
          v10 = self->_deviceSetupFlowScene;
LABEL_13:
          v11 = v10;
          if ((*(unsigned char *)&self->_mutationFlags & 0x10) != 0)
          {
            v12 = self->_storeDemo;
          }
          else
          {
            v12 = [(SVXSystemEvent *)self->_baseModel storeDemo];
          }
          v13 = v12;
          if ((*(unsigned char *)&self->_mutationFlags & 0x20) != 0)
          {
            v14 = self->_orderedAlarmAndTimerIDs;
          }
          else
          {
            v14 = [(SVXSystemEvent *)self->_baseModel orderedAlarmAndTimerIDs];
          }
          v15 = v14;
          if ((*(unsigned char *)&self->_mutationFlags & 0x40) != 0)
          {
            v16 = self->_speechSynthesisRequest;
          }
          else
          {
            v16 = [(SVXSystemEvent *)self->_baseModel speechSynthesisRequest];
          }
          v17 = v16;
          if ((*(unsigned char *)&self->_mutationFlags & 0x80000000) != 0) {
            unsigned int audioSessionID = self->_audioSessionID;
          }
          else {
            unsigned int audioSessionID = [(SVXSystemEvent *)self->_baseModel audioSessionID];
          }
          LODWORD(v20) = audioSessionID;
          v7 = [[SVXSystemEvent alloc] initWithType:type timestamp:timestamp deviceSetupFlowScene:v11 storeDemo:v13 orderedAlarmAndTimerIDs:v15 speechSynthesisRequest:v17 audioSessionID:v20];

          goto LABEL_26;
        }
LABEL_12:
        v10 = [(SVXSystemEvent *)self->_baseModel deviceSetupFlowScene];
        goto LABEL_13;
      }
    }
    else
    {
      int64_t type = [(SVXSystemEvent *)baseModel type];
      char mutationFlags = (char)self->_mutationFlags;
      if ((mutationFlags & 4) != 0) {
        goto LABEL_8;
      }
    }
    unint64_t timestamp = [(SVXSystemEvent *)self->_baseModel timestamp];
    if ((*(unsigned char *)&self->_mutationFlags & 8) != 0) {
      goto LABEL_9;
    }
    goto LABEL_12;
  }
  uint64_t v5 = [(SVXSystemEvent *)baseModel copy];
LABEL_5:
  v7 = (SVXSystemEvent *)v5;
LABEL_26:

  return v7;
}

- (void)setAudioSessionID:(unsigned int)a3
{
  self->_unsigned int audioSessionID = a3;
  *(unsigned char *)&self->_mutationFlags |= 0x81u;
}

- (void)setSpeechSynthesisRequest:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 0x41u;
}

- (void)setOrderedAlarmAndTimerIDs:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 0x21u;
}

- (void)setStoreDemo:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 0x11u;
}

- (void)setDeviceSetupFlowScene:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 9u;
}

- (void)setTimestamp:(unint64_t)a3
{
  self->_unint64_t timestamp = a3;
  *(unsigned char *)&self->_mutationFlags |= 5u;
}

- (void)setType:(int64_t)a3
{
  self->_int64_t type = a3;
  *(unsigned char *)&self->_mutationFlags |= 3u;
}

- (_SVXSystemEventMutation)initWithBaseModel:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SVXSystemEventMutation;
  v6 = [(_SVXSystemEventMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_baseModel, a3);
  }

  return v7;
}

- (_SVXSystemEventMutation)init
{
  return [(_SVXSystemEventMutation *)self initWithBaseModel:0];
}

@end