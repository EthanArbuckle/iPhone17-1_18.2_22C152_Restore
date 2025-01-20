@interface PKPeerPaymentAssociatedAccountPresentationContext
- (PKFamilyMember)member;
- (PKPaymentTransaction)transaction;
- (PKPeerPaymentAssociatedAccountPresentationContext)initWithFAFamilyMember:(id)a3 options:(id)a4;
- (PKPeerPaymentAssociatedAccountPresentationContext)initWithPKFamilyMember:(id)a3 options:(id)a4;
- (PKPeerPaymentAssociatedAccountPresentationContext)initWithPKFamilyMember:(id)a3 setupType:(int64_t)a4;
- (PKPeerPaymentAssociatedAccountPresentationContext)initWithPKFamilyMember:(id)a3 transaction:(id)a4;
- (id)description;
- (int64_t)setupType;
- (void)setMember:(id)a3;
- (void)setSetupType:(int64_t)a3;
- (void)setTransaction:(id)a3;
@end

@implementation PKPeerPaymentAssociatedAccountPresentationContext

- (PKPeerPaymentAssociatedAccountPresentationContext)initWithFAFamilyMember:(id)a3 options:(id)a4
{
  id v6 = a4;
  if (a3)
  {
    v7 = (objc_class *)MEMORY[0x1E4F84708];
    id v8 = a3;
    a3 = (id)[[v7 alloc] initWithFAFamilyMember:v8];
  }
  v9 = [(PKPeerPaymentAssociatedAccountPresentationContext *)self initWithPKFamilyMember:a3 options:v6];

  return v9;
}

- (PKPeerPaymentAssociatedAccountPresentationContext)initWithPKFamilyMember:(id)a3 options:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PKPeerPaymentAssociatedAccountPresentationContext;
  v9 = [(PKPeerPaymentAssociatedAccountPresentationContext *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_member, a3);
    v11 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v8;
      _os_log_impl(&dword_19F450000, v11, OS_LOG_TYPE_DEFAULT, "Creating PKPeerPaymentAssociatedAccountPresentationContext with options %@", buf, 0xCu);
    }
  }
  return v10;
}

- (PKPeerPaymentAssociatedAccountPresentationContext)initWithPKFamilyMember:(id)a3 transaction:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = [(PKPeerPaymentAssociatedAccountPresentationContext *)self initWithPKFamilyMember:a3 options:0];
  if (v8)
  {
    v9 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      id v12 = v7;
      _os_log_impl(&dword_19F450000, v9, OS_LOG_TYPE_DEFAULT, "Creating PKPeerPaymentAssociatedAccountPresentationContext with transaction %@", (uint8_t *)&v11, 0xCu);
    }

    objc_storeStrong((id *)&v8->_transaction, a4);
  }

  return v8;
}

- (PKPeerPaymentAssociatedAccountPresentationContext)initWithPKFamilyMember:(id)a3 setupType:(int64_t)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v5 = [(PKPeerPaymentAssociatedAccountPresentationContext *)self initWithPKFamilyMember:a3 options:0];
  if (v5)
  {
    id v6 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = PKPeerPaymentAssociatedAccountSetupTypeToString();
      int v9 = 138412290;
      v10 = v7;
      _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "Creating PKPeerPaymentAssociatedAccountPresentationContext with setupType %@", (uint8_t *)&v9, 0xCu);
    }
    v5->_setupType = a4;
  }
  return v5;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"familyMember: '%@'; ", self->_member];
  if (self->_transaction) {
    [v3 appendFormat:@"transaction: '%@'; ", self->_transaction];
  }
  v4 = PKPeerPaymentAssociatedAccountSetupTypeToString();
  [v3 appendFormat:@"setupType: '%@'; ", v4];

  [v3 appendFormat:@">"];
  v5 = (void *)[v3 copy];

  return v5;
}

- (PKFamilyMember)member
{
  return self->_member;
}

- (void)setMember:(id)a3
{
}

- (PKPaymentTransaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
}

- (int64_t)setupType
{
  return self->_setupType;
}

- (void)setSetupType:(int64_t)a3
{
  self->_setupType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);

  objc_storeStrong((id *)&self->_member, 0);
}

@end