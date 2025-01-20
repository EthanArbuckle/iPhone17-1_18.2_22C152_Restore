@interface TUMomentsMessageDescriptor
+ (BOOL)supportsSecureCoding;
- (NSUUID)messageUUID;
- (TUMomentsMessageDescriptor)initWithCoder:(id)a3;
- (TUMomentsMessageDescriptor)initWithMessageUUID:(id)a3 videoURL:(id)a4 thumbnailURL:(id)a5;
- (TUSandboxExtendedURL)thumbnailURL;
- (TUSandboxExtendedURL)videoURL;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TUMomentsMessageDescriptor

- (TUMomentsMessageDescriptor)initWithMessageUUID:(id)a3 videoURL:(id)a4 thumbnailURL:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)TUMomentsMessageDescriptor;
  v12 = [(TUMomentsMessageDescriptor *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_messageUUID, a3);
    objc_storeStrong((id *)&v13->_videoURL, a4);
    objc_storeStrong((id *)&v13->_thumbnailURL, a5);
  }

  return v13;
}

- (TUMomentsMessageDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = NSStringFromSelector(sel_messageUUID);
  v7 = [v4 decodeObjectOfClass:v5 forKey:v6];

  uint64_t v8 = objc_opt_class();
  id v9 = NSStringFromSelector(sel_videoURL);
  id v10 = [v4 decodeObjectOfClass:v8 forKey:v9];

  uint64_t v11 = objc_opt_class();
  v12 = NSStringFromSelector(sel_thumbnailURL);
  v13 = [v4 decodeObjectOfClass:v11 forKey:v12];

  v14 = [(TUMomentsMessageDescriptor *)self initWithMessageUUID:v7 videoURL:v10 thumbnailURL:v13];
  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(TUMomentsMessageDescriptor *)self messageUUID];
  v6 = NSStringFromSelector(sel_messageUUID);
  [v4 encodeObject:v5 forKey:v6];

  v7 = [(TUMomentsMessageDescriptor *)self videoURL];
  uint64_t v8 = NSStringFromSelector(sel_videoURL);
  [v4 encodeObject:v7 forKey:v8];

  id v10 = [(TUMomentsMessageDescriptor *)self thumbnailURL];
  id v9 = NSStringFromSelector(sel_thumbnailURL);
  [v4 encodeObject:v10 forKey:v9];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSUUID)messageUUID
{
  return self->_messageUUID;
}

- (TUSandboxExtendedURL)videoURL
{
  return self->_videoURL;
}

- (TUSandboxExtendedURL)thumbnailURL
{
  return self->_thumbnailURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnailURL, 0);
  objc_storeStrong((id *)&self->_videoURL, 0);

  objc_storeStrong((id *)&self->_messageUUID, 0);
}

@end