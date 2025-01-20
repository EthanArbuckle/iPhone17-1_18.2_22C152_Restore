@interface PRCollaborationData
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSData)data;
- (PRCollaborationData)initWithCoder:(id)a3;
- (PRCollaborationData)initWithData:(id)a3 sendingPeer:(id)a4;
- (PRPeer)sendingPeer;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PRCollaborationData

- (PRCollaborationData)initWithData:(id)a3 sendingPeer:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PRCollaborationData;
  v9 = [(PRCollaborationData *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_data, a3);
    objc_storeStrong((id *)&v10->_sendingPeer, a4);
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    data = self->_data;
    id v7 = [v5 data];
    if ([(NSData *)data isEqualToData:v7])
    {
      sendingPeer = self->_sendingPeer;
      v9 = [v5 sendingPeer];
      BOOL v10 = [(PRPeer *)sendingPeer isEqual:v9];
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [PRCollaborationData alloc];
  data = self->_data;
  sendingPeer = self->_sendingPeer;
  return [(PRCollaborationData *)v4 initWithData:data sendingPeer:sendingPeer];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PRCollaborationData)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Data"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SendingPeer"];

  id v7 = [(PRCollaborationData *)self initWithData:v5 sendingPeer:v6];
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  data = self->_data;
  id v5 = a3;
  [v5 encodeObject:data forKey:@"Data"];
  [v5 encodeObject:self->_sendingPeer forKey:@"SendingPeer"];
}

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (PRPeer)sendingPeer
{
  return (PRPeer *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sendingPeer, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end