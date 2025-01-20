@interface WFTriggerEvent
- (BOOL)confirmed;
- (NSData)eventInfo;
- (NSDate)dateCreated;
- (NSString)triggerID;
- (WFTriggerEvent)initWithIdentifier:(id)a3 triggerID:(id)a4 eventInfo:(id)a5 confirmed:(BOOL)a6 dateCreated:(id)a7;
- (void)setConfirmed:(BOOL)a3;
@end

@implementation WFTriggerEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateCreated, 0);
  objc_storeStrong((id *)&self->_eventInfo, 0);
  objc_storeStrong((id *)&self->_triggerID, 0);
}

- (void)setConfirmed:(BOOL)a3
{
  self->_confirmed = a3;
}

- (BOOL)confirmed
{
  return self->_confirmed;
}

- (NSDate)dateCreated
{
  return self->_dateCreated;
}

- (NSData)eventInfo
{
  return self->_eventInfo;
}

- (NSString)triggerID
{
  return self->_triggerID;
}

- (WFTriggerEvent)initWithIdentifier:(id)a3 triggerID:(id)a4 eventInfo:(id)a5 confirmed:(BOOL)a6 dateCreated:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  if (v13)
  {
    if (v14) {
      goto LABEL_3;
    }
  }
  else
  {
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"WFTriggerEvent.m", 17, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];

    if (v14)
    {
LABEL_3:
      if (v15) {
        goto LABEL_4;
      }
LABEL_10:
      v26 = [MEMORY[0x1E4F28B00] currentHandler];
      [v26 handleFailureInMethod:a2, self, @"WFTriggerEvent.m", 19, @"Invalid parameter not satisfying: %@", @"eventInfo" object file lineNumber description];

      if (v16) {
        goto LABEL_5;
      }
      goto LABEL_11;
    }
  }
  v25 = [MEMORY[0x1E4F28B00] currentHandler];
  [v25 handleFailureInMethod:a2, self, @"WFTriggerEvent.m", 18, @"Invalid parameter not satisfying: %@", @"triggerID" object file lineNumber description];

  if (!v15) {
    goto LABEL_10;
  }
LABEL_4:
  if (v16) {
    goto LABEL_5;
  }
LABEL_11:
  v27 = [MEMORY[0x1E4F28B00] currentHandler];
  [v27 handleFailureInMethod:a2, self, @"WFTriggerEvent.m", 20, @"Invalid parameter not satisfying: %@", @"date" object file lineNumber description];

LABEL_5:
  v28.receiver = self;
  v28.super_class = (Class)WFTriggerEvent;
  v17 = [(WFTriggerEvent *)&v28 initWithIdentifier:v13 objectType:4];
  if (v17)
  {
    uint64_t v18 = [v14 copy];
    triggerID = v17->_triggerID;
    v17->_triggerID = (NSString *)v18;

    uint64_t v20 = [v15 copy];
    eventInfo = v17->_eventInfo;
    v17->_eventInfo = (NSData *)v20;

    objc_storeStrong((id *)&v17->_dateCreated, a7);
    v17->_confirmed = a6;
    v22 = v17;
  }

  return v17;
}

@end