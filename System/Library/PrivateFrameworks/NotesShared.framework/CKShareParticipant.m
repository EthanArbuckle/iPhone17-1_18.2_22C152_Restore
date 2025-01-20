@interface CKShareParticipant
@end

@implementation CKShareParticipant

void __50__CKShareParticipant_IC__ic_mentionableNamesCache__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F83720]);
  uint64_t v1 = [v0 initWithMaxSize:50 notificationName:*MEMORY[0x1E4F1AF80]];
  v2 = (void *)ic_mentionableNamesCache_sMentionableNamesCache;
  ic_mentionableNamesCache_sMentionableNamesCache = v1;
}

uint64_t __64__CKShareParticipant_IC__ic_displayableNames_maximumNamesCount___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "ic_participantName");
}

uint64_t __56__CKShareParticipant_IC__ic_nonCurrentUserParticipants___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isCurrentUser] ^ 1;
}

uint64_t __54__CKShareParticipant_IC__ic_mentionTokensFromContacts__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "ic_tokenSafeText");
}

void __74__CKShareParticipant_IC__ic_participantNameMatchingString_returnFullName___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v20 = a2;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if ([v20 length])
  {
    v12 = objc_msgSend(v20, "ic_tokenSafeText");
    int v13 = [v12 isEqualToString:*(void *)(a1 + 32)];

    if (v13)
    {
      if (*(unsigned char *)(a1 + 48))
      {
        uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
        id v15 = v11;
LABEL_8:
        v17 = *(void **)(v14 + 40);
        *(void *)(v14 + 40) = v15;
LABEL_9:

        goto LABEL_10;
      }
      v16 = objc_msgSend(v10, "ic_tokenSafeText");
      if ([v16 isEqualToString:*(void *)(a1 + 32)])
      {

LABEL_7:
        uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
        id v15 = v10;
        goto LABEL_8;
      }
      if ([v11 length])
      {
      }
      else
      {
        uint64_t v18 = [v9 length];

        if (!v18) {
          goto LABEL_7;
        }
      }
      v17 = objc_msgSend(NSString, "ic_shortNameFromGivenName:familyName:", v9, v10);
      if ([v17 length]) {
        v19 = v17;
      }
      else {
        v19 = v11;
      }
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v19);
      goto LABEL_9;
    }
  }
LABEL_10:
}

void __74__CKShareParticipant_IC__ic_participantNameMatchingString_returnFullName___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = v3;
  if (v3)
  {
    id v6 = v3;
    uint64_t v5 = [v3 length];
    v4 = v6;
    if (v5)
    {
      [*(id *)(a1 + 32) addObject:v6];
      v4 = v6;
      ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    }
  }
}

@end