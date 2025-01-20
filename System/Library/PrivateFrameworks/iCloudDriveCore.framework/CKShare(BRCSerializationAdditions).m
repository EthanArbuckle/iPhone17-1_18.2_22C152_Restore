@interface CKShare(BRCSerializationAdditions)
- (uint64_t)_brc_isOwner;
- (uint64_t)deserializeSharingOptions:()BRCSerializationAdditions error:;
@end

@implementation CKShare(BRCSerializationAdditions)

- (uint64_t)_brc_isOwner
{
  v1 = [a1 recordID];
  v2 = [v1 zoneID];
  v3 = [v2 ownerName];
  uint64_t v4 = [v3 isEqualToString:*MEMORY[0x263EFD488]];

  return v4;
}

- (uint64_t)deserializeSharingOptions:()BRCSerializationAdditions error:
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v5 = [a1 publicPermission];
  if (v5 == 3)
  {
    unint64_t v6 = 8;
  }
  else if (v5 == 2)
  {
    if (objc_msgSend(a1, "_brc_isOwner")) {
      unint64_t v6 = 24;
    }
    else {
      unint64_t v6 = 8;
    }
  }
  else if (objc_msgSend(a1, "_brc_isOwner"))
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v7 = objc_msgSend(a1, "participants", 0);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v19;
      unint64_t v6 = 64;
LABEL_10:
      uint64_t v11 = 0;
      while (1)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v18 + 1) + 8 * v11);
        if ([v12 type] != 1 && objc_msgSend(v12, "permission") > 1) {
          break;
        }
        if (v9 == ++v11)
        {
          uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
          if (v9) {
            goto LABEL_10;
          }
          goto LABEL_17;
        }
      }
    }
    else
    {
LABEL_17:
      unint64_t v6 = 0;
    }
  }
  else
  {
    v13 = [a1 currentUserParticipant];
    BOOL v14 = [v13 permission] > 1;

    unint64_t v6 = (unint64_t)v14 << 6;
  }
  v15 = [a1 currentUserParticipant];
  if ([v15 permission] == 3)
  {

    if (!a3) {
      return 1;
    }
    goto LABEL_26;
  }
  uint64_t v16 = [a1 publicPermission];

  if (v16 != 3) {
    v6 |= 0x20uLL;
  }
  if (a3) {
LABEL_26:
  }
    *a3 = v6;
  return 1;
}

@end