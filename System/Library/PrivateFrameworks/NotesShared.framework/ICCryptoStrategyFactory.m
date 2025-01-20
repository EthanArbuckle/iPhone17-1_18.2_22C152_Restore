@interface ICCryptoStrategyFactory
+ (BOOL)shouldAuthenticateWithCustomPasswordForObject:(id)a3;
+ (BOOL)shouldAuthenticateWithDevicePasswordForObject:(id)a3;
+ (id)makeCryptoStrategyForObject:(id)a3 andValidateProtocolConformance:(id)a4;
+ (id)makeCryptoStrategyForObject:(id)a3 withCipherMatchingEncryptedData:(id)a4 andValidateProtocolConformance:(id)a5;
+ (id)primaryEncryptedDataForObject:(id)a3;
+ (id)strategyForObject:(id)a3 cipherVersion:(int64_t)a4;
+ (int64_t)cipherVersionForObject:(id)a3;
+ (int64_t)cipherVersionForPrimaryEncryptedData:(id)a3;
+ (int64_t)userSelectedCipherVersionForObject:(id)a3;
@end

@implementation ICCryptoStrategyFactory

+ (id)makeCryptoStrategyForObject:(id)a3 andValidateProtocolConformance:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_msgSend(a1, "strategyForObject:cipherVersion:", v7, objc_msgSend(a1, "cipherVersionForObject:", v7));

  LOBYTE(a1) = [v8 conformsToProtocol:v6];
  if ((a1 & 1) == 0)
  {

    v8 = 0;
  }
  return v8;
}

+ (id)makeCryptoStrategyForObject:(id)a3 withCipherMatchingEncryptedData:(id)a4 andValidateProtocolConformance:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = objc_msgSend(a1, "strategyForObject:cipherVersion:", v9, objc_msgSend(a1, "cipherVersionForPrimaryEncryptedData:", a4));

  LOBYTE(v9) = [v10 conformsToProtocol:v8];
  if ((v9 & 1) == 0)
  {

    v10 = 0;
  }
  return v10;
}

+ (BOOL)shouldAuthenticateWithCustomPasswordForObject:(id)a3
{
  id v4 = a3;
  if ([a1 cipherVersionForObject:v4]) {
    BOOL v5 = [a1 cipherVersionForObject:v4] == 2;
  }
  else {
    BOOL v5 = 1;
  }

  return v5;
}

+ (BOOL)shouldAuthenticateWithDevicePasswordForObject:(id)a3
{
  return [a1 cipherVersionForObject:a3] == 1;
}

+ (int64_t)cipherVersionForObject:(id)a3
{
  id v4 = a3;
  int64_t v5 = [a1 userSelectedCipherVersionForObject:v4];
  if ([v4 isPasswordProtected])
  {
    id v6 = [a1 primaryEncryptedDataForObject:v4];
    if (v6) {
      int64_t v5 = [a1 cipherVersionForPrimaryEncryptedData:v6];
    }
  }
  return v5;
}

+ (id)primaryEncryptedDataForObject:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    int64_t v5 = v3;
    while (1)
    {
      uint64_t v6 = [v5 primaryEncryptedData];
      if (v6) {
        break;
      }
      id v7 = [v5 unappliedEncryptedRecord];

      if (v7)
      {
        id v8 = [v5 unappliedEncryptedRecord];
        id v9 = [v5 primaryEncryptedDataFromRecord:v8];

        if (v9) {
          goto LABEL_10;
        }
      }
      uint64_t v10 = [v5 parentEncryptableObject];

      int64_t v5 = (void *)v10;
      if (!v10)
      {
        id v9 = 0;
        int64_t v5 = 0;
        goto LABEL_10;
      }
    }
    id v9 = (void *)v6;
  }
  else
  {
    int64_t v5 = 0;
    id v9 = 0;
  }
LABEL_10:

  return v9;
}

+ (int64_t)cipherVersionForPrimaryEncryptedData:(id)a3
{
  id v3 = a3;
  if (![v3 length]) {
    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"primaryEncryptedData.length" functionName:"+[ICCryptoStrategyFactory cipherVersionForPrimaryEncryptedData:]" simulateCrash:1 showAlert:0 format:@"Valid data must be provided to cipherVersionForPrimaryEncryptedData:"];
  }
  id v4 = [[ICEncryptionObject alloc] initWithSerializedData:v3];

  if (v4)
  {
    int64_t v5 = [(ICEncryptionObject *)v4 metadata];
    int64_t v6 = [v5 cipherVersion];
  }
  else
  {
    int64_t v6 = 0;
  }

  return v6;
}

+ (int64_t)userSelectedCipherVersionForObject:(id)a3
{
  id v3 = a3;
  char v4 = objc_msgSend(v3, "ic_isTransitioning");
  int64_t v5 = [v3 cloudAccount];

  if (v4) {
    [v5 accountData];
  }
  else {
  int64_t v6 = [v5 accountDataCreateIfNecessary];
  }

  if ([v6 lockedNotesMode] > 1)
  {
    int64_t v7 = 1;
  }
  else if ([v6 supportsV1Neo])
  {
    if (ICInternalSettingsIsLockedNotesV1NeoEnabled()) {
      int64_t v7 = 2;
    }
    else {
      int64_t v7 = 0;
    }
  }
  else
  {
    int64_t v7 = 0;
  }

  return v7;
}

+ (id)strategyForObject:(id)a3 cipherVersion:(int64_t)a4
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int64_t v6 = off_1E64A3240;
LABEL_3:
    int64_t v7 = (void *)[objc_alloc(*v6) initWithCloudSyncingObject:v5];
    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_10:
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int64_t v7 = 0;
      int64_t v6 = off_1E64A32D8;
      switch(a4)
      {
        case 0:
          goto LABEL_3;
        case 1:
          int64_t v6 = off_1E64A32E8;
          goto LABEL_3;
        case 2:
          int64_t v6 = off_1E64A32E0;
          goto LABEL_3;
        case 3:
          goto LABEL_4;
        default:
          goto LABEL_13;
      }
      goto LABEL_4;
    }
LABEL_13:
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int64_t v7 = 0;
      int64_t v6 = off_1E64A3360;
      switch(a4)
      {
        case 0:
          goto LABEL_3;
        case 1:
          int64_t v6 = off_1E64A3370;
          goto LABEL_3;
        case 2:
          int64_t v6 = off_1E64A3368;
          goto LABEL_3;
        case 3:
          goto LABEL_4;
        default:
          goto LABEL_16;
      }
      goto LABEL_4;
    }
LABEL_16:
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int64_t v7 = 0;
      int64_t v6 = off_1E64A3750;
      switch(a4)
      {
        case 0:
          goto LABEL_3;
        case 1:
          int64_t v6 = off_1E64A3760;
          goto LABEL_3;
        case 2:
          int64_t v6 = off_1E64A3758;
          goto LABEL_3;
        case 3:
          goto LABEL_4;
        default:
          goto LABEL_19;
      }
      goto LABEL_4;
    }
LABEL_19:
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ((unint64_t)a4 < 3)
      {
        id v9 = off_1E64A5770;
LABEL_25:
        int64_t v6 = v9[a4];
        goto LABEL_3;
      }
    }
    else if ((unint64_t)a4 < 3)
    {
      id v9 = off_1E64A5788;
      goto LABEL_25;
    }
    int64_t v7 = 0;
    goto LABEL_4;
  }
  int64_t v7 = 0;
  int64_t v6 = off_1E64A37C0;
  switch(a4)
  {
    case 0:
      goto LABEL_3;
    case 1:
      int64_t v6 = off_1E64A37D0;
      goto LABEL_3;
    case 2:
      int64_t v6 = off_1E64A37C8;
      goto LABEL_3;
    case 3:
      break;
    default:
      goto LABEL_10;
  }
LABEL_4:

  return v7;
}

@end