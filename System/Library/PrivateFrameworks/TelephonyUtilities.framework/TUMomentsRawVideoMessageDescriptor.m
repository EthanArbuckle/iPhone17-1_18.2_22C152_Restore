@interface TUMomentsRawVideoMessageDescriptor
+ (BOOL)supportsSecureCoding;
- (NSUUID)uuid;
- (TUMomentsRawVideoMessageDescriptor)initWithCoder:(id)a3;
- (TUMomentsRawVideoMessageDescriptor)initWithUUID:(id)a3 videoURL:(id)a4;
- (TUSandboxExtendedURL)videoURL;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TUMomentsRawVideoMessageDescriptor

- (TUMomentsRawVideoMessageDescriptor)initWithUUID:(id)a3 videoURL:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TUMomentsRawVideoMessageDescriptor;
  v9 = [(TUMomentsRawVideoMessageDescriptor *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_uuid, a3);
    objc_storeStrong((id *)&v10->_videoURL, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(TUMomentsRawVideoMessageDescriptor *)self uuid];
  v6 = NSStringFromSelector(sel_uuid);
  [v4 encodeObject:v5 forKey:v6];

  id v8 = [(TUMomentsRawVideoMessageDescriptor *)self videoURL];
  id v7 = NSStringFromSelector(sel_videoURL);
  [v4 encodeObject:v8 forKey:v7];
}

- (TUMomentsRawVideoMessageDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = NSStringFromSelector(sel_uuid);
  id v7 = [v4 decodeObjectOfClass:v5 forKey:v6];

  uint64_t v8 = objc_opt_class();
  v9 = NSStringFromSelector(sel_videoURL);
  v10 = [v4 decodeObjectOfClass:v8 forKey:v9];

  if (v7) {
    BOOL v11 = v10 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11)
  {
    objc_super v12 = 0;
  }
  else
  {
    self = [(TUMomentsRawVideoMessageDescriptor *)self initWithUUID:v7 videoURL:v10];
    objc_super v12 = self;
  }

  return v12;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (TUSandboxExtendedURL)videoURL
{
  return self->_videoURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoURL, 0);

  objc_storeStrong((id *)&self->_uuid, 0);
}

@end