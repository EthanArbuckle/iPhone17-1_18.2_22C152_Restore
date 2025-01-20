@interface PCSShareProtectionObject
- (PCSShareProtectionObject)initWithShareProtectionRef:(_OpaquePCSShareProtection *)a3;
- (PCSShareProtectionObject)initWithSharingRequestData:(id)a3 identitySet:(_PCSIdentitySetData *)a4 error:(id *)a5;
- (_OpaquePCSShareProtection)shareProtection;
- (id)exportAcceptedSharingRequestWithError:(id *)a3;
- (id)sharingRequestDataForIdentity:(_PCSPublicIdentityData *)a3 error:(id *)a4;
- (id)sharingRequestDataForIdentity:(_PCSPublicIdentityData *)a3 flags:(unsigned int)a4 error:(id *)a5;
- (id)sharingRequestDataForIdentity:(_PCSPublicIdentityData *)a3 owner:(void *)a4 flags:(unsigned int)a5 error:(id *)a6;
- (void)dealloc;
@end

@implementation PCSShareProtectionObject

- (PCSShareProtectionObject)initWithShareProtectionRef:(_OpaquePCSShareProtection *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PCSShareProtectionObject;
  v4 = [(PCSShareProtectionObject *)&v6 init];
  if (v4)
  {
    if (a3) {
      CFRetain(a3);
    }
    v4->_shareProtection = a3;
  }
  return v4;
}

- (PCSShareProtectionObject)initWithSharingRequestData:(id)a3 identitySet:(_PCSIdentitySetData *)a4 error:(id *)a5
{
  id v8 = a3;
  v25.receiver = self;
  v25.super_class = (Class)PCSShareProtectionObject;
  v9 = [(PCSShareProtectionObject *)&v25 init];
  if (v9)
  {
    v10 = v9;
    uint64_t v21 = 0;
    v22 = (const void **)&v21;
    uint64_t v23 = 0x2020000000;
    uint64_t v24 = 0;
    v11 = [[PCSManateeShareInvitation alloc] initWithData:v8];
    v12 = v11;
    if (v11 && [(PCSManateeShareInvitation *)v11 hasExportedPCSData])
    {
      CFDictionaryRef v13 = (const __CFDictionary *)PCSIdentitySetCopyIdentities((uint64_t)a4, 0);
      context[0] = MEMORY[0x1E4F143A8];
      context[1] = 3221225472;
      context[2] = __73__PCSShareProtectionObject_initWithSharingRequestData_identitySet_error___block_invoke;
      context[3] = &unk_1E5E6E300;
      v14 = v10;
      v18 = v14;
      v20 = &v21;
      v19 = v12;
      CFDictionaryApplyFunction(v13, (CFDictionaryApplierFunction)apply_block_2_1, context);
      if (v13) {
        CFRelease(v13);
      }
      if (!v14->_shareProtection)
      {

        v14 = 0;
      }

      v10 = v18;
    }
    else
    {
      _PCSError(v22 + 3, 139, @"Failed to deserialize PCSManateeShareInvitation");
      v14 = 0;
    }

    v15 = (void *)v22[3];
    if (a5)
    {
      *a5 = v15;
      v22[3] = 0;
    }
    else if (v15)
    {
      v22[3] = 0;
      CFRelease(v15);
    }

    _Block_object_dispose(&v21, 8);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

void __73__PCSShareProtectionObject_initWithSharingRequestData_identitySet_error___block_invoke(uint64_t a1, uint64_t a2, const void *a3)
{
  if (*(void *)(*(void *)(a1 + 32) + 8)) {
    return;
  }
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  objc_super v6 = *(const void **)(v5 + 24);
  if (v6)
  {
    *(void *)(v5 + 24) = 0;
    CFRelease(v6);
  }
  v7 = [*(id *)(a1 + 40) exportedPCSData];
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  v9 = (const void **)(v8 + 24);
  if (!a3)
  {
    _PCSError((const void **)(v8 + 24), 27, @"PCSFPCreateWithExportedManateeSharingInvitation need an identity");
    goto LABEL_15;
  }
  CFTypeRef Mutable = PCSIdentitySetCreateMutable((const void **)(v8 + 24));
  if (!Mutable)
  {
LABEL_15:
    v12 = 0;
    goto LABEL_9;
  }
  v11 = Mutable;
  if (PCSIdentitySetAddIdentity((uint64_t)Mutable, (uint64_t)a3)) {
    v12 = CreateWithExportedInternal((uint64_t)v7, (uint64_t)v11, 0, 0, 1, 0, 0, v9);
  }
  else {
    v12 = 0;
  }
  CFRelease(v11);
LABEL_9:
  *(void *)(*(void *)(a1 + 32) + 8) = v12;

  uint64_t v13 = *(void *)(a1 + 32);
  if (*(void *)(v13 + 8))
  {
    if (a3)
    {
      CFRetain(a3);
      uint64_t v13 = *(void *)(a1 + 32);
    }
    *(void *)(v13 + 16) = a3;
  }
}

- (void)dealloc
{
  shareProtection = self->_shareProtection;
  if (shareProtection)
  {
    self->_shareProtection = 0;
    CFRelease(shareProtection);
  }
  identity = self->_identity;
  if (identity)
  {
    self->_identity = 0;
    CFRelease(identity);
  }
  v5.receiver = self;
  v5.super_class = (Class)PCSShareProtectionObject;
  [(PCSShareProtectionObject *)&v5 dealloc];
}

- (id)sharingRequestDataForIdentity:(_PCSPublicIdentityData *)a3 error:(id *)a4
{
  return [(PCSShareProtectionObject *)self sharingRequestDataForIdentity:a3 flags:0 error:a4];
}

- (id)sharingRequestDataForIdentity:(_PCSPublicIdentityData *)a3 flags:(unsigned int)a4 error:(id *)a5
{
  return [(PCSShareProtectionObject *)self sharingRequestDataForIdentity:a3 owner:0 flags:*(void *)&a4 error:a5];
}

- (id)sharingRequestDataForIdentity:(_PCSPublicIdentityData *)a3 owner:(void *)a4 flags:(unsigned int)a5 error:(id *)a6
{
  id v22 = 0;
  PCSFPAddPublicIdentityWithShareFlags((uint64_t)self->_shareProtection, a3, *(uint64_t *)&a5, (uint64_t)a4, *(uint64_t *)&a5, (uint64_t)a6, v6, v7);
  shareProtection = self->_shareProtection;
  if (a4)
  {
    PCSFPSetOwnerIdentity((uint64_t)shareProtection, a4);
  }
  else if (!shareProtection->var19 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    -[PCSShareProtectionObject sharingRequestDataForIdentity:owner:flags:error:]();
  }
  v16 = _PCSFPCopyExportedWithOptions((uint64_t)self->_shareProtection, 0, 1, (uint64_t)a3, (const void **)&v22, v12, v13, v14);
  id v17 = v22;
  if (a6)
  {
    *a6 = v22;
    id v22 = 0;
  }
  else if (v22)
  {
    id v22 = 0;
    CFRelease(v17);
  }
  if (v16)
  {
    v18 = objc_alloc_init(PCSManateeShareInvitation);
    [(PCSManateeShareInvitation *)v18 setExportedPCSData:v16];
    CFDataRef v19 = PCSPublicIdentityCopyPublicKey((uint64_t)a3);
    [(PCSManateeShareInvitation *)v18 setShareePublicKeyData:v19];

    v20 = [(PCSManateeShareInvitation *)v18 data];
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (id)exportAcceptedSharingRequestWithError:(id *)a3
{
  v19[1] = *MEMORY[0x1E4F143B8];
  uint64_t SigningIdentity = _PCSIdentityGetSigningIdentity((uint64_t)self->_identity);
  uint64_t v6 = PCSIdentityCopyPublicIdentity(SigningIdentity);
  if (v6)
  {
    v10 = v6;
    id v17 = 0;
    v11 = _PCSFPCopyExportedWithOptions((uint64_t)self->_shareProtection, 1, 1, (uint64_t)v6, (const void **)&v17, v7, v8, v9);
    id v12 = v17;
    if (a3)
    {
      *a3 = v17;
      id v17 = 0;
    }
    else if (v17)
    {
      id v17 = 0;
      CFRelease(v12);
    }
    CFRelease(v10);
  }
  else
  {
    if (a3)
    {
      uint64_t v13 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v14 = kPCSErrorDomain;
      uint64_t v18 = *MEMORY[0x1E4F28568];
      v19[0] = @"missing signing identity";
      v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
      *a3 = [v13 errorWithDomain:v14 code:144 userInfo:v15];
    }
    v11 = 0;
  }
  return v11;
}

- (_OpaquePCSShareProtection)shareProtection
{
  return self->_shareProtection;
}

- (void)sharingRequestDataForIdentity:owner:flags:error:.cold.1()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_1ACF98000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "generating a sharing request with no owner; this will not work",
    v0,
    2u);
}

@end