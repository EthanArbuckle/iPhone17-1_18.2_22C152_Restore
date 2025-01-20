@interface VUIFamilyMember
- (BOOL)sharingPurchases;
- (NSNumber)memberIdentifier;
- (NSString)accountName;
- (NSString)firstName;
- (NSString)lastName;
- (UIImage)memberImage;
- (VUIFamilyMemberDelegate)delegate;
- (unint64_t)hash;
- (void)setAccountName:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFirstName:(id)a3;
- (void)setLastName:(id)a3;
- (void)setMemberIdentifier:(id)a3;
- (void)setMemberImage:(id)a3;
- (void)setSharingPurchases:(BOOL)a3;
@end

@implementation VUIFamilyMember

- (void)setMemberIdentifier:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_memberIdentifier, a3);
  objc_initWeak(&location, self);
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  v9 = __39__VUIFamilyMember_setMemberIdentifier___block_invoke;
  v10 = &unk_1E6DF4A30;
  objc_copyWeak(&v11, &location);
  v6 = &v7;
  if (objc_msgSend(MEMORY[0x1E4F29060], "isMainThread", v7, v8)) {
    v9((uint64_t)v6);
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], v6);
  }

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __39__VUIFamilyMember_setMemberIdentifier___block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = objc_alloc(MEMORY[0x1E4F61860]);
  v4 = [WeakRetained memberIdentifier];
  id v5 = (void *)[v3 initWithFamilyMemberDSID:v4 size:1 localFallback:0];

  [v5 setUseMonogramAsLastResort:0];
  +[VUIFamilyMemberCell maxMonogramHeight];
  objc_msgSend(v5, "setMonogramDiameter:");
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __39__VUIFamilyMember_setMemberIdentifier___block_invoke_2;
  v6[3] = &unk_1E6DF9920;
  objc_copyWeak(&v7, v1);
  [v5 startRequestWithCompletionHandler:v6];
  objc_destroyWeak(&v7);
}

void __39__VUIFamilyMember_setMemberIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  v4 = [MEMORY[0x1E4FB1818] imageWithData:v3];

  [WeakRetained setMemberImage:v4];
  id v5 = [WeakRetained delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 familyMember:WeakRetained photoRequestDidCompleteWithImage:v4];
  }
}

- (unint64_t)hash
{
  id v3 = [(VUIFamilyMember *)self memberIdentifier];
  uint64_t v4 = [v3 hash];

  id v5 = [(VUIFamilyMember *)self firstName];
  uint64_t v6 = [v5 hash] ^ v4;

  id v7 = [(VUIFamilyMember *)self lastName];
  uint64_t v8 = [v7 hash];

  v9 = [(VUIFamilyMember *)self accountName];
  unint64_t v10 = v6 ^ v8 ^ [v9 hash];

  return v10;
}

- (NSNumber)memberIdentifier
{
  return self->_memberIdentifier;
}

- (NSString)firstName
{
  return self->_firstName;
}

- (void)setFirstName:(id)a3
{
}

- (NSString)lastName
{
  return self->_lastName;
}

- (void)setLastName:(id)a3
{
}

- (NSString)accountName
{
  return self->_accountName;
}

- (void)setAccountName:(id)a3
{
}

- (BOOL)sharingPurchases
{
  return self->_sharingPurchases;
}

- (void)setSharingPurchases:(BOOL)a3
{
  self->_sharingPurchases = a3;
}

- (UIImage)memberImage
{
  return self->_memberImage;
}

- (void)setMemberImage:(id)a3
{
}

- (VUIFamilyMemberDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (VUIFamilyMemberDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_memberImage, 0);
  objc_storeStrong((id *)&self->_accountName, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_memberIdentifier, 0);
}

@end