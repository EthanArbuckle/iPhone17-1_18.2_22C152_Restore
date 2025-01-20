@interface PKContactAvatarManager
- (PKContactAvatarManager)initWithContactResolver:(id)a3 paymentDataProvider:(id)a4;
- (id)cachedAvatarForAltDSID:(id)a3;
- (void)_avatarForAltDSID:(id)a3 dsid:(id)a4 handles:(id)a5 contact:(id)a6 completion:(id)a7;
- (void)avatarForFamilyMember:(id)a3 accountUser:(id)a4 invitation:(id)a5 completion:(id)a6;
- (void)avatarForFamilyMember:(id)a3 completion:(id)a4;
- (void)avatarForFamilyMember:(id)a3 peerPaymentAccount:(id)a4 invitation:(id)a5 completion:(id)a6;
@end

@implementation PKContactAvatarManager

- (PKContactAvatarManager)initWithContactResolver:(id)a3 paymentDataProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)PKContactAvatarManager;
  v9 = [(PKContactAvatarManager *)&v21 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_paymentDataProvider, a4);
    objc_storeStrong((id *)&v10->_contactResolver, a3);
    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    dictionaryAvatars = v10->_dictionaryAvatars;
    v10->_dictionaryAvatars = v11;

    id v13 = objc_alloc(_MergedGlobals_664());
    v14 = [(Class)off_1EB545978() defaultSettings];
    uint64_t v15 = [v13 initWithSettings:v14];
    renderer = v10->_renderer;
    v10->_renderer = (CNAvatarImageRenderer *)v15;

    Class v17 = (Class)off_1EB545980();
    uint64_t v18 = -[objc_class scopeWithPointSize:scale:rightToLeft:style:](v17, "scopeWithPointSize:scale:rightToLeft:style:", 1, 0, 100.0, 100.0, PKUIScreenScale());
    scope = v10->_scope;
    v10->_scope = (CNAvatarImageRenderingScope *)v18;
  }
  return v10;
}

- (id)cachedAvatarForAltDSID:(id)a3
{
  p_lockAvatars = &self->_lockAvatars;
  id v5 = a3;
  os_unfair_lock_lock(p_lockAvatars);
  v6 = [(NSMutableDictionary *)self->_dictionaryAvatars objectForKey:v5];

  os_unfair_lock_unlock(p_lockAvatars);

  return v6;
}

- (void)avatarForFamilyMember:(id)a3 peerPaymentAccount:(id)a4 invitation:(id)a5 completion:(id)a6
{
  id v19 = a3;
  id v9 = a5;
  id v10 = a6;
  v11 = [v19 altDSID];
  v12 = v11;
  if (v11)
  {
    id v13 = v11;
  }
  else
  {
    id v13 = [v9 altDSID];
  }
  v14 = v13;

  uint64_t v15 = [v19 dsid];
  id v16 = objc_alloc_init(MEMORY[0x1E4F1BA40]);
  [v16 setContactType:0];
  if (v19)
  {
    Class v17 = [v19 firstName];
    [v16 setGivenName:v17];

    uint64_t v18 = [v19 lastName];
    [v16 setFamilyName:v18];
  }
  [(PKContactAvatarManager *)self _avatarForAltDSID:v14 dsid:v15 handles:0 contact:v16 completion:v10];
}

- (void)avatarForFamilyMember:(id)a3 completion:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  id v7 = [v12 altDSID];
  id v8 = [v12 dsid];
  id v9 = objc_alloc_init(MEMORY[0x1E4F1BA40]);
  [v9 setContactType:0];
  if (v12)
  {
    id v10 = [v12 firstName];
    [v9 setGivenName:v10];

    v11 = [v12 lastName];
    [v9 setFamilyName:v11];
  }
  [(PKContactAvatarManager *)self _avatarForAltDSID:v7 dsid:v8 handles:0 contact:v9 completion:v6];
}

- (void)avatarForFamilyMember:(id)a3 accountUser:(id)a4 invitation:(id)a5 completion:(id)a6
{
  id v31 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [v10 altDSID];
  v14 = v13;
  id v29 = v11;
  uint64_t v15 = self;
  if (v13)
  {
    id v16 = v13;
  }
  else
  {
    Class v17 = objc_msgSend(v11, "invitationDetails", v11);
    id v16 = [v17 accountUserAltDSID];
  }
  uint64_t v18 = [v31 dsid];
  id v19 = objc_alloc_init(MEMORY[0x1E4F1BA40]);
  [v19 setContactType:0];
  if (v31)
  {
    v20 = [v31 firstName];
    [v19 setGivenName:v20];

    objc_super v21 = [v31 lastName];
    [v19 setFamilyName:v21];
LABEL_8:

    goto LABEL_9;
  }
  if (v10)
  {
    objc_super v21 = [v10 nameComponents];
    v22 = [v21 givenName];
    [v19 setGivenName:v22];

    v23 = [v21 familyName];
    [v19 setFamilyName:v23];

    goto LABEL_8;
  }
LABEL_9:
  v24 = objc_msgSend(v10, "addressableHandles", v29);
  v25 = (void *)[v24 mutableCopy];

  v26 = [v10 appleID];
  if (v26 && ([v25 containsObject:v26] & 1) == 0) {
    [v25 addObject:v26];
  }
  v27 = (void *)[v25 copy];
  v28 = (void *)[v19 copy];
  [(PKContactAvatarManager *)v15 _avatarForAltDSID:v16 dsid:v18 handles:v27 contact:v28 completion:v12];
}

- (void)_avatarForAltDSID:(id)a3 dsid:(id)a4 handles:(id)a5 contact:(id)a6 completion:(id)a7
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v27 = a4;
  id v24 = a5;
  id v26 = a6;
  id v29 = (void (**)(id, uint64_t))a7;
  os_unfair_lock_lock(&self->_lockAvatars);
  v28 = v12;
  uint64_t v25 = [(NSMutableDictionary *)self->_dictionaryAvatars objectForKey:v12];
  os_unfair_lock_unlock(&self->_lockAvatars);
  id v13 = (void *)v25;
  if (v25)
  {
    v29[2](v29, v25);
  }
  else
  {
    v14 = [(CNAvatarImageRenderer *)self->_renderer placeholderImageProvider];
    v23 = objc_msgSend(v14, "imageForSize:scale:", 100.0, 100.0, PKUIScreenScale());

    if (v23) {
      ((void (*)(void))v29[2])();
    }
    v50[0] = 0;
    v50[1] = v50;
    v50[2] = 0x3032000000;
    v50[3] = __Block_byref_object_copy__29;
    v50[4] = __Block_byref_object_dispose__29;
    id v51 = 0;
    id v15 = objc_alloc_init(MEMORY[0x1E4F84518]);
    if (v27)
    {
      v47[0] = MEMORY[0x1E4F143A8];
      v47[1] = 3221225472;
      v47[2] = __76__PKContactAvatarManager__avatarForAltDSID_dsid_handles_contact_completion___block_invoke;
      v47[3] = &unk_1E59CC7D8;
      v47[4] = self;
      id v48 = v27;
      v49 = v50;
      [v15 addOperation:v47];
    }
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v16 = v24;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v43 objects:v52 count:16];
    if (v17)
    {
      uint64_t v18 = *(void *)v44;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v44 != v18) {
            objc_enumerationMutation(v16);
          }
          uint64_t v20 = *(void *)(*((void *)&v43 + 1) + 8 * i);
          v39[0] = MEMORY[0x1E4F143A8];
          v39[1] = 3221225472;
          v39[2] = __76__PKContactAvatarManager__avatarForAltDSID_dsid_handles_contact_completion___block_invoke_3;
          v39[3] = &unk_1E59D5CA0;
          v39[4] = self;
          v39[5] = v20;
          v42 = v50;
          id v40 = v28;
          v41 = v29;
          [v15 addOperation:v39];
        }
        uint64_t v17 = [v16 countByEnumeratingWithState:&v43 objects:v52 count:16];
      }
      while (v17);
    }

    if (v26)
    {
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __76__PKContactAvatarManager__avatarForAltDSID_dsid_handles_contact_completion___block_invoke_7;
      v34[3] = &unk_1E59D5CA0;
      v34[4] = self;
      id v35 = v26;
      v38 = v50;
      id v36 = v28;
      v37 = v29;
      [v15 addOperation:v34];
    }
    objc_super v21 = [MEMORY[0x1E4F1CA98] null];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __76__PKContactAvatarManager__avatarForAltDSID_dsid_handles_contact_completion___block_invoke_9;
    v30[3] = &unk_1E59D5CC8;
    v33 = v50;
    v30[4] = self;
    id v31 = v28;
    v32 = v29;
    id v22 = (id)[v15 evaluateWithInput:v21 completion:v30];

    _Block_object_dispose(v50, 8);
    id v13 = 0;
  }
}

void __76__PKContactAvatarManager__avatarForAltDSID_dsid_handles_contact_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = *(void **)(*(void *)(a1 + 32) + 32);
  v19[0] = *(void *)(a1 + 40);
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __76__PKContactAvatarManager__avatarForAltDSID_dsid_handles_contact_completion___block_invoke_2;
  v14[3] = &unk_1E59D5C00;
  id v10 = *(id *)(a1 + 40);
  uint64_t v11 = *(void *)(a1 + 48);
  id v17 = v7;
  uint64_t v18 = v11;
  id v15 = v10;
  id v16 = v6;
  id v12 = v6;
  id v13 = v7;
  [v8 photosForFamilyMembersWithDSIDs:v9 completion:v14];
}

void __76__PKContactAvatarManager__avatarForAltDSID_dsid_handles_contact_completion___block_invoke_2(void *a1, void *a2)
{
  id v4 = [a2 objectForKey:a1[4]];
  if (v4)
  {
    v3 = (void *)[objc_alloc(MEMORY[0x1E4FB1818]) initWithData:v4];
    if (v3) {
      objc_storeStrong((id *)(*(void *)(a1[7] + 8) + 40), v3);
    }
  }
  else
  {
    v3 = 0;
  }
  (*(void (**)(void))(a1[6] + 16))();
}

void __76__PKContactAvatarManager__avatarForAltDSID_dsid_handles_contact_completion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  id v10 = *(void **)(v8 + 8);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __76__PKContactAvatarManager__avatarForAltDSID_dsid_handles_contact_completion___block_invoke_4;
  v13[3] = &unk_1E59D5C78;
  uint64_t v18 = *(void *)(a1 + 64);
  id v16 = v7;
  v13[4] = v8;
  id v14 = v6;
  id v15 = *(id *)(a1 + 48);
  id v17 = *(id *)(a1 + 56);
  id v11 = v6;
  id v12 = v7;
  [v10 contactForHandle:v9 withCompletion:v13];
}

void __76__PKContactAvatarManager__avatarForAltDSID_dsid_handles_contact_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__PKContactAvatarManager__avatarForAltDSID_dsid_handles_contact_completion___block_invoke_5;
  block[3] = &unk_1E59D5C50;
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = v3;
  uint64_t v8 = v4;
  uint64_t v13 = *(void *)(a1 + 72);
  id v11 = *(id *)(a1 + 56);
  id v9 = *(id *)(a1 + 40);
  id v10 = *(id *)(a1 + 48);
  id v12 = *(id *)(a1 + 64);
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __76__PKContactAvatarManager__avatarForAltDSID_dsid_handles_contact_completion___block_invoke_5(uint64_t a1)
{
  v21[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    v19[0] = 0;
    v19[1] = v19;
    void v19[2] = 0x2020000000;
    char v20 = 0;
    id v3 = *(void **)(*(void *)(a1 + 40) + 40);
    v21[0] = v2;
    uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 48);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __76__PKContactAvatarManager__avatarForAltDSID_dsid_handles_contact_completion___block_invoke_6;
    v11[3] = &unk_1E59D5C28;
    uint64_t v6 = *(void *)(a1 + 80);
    id v17 = v19;
    uint64_t v18 = v6;
    id v15 = *(id *)(a1 + 64);
    id v7 = *(id *)(a1 + 48);
    uint64_t v8 = *(void *)(a1 + 40);
    id v12 = v7;
    uint64_t v13 = v8;
    id v14 = *(id *)(a1 + 56);
    id v16 = *(id *)(a1 + 72);
    id v9 = (id)[v3 renderAvatarsForContacts:v4 scope:v5 imageHandler:v11];

    _Block_object_dispose(v19, 8);
  }
  else
  {
    id v10 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    v10();
  }
}

void __76__PKContactAvatarManager__avatarForAltDSID_dsid_handles_contact_completion___block_invoke_6(void *a1, void *a2)
{
  id v4 = a2;
  uint64_t v5 = *(void *)(a1[9] + 8);
  id v6 = v4;
  if (*(unsigned char *)(v5 + 24))
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1[5] + 16));
    [*(id *)(a1[5] + 24) setObject:v6 forKey:a1[6]];
    os_unfair_lock_unlock((os_unfair_lock_t)(a1[5] + 16));
    (*(void (**)(void))(a1[8] + 16))();
  }
  else
  {
    if (v4)
    {
      objc_storeStrong((id *)(*(void *)(a1[10] + 8) + 40), a2);
      uint64_t v5 = *(void *)(a1[9] + 8);
    }
    *(unsigned char *)(v5 + 24) = 1;
    (*(void (**)(void))(a1[7] + 16))();
  }
}

void __76__PKContactAvatarManager__avatarForAltDSID_dsid_handles_contact_completion___block_invoke_7(uint64_t a1, void *a2, void *a3, void *a4)
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  char v27 = 0;
  id v10 = *(void **)(*(void *)(a1 + 32) + 40);
  v28[0] = *(void *)(a1 + 40);
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];
  uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 48);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __76__PKContactAvatarManager__avatarForAltDSID_dsid_handles_contact_completion___block_invoke_8;
  v18[3] = &unk_1E59D5C28;
  uint64_t v13 = *(void *)(a1 + 64);
  id v24 = v26;
  uint64_t v25 = v13;
  id v14 = v9;
  id v22 = v14;
  id v15 = v8;
  uint64_t v16 = *(void *)(a1 + 32);
  id v19 = v15;
  uint64_t v20 = v16;
  id v21 = *(id *)(a1 + 48);
  id v23 = *(id *)(a1 + 56);
  id v17 = (id)[v10 renderAvatarsForContacts:v11 scope:v12 imageHandler:v18];

  _Block_object_dispose(v26, 8);
}

void __76__PKContactAvatarManager__avatarForAltDSID_dsid_handles_contact_completion___block_invoke_8(void *a1, void *a2)
{
  id v4 = a2;
  uint64_t v5 = *(void *)(a1[9] + 8);
  id v6 = v4;
  if (*(unsigned char *)(v5 + 24))
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1[5] + 16));
    [*(id *)(a1[5] + 24) setObject:v6 forKey:a1[6]];
    os_unfair_lock_unlock((os_unfair_lock_t)(a1[5] + 16));
    (*(void (**)(void))(a1[8] + 16))();
  }
  else
  {
    if (v4)
    {
      objc_storeStrong((id *)(*(void *)(a1[10] + 8) + 40), a2);
      uint64_t v5 = *(void *)(a1[9] + 8);
    }
    *(unsigned char *)(v5 + 24) = 1;
    (*(void (**)(void))(a1[7] + 16))();
  }
}

uint64_t __76__PKContactAvatarManager__avatarForAltDSID_dsid_handles_contact_completion___block_invoke_9(uint64_t result)
{
  if (*(void *)(*(void *)(*(void *)(result + 56) + 8) + 40))
  {
    v1 = (void *)result;
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(result + 32) + 16));
    [*(id *)(v1[4] + 24) setObject:*(void *)(*(void *)(v1[7] + 8) + 40) forKey:v1[5]];
    os_unfair_lock_unlock((os_unfair_lock_t)(v1[4] + 16));
    uint64_t v2 = *(uint64_t (**)(void))(v1[6] + 16);
    return v2();
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scope, 0);
  objc_storeStrong((id *)&self->_renderer, 0);
  objc_storeStrong((id *)&self->_paymentDataProvider, 0);
  objc_storeStrong((id *)&self->_dictionaryAvatars, 0);

  objc_storeStrong((id *)&self->_contactResolver, 0);
}

@end