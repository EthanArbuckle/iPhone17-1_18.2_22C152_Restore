@interface PKDevicePhoneNumberAndSignature
@end

@implementation PKDevicePhoneNumberAndSignature

uint64_t ___PKDevicePhoneNumberAndSignature_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = [v5 uuid];
  v8 = [v6 uuid];
  if (!*(void *)(a1 + 32)) {
    goto LABEL_10;
  }
  int v9 = objc_msgSend(v7, "isEqual:");
  int v10 = v9;
  if (!*(void *)(a1 + 32))
  {
    if (v9)
    {
      uint64_t v12 = -1;
      goto LABEL_15;
    }
    goto LABEL_10;
  }
  int v11 = objc_msgSend(v8, "isEqual:");
  uint64_t v12 = v10 ? -1 : 1;
  if (v10 == v11)
  {
LABEL_10:
    uint64_t v13 = [v5 slotID];
    int v14 = [v6 slotID] != 1;
    int v15 = v13 == 1;
    if (v13 == 1) {
      uint64_t v12 = -1;
    }
    else {
      uint64_t v12 = 1;
    }
    if (v15 != v14)
    {
      v16 = [v7 UUIDString];
      v17 = [v8 UUIDString];
      uint64_t v12 = [v16 compare:v17];
    }
  }
LABEL_15:

  return v12;
}

@end