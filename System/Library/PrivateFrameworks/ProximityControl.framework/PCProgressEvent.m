@interface PCProgressEvent
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSError)error;
- (NSString)mediaRemoteID;
- (PCProgressEvent)initWithCoder:(id)a3;
- (PCProgressEvent)initWithError:(id)a3;
- (PCProgressEvent)initWithEventType:(int64_t)a3;
- (id)description;
- (int64_t)eventType;
- (void)encodeWithCoder:(id)a3;
- (void)setMediaRemoteID:(id)a3;
@end

@implementation PCProgressEvent

- (PCProgressEvent)initWithEventType:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PCProgressEvent;
  v4 = [(PCProgressEvent *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->_eventType = a3;
    v6 = v4;
  }

  return v5;
}

- (PCProgressEvent)initWithError:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PCProgressEvent;
  v6 = [(PCProgressEvent *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_error, a3);
    v7->_eventType = 0;
    objc_super v8 = v7;
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [v5 mediaRemoteID];
    mediaRemoteID = self->_mediaRemoteID;
    objc_super v8 = v6;
    v9 = mediaRemoteID;
    if (v8 == (NSError *)v9)
    {
    }
    else
    {
      objc_super v10 = (NSError *)v9;
      if ((v8 == 0) == (v9 != 0)) {
        goto LABEL_12;
      }
      int v11 = [(NSError *)v8 isEqual:v9];

      if (!v11) {
        goto LABEL_13;
      }
    }
    v13 = [v5 error];
    error = self->_error;
    objc_super v8 = v13;
    v15 = error;
    if (v8 == v15)
    {

LABEL_15:
      BOOL v12 = [v5 eventType] == self->_eventType;
      goto LABEL_16;
    }
    objc_super v10 = v15;
    if ((v8 == 0) != (v15 != 0))
    {
      int v16 = [(NSError *)v8 isEqual:v15];

      if (v16) {
        goto LABEL_15;
      }
LABEL_13:
      BOOL v12 = 0;
LABEL_16:

      goto LABEL_17;
    }
LABEL_12:

    goto LABEL_13;
  }
  BOOL v12 = 0;
LABEL_17:

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
    [v4 encodeObject:error forKey:@"er"];
    id v4 = v8;
  }
  int64_t eventType = self->_eventType;
  if (eventType)
  {
    [v8 encodeInteger:eventType forKey:@"et"];
    id v4 = v8;
  }
  mediaRemoteID = self->_mediaRemoteID;
  if (mediaRemoteID)
  {
    [v8 encodeObject:mediaRemoteID forKey:@"mrID"];
    id v4 = v8;
  }
}

- (PCProgressEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PCProgressEvent;
  id v5 = [(PCProgressEvent *)&v10 init];
  if (v5)
  {
    objc_opt_class();
    NSDecodeObjectIfPresent();
    id v6 = v4;
    if ([v6 containsValueForKey:@"et"]) {
      v5->_int64_t eventType = [v6 decodeIntegerForKey:@"et"];
    }

    id v7 = v6;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v8 = v5;
  }

  return v5;
}

- (id)description
{
  unint64_t eventType = self->_eventType;
  if (eventType > 2) {
    v3 = @"?";
  }
  else {
    v3 = off_26443DE60[eventType];
  }
  return (id)[NSString stringWithFormat:@"%@", v3];
}

- (NSError)error
{
  return self->_error;
}

- (int64_t)eventType
{
  return self->_eventType;
}

- (NSString)mediaRemoteID
{
  return self->_mediaRemoteID;
}

- (void)setMediaRemoteID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaRemoteID, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end