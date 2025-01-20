@interface SDActivityPayloadRequestRecord
- (NSData)advertisementPayload;
- (NSString)command;
- (RPCompanionLinkClient)linkClient;
- (id)description;
- (void)dealloc;
- (void)setAdvertisementPayload:(id)a3;
- (void)setCommand:(id)a3;
- (void)setLinkClient:(id)a3;
@end

@implementation SDActivityPayloadRequestRecord

- (void)dealloc
{
  [(RPCompanionLinkClient *)self->_linkClient invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SDActivityPayloadRequestRecord;
  [(SDActivityPayloadRequestRecord *)&v3 dealloc];
}

- (id)description
{
  linkClient = self->_linkClient;
  if (linkClient)
  {
    v4 = +[NSString stringWithFormat:@"linkClient: <%@>, ", linkClient];
  }
  else
  {
    v4 = &stru_1008E7020;
  }
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  v7 = SFHexStringForData();
  command = self->_command;
  v12.receiver = self;
  v12.super_class = (Class)SDActivityPayloadRequestRecord;
  v9 = [(SDActivityRequestRecord *)&v12 description];
  v10 = +[NSString stringWithFormat:@"<%@: %p, advertisementPayload:%@, command:%@, %@%@>", v6, self, v7, command, v4, v9];

  return v10;
}

- (NSData)advertisementPayload
{
  return self->_advertisementPayload;
}

- (void)setAdvertisementPayload:(id)a3
{
}

- (NSString)command
{
  return self->_command;
}

- (void)setCommand:(id)a3
{
}

- (RPCompanionLinkClient)linkClient
{
  return self->_linkClient;
}

- (void)setLinkClient:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkClient, 0);
  objc_storeStrong((id *)&self->_command, 0);

  objc_storeStrong((id *)&self->_advertisementPayload, 0);
}

@end