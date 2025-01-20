@interface CKShareParticipant(WBSUICKShareParticipantExtras)
- (id)safari_contact;
- (void)safari_contact;
@end

@implementation CKShareParticipant(WBSUICKShareParticipantExtras)

- (id)safari_contact
{
  v2 = [a1 userIdentity];
  v3 = objc_msgSend(v2, "safari_contactIdentifier");
  if (v3)
  {
    if (safari_contact_onceToken != -1) {
      dispatch_once(&safari_contact_onceToken, &__block_literal_global_56);
    }
    v4 = [MEMORY[0x1E4F982D8] sharedContactStoreManager];
    id v11 = 0;
    v5 = [v4 unifiedContactWithIdentifier:v3 keysToFetch:safari_contact_keyDescriptors error:&v11];
    id v6 = v11;

    if (v5)
    {
      v7 = objc_msgSend(a1, "safari_shareParticipantIdentifier");
      objc_msgSend(v5, "safari_setShareParticipantIdentifier:", v7);

      goto LABEL_11;
    }
    if (v6)
    {
      v8 = WBS_LOG_CHANNEL_PREFIXSharedTabGroups();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        [(CKShareParticipant(WBSUICKShareParticipantExtras) *)v8 safari_contact];
      }
    }
  }
  v9 = [MEMORY[0x1E4F982D8] sharedContactStoreManager];
  v5 = [v9 temporaryContactForIdentity:v2];

  objc_msgSend(a1, "safari_shareParticipantIdentifier");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safari_setShareParticipantIdentifier:", v6);
LABEL_11:

  return v5;
}

- (void)safari_contact
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = a1;
  v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  int v5 = 138543362;
  id v6 = v4;
  _os_log_error_impl(&dword_1ABB70000, v3, OS_LOG_TYPE_ERROR, "Failed to fetch contact: %{public}@", (uint8_t *)&v5, 0xCu);
}

@end