@interface PKPaymentSetupAssistantCoreCredential
- (NSString)subtitle;
- (NSString)title;
- (NSString)uniqueIdentifier;
- (PKPaymentCredential)credential;
- (PKPaymentSetupAssistantCoreCredential)initWithPaymentCredential:(id)a3;
- (PKPaymentSetupAssistantCoreCredential)initWithPaymentPass:(id)a3;
- (id)description;
@end

@implementation PKPaymentSetupAssistantCoreCredential

- (PKPaymentSetupAssistantCoreCredential)initWithPaymentCredential:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)PKPaymentSetupAssistantCoreCredential;
  v6 = [(PKPaymentSetupAssistantCoreCredential *)&v23 init];
  if (!v6) {
    goto LABEL_16;
  }
  uint64_t v7 = [v5 longDescription];
  title = v6->_title;
  v6->_title = (NSString *)v7;

  uint64_t v9 = [v5 detailDescriptionWithEnvironment:1];
  subtitle = v6->_subtitle;
  v6->_subtitle = (NSString *)v9;

  objc_storeStrong((id *)&v6->_credential, a3);
  if ([v5 isRemoteCredential])
  {
    v11 = [v5 remoteCredential];
LABEL_6:
    v12 = v11;
    uint64_t v13 = [v11 serialNumber];
LABEL_7:
    uniqueIdentifier = v6->_uniqueIdentifier;
    v6->_uniqueIdentifier = (NSString *)v13;

    goto LABEL_14;
  }
  if ([v5 isLocalPassCredential])
  {
    v11 = [v5 localPassCredential];
    goto LABEL_6;
  }
  if ([v5 isAccountCredential])
  {
    v12 = [v5 accountCredential];
    v15 = [v12 account];
    uint64_t v16 = [v15 accountIdentifier];
LABEL_12:
    v17 = v6->_uniqueIdentifier;
    v6->_uniqueIdentifier = (NSString *)v16;

LABEL_13:
    goto LABEL_14;
  }
  if ([v5 isPeerPaymentCredential])
  {
    v12 = [v5 peerPaymentCredential];
    v15 = [v12 account];
    uint64_t v16 = [v15 identifier];
    goto LABEL_12;
  }
  if ([v5 isSafariCredential])
  {
    v12 = [v5 safariCredential];
    uint64_t v13 = [v12 longDescription];
    goto LABEL_7;
  }
  v12 = PKLogFacilityTypeGetObject(0x29uLL);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v22 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v22);
    *(_DWORD *)buf = 138412546;
    v25 = v15;
    __int16 v26 = 2112;
    id v27 = v5;
    _os_log_impl(&dword_190E10000, v12, OS_LOG_TYPE_DEFAULT, "%@: Error - Initialized with payment credential of unsupported type: %@", buf, 0x16u);
    goto LABEL_13;
  }
LABEL_14:

  if (!v6->_uniqueIdentifier)
  {
    id v18 = objc_alloc_init(MEMORY[0x1E4F29128]);
    uint64_t v19 = [v18 UUIDString];
    v20 = v6->_uniqueIdentifier;
    v6->_uniqueIdentifier = (NSString *)v19;
  }
LABEL_16:

  return v6;
}

- (PKPaymentSetupAssistantCoreCredential)initWithPaymentPass:(id)a3
{
  id v4 = a3;
  id v5 = [[PKPaymentLocalPassCredential alloc] initWithPaymentPass:v4];

  v6 = [(PKPaymentSetupAssistantCoreCredential *)self initWithPaymentCredential:v5];
  return v6;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; title: '%@', subtitle: '%@', uniqueID: '%@'>",
    v5,
    self,
    self->_title,
    self->_subtitle,
  v6 = self->_uniqueIdentifier);

  return v6;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (PKPaymentCredential)credential
{
  return self->_credential;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_credential, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end