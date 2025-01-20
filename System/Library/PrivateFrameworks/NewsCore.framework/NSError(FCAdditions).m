@interface NSError(FCAdditions)
- (BOOL)fc_hasUnderlyingErrorPassingTest:()FCAdditions;
- (BOOL)fc_isAVUnauthorizedError;
- (BOOL)fc_isBlockedInStoreFrontError;
- (BOOL)fc_isHTTPNotFoundError;
- (BOOL)fc_isOperationThrottledError;
- (BOOL)fc_isRequestDroppedError;
- (id)fc_errorWithMaximumRetryAfter:()FCAdditions;
- (uint64_t)fc_failedDueToTaskConstraints;
- (uint64_t)fc_isAuthenticationUserCancelled;
- (uint64_t)fc_isCancellationError;
- (uint64_t)fc_isNetworkUnavailableError;
- (uint64_t)fc_isOfflineError;
- (uint64_t)fc_isOfflineErrorOfflineReason:()FCAdditions;
- (uint64_t)fc_isServiceUnavailableError;
- (uint64_t)fc_shouldRetry;
@end

@implementation NSError(FCAdditions)

- (BOOL)fc_isOperationThrottledError
{
  v2 = [a1 domain];
  if ([v2 isEqualToString:@"FCErrorDomain"]) {
    BOOL v3 = [a1 code] == 12;
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

- (id)fc_errorWithMaximumRetryAfter:()FCAdditions
{
  if (a2 == 0.0)
  {
    v15[5] = MEMORY[0x1E4F143A8];
    v15[6] = 3221225472;
    v15[7] = __54__NSError_FCAdditions__fc_errorWithMaximumRetryAfter___block_invoke;
    v15[8] = &unk_1E5B4C840;
    v15[9] = a1;
    id v13 = a1;
  }
  else
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __54__NSError_FCAdditions__fc_errorWithMaximumRetryAfter___block_invoke_2;
    v15[3] = &unk_1E5B4C2A0;
    v15[4] = a1;
    v4 = __54__NSError_FCAdditions__fc_errorWithMaximumRetryAfter___block_invoke_2((uint64_t)v15);
    if (v4)
    {
      v5 = [a1 userInfo];
      v6 = [v5 objectForKeyedSubscript:v4];

      [v6 doubleValue];
      if (v7 <= a2)
      {
        id v13 = a1;
      }
      else
      {
        v8 = [a1 userInfo];
        v9 = (void *)[v8 mutableCopy];

        v10 = [NSNumber numberWithDouble:a2];
        [v9 setObject:v10 forKeyedSubscript:v4];

        v11 = (void *)MEMORY[0x1E4F28C58];
        v12 = [a1 domain];
        objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, objc_msgSend(a1, "code"), v9);
        id v13 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      id v13 = a1;
    }
  }
  return v13;
}

- (uint64_t)fc_shouldRetry
{
  v1 = [a1 userInfo];
  v2 = [v1 objectForKeyedSubscript:@"NSErrorFCAdditionsShouldRetry"];
  uint64_t v3 = [v2 BOOLValue];

  return v3;
}

- (uint64_t)fc_isNetworkUnavailableError
{
  v1 = [a1 userInfo];
  v2 = [v1 objectForKeyedSubscript:@"NSErrorFCAdditionsIsNetworkUnavailable"];
  uint64_t v3 = [v2 BOOLValue];

  return v3;
}

- (uint64_t)fc_isCancellationError
{
  v2 = [a1 domain];
  if ([v2 isEqualToString:*MEMORY[0x1E4F19C40]] && objc_msgSend(a1, "code") == 20)
  {
    uint64_t v3 = 1;
  }
  else
  {
    v4 = [a1 domain];
    if ([v4 isEqualToString:*MEMORY[0x1E4F289A0]] && objc_msgSend(a1, "code") == -999)
    {
      uint64_t v3 = 1;
    }
    else
    {
      v5 = [a1 domain];
      if ([v5 isEqualToString:@"FCErrorDomain"] && objc_msgSend(a1, "code") == 1) {
        uint64_t v3 = 1;
      }
      else {
        uint64_t v3 = objc_msgSend(a1, "fc_hasUnderlyingErrorPassingTest:", &__block_literal_global_150);
      }
    }
  }

  return v3;
}

- (BOOL)fc_isRequestDroppedError
{
  v2 = [a1 domain];
  if ([v2 isEqualToString:@"FCErrorDomain"]) {
    BOOL v3 = [a1 code] == 2;
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

- (uint64_t)fc_isServiceUnavailableError
{
  v2 = [a1 domain];
  if ([v2 isEqualToString:*MEMORY[0x1E4F19C40]])
  {
    uint64_t v3 = [a1 code];

    if (v3 == 6) {
      return 1;
    }
  }
  else
  {
  }
  v5 = [a1 domain];
  if ([v5 isEqualToString:@"FCErrorDomain"])
  {
    v6 = [a1 userInfo];
    double v7 = [v6 objectForKeyedSubscript:@"FCErrorHTTPStatusCode"];
    BOOL v4 = [v7 unsignedIntegerValue] == 503;
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (uint64_t)fc_isOfflineError
{
  return objc_msgSend(a1, "fc_isOfflineErrorOfflineReason:", 0);
}

- (uint64_t)fc_isOfflineErrorOfflineReason:()FCAdditions
{
  v5 = [a1 domain];
  uint64_t v6 = [a1 code];
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0;
  if ([v5 isEqualToString:@"FCErrorDomain"])
  {
    if (v6 == 10)
    {
      double v7 = [a1 userInfo];
      v8 = [v7 objectForKeyedSubscript:@"FCErrorOfflineReasonKey"];

      uint64_t v9 = [v8 unsignedIntegerValue];
      v18[3] = v9;

      goto LABEL_15;
    }
LABEL_20:
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __55__NSError_FCAdditions__fc_isOfflineErrorOfflineReason___block_invoke;
    v16[3] = &unk_1E5B59B18;
    v16[4] = &v17;
    uint64_t v14 = objc_msgSend(a1, "fc_hasUnderlyingErrorPassingTest:", v16);
    goto LABEL_21;
  }
  if ([v5 isEqualToString:*MEMORY[0x1E4F19C40]])
  {
    if ((unint64_t)(v6 - 3) >= 2) {
      goto LABEL_20;
    }
  }
  else
  {
    if ([v5 isEqualToString:*MEMORY[0x1E4F289A0]])
    {
      uint64_t v10 = [a1 code];
      if ((unint64_t)(v10 + 1018) > 0x11) {
        goto LABEL_20;
      }
      uint64_t v11 = 1 << (v10 - 6);
      uint64_t v12 = 139777;
    }
    else
    {
      if (![v5 isEqual:*MEMORY[0x1E4F18F50]]) {
        goto LABEL_20;
      }
      uint64_t v13 = [a1 code];
      if (v13 > 0)
      {
        if (v13 != 1 && v13 != 302 && v13 != 310) {
          goto LABEL_20;
        }
        goto LABEL_15;
      }
      if ((unint64_t)(v13 + 1020) > 0x13) {
        goto LABEL_20;
      }
      uint64_t v11 = 1 << (v13 - 4);
      uint64_t v12 = 772103;
    }
    if ((v11 & v12) == 0) {
      goto LABEL_20;
    }
  }
LABEL_15:
  uint64_t v14 = 1;
  if (!v18[3]) {
    v18[3] = 1;
  }
LABEL_21:
  if (a3) {
    *a3 = v18[3];
  }
  _Block_object_dispose(&v17, 8);

  return v14;
}

- (BOOL)fc_isBlockedInStoreFrontError
{
  v2 = [a1 domain];
  if ([v2 isEqualToString:@"FCErrorDomain"]) {
    BOOL v3 = [a1 code] == 20;
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

- (BOOL)fc_isAVUnauthorizedError
{
  v2 = [a1 domain];
  int v3 = [v2 isEqualToString:@"FCErrorDomain"];

  if (!v3) {
    return 0;
  }
  if ([a1 code] == 34) {
    return 1;
  }
  return [a1 code] == 35;
}

- (BOOL)fc_isHTTPNotFoundError
{
  v2 = [a1 domain];
  int v3 = [v2 isEqualToString:@"FCErrorDomain"];

  if (!v3 || [a1 code] != 4) {
    return 0;
  }
  BOOL v4 = [a1 userInfo];
  v5 = [v4 objectForKey:@"FCErrorHTTPStatusCode"];

  if (v5) {
    BOOL v6 = [v5 unsignedIntegerValue] == 404;
  }
  else {
    BOOL v6 = 0;
  }

  return v6;
}

- (uint64_t)fc_isAuthenticationUserCancelled
{
  v2 = [a1 domain];
  if ([v2 isEqualToString:*MEMORY[0x1E4F4DA40]])
  {
    uint64_t v3 = [a1 code];

    if (v3 == 6) {
      return 1;
    }
  }
  else
  {
  }
  v5 = [a1 userInfo];
  uint64_t v6 = *MEMORY[0x1E4F28A50];
  double v7 = [v5 objectForKey:*MEMORY[0x1E4F28A50]];

  v8 = [v7 userInfo];
  uint64_t v9 = [v8 objectForKey:v6];

  BOOL v4 = [v7 code] == -7003 || objc_msgSend(v9, "code") == -7003;
  return v4;
}

- (uint64_t)fc_failedDueToTaskConstraints
{
  v2 = [a1 userInfo];
  uint64_t v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F289D8]];
  if (v3) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = objc_msgSend(a1, "fc_hasUnderlyingErrorPassingTest:", &__block_literal_global_20_0);
  }

  return v4;
}

- (BOOL)fc_hasUnderlyingErrorPassingTest:()FCAdditions
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = a3;
  v5 = [a1 userInfo];
  uint64_t v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F28750]];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    while (2)
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        if (v4[2](v4, *(void *)(*((void *)&v16 + 1) + 8 * v11)))
        {
          BOOL v14 = 1;
          uint64_t v13 = v7;
          goto LABEL_14;
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  uint64_t v12 = objc_msgSend(a1, "userInfo", (void)v16);
  uint64_t v13 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];

  BOOL v14 = v13 && (((uint64_t (**)(id, void *))v4)[2](v4, v13) & 1) != 0;
LABEL_14:

  return v14;
}

@end