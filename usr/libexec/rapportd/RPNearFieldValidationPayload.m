@interface RPNearFieldValidationPayload
- (BOOL)isKnownIdentity;
- (NSNumber)supportsApplicationLabel;
- (RPNearFieldValidationPayload)initWithDictionary:(id)a3;
- (RPNearFieldValidationPayload)initWithKnownIdentity:(BOOL)a3 supportsApplicationLabel:(BOOL)a4;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (id)dictionaryRepresentation;
@end

@implementation RPNearFieldValidationPayload

- (RPNearFieldValidationPayload)initWithKnownIdentity:(BOOL)a3 supportsApplicationLabel:(BOOL)a4
{
  BOOL v4 = a4;
  v12.receiver = self;
  v12.super_class = (Class)RPNearFieldValidationPayload;
  v6 = [(RPNearFieldMessagePayload *)&v12 initWithType:2];
  v7 = v6;
  if (v6)
  {
    v6->_isKnownIdentity = a3;
    uint64_t v8 = +[NSNumber numberWithBool:v4];
    supportsApplicationLabel = v7->_supportsApplicationLabel;
    v7->_supportsApplicationLabel = (NSNumber *)v8;

    v10 = v7;
  }

  return v7;
}

- (RPNearFieldValidationPayload)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RPNearFieldValidationPayload;
  v5 = [(RPNearFieldMessagePayload *)&v11 initWithDictionary:v4];
  if (v5)
  {
    v6 = NSDictionaryGetNSNumber();
    if (v6)
    {
      uint64_t v7 = NSDictionaryGetNSNumber();
      supportsApplicationLabel = v5->_supportsApplicationLabel;
      v5->_supportsApplicationLabel = (NSNumber *)v7;

      v5->_isKnownIdentity = [v6 BOOLValue];
      v9 = v5;
    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)dictionaryRepresentation
{
  v9[0] = @"RPKnownIdentityKey";
  v3 = +[NSNumber numberWithBool:self->_isKnownIdentity];
  v9[1] = @"RPSupportsApplicationLabelKey";
  v10[0] = v3;
  v10[1] = self->_supportsApplicationLabel;
  id v4 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];

  v8.receiver = self;
  v8.super_class = (Class)RPNearFieldValidationPayload;
  v5 = [(RPNearFieldMessagePayload *)&v8 dictionaryRepresentation];
  v6 = +[NSMutableDictionary dictionaryWithDictionary:v5];

  [v6 addEntriesFromDictionary:v4];

  return v6;
}

- (id)description
{
  return [(RPNearFieldValidationPayload *)self descriptionWithLevel:50];
}

- (id)descriptionWithLevel:(int)a3
{
  [(RPNearFieldValidationPayload *)self isKnownIdentity];
  id v4 = NSStringFromBOOL();
  v5 = [(RPNearFieldValidationPayload *)self supportsApplicationLabel];
  v6 = [(RPNearFieldValidationPayload *)self supportsApplicationLabel];
  uint64_t v7 = v6;
  if (v5)
  {
    [v6 BOOLValue];
    objc_super v8 = NSStringFromBOOL();
  }
  else
  {
    objc_super v8 = v6;
  }
  NSAppendPrintF();
  id v9 = 0;
  if (v5) {

  }
  return v9;
}

- (BOOL)isKnownIdentity
{
  return self->_isKnownIdentity;
}

- (NSNumber)supportsApplicationLabel
{
  return self->_supportsApplicationLabel;
}

- (void).cxx_destruct
{
}

@end