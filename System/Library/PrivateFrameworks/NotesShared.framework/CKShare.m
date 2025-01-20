@interface CKShare
@end

@implementation CKShare

BOOL __38__CKShare_IC__ic_acceptedParticipants__block_invoke(uint64_t a1, void *a2)
{
  return [a2 acceptanceStatus] == 2;
}

BOOL __52__CKShare_IC__ic_nonCurrentUserAcceptedParticipants__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = ([v2 isCurrentUser] & 1) == 0 && objc_msgSend(v2, "acceptanceStatus") == 2;

  return v3;
}

uint64_t __48__CKShare_IC__ic_participantWithUserRecordName___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = [a2 userIdentity];
  v4 = [v3 userRecordID];
  v5 = [v4 recordName];
  uint64_t v6 = [v5 isEqualToString:*(void *)(a1 + 32)];

  return v6;
}

uint64_t __40__CKShare_IC__ic_participantWithHandle___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = [a2 userIdentity];
  v4 = [v3 lookupInfo];

  v5 = [v4 emailAddress];
  uint64_t v6 = [v5 length];

  if (v6)
  {
    v7 = (void *)MEMORY[0x1E4FADBD8];
    v8 = [v4 emailAddress];
    uint64_t v9 = [v7 normalizedEmailAddressHandleForValue:v8];
  }
  else
  {
    v13 = [v4 phoneNumber];
    uint64_t v14 = [v13 length];

    if (!v14)
    {
      v10 = 0;
      goto LABEL_4;
    }
    v15 = [v4 phoneNumber];
    char v16 = [v15 hasPrefix:@"+"];

    if ((v16 & 1) == 0)
    {
      v18 = [*(id *)(a1 + 32) normalizedValue];
      v10 = objc_msgSend(v18, "stringByReplacingOccurrencesOfString:withString:options:range:", @"+", &stru_1F1F2FFF8, 0, 0, 1);

      v19 = [v4 phoneNumber];
      uint64_t v11 = [v19 isEqualToString:v10];

      goto LABEL_5;
    }
    v17 = (void *)MEMORY[0x1E4FADBD8];
    v8 = [v4 phoneNumber];
    uint64_t v9 = [v17 normalizedPhoneNumberHandleForValue:v8 isoCountryCode:0];
  }
  v10 = (void *)v9;

LABEL_4:
  uint64_t v11 = [v10 isEquivalentToHandle:*(void *)(a1 + 32)];
LABEL_5:

  return v11;
}

@end