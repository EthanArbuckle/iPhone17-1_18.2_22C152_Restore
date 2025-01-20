@interface PKAccountEnhancedMerchantDisclosurePresentationInfo
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToAccountEnhancedMerchantDisclosure:(id)a3;
- (NSCopying)identifier;
- (NSString)disclosures;
- (NSString)name;
- (PKAccountEnhancedMerchant)enhancedMerchant;
- (PKAccountEnhancedMerchantDisclosurePresentationInfo)initWithAccountEnhancedMerchant:(id)a3;
- (unint64_t)hash;
- (void)setDisclosures:(id)a3;
- (void)setEnhancedMerchant:(id)a3;
- (void)setName:(id)a3;
@end

@implementation PKAccountEnhancedMerchantDisclosurePresentationInfo

- (PKAccountEnhancedMerchantDisclosurePresentationInfo)initWithAccountEnhancedMerchant:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PKAccountEnhancedMerchantDisclosurePresentationInfo;
  v6 = [(PKAccountEnhancedMerchantDisclosurePresentationInfo *)&v16 init];
  v7 = v6;
  if (!v6) {
    goto LABEL_6;
  }
  objc_storeStrong((id *)&v6->_enhancedMerchant, a3);
  uint64_t v8 = [v5 name];
  name = v7->_name;
  v7->_name = (NSString *)v8;

  uint64_t v10 = [v5 disclosures];
  disclosures = v7->_disclosures;
  v7->_disclosures = (NSString *)v10;

  v12 = v7->_name;
  if (!v12) {
    goto LABEL_7;
  }
  if ([(NSString *)v12 length] && (v13 = v7->_disclosures) != 0 && [(NSString *)v13 length]) {
LABEL_6:
  }
    v14 = v7;
  else {
LABEL_7:
  }
    v14 = 0;

  return v14;
}

- (NSCopying)identifier
{
  v2 = NSString;
  v3 = [(PKAccountEnhancedMerchant *)self->_enhancedMerchant privateIdentifier];
  v4 = [v2 stringWithFormat:@"%@_disclosures", v3];

  return (NSCopying *)v4;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PKAccountEnhancedMerchantDisclosurePresentationInfo *)a3;
  id v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKAccountEnhancedMerchantDisclosurePresentationInfo *)self isEqualToAccountEnhancedMerchantDisclosure:v5];

  return v6;
}

- (BOOL)isEqualToAccountEnhancedMerchantDisclosure:(id)a3
{
  v4 = a3;
  id v5 = v4;
  if (!v4) {
    goto LABEL_14;
  }
  BOOL v6 = (void *)v4[1];
  v7 = self->_name;
  uint64_t v8 = v6;
  if (v7 == v8)
  {
  }
  else
  {
    v9 = v8;
    if (!v7 || !v8)
    {
LABEL_13:

      goto LABEL_14;
    }
    BOOL v10 = [(NSString *)v7 isEqualToString:v8];

    if (!v10) {
      goto LABEL_14;
    }
  }
  v11 = (void *)v5[2];
  v7 = self->_disclosures;
  v12 = v11;
  if (v7 == v12)
  {

LABEL_17:
    char v14 = PKEqualObjects();
    goto LABEL_15;
  }
  v9 = v12;
  if (!v7 || !v12) {
    goto LABEL_13;
  }
  BOOL v13 = [(NSString *)v7 isEqualToString:v12];

  if (v13) {
    goto LABEL_17;
  }
LABEL_14:
  char v14 = 0;
LABEL_15:

  return v14;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_name];
  [v3 safelyAddObject:self->_disclosures];
  [v3 safelyAddObject:self->_enhancedMerchant];
  unint64_t v4 = PKCombinedHash();

  return v4;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)disclosures
{
  return self->_disclosures;
}

- (void)setDisclosures:(id)a3
{
}

- (PKAccountEnhancedMerchant)enhancedMerchant
{
  return self->_enhancedMerchant;
}

- (void)setEnhancedMerchant:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enhancedMerchant, 0);
  objc_storeStrong((id *)&self->_disclosures, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end