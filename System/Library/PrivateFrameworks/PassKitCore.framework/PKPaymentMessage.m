@interface PKPaymentMessage
+ (BOOL)supportsSecureCoding;
+ (id)paymentMessageWithDictionary:(id)a3;
- (BOOL)allowDeepLink;
- (BOOL)archiveOnNextTransaction;
- (BOOL)hasAssociatedPaymentApplication;
- (BOOL)isArchived;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPaymentMessage:(id)a3;
- (BOOL)isValid;
- (NSDate)expirationDate;
- (NSDate)messageDate;
- (NSString)content;
- (NSString)identifier;
- (NSString)serviceIdentifier;
- (PKPaymentMessage)init;
- (PKPaymentMessage)initWithCoder:(id)a3;
- (id)description;
- (unint64_t)hash;
- (unint64_t)messageType;
- (void)encodeWithCoder:(id)a3;
- (void)setAllowDeepLink:(BOOL)a3;
- (void)setArchived:(BOOL)a3;
- (void)setContent:(id)a3;
- (void)setExpirationDate:(id)a3;
- (void)setHasAssociatedPaymentApplication:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setMessageDate:(id)a3;
- (void)setMessageType:(unint64_t)a3;
- (void)setServiceIdentifier:(id)a3;
@end

@implementation PKPaymentMessage

+ (id)paymentMessageWithDictionary:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(PKPaymentMessage);
  id v5 = v3;
  v6 = (void *)[v5 mutableCopy];
  v7 = [v5 valueForKey:@"identifier"];

  [v6 removeObjectForKey:@"identifier"];
  [v6 setObject:v7 forKey:@"serviceIdentifier"];

  v8 = [v6 PKStringForKey:@"serviceIdentifier"];
  v9 = [v8 uppercaseString];
  [(PKPaymentMessage *)v4 setServiceIdentifier:v9];

  v10 = [v6 PKStringForKey:@"content"];
  [(PKPaymentMessage *)v4 setContent:v10];

  v11 = [v6 PKDateForKey:@"messageDate"];
  [(PKPaymentMessage *)v4 setMessageDate:v11];

  -[PKPaymentMessage setAllowDeepLink:](v4, "setAllowDeepLink:", [v6 PKBoolForKey:@"allowDeepLink"]);
  v12 = [v6 PKDateForKey:@"expirationDate"];
  [(PKPaymentMessage *)v4 setExpirationDate:v12];

  return v4;
}

- (PKPaymentMessage)init
{
  v7.receiver = self;
  v7.super_class = (Class)PKPaymentMessage;
  v2 = [(PKPaymentMessage *)&v7 init];
  if (v2)
  {
    id v3 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v4 = [v3 UUIDString];
    identifier = v2->_identifier;
    v2->_identifier = (NSString *)v4;
  }
  return v2;
}

- (unint64_t)hash
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_identifier];
  [v3 safelyAddObject:self->_serviceIdentifier];
  [v3 safelyAddObject:self->_content];
  [v3 safelyAddObject:self->_expirationDate];
  [v3 safelyAddObject:self->_messageDate];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = self->_messageType - v4 + 32 * v4;
  uint64_t v6 = self->_allowDeepLink - v5 + 32 * v5;
  uint64_t v7 = self->_hasAssociatedPaymentApplication - v6 + 32 * v6;
  unint64_t v8 = self->_archived - v7 + 32 * v7;

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (PKPaymentMessage *)a3;
  unint64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKPaymentMessage *)self isEqualToPaymentMessage:v5];

  return v6;
}

- (BOOL)isEqualToPaymentMessage:(id)a3
{
  uint64_t v4 = a3;
  identifier = self->_identifier;
  BOOL v6 = (NSString *)v4[2];
  if (identifier) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (identifier != v6) {
      goto LABEL_33;
    }
  }
  else if ((-[NSString isEqual:](identifier, "isEqual:") & 1) == 0)
  {
    goto LABEL_33;
  }
  serviceIdentifier = self->_serviceIdentifier;
  v9 = (NSString *)v4[3];
  if (serviceIdentifier && v9)
  {
    if ((-[NSString isEqual:](serviceIdentifier, "isEqual:") & 1) == 0) {
      goto LABEL_33;
    }
  }
  else if (serviceIdentifier != v9)
  {
    goto LABEL_33;
  }
  content = self->_content;
  v11 = (NSString *)v4[4];
  if (content && v11)
  {
    if ((-[NSString isEqual:](content, "isEqual:") & 1) == 0) {
      goto LABEL_33;
    }
  }
  else if (content != v11)
  {
    goto LABEL_33;
  }
  messageDate = self->_messageDate;
  v13 = (NSDate *)v4[5];
  if (messageDate && v13)
  {
    if ((-[NSDate isEqual:](messageDate, "isEqual:") & 1) == 0) {
      goto LABEL_33;
    }
  }
  else if (messageDate != v13)
  {
    goto LABEL_33;
  }
  expirationDate = self->_expirationDate;
  v15 = (NSDate *)v4[6];
  if (!expirationDate || !v15)
  {
    if (expirationDate == v15) {
      goto LABEL_29;
    }
LABEL_33:
    BOOL v16 = 0;
    goto LABEL_34;
  }
  if ((-[NSDate isEqual:](expirationDate, "isEqual:") & 1) == 0) {
    goto LABEL_33;
  }
LABEL_29:
  if (self->_messageType != v4[7]
    || self->_allowDeepLink != *((unsigned __int8 *)v4 + 8)
    || self->_hasAssociatedPaymentApplication != *((unsigned __int8 *)v4 + 9))
  {
    goto LABEL_33;
  }
  BOOL v16 = self->_archived == *((unsigned __int8 *)v4 + 10);
LABEL_34:

  return v16;
}

- (id)description
{
  id v3 = NSString;
  uint64_t v4 = [(PKPaymentMessage *)self identifier];
  unint64_t v5 = [(PKPaymentMessage *)self serviceIdentifier];
  BOOL v6 = [(PKPaymentMessage *)self content];
  BOOL v7 = [v3 stringWithFormat:@"Identifier: %@, Service Identifier: %@, Content: %@", v4, v5, v6];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentMessage)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PKPaymentMessage;
  unint64_t v5 = [(PKPaymentMessage *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serviceIdentifier"];
    serviceIdentifier = v5->_serviceIdentifier;
    v5->_serviceIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"content"];
    content = v5->_content;
    v5->_content = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"messageDate"];
    messageDate = v5->_messageDate;
    v5->_messageDate = (NSDate *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"expirationDate"];
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v14;

    v5->_messageType = [v4 decodeBoolForKey:@"messageType"];
    v5->_allowDeepLink = [v4 decodeBoolForKey:@"allowDeepLink"];
    v5->_hasAssociatedPaymentApplication = [v4 decodeBoolForKey:@"hasAssociatedPaymentApplication"];
    v5->_archived = [v4 decodeBoolForKey:@"archived"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeObject:self->_serviceIdentifier forKey:@"serviceIdentifier"];
  [v5 encodeObject:self->_content forKey:@"content"];
  [v5 encodeObject:self->_messageDate forKey:@"messageDate"];
  [v5 encodeObject:self->_expirationDate forKey:@"expirationDate"];
  [v5 encodeBool:self->_messageType != 0 forKey:@"messageType"];
  [v5 encodeBool:self->_allowDeepLink forKey:@"allowDeepLink"];
  [v5 encodeBool:self->_hasAssociatedPaymentApplication forKey:@"hasAssociatedPaymentApplication"];
  [v5 encodeBool:self->_archived forKey:@"archived"];
}

- (BOOL)isValid
{
  if (self->_archived || ![(NSString *)self->_content length]) {
    return 0;
  }
  expirationDate = self->_expirationDate;
  id v5 = [MEMORY[0x1E4F1C9C8] date];
  BOOL v2 = [(NSDate *)expirationDate compare:v5] != NSOrderedAscending;

  return v2;
}

- (BOOL)archiveOnNextTransaction
{
  return self->_messageType == 1;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (void)setServiceIdentifier:(id)a3
{
}

- (NSString)content
{
  return self->_content;
}

- (void)setContent:(id)a3
{
}

- (NSDate)messageDate
{
  return self->_messageDate;
}

- (void)setMessageDate:(id)a3
{
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
}

- (unint64_t)messageType
{
  return self->_messageType;
}

- (void)setMessageType:(unint64_t)a3
{
  self->_messageType = a3;
}

- (BOOL)allowDeepLink
{
  return self->_allowDeepLink;
}

- (void)setAllowDeepLink:(BOOL)a3
{
  self->_allowDeepLink = a3;
}

- (BOOL)hasAssociatedPaymentApplication
{
  return self->_hasAssociatedPaymentApplication;
}

- (void)setHasAssociatedPaymentApplication:(BOOL)a3
{
  self->_hasAssociatedPaymentApplication = a3;
}

- (BOOL)isArchived
{
  return self->_archived;
}

- (void)setArchived:(BOOL)a3
{
  self->_archived = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_messageDate, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end