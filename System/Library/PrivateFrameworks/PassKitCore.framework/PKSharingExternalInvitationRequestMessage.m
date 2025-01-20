@interface PKSharingExternalInvitationRequestMessage
+ (BOOL)supportsSecureCoding;
- (BOOL)configureWithContent:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)sharingSessionIdentifier;
- (PKSharingExternalInvitationRequestMessage)initWithSharingSessionIdentifier:(id)a3;
- (id)description;
@end

@implementation PKSharingExternalInvitationRequestMessage

- (PKSharingExternalInvitationRequestMessage)initWithSharingSessionIdentifier:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v11 = @"sharingSessionIdentifier";
    v12[0] = a3;
    v4 = (void *)MEMORY[0x1E4F1C9E8];
    id v5 = a3;
    v6 = [v4 dictionaryWithObjects:v12 forKeys:&v11 count:1];
    v10.receiver = self;
    v10.super_class = (Class)PKSharingExternalInvitationRequestMessage;
    v7 = [(PKSharingGenericMessage *)&v10 initWithFormat:3 type:1002 genericSharingDict:MEMORY[0x1E4F1CC08] appleSharingDict:v6];

    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)configureWithContent:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKSharingExternalInvitationRequestMessage;
  if ([(PKSharingGenericMessage *)&v10 configureWithContent:v4])
  {
    id v5 = [v4 PKDictionaryForKey:@"apple"];
    v6 = [v5 PKStringForKey:@"sharingSessionIdentifier"];
    sharingSessionIdentifier = self->_sharingSessionIdentifier;
    self->_sharingSessionIdentifier = v6;

    BOOL v8 = self->_sharingSessionIdentifier != 0;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  id v4 = [(PKSharingMessage *)self identifier];
  [v3 appendFormat:@"identifier: '%@'; ", v4];

  id v5 = PKSharingMessageTypeToString([(PKSharingMessage *)self type]);
  [v3 appendFormat:@"type: '%@'; ", v5];

  [v3 appendFormat:@"sharingSessionIdentifier: '%@'; ", self->_sharingSessionIdentifier];
  [v3 appendFormat:@">"];
  v6 = (void *)[v3 copy];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKSharingExternalInvitationRequestMessage *)a3;
  id v5 = v4;
  if (v4 == self)
  {
    LOBYTE(self) = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    if (self)
    {
      v11.receiver = self;
      v11.super_class = (Class)PKSharingExternalInvitationRequestMessage;
      if ([(PKSharingGenericMessage *)&v11 isEqual:v6])
      {
        sharingSessionIdentifier = self->_sharingSessionIdentifier;
        BOOL v8 = v6->_sharingSessionIdentifier;
        if (sharingSessionIdentifier) {
          BOOL v9 = v8 == 0;
        }
        else {
          BOOL v9 = 1;
        }
        if (v9) {
          LOBYTE(self) = sharingSessionIdentifier == v8;
        }
        else {
          LOBYTE(self) = -[NSString isEqual:](sharingSessionIdentifier, "isEqual:");
        }
      }
      else
      {
        LOBYTE(self) = 0;
      }
    }
  }
  else
  {
    LOBYTE(self) = 0;
  }

  return (char)self;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)sharingSessionIdentifier
{
  return self->_sharingSessionIdentifier;
}

- (void).cxx_destruct
{
}

@end