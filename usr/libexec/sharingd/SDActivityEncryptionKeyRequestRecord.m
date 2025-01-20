@interface SDActivityEncryptionKeyRequestRecord
- (NSUUID)previousKeyIdentifier;
- (RPCompanionLinkClient)linkClient;
- (id)description;
- (void)dealloc;
- (void)setLinkClient:(id)a3;
- (void)setPreviousKeyIdentifier:(id)a3;
@end

@implementation SDActivityEncryptionKeyRequestRecord

- (void)dealloc
{
  [(RPCompanionLinkClient *)self->_linkClient invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SDActivityEncryptionKeyRequestRecord;
  [(SDActivityEncryptionKeyRequestRecord *)&v3 dealloc];
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
  previousKeyIdentifier = self->_previousKeyIdentifier;
  v11.receiver = self;
  v11.super_class = (Class)SDActivityEncryptionKeyRequestRecord;
  v8 = [(SDActivityRequestRecord *)&v11 description];
  v9 = +[NSString stringWithFormat:@"<%@: %p, previousKeyIdentifier:%@, %@%@>", v6, self, previousKeyIdentifier, v4, v8];

  return v9;
}

- (NSUUID)previousKeyIdentifier
{
  return self->_previousKeyIdentifier;
}

- (void)setPreviousKeyIdentifier:(id)a3
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

  objc_storeStrong((id *)&self->_previousKeyIdentifier, 0);
}

@end