@interface PKCloudStoreError
+ (BOOL)_isCloudKitErrorDomain:(id)a3;
+ (id)errorWithDomain:(id)a3 code:(int64_t)a4 userInfo:(id)a5;
- (BOOL)isAccountUnavailable;
- (BOOL)isAuthenticationOrQuotaError;
- (BOOL)isChangeTokenExpired;
- (BOOL)isConflictDetected;
- (BOOL)isInitializationTimeOutError;
- (BOOL)isKeychainSyncingInProgress;
- (BOOL)isManateeNotAvailableError;
- (BOOL)isNetworkUnavailable;
- (BOOL)isPCSError;
- (BOOL)isPartialError;
- (BOOL)isPartialErrorWithUnkownItems;
- (BOOL)isParticipantMayNeedVerificationError;
- (BOOL)isUnknownItemError;
- (BOOL)isUnrecoverableDecryptionError;
- (BOOL)isZoneNotFoundError;
- (PKCloudStoreError)initWithDomain:(id)a3 code:(int64_t)a4 userInfo:(id)a5;
- (PKCloudStoreError)initWithError:(id)a3;
- (id)_allPartialErrors;
- (id)_objectsOfClassTypeFromPartialErrors:(Class)a3;
- (id)_partialErrorsDictionary;
- (id)allZoneIDs;
- (id)errorForPartialErrorWithObject:(id)a3;
- (int64_t)_code;
@end

@implementation PKCloudStoreError

+ (id)errorWithDomain:(id)a3 code:(int64_t)a4 userInfo:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  v9 = [[PKCloudStoreError alloc] initWithDomain:v8 code:a4 userInfo:v7];

  return v9;
}

- (PKCloudStoreError)initWithDomain:(id)a3 code:(int64_t)a4 userInfo:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ([(id)objc_opt_class() _isCloudKitErrorDomain:v8])
  {
    v10 = [v9 objectForKey:*MEMORY[0x1E4F28A50]];
    v11 = v10;
    if (v10)
    {
      v12 = [v10 domain];
      int v13 = [v12 isEqualToString:*MEMORY[0x1E4F19CA0]];

      if (v13)
      {
        uint64_t v14 = [v11 domain];

        a4 = [v11 code];
        uint64_t v15 = [v11 userInfo];

        id v8 = (id)v14;
        id v9 = (id)v15;
      }
    }
    v18.receiver = self;
    v18.super_class = (Class)PKCloudStoreError;
    self = [(PKCloudStoreError *)&v18 initWithDomain:v8 code:a4 userInfo:v9];

    v16 = self;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (PKCloudStoreError)initWithError:(id)a3
{
  id v4 = a3;
  v5 = [v4 domain];
  uint64_t v6 = [v4 code];
  id v7 = [v4 userInfo];

  id v8 = [(PKCloudStoreError *)self initWithDomain:v5 code:v6 userInfo:v7];
  return v8;
}

- (id)errorForPartialErrorWithObject:(id)a3
{
  id v4 = a3;
  v5 = [(PKCloudStoreError *)self _partialErrorsDictionary];
  uint64_t v6 = [v5 objectForKey:v4];

  if (v6) {
    id v7 = [[PKCloudStoreError alloc] initWithError:v6];
  }
  else {
    id v7 = 0;
  }

  return v7;
}

- (BOOL)isChangeTokenExpired
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  int64_t v3 = [(PKCloudStoreError *)self _code];
  if ([(PKCloudStoreError *)self isPartialError])
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v4 = [(PKCloudStoreError *)self _allPartialErrors];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v13;
      while (2)
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = [[PKCloudStoreError alloc] initWithError:*(void *)(*((void *)&v12 + 1) + 8 * v8)];
          BOOL v10 = [(PKCloudStoreError *)v9 isChangeTokenExpired];

          if (v10)
          {

            return 1;
          }
          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }

    return 0;
  }
  return v3 == 21;
}

- (BOOL)isZoneNotFoundError
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  int64_t v3 = [(PKCloudStoreError *)self _code];
  if ([(PKCloudStoreError *)self isPartialError])
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v4 = [(PKCloudStoreError *)self _allPartialErrors];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v13;
      while (2)
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = [[PKCloudStoreError alloc] initWithError:*(void *)(*((void *)&v12 + 1) + 8 * v8)];
          BOOL v10 = [(PKCloudStoreError *)v9 isZoneNotFoundError];

          if (v10)
          {

            return 1;
          }
          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }

    return 0;
  }
  return v3 == 26;
}

- (BOOL)isPartialError
{
  return [(PKCloudStoreError *)self _code] == 2;
}

- (BOOL)isPartialErrorWithUnkownItems
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ([(PKCloudStoreError *)self isUnknownItemError]) {
    return 1;
  }
  if (![(PKCloudStoreError *)self isPartialError]) {
    return 0;
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [(PKCloudStoreError *)self _allPartialErrors];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [[PKCloudStoreError alloc] initWithError:*(void *)(*((void *)&v12 + 1) + 8 * i)];
        BOOL v10 = [(PKCloudStoreError *)v9 isUnknownItemError];

        if (!v10)
        {
          BOOL v3 = 0;
          goto LABEL_15;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v3 = 1;
LABEL_15:

  return v3;
}

- (BOOL)isUnrecoverableDecryptionError
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  int64_t v3 = [(PKCloudStoreError *)self _code];
  if ([(PKCloudStoreError *)self isPartialError])
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v4 = [(PKCloudStoreError *)self _allPartialErrors];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v13;
      while (2)
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = [[PKCloudStoreError alloc] initWithError:*(void *)(*((void *)&v12 + 1) + 8 * v8)];
          BOOL v10 = [(PKCloudStoreError *)v9 isUnrecoverableDecryptionError];

          if (v10)
          {

            return 1;
          }
          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }

    return 0;
  }
  return v3 == 112;
}

- (BOOL)isManateeNotAvailableError
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ([(PKCloudStoreError *)self isPartialError])
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    int64_t v3 = [(PKCloudStoreError *)self _allPartialErrors];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v12;
      while (2)
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v12 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = [[PKCloudStoreError alloc] initWithError:*(void *)(*((void *)&v11 + 1) + 8 * v7)];
          BOOL v9 = [(PKCloudStoreError *)v8 isManateeNotAvailableError];

          if (v9)
          {

            return 1;
          }
          ++v7;
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
  }
  return [(PKCloudStoreError *)self _code] == 110;
}

- (BOOL)isNetworkUnavailable
{
  int64_t v3 = objc_opt_class();
  uint64_t v4 = [(PKCloudStoreError *)self domain];
  LODWORD(v3) = [v3 _isCloudKitErrorDomain:v4];

  if (v3)
  {
    if ([(PKCloudStoreError *)self isPartialError])
    {
      uint64_t v5 = [(PKCloudStoreError *)self _allPartialErrors];
      uint64_t v6 = objc_msgSend(v5, "pk_firstObjectPassingTest:", &__block_literal_global_41);
      LOBYTE(self) = v6 != 0;
    }
    else
    {
      unint64_t v7 = [(PKCloudStoreError *)self _code];
      if (v7 <= 0x17) {
        LODWORD(self) = (0x8000D8u >> v7) & 1;
      }
      else {
        LOBYTE(self) = 0;
      }
    }
  }
  else
  {
    LOBYTE(self) = 0;
  }
  return (char)self;
}

uint64_t __41__PKCloudStoreError_isNetworkUnavailable__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  int64_t v3 = [[PKCloudStoreError alloc] initWithError:v2];

  uint64_t v4 = [(PKCloudStoreError *)v3 isNetworkUnavailable];
  return v4;
}

- (BOOL)isAccountUnavailable
{
  int64_t v3 = objc_opt_class();
  uint64_t v4 = [(PKCloudStoreError *)self domain];
  LODWORD(v3) = [v3 _isCloudKitErrorDomain:v4];

  if (!v3) {
    return 0;
  }
  if (![(PKCloudStoreError *)self isPartialError]) {
    return [(PKCloudStoreError *)self _code] == 36;
  }
  uint64_t v5 = [(PKCloudStoreError *)self _allPartialErrors];
  uint64_t v6 = objc_msgSend(v5, "pk_firstObjectPassingTest:", &__block_literal_global_12_0);
  BOOL v7 = v6 != 0;

  return v7;
}

uint64_t __41__PKCloudStoreError_isAccountUnavailable__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  int64_t v3 = [[PKCloudStoreError alloc] initWithError:v2];

  uint64_t v4 = [(PKCloudStoreError *)v3 isAccountUnavailable];
  return v4;
}

- (BOOL)isKeychainSyncingInProgress
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (![(PKCloudStoreError *)self isPartialError]) {
    return [(PKCloudStoreError *)self _code] == 111;
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  int64_t v3 = [(PKCloudStoreError *)self _allPartialErrors];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = [[PKCloudStoreError alloc] initWithError:*(void *)(*((void *)&v11 + 1) + 8 * v7)];
        BOOL v9 = [(PKCloudStoreError *)v8 isKeychainSyncingInProgress];

        if (v9)
        {

          return 1;
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  return 0;
}

- (BOOL)isPCSError
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ([(PKCloudStoreError *)self isPartialError])
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    int64_t v3 = [(PKCloudStoreError *)self _allPartialErrors];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v15 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = [[PKCloudStoreError alloc] initWithError:*(void *)(*((void *)&v14 + 1) + 8 * i)];
          BOOL v9 = [(PKCloudStoreError *)v8 isPCSError];

          if (v9)
          {

            return 1;
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }

    return 0;
  }
  BOOL v10 = [(PKCloudStoreError *)self domain];
  int v11 = [v10 isEqualToString:*MEMORY[0x1E4F19CA0]];

  if (!v11) {
    return 0;
  }
  uint64_t v12 = [(PKCloudStoreError *)self code];
  if ((unint64_t)(v12 - 5000) <= 0xA) {
    return (0x4BFu >> (v12 + 120)) & 1;
  }
  else {
    return 0;
  }
}

- (BOOL)isInitializationTimeOutError
{
  if ([(PKCloudStoreError *)self _code] != 20) {
    return 0;
  }
  int64_t v3 = [(PKCloudStoreError *)self userInfo];
  uint64_t v4 = [v3 objectForKey:*MEMORY[0x1E4F28A50]];

  uint64_t v5 = [v4 domain];
  if ([v5 isEqualToString:@"PKPassKitErrorDomain"]) {
    BOOL v6 = [v4 code] == -4007;
  }
  else {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)isUnknownItemError
{
  return [(PKCloudStoreError *)self _code] == 11;
}

- (BOOL)isParticipantMayNeedVerificationError
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (![(PKCloudStoreError *)self isPartialError]) {
    return [(PKCloudStoreError *)self _code] == 33;
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  int64_t v3 = [(PKCloudStoreError *)self _allPartialErrors];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = [[PKCloudStoreError alloc] initWithError:*(void *)(*((void *)&v11 + 1) + 8 * v7)];
        BOOL v9 = [(PKCloudStoreError *)v8 isParticipantMayNeedVerificationError];

        if (v9)
        {

          return 1;
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  return 0;
}

- (BOOL)isConflictDetected
{
  int64_t v3 = [(PKCloudStoreError *)self _code];
  uint64_t v4 = [(PKCloudStoreError *)self domain];
  uint64_t v5 = (void *)*MEMORY[0x1E4F19CA0];
  id v6 = v4;
  id v7 = v5;
  uint64_t v8 = v7;
  if (v6 == v7)
  {
    int v9 = 1;
  }
  else
  {
    int v9 = 0;
    if (v6 && v7) {
      int v9 = [v6 isEqualToString:v7];
    }
  }

  if (v9 && v3 == 2004) {
    return 1;
  }
  return v3 == 14 || v3 == 11;
}

- (BOOL)isAuthenticationOrQuotaError
{
  int64_t v3 = objc_opt_class();
  uint64_t v4 = [(PKCloudStoreError *)self domain];
  LODWORD(v3) = [v3 _isCloudKitErrorDomain:v4];

  if (!v3) {
    return 0;
  }
  if (![(PKCloudStoreError *)self isPartialError]) {
    return ([(PKCloudStoreError *)self _code] & 0xFFFFFFFFFFFFFFEFLL) == 9;
  }
  uint64_t v5 = [(PKCloudStoreError *)self _allPartialErrors];
  id v6 = objc_msgSend(v5, "pk_firstObjectPassingTest:", &__block_literal_global_14);
  BOOL v7 = v6 != 0;

  return v7;
}

uint64_t __49__PKCloudStoreError_isAuthenticationOrQuotaError__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  int64_t v3 = [[PKCloudStoreError alloc] initWithError:v2];

  uint64_t v4 = [(PKCloudStoreError *)v3 isAuthenticationOrQuotaError];
  return v4;
}

- (id)allZoneIDs
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v4 = [(PKCloudStoreError *)self _objectsOfClassTypeFromPartialErrors:objc_opt_class()];
  [v3 unionSet:v4];

  uint64_t v5 = [(PKCloudStoreError *)self _objectsOfClassTypeFromPartialErrors:objc_opt_class()];
  id v6 = [v5 allObjects];
  BOOL v7 = [v6 valueForKey:@"zoneID"];
  [v3 addObjectsFromArray:v7];

  uint64_t v8 = (void *)[v3 copy];
  return v8;
}

- (id)_objectsOfClassTypeFromPartialErrors:(Class)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v6 = [(PKCloudStoreError *)self _partialErrorsDictionary];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  long long v12 = __58__PKCloudStoreError__objectsOfClassTypeFromPartialErrors___block_invoke;
  long long v13 = &unk_1E56E0210;
  id v14 = v5;
  Class v15 = a3;
  id v7 = v5;
  [v6 enumerateKeysAndObjectsUsingBlock:&v10];
  uint64_t v8 = objc_msgSend(v7, "copy", v10, v11, v12, v13);

  return v8;
}

void __58__PKCloudStoreError__objectsOfClassTypeFromPartialErrors___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_isKindOfClass()) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

- (int64_t)_code
{
  int64_t v3 = [(PKCloudStoreError *)self code];
  uint64_t v4 = [(PKCloudStoreError *)self domain];
  int v5 = [v4 isEqualToString:*MEMORY[0x1E4F19CA0]];

  int64_t result = v3;
  if (v5)
  {
    JUMPOUT(0x192FDB150);
  }
  return result;
}

- (id)_partialErrorsDictionary
{
  id v2 = [(PKCloudStoreError *)self userInfo];
  int64_t v3 = [v2 objectForKey:*MEMORY[0x1E4F19CD8]];

  return v3;
}

- (id)_allPartialErrors
{
  id v2 = [(PKCloudStoreError *)self _partialErrorsDictionary];
  int64_t v3 = [v2 allValues];

  return v3;
}

+ (BOOL)_isCloudKitErrorDomain:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:*MEMORY[0x1E4F19C40]]) {
    char v4 = 1;
  }
  else {
    char v4 = [v3 isEqualToString:*MEMORY[0x1E4F19CA0]];
  }

  return v4;
}

@end