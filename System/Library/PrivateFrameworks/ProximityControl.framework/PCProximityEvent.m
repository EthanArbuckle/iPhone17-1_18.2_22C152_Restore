@interface PCProximityEvent
+ (BOOL)supportsSecureCoding;
- (BOOL)expectsDisplayContext;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)info;
- (NSError)error;
- (NSString)mediaRemoteID;
- (PCProximityEvent)initWithCoder:(id)a3;
- (PCProximityEvent)initWithError:(id)a3 mediaRemoteID:(id)a4;
- (PCProximityEvent)initWithType:(int64_t)a3 mediaRemoteID:(id)a4 info:(id)a5;
- (id)description;
- (int64_t)eventType;
- (void)encodeWithCoder:(id)a3;
- (void)setExpectsDisplayContext:(BOOL)a3;
@end

@implementation PCProximityEvent

- (PCProximityEvent)initWithType:(int64_t)a3 mediaRemoteID:(id)a4 info:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PCProximityEvent;
  v11 = [(PCProximityEvent *)&v14 init];
  v12 = v11;
  if (v11)
  {
    v11->_eventType = a3;
    objc_storeStrong((id *)&v11->_info, a5);
    objc_storeStrong((id *)&v12->_mediaRemoteID, a4);
  }

  return v12;
}

- (PCProximityEvent)initWithError:(id)a3 mediaRemoteID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PCProximityEvent;
  id v9 = [(PCProximityEvent *)&v12 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_error, a3);
    objc_storeStrong((id *)&v10->_mediaRemoteID, a4);
  }

  return v10;
}

- (id)description
{
  unint64_t eventType = self->_eventType;
  if (eventType > 9) {
    v4 = @"?";
  }
  else {
    v4 = off_26443E130[eventType];
  }
  v5 = [MEMORY[0x263F089D8] stringWithFormat:@"<PCProximityEvent id=%@ type=%@", self->_mediaRemoteID, v4];
  v6 = v5;
  if (self->_expectsDisplayContext) {
    [v5 appendString:@", expects content"];
  }
  if (self->_info) {
    [v6 appendString:@", info present"];
  }
  error = self->_error;
  if (error)
  {
    id v8 = [(NSError *)error localizedDescription];
    [v6 appendFormat:@", error=%@", v8];
  }
  [v6 appendString:@">"];
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    if ([v5 eventType] != self->_eventType
      || self->_expectsDisplayContext != [v5 expectsDisplayContext])
    {
      goto LABEL_13;
    }
    v6 = [v5 mediaRemoteID];
    mediaRemoteID = self->_mediaRemoteID;
    id v8 = v6;
    id v9 = mediaRemoteID;
    if (v8 == v9)
    {
    }
    else
    {
      id v10 = v9;
      if ((v8 == 0) == (v9 != 0)) {
        goto LABEL_20;
      }
      int v11 = [v8 isEqual:v9];

      if (!v11) {
        goto LABEL_13;
      }
    }
    v13 = [v5 error];
    error = self->_error;
    id v8 = v13;
    v15 = error;
    if (v8 == v15)
    {
    }
    else
    {
      id v10 = v15;
      if ((v8 == 0) == (v15 != 0)) {
        goto LABEL_20;
      }
      int v16 = [v8 isEqual:v15];

      if (!v16)
      {
LABEL_13:
        char v12 = 0;
LABEL_14:

        goto LABEL_15;
      }
    }
    v18 = [v5 info];
    info = self->_info;
    id v8 = v18;
    v20 = info;
    id v10 = v20;
    if (v8 == v20)
    {
      char v12 = 1;
      goto LABEL_21;
    }
    if ((v8 == 0) != (v20 != 0))
    {
      char v12 = [v8 isEqual:v20];
LABEL_21:

      goto LABEL_14;
    }
LABEL_20:
    char v12 = 0;
    goto LABEL_21;
  }
  char v12 = 0;
LABEL_15:

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  error = self->_error;
  id v8 = v4;
  if (error)
  {
    [v4 encodeObject:error forKey:@"err"];
    id v4 = v8;
  }
  if (LODWORD(self->_eventType))
  {
    [v8 encodeInteger:SLODWORD(self->_eventType) forKey:@"type"];
    id v4 = v8;
  }
  if (self->_expectsDisplayContext)
  {
    [v8 encodeBool:1 forKey:@"exp"];
    id v4 = v8;
  }
  info = self->_info;
  if (info)
  {
    [v8 encodeObject:info forKey:@"info"];
    id v4 = v8;
  }
  mediaRemoteID = self->_mediaRemoteID;
  if (mediaRemoteID)
  {
    [v8 encodeObject:mediaRemoteID forKey:@"mID"];
    id v4 = v8;
  }
}

- (PCProximityEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PCProximityEvent;
  id v5 = [(PCProximityEvent *)&v10 init];
  if (v5)
  {
    objc_opt_class();
    NSDecodeObjectIfPresent();
    uint64_t v11 = 0;
    if (NSDecodeSInt64RangedIfPresent()) {
      LODWORD(v5->_eventType) = v11;
    }
    id v6 = v4;
    if ([v6 containsValueForKey:@"exp"]) {
      v5->_expectsDisplayContext = [v6 decodeBoolForKey:@"exp"];
    }

    id v7 = v6;
    objc_opt_class();
    NSDecodeStandardContainerIfPresent();

    id v8 = v7;
    objc_opt_class();
    NSDecodeObjectIfPresent();
  }
  return v5;
}

- (NSDictionary)info
{
  return self->_info;
}

- (NSError)error
{
  return self->_error;
}

- (int64_t)eventType
{
  return self->_eventType;
}

- (BOOL)expectsDisplayContext
{
  return self->_expectsDisplayContext;
}

- (void)setExpectsDisplayContext:(BOOL)a3
{
  self->_expectsDisplayContext = a3;
}

- (NSString)mediaRemoteID
{
  return self->_mediaRemoteID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaRemoteID, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_info, 0);
}

@end