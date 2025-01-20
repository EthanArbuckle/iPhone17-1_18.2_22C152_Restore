@interface PKTransactionReleasedData
+ (BOOL)supportsSecureCoding;
- (BOOL)isAgeVerificationElement:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToReleasedData:(id)a3;
- (BOOL)isPortraitElement:(id)a3;
- (NSData)certificateData;
- (NSSet)elements;
- (NSString)documentType;
- (NSString)merchantNameOverride;
- (NSURL)privacyPolicyURL;
- (PKTransactionReleasedData)init;
- (PKTransactionReleasedData)initWithCoder:(id)a3;
- (PKTransactionReleasedData)initWithDocumentType:(id)a3;
- (PKTransactionReleasedDataApplication)application;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)verificationType;
- (void)encodeWithCoder:(id)a3;
- (void)setApplication:(id)a3;
- (void)setCertificateData:(id)a3;
- (void)setDocumentType:(id)a3;
- (void)setElements:(id)a3;
- (void)setMerchantNameOverride:(id)a3;
- (void)setPrivacyPolicyURL:(id)a3;
@end

@implementation PKTransactionReleasedData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKTransactionReleasedData)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"documentType"];
  if (v5)
  {
    v6 = [(PKTransactionReleasedData *)self initWithDocumentType:v5];
    if (v6)
    {
      v7 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v8 = objc_opt_class();
      v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
      uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"elements"];
      elements = v6->_elements;
      v6->_elements = (NSSet *)v10;

      uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"application"];
      application = v6->_application;
      v6->_application = (PKTransactionReleasedDataApplication *)v12;

      uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"privacyPolicyURL"];
      privacyPolicyURL = v6->_privacyPolicyURL;
      v6->_privacyPolicyURL = (NSURL *)v14;

      uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"certificateData"];
      certificateData = v6->_certificateData;
      v6->_certificateData = (NSData *)v16;

      uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"merchantNameOverride"];
      merchantNameOverride = v6->_merchantNameOverride;
      v6->_merchantNameOverride = (NSString *)v18;
    }
    self = v6;
    v20 = self;
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (void)encodeWithCoder:(id)a3
{
  documentType = self->_documentType;
  id v5 = a3;
  [v5 encodeObject:documentType forKey:@"documentType"];
  [v5 encodeObject:self->_elements forKey:@"elements"];
  [v5 encodeObject:self->_application forKey:@"application"];
  [v5 encodeObject:self->_privacyPolicyURL forKey:@"privacyPolicyURL"];
  [v5 encodeObject:self->_certificateData forKey:@"certificateData"];
  [v5 encodeObject:self->_merchantNameOverride forKey:@"merchantNameOverride"];
}

- (PKTransactionReleasedData)init
{
  return [(PKTransactionReleasedData *)self initWithDocumentType:@"org.iso.18013.5.1.mDL"];
}

- (PKTransactionReleasedData)initWithDocumentType:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKTransactionReleasedData;
  v6 = [(PKTransactionReleasedData *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_documentType, a3);
  }

  return v7;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_documentType];
  [v3 safelyAddObject:self->_elements];
  [v3 safelyAddObject:self->_application];
  [v3 safelyAddObject:self->_privacyPolicyURL];
  [v3 safelyAddObject:self->_certificateData];
  [v3 safelyAddObject:self->_merchantNameOverride];
  unint64_t v4 = PKCombinedHash(17, v3);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (PKTransactionReleasedData *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKTransactionReleasedData *)self isEqualToReleasedData:v5];

  return v6;
}

- (BOOL)isEqualToReleasedData:(id)a3
{
  unint64_t v4 = a3;
  documentType = self->_documentType;
  BOOL v6 = (NSString *)v4[1];
  if (documentType) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (documentType != v6) {
      goto LABEL_31;
    }
  }
  else if ((-[NSString isEqual:](documentType, "isEqual:") & 1) == 0)
  {
    goto LABEL_31;
  }
  elements = self->_elements;
  objc_super v9 = (NSSet *)v4[2];
  if (elements && v9)
  {
    if ((-[NSSet isEqual:](elements, "isEqual:") & 1) == 0) {
      goto LABEL_31;
    }
  }
  else if (elements != v9)
  {
    goto LABEL_31;
  }
  application = self->_application;
  v11 = (PKTransactionReleasedDataApplication *)v4[3];
  if (application && v11)
  {
    if (!-[PKTransactionReleasedDataApplication isEqual:](application, "isEqual:")) {
      goto LABEL_31;
    }
  }
  else if (application != v11)
  {
    goto LABEL_31;
  }
  privacyPolicyURL = self->_privacyPolicyURL;
  v13 = (NSURL *)v4[4];
  if (privacyPolicyURL && v13)
  {
    if ((-[NSURL isEqual:](privacyPolicyURL, "isEqual:") & 1) == 0) {
      goto LABEL_31;
    }
  }
  else if (privacyPolicyURL != v13)
  {
    goto LABEL_31;
  }
  certificateData = self->_certificateData;
  v15 = (NSData *)v4[5];
  if (!certificateData || !v15)
  {
    if (certificateData == v15) {
      goto LABEL_27;
    }
LABEL_31:
    char v18 = 0;
    goto LABEL_32;
  }
  if ((-[NSData isEqual:](certificateData, "isEqual:") & 1) == 0) {
    goto LABEL_31;
  }
LABEL_27:
  merchantNameOverride = self->_merchantNameOverride;
  v17 = (NSString *)v4[6];
  if (merchantNameOverride && v17) {
    char v18 = -[NSString isEqual:](merchantNameOverride, "isEqual:");
  }
  else {
    char v18 = merchantNameOverride == v17;
  }
LABEL_32:

  return v18;
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v3 setObject:self->_documentType forKey:@"documentType"];
  elements = self->_elements;
  if (elements)
  {
    id v5 = [(NSSet *)elements pk_setByApplyingBlock:&__block_literal_global_138];
    BOOL v6 = [v5 allObjects];
    [v3 setObject:v6 forKey:@"elements"];
  }
  application = self->_application;
  if (application) {
    [v3 setObject:application forKey:@"application"];
  }
  privacyPolicyURL = self->_privacyPolicyURL;
  if (privacyPolicyURL) {
    [v3 setObject:privacyPolicyURL forKey:@"privacyPolicyURL"];
  }
  certificateData = self->_certificateData;
  if (certificateData) {
    [v3 setObject:certificateData forKey:@"certificateData"];
  }
  merchantNameOverride = self->_merchantNameOverride;
  if (merchantNameOverride) {
    [v3 setObject:merchantNameOverride forKey:@"merchantNameOverride"];
  }
  v11 = (void *)[v3 copy];

  return v11;
}

uint64_t __53__PKTransactionReleasedData_dictionaryRepresentation__block_invoke(uint64_t a1, void *a2)
{
  return [a2 dictionaryRepresentation];
}

- (id)description
{
  id v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"documentType: '%@'; ", self->_documentType];
  unint64_t v4 = [(NSSet *)self->_elements description];
  [v3 appendFormat:@"elements: '%@'; ", v4];

  id v5 = [(PKTransactionReleasedDataApplication *)self->_application description];
  [v3 appendFormat:@"application: '%@'; ", v5];

  BOOL v6 = [(NSURL *)self->_privacyPolicyURL description];
  [v3 appendFormat:@"privacyPolicyURL: '%@'; ", v6];

  objc_msgSend(v3, "appendFormat:", @"certificateData: %ld bytes; ",
    [(NSData *)self->_certificateData length]);
  [v3 appendFormat:@"merchantNameOverride: '%@'; ", self->_merchantNameOverride];
  [v3 appendFormat:@">"];
  return v3;
}

- (BOOL)isAgeVerificationElement:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [v3 elementNamespace];
  id v5 = @"org.iso.18013.5.1";
  if (v4 == v5)
  {

    goto LABEL_7;
  }
  BOOL v6 = v5;
  if (!v4 || !v5)
  {

    char v8 = 0;
    goto LABEL_17;
  }
  int v7 = [(__CFString *)v4 isEqualToString:v5];

  if (v7)
  {
LABEL_7:
    unint64_t v4 = [v3 identifier];
    objc_super v9 = @"age_in_years";
    if (v4 == v9)
    {
    }
    else
    {
      uint64_t v10 = v9;
      if (!v4 || !v9)
      {

LABEL_16:
        char v8 = [(__CFString *)v4 containsString:@"age_over_"];
        goto LABEL_17;
      }
      char v11 = [(__CFString *)v4 isEqualToString:v9];

      if ((v11 & 1) == 0) {
        goto LABEL_16;
      }
    }
    char v8 = 1;
LABEL_17:

    goto LABEL_18;
  }
  char v8 = 0;
LABEL_18:

  return v8;
}

- (BOOL)isPortraitElement:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [v3 elementNamespace];
  id v5 = @"org.iso.18013.5.1";
  if (v4 == v5)
  {

LABEL_7:
    unint64_t v4 = [v3 identifier];
    char v8 = @"portrait";
    if (v4 == v8)
    {
      LOBYTE(v7) = 1;
      BOOL v6 = v4;
    }
    else
    {
      BOOL v6 = v8;
      LOBYTE(v7) = 0;
      if (v4 && v8) {
        LOBYTE(v7) = [(__CFString *)v4 isEqualToString:v8];
      }
    }
    goto LABEL_12;
  }
  BOOL v6 = v5;
  LOBYTE(v7) = 0;
  if (v4 && v5)
  {
    int v7 = [(__CFString *)v4 isEqualToString:v5];

    if (!v7) {
      goto LABEL_13;
    }
    goto LABEL_7;
  }
LABEL_12:

LABEL_13:
  return v7;
}

- (unint64_t)verificationType
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = [(PKTransactionReleasedData *)self elements];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    char v6 = 0;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        if ([(PKTransactionReleasedData *)self isAgeVerificationElement:v9])
        {
          char v6 = 1;
        }
        else if (![(PKTransactionReleasedData *)self isPortraitElement:v9])
        {
          goto LABEL_12;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);

    return v6 & 1;
  }
  else
  {
LABEL_12:

    return 0;
  }
}

- (NSString)documentType
{
  return self->_documentType;
}

- (void)setDocumentType:(id)a3
{
}

- (NSSet)elements
{
  return self->_elements;
}

- (void)setElements:(id)a3
{
}

- (PKTransactionReleasedDataApplication)application
{
  return self->_application;
}

- (void)setApplication:(id)a3
{
}

- (NSURL)privacyPolicyURL
{
  return self->_privacyPolicyURL;
}

- (void)setPrivacyPolicyURL:(id)a3
{
}

- (NSData)certificateData
{
  return self->_certificateData;
}

- (void)setCertificateData:(id)a3
{
}

- (NSString)merchantNameOverride
{
  return self->_merchantNameOverride;
}

- (void)setMerchantNameOverride:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_merchantNameOverride, 0);
  objc_storeStrong((id *)&self->_certificateData, 0);
  objc_storeStrong((id *)&self->_privacyPolicyURL, 0);
  objc_storeStrong((id *)&self->_application, 0);
  objc_storeStrong((id *)&self->_elements, 0);
  objc_storeStrong((id *)&self->_documentType, 0);
}

@end