@interface PKFeatureApplicationDeclineDetails
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)declinedTermsIdentifier;
- (NSString)pathIdentifier;
- (NSString)pathTermsIdentifier;
- (PKFeatureApplicationDeclineDetails)initWithCoder:(id)a3;
- (PKFeatureApplicationDeclineDetails)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDeclinedTermsIdentifier:(id)a3;
- (void)setPathIdentifier:(id)a3;
- (void)setPathTermsIdentifier:(id)a3;
@end

@implementation PKFeatureApplicationDeclineDetails

- (PKFeatureApplicationDeclineDetails)initWithDictionary:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PKFeatureApplicationDeclineDetails;
  v5 = [(PKFeatureApplicationDeclineDetails *)&v17 init];
  if (!v5) {
    goto LABEL_4;
  }
  uint64_t v6 = [v4 PKStringForKey:@"declineTermsIdentifier"];
  declinedTermsIdentifier = v5->_declinedTermsIdentifier;
  v5->_declinedTermsIdentifier = (NSString *)v6;

  if (v5->_declinedTermsIdentifier)
  {
    uint64_t v8 = [v4 PKStringForKey:@"pathTermsIdentifier"];
    pathTermsIdentifier = v5->_pathTermsIdentifier;
    v5->_pathTermsIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 PKStringForKey:@"pathIdentifier"];
    pathIdentifier = v5->_pathIdentifier;
    v5->_pathIdentifier = (NSString *)v10;

LABEL_4:
    v12 = v5;
    goto LABEL_8;
  }
  v13 = PKLogFacilityTypeGetObject(0xDuLL);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v14);
    *(_DWORD *)buf = 138412290;
    v19 = v15;
    _os_log_impl(&dword_190E10000, v13, OS_LOG_TYPE_DEFAULT, "Error: Declined identifier missing from :%@", buf, 0xCu);
  }
  v12 = 0;
LABEL_8:

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKFeatureApplicationDeclineDetails)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKFeatureApplicationDeclineDetails;
  v5 = [(PKFeatureApplicationDeclineDetails *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"declinedTermsIdentifier"];
    declinedTermsIdentifier = v5->_declinedTermsIdentifier;
    v5->_declinedTermsIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pathTermsIdentifier"];
    pathTermsIdentifier = v5->_pathTermsIdentifier;
    v5->_pathTermsIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pathIdentifier"];
    pathIdentifier = v5->_pathIdentifier;
    v5->_pathIdentifier = (NSString *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  declinedTermsIdentifier = self->_declinedTermsIdentifier;
  id v5 = a3;
  [v5 encodeObject:declinedTermsIdentifier forKey:@"declinedTermsIdentifier"];
  [v5 encodeObject:self->_pathTermsIdentifier forKey:@"pathTermsIdentifier"];
  [v5 encodeObject:self->_pathIdentifier forKey:@"pathIdentifier"];
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"declinedTermsIdentifier: '%@'; ", self->_declinedTermsIdentifier];
  [v3 appendFormat:@"pathTermsIdentifier: '%@'; ", self->_pathTermsIdentifier];
  [v3 appendFormat:@"pathIdentifier: '%@'; ", self->_pathIdentifier];
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_14;
  }
  declinedTermsIdentifier = self->_declinedTermsIdentifier;
  uint64_t v6 = (NSString *)v4[1];
  if (declinedTermsIdentifier && v6)
  {
    if ((-[NSString isEqual:](declinedTermsIdentifier, "isEqual:") & 1) == 0) {
      goto LABEL_14;
    }
  }
  else if (declinedTermsIdentifier != v6)
  {
    goto LABEL_14;
  }
  pathTermsIdentifier = self->_pathTermsIdentifier;
  uint64_t v8 = (NSString *)v4[2];
  if (!pathTermsIdentifier || !v8)
  {
    if (pathTermsIdentifier == v8) {
      goto LABEL_10;
    }
LABEL_14:
    char v11 = 0;
    goto LABEL_15;
  }
  if ((-[NSString isEqual:](pathTermsIdentifier, "isEqual:") & 1) == 0) {
    goto LABEL_14;
  }
LABEL_10:
  pathIdentifier = self->_pathIdentifier;
  uint64_t v10 = (NSString *)v4[3];
  if (pathIdentifier && v10) {
    char v11 = -[NSString isEqual:](pathIdentifier, "isEqual:");
  }
  else {
    char v11 = pathIdentifier == v10;
  }
LABEL_15:

  return v11;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_declinedTermsIdentifier];
  [v3 safelyAddObject:self->_pathTermsIdentifier];
  [v3 safelyAddObject:self->_pathIdentifier];
  unint64_t v4 = PKCombinedHash(17, v3);

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [+[PKFeatureApplicationDeclineDetails allocWithZone:](PKFeatureApplicationDeclineDetails, "allocWithZone:") init];
  uint64_t v6 = [(NSString *)self->_declinedTermsIdentifier copyWithZone:a3];
  declinedTermsIdentifier = v5->_declinedTermsIdentifier;
  v5->_declinedTermsIdentifier = (NSString *)v6;

  uint64_t v8 = [(NSString *)self->_pathTermsIdentifier copyWithZone:a3];
  pathTermsIdentifier = v5->_pathTermsIdentifier;
  v5->_pathTermsIdentifier = (NSString *)v8;

  uint64_t v10 = [(NSString *)self->_pathIdentifier copyWithZone:a3];
  pathIdentifier = v5->_pathIdentifier;
  v5->_pathIdentifier = (NSString *)v10;

  return v5;
}

- (NSString)declinedTermsIdentifier
{
  return self->_declinedTermsIdentifier;
}

- (void)setDeclinedTermsIdentifier:(id)a3
{
}

- (NSString)pathTermsIdentifier
{
  return self->_pathTermsIdentifier;
}

- (void)setPathTermsIdentifier:(id)a3
{
}

- (NSString)pathIdentifier
{
  return self->_pathIdentifier;
}

- (void)setPathIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pathIdentifier, 0);
  objc_storeStrong((id *)&self->_pathTermsIdentifier, 0);
  objc_storeStrong((id *)&self->_declinedTermsIdentifier, 0);
}

@end