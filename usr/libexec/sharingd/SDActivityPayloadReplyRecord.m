@interface SDActivityPayloadReplyRecord
- (NSString)deviceIdentifier;
- (NSUUID)activityIdentifier;
- (NSUUID)messageIdentifier;
- (NSUUID)requestIdentifier;
- (id)description;
- (void)setActivityIdentifier:(id)a3;
- (void)setDeviceIdentifier:(id)a3;
- (void)setMessageIdentifier:(id)a3;
- (void)setRequestIdentifier:(id)a3;
@end

@implementation SDActivityPayloadReplyRecord

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = [(SDActivityPayloadReplyRecord *)self messageIdentifier];
  v6 = [v5 UUIDString];
  v7 = [(SDActivityPayloadReplyRecord *)self requestIdentifier];
  v8 = [v7 UUIDString];
  v9 = [(SDActivityPayloadReplyRecord *)self activityIdentifier];
  v10 = [v9 UUIDString];
  v11 = [(SDActivityPayloadReplyRecord *)self deviceIdentifier];
  v12 = +[NSString stringWithFormat:@"<%@: %p, messageIdentifier:%@, requestIdentifier:%@, activityIdentifier:%@, deviceIdentifier:%@>", v4, self, v6, v8, v10, v11];

  return v12;
}

- (NSUUID)messageIdentifier
{
  return self->_messageIdentifier;
}

- (void)setMessageIdentifier:(id)a3
{
}

- (NSUUID)requestIdentifier
{
  return self->_requestIdentifier;
}

- (void)setRequestIdentifier:(id)a3
{
}

- (NSUUID)activityIdentifier
{
  return self->_activityIdentifier;
}

- (void)setActivityIdentifier:(id)a3
{
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void)setDeviceIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_activityIdentifier, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);

  objc_storeStrong((id *)&self->_messageIdentifier, 0);
}

@end