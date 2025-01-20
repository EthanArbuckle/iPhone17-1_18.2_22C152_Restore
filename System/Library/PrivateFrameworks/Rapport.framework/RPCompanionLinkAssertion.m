@interface RPCompanionLinkAssertion
+ (BOOL)supportsSecureCoding;
- (NSString)assertionID;
- (NSString)destinationID;
- (NSString)identifier;
- (RPCompanionLinkAssertion)initWithCoder:(id)a3;
- (RPCompanionLinkClient)client;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)invalidate;
- (void)setAssertionID:(id)a3;
- (void)setClient:(id)a3;
- (void)setDestinationID:(id)a3;
- (void)setIdentifier:(id)a3;
@end

@implementation RPCompanionLinkAssertion

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RPCompanionLinkAssertion)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RPCompanionLinkAssertion;
  v5 = [(RPCompanionLinkAssertion *)&v11 init];
  if (v5)
  {
    id v6 = v4;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v7 = v6;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v8 = v7;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v9 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  assertionID = self->_assertionID;
  id v8 = v4;
  if (assertionID)
  {
    [v4 encodeObject:assertionID forKey:@"asID"];
    id v4 = v8;
  }
  destinationID = self->_destinationID;
  if (destinationID)
  {
    [v8 encodeObject:destinationID forKey:@"dID"];
    id v4 = v8;
  }
  identifier = self->_identifier;
  if (identifier)
  {
    [v8 encodeObject:identifier forKey:@"id"];
    id v4 = v8;
  }
}

- (id)description
{
  NSAppendPrintF();
  id v3 = 0;
  id v4 = v3;
  if (self->_destinationID)
  {
    id v8 = v3;
    NSAppendPrintF();
    id v5 = v8;

    id v4 = v5;
  }
  if (self->_identifier)
  {
    NSAppendPrintF();
    id v6 = v4;

    id v4 = v6;
  }
  return v4;
}

- (void)invalidate
{
}

- (NSString)assertionID
{
  return self->_assertionID;
}

- (void)setAssertionID:(id)a3
{
}

- (RPCompanionLinkClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
}

- (NSString)destinationID
{
  return self->_destinationID;
}

- (void)setDestinationID:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_destinationID, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_assertionID, 0);
}

@end