@interface PKPaymentSetupCredentialListItem
- (BOOL)isAvailable;
- (BOOL)isBeingProvisioned;
- (BOOL)isCellDisabled;
- (BOOL)isDeletable;
- (BOOL)isEqual:(id)a3;
- (BOOL)isRefund;
- (BOOL)isSnapshotFetchInProgress;
- (BOOL)isUnavailable;
- (NSString)description;
- (PKPaymentCredential)credential;
- (PKPaymentSetupCredentialListItem)initWithCredential:(id)a3;
- (UIImage)passSnapshot;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (unint64_t)lastCheckedCredentialHash;
- (void)setIsAvailable:(BOOL)a3;
- (void)setIsBeingProvisioned:(BOOL)a3;
- (void)setIsCellDisabled:(BOOL)a3;
- (void)setIsRefund:(BOOL)a3;
- (void)setIsSnapshotFetchInProgress:(BOOL)a3;
- (void)setIsUnavailable:(BOOL)a3;
- (void)setLastCheckedCredentialHash:(unint64_t)a3;
- (void)setPassSnapshot:(id)a3;
@end

@implementation PKPaymentSetupCredentialListItem

- (PKPaymentSetupCredentialListItem)initWithCredential:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPaymentSetupCredentialListItem;
  v6 = [(PKPaymentSetupListItem *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_credential, a3);
    v7->_isCellDisabled = 0;
  }

  return v7;
}

- (BOOL)isDeletable
{
  int v3 = [(PKPaymentCredential *)self->_credential isDeletable];
  if (v3) {
    LOBYTE(v3) = !self->_isBeingProvisioned;
  }
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = v4;
    v8.receiver = self;
    v8.super_class = (Class)PKPaymentSetupCredentialListItem;
    BOOL v6 = [(PKPaymentSetupListItem *)&v8 isEqual:v5]
      && self->_lastCheckedCredentialHash == v5[10]
      && PKEqualObjects()
      && self->_isAvailable == *((unsigned __int8 *)v5 + 64)
      && self->_isUnavailable == *((unsigned __int8 *)v5 + 65)
      && self->_isRefund == *((unsigned __int8 *)v5 + 66)
      && self->_isBeingProvisioned == *((unsigned __int8 *)v5 + 67)
      && self->_isCellDisabled == *((unsigned __int8 *)v5 + 68);
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v6.receiver = self;
  v6.super_class = (Class)PKPaymentSetupCredentialListItem;
  [(PKPaymentSetupListItem *)&v6 hash];
  PKCombinedHash();
  PKIntegerHash();
  PKIntegerHash();
  PKIntegerHash();
  PKIntegerHash();
  PKIntegerHash();
  unint64_t v4 = PKIntegerHash();

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKPaymentSetupCredentialListItem;
  unint64_t v4 = [(PKPaymentSetupListItem *)&v6 copyWithZone:a3];
  objc_storeStrong(v4 + 9, self->_credential);
  objc_storeStrong(v4 + 11, self->_passSnapshot);
  *((unsigned char *)v4 + 64) = self->_isAvailable;
  *((unsigned char *)v4 + 65) = self->_isUnavailable;
  *((unsigned char *)v4 + 66) = self->_isRefund;
  *((unsigned char *)v4 + 67) = self->_isBeingProvisioned;
  *((unsigned char *)v4 + 68) = self->_isCellDisabled;
  *((unsigned char *)v4 + 69) = self->_isSnapshotFetchInProgress;
  v4[10] = self->_lastCheckedCredentialHash;
  return v4;
}

- (NSString)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v3 appendFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"credential: '%@'; ", self->_credential];
  if (self->_isAvailable) {
    unint64_t v4 = @"Y";
  }
  else {
    unint64_t v4 = @"N";
  }
  [v3 appendFormat:@"isAvailable: '%@'; ", v4];
  if (self->_isUnavailable) {
    id v5 = @"Y";
  }
  else {
    id v5 = @"N";
  }
  [v3 appendFormat:@"isUnavailable: '%@'; ", v5];
  if (self->_isRefund) {
    objc_super v6 = @"Y";
  }
  else {
    objc_super v6 = @"N";
  }
  [v3 appendFormat:@"isRefund: '%@'; ", v6];
  if (self->_isBeingProvisioned) {
    v7 = @"Y";
  }
  else {
    v7 = @"N";
  }
  [v3 appendFormat:@"isBeingProvisioned: '%@'; ", v7];
  if (self->_isCellDisabled) {
    objc_super v8 = @"Y";
  }
  else {
    objc_super v8 = @"N";
  }
  [v3 appendFormat:@"isCellDisabled: '%@'; ", v8];
  if (self->_isSnapshotFetchInProgress) {
    objc_super v9 = @"Y";
  }
  else {
    objc_super v9 = @"N";
  }
  [v3 appendFormat:@"isSnapshotFetchInProgress: '%@'; ", v9];
  [v3 appendFormat:@">"];

  return (NSString *)v3;
}

- (PKPaymentCredential)credential
{
  return self->_credential;
}

- (unint64_t)lastCheckedCredentialHash
{
  return self->_lastCheckedCredentialHash;
}

- (void)setLastCheckedCredentialHash:(unint64_t)a3
{
  self->_lastCheckedCredentialHash = a3;
}

- (UIImage)passSnapshot
{
  return self->_passSnapshot;
}

- (void)setPassSnapshot:(id)a3
{
}

- (BOOL)isAvailable
{
  return self->_isAvailable;
}

- (void)setIsAvailable:(BOOL)a3
{
  self->_isAvailable = a3;
}

- (BOOL)isUnavailable
{
  return self->_isUnavailable;
}

- (void)setIsUnavailable:(BOOL)a3
{
  self->_isUnavailable = a3;
}

- (BOOL)isRefund
{
  return self->_isRefund;
}

- (void)setIsRefund:(BOOL)a3
{
  self->_isRefund = a3;
}

- (BOOL)isBeingProvisioned
{
  return self->_isBeingProvisioned;
}

- (void)setIsBeingProvisioned:(BOOL)a3
{
  self->_isBeingProvisioned = a3;
}

- (BOOL)isCellDisabled
{
  return self->_isCellDisabled;
}

- (void)setIsCellDisabled:(BOOL)a3
{
  self->_isCellDisabled = a3;
}

- (BOOL)isSnapshotFetchInProgress
{
  return self->_isSnapshotFetchInProgress;
}

- (void)setIsSnapshotFetchInProgress:(BOOL)a3
{
  self->_isSnapshotFetchInProgress = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passSnapshot, 0);

  objc_storeStrong((id *)&self->_credential, 0);
}

@end