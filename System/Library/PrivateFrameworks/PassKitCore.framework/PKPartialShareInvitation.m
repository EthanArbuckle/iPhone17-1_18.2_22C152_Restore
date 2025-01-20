@interface PKPartialShareInvitation
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPartialShareInvitation:(id)a3;
- (BOOL)isHomeShare;
- (NSData)homeInvite;
- (NSString)recipientHandle;
- (NSString)recipientNickname;
- (PKPartialShareInvitation)initWithCoder:(id)a3;
- (PKPartialShareInvitation)initWithHomeInvite:(id)a3 displayInformation:(id)a4;
- (PKPartialShareInvitation)initWithShare:(id)a3 pass:(id)a4;
- (PKPassShare)share;
- (PKSecureElementPass)pass;
- (PKSharingMessageDisplayInformation)displayInformation;
- (id)description;
- (unint64_t)hash;
- (unint64_t)requestSource;
- (void)encodeWithCoder:(id)a3;
- (void)setRecipientHandle:(id)a3;
- (void)setRecipientNickname:(id)a3;
- (void)setRequestSource:(unint64_t)a3;
@end

@implementation PKPartialShareInvitation

- (PKPartialShareInvitation)initWithShare:(id)a3 pass:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKPartialShareInvitation;
  v9 = [(PKPartialShareInvitation *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_share, a3);
    objc_storeStrong((id *)&v10->_pass, a4);
  }

  return v10;
}

- (PKPartialShareInvitation)initWithHomeInvite:(id)a3 displayInformation:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKPartialShareInvitation;
  v9 = [(PKPartialShareInvitation *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_homeInvite, a3);
    objc_storeStrong((id *)&v10->_displayInformation, a4);
  }

  return v10;
}

- (BOOL)isHomeShare
{
  return self->_homeInvite != 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPartialShareInvitation)initWithCoder:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)PKPartialShareInvitation;
  v5 = [(PKPartialShareInvitation *)&v29 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"share"];
    share = v5->_share;
    v5->_share = (PKPassShare *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pass"];
    pass = v5->_pass;
    v5->_pass = (PKSecureElementPass *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"homeInvite"];
    homeInvite = v5->_homeInvite;
    v5->_homeInvite = (NSData *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayInformation"];
    displayInformation = v5->_displayInformation;
    v5->_displayInformation = (PKSharingMessageDisplayInformation *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"recipientNickname"];
    recipientNickname = v5->_recipientNickname;
    v5->_recipientNickname = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"recipientHandle"];
    recipientHandle = v5->_recipientHandle;
    v5->_recipientHandle = (NSString *)v16;

    v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"requestSource"];
    v19 = v18;
    uint64_t v20 = 0;
    if (v18 == @"UI" || !v18) {
      goto LABEL_12;
    }
    char v21 = [(__CFString *)v18 isEqualToString:@"UI"];

    if ((v21 & 1) == 0)
    {
      v22 = v19;
      if (v22 == @"remoteLocalDevice"
        || (v23 = v22,
            char v24 = [(__CFString *)v22 isEqualToString:@"remoteLocalDevice"],
            v23,
            (v24 & 1) != 0))
      {
        uint64_t v20 = 1;
        goto LABEL_12;
      }
      v25 = v23;
      if (v25 == @"remoteExternalDevice"
        || (v26 = v25,
            int v27 = [(__CFString *)v25 isEqualToString:@"remoteExternalDevice"],
            v26,
            v27))
      {
        uint64_t v20 = 2;
        goto LABEL_12;
      }
    }
    uint64_t v20 = 0;
LABEL_12:

    v5->_requestSource = v20;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  share = self->_share;
  id v8 = a3;
  [v8 encodeObject:share forKey:@"share"];
  [v8 encodeObject:self->_pass forKey:@"pass"];
  [v8 encodeObject:self->_homeInvite forKey:@"homeInvite"];
  [v8 encodeObject:self->_displayInformation forKey:@"displayInformation"];
  [v8 encodeObject:self->_recipientNickname forKey:@"recipientNickname"];
  [v8 encodeObject:self->_recipientHandle forKey:@"recipientHandle"];
  unint64_t requestSource = self->_requestSource;
  uint64_t v6 = @"UI";
  if (requestSource == 1) {
    uint64_t v6 = @"remoteLocalDevice";
  }
  if (requestSource == 2) {
    id v7 = @"remoteExternalDevice";
  }
  else {
    id v7 = v6;
  }
  [v8 encodeObject:v7 forKey:@"requestSource"];
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  uint64_t v6 = [v3 stringWithFormat:@"<%@: %p; ", v5, self];

  [v6 appendFormat:@"share: '%@'; ", self->_share];
  [v6 appendFormat:@"pass: '%@'; ", self->_pass];
  [v6 appendFormat:@"homeInvite: '%@'; ", self->_homeInvite];
  [v6 appendFormat:@"displayInformation: '%@'; ", self->_displayInformation];
  [v6 appendFormat:@"recipientNickname: '%@'; ", self->_recipientNickname];
  [v6 appendFormat:@"recipientHandle: '%@'; ", self->_recipientHandle];
  unint64_t requestSource = self->_requestSource;
  id v8 = @"UI";
  if (requestSource == 1) {
    id v8 = @"remoteLocalDevice";
  }
  if (requestSource == 2) {
    v9 = @"remoteExternalDevice";
  }
  else {
    v9 = v8;
  }
  [v6 appendFormat:@"requestSource: '%@'; ", v9];
  [v6 appendFormat:@">"];
  uint64_t v10 = [NSString stringWithString:v6];

  return v10;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = v3;
  if (self->_share) {
    objc_msgSend(v3, "addObject:");
  }
  if (self->_pass) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_homeInvite) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_displayInformation) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_recipientNickname) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_recipientHandle) {
    objc_msgSend(v4, "addObject:");
  }
  uint64_t v5 = PKCombinedHash(17, v4);
  unint64_t v6 = self->_requestSource - v5 + 32 * v5;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKPartialShareInvitation *)a3;
  uint64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKPartialShareInvitation *)self isEqualToPartialShareInvitation:v5];

  return v6;
}

- (BOOL)isEqualToPartialShareInvitation:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_35;
  }
  share = self->_share;
  BOOL v6 = (PKPassShare *)v4[1];
  if (share) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (share != v6) {
      goto LABEL_35;
    }
  }
  else if (!-[PKPassShare isEqual:](share, "isEqual:"))
  {
    goto LABEL_35;
  }
  pass = self->_pass;
  v9 = (PKSecureElementPass *)v4[2];
  if (pass && v9)
  {
    if ((-[PKSecureElementPass isEqual:](pass, "isEqual:") & 1) == 0) {
      goto LABEL_35;
    }
  }
  else if (pass != v9)
  {
    goto LABEL_35;
  }
  homeInvite = self->_homeInvite;
  v11 = (NSData *)v4[4];
  if (homeInvite && v11)
  {
    if ((-[NSData isEqual:](homeInvite, "isEqual:") & 1) == 0) {
      goto LABEL_35;
    }
  }
  else if (homeInvite != v11)
  {
    goto LABEL_35;
  }
  displayInformation = self->_displayInformation;
  v13 = (PKSharingMessageDisplayInformation *)v4[5];
  if (displayInformation && v13)
  {
    if ((-[PKSharingMessageDisplayInformation isEqual:](displayInformation, "isEqual:") & 1) == 0) {
      goto LABEL_35;
    }
  }
  else if (displayInformation != v13)
  {
    goto LABEL_35;
  }
  recipientNickname = self->_recipientNickname;
  v15 = (NSString *)v4[6];
  if (recipientNickname && v15)
  {
    if ((-[NSString isEqual:](recipientNickname, "isEqual:") & 1) == 0) {
      goto LABEL_35;
    }
  }
  else if (recipientNickname != v15)
  {
    goto LABEL_35;
  }
  recipientHandle = self->_recipientHandle;
  v17 = (NSString *)v4[7];
  if (!recipientHandle || !v17)
  {
    if (recipientHandle == v17) {
      goto LABEL_33;
    }
LABEL_35:
    BOOL v18 = 0;
    goto LABEL_36;
  }
  if ((-[NSString isEqual:](recipientHandle, "isEqual:") & 1) == 0) {
    goto LABEL_35;
  }
LABEL_33:
  BOOL v18 = self->_requestSource == v4[3];
LABEL_36:

  return v18;
}

- (void)setRecipientHandle:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_recipientHandle, a3);
  if (self->_recipientHandle) {
    -[PKPassShare setRecipientHandle:](self->_share, "setRecipientHandle:");
  }
}

- (void)setRecipientNickname:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_recipientNickname, a3);
  if (self->_recipientNickname) {
    [(PKPassShare *)self->_share setRecipientNickname:v5];
  }
}

- (PKPassShare)share
{
  return self->_share;
}

- (PKSecureElementPass)pass
{
  return self->_pass;
}

- (unint64_t)requestSource
{
  return self->_requestSource;
}

- (void)setRequestSource:(unint64_t)a3
{
  self->_unint64_t requestSource = a3;
}

- (NSData)homeInvite
{
  return self->_homeInvite;
}

- (PKSharingMessageDisplayInformation)displayInformation
{
  return self->_displayInformation;
}

- (NSString)recipientNickname
{
  return self->_recipientNickname;
}

- (NSString)recipientHandle
{
  return self->_recipientHandle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recipientHandle, 0);
  objc_storeStrong((id *)&self->_recipientNickname, 0);
  objc_storeStrong((id *)&self->_displayInformation, 0);
  objc_storeStrong((id *)&self->_homeInvite, 0);
  objc_storeStrong((id *)&self->_pass, 0);
  objc_storeStrong((id *)&self->_share, 0);
}

@end