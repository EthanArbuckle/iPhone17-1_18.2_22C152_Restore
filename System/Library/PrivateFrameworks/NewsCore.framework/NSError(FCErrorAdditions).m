@interface NSError(FCErrorAdditions)
+ (id)fc_HTTPErrorWithURL:()FCErrorAdditions statusCode:requestUUID:additionalUserInfo:;
+ (id)fc_blockedInCurrentStorefrontErrorWithIdentifiers:()FCErrorAdditions;
+ (id)fc_errorWithCode:()FCErrorAdditions description:additionalUserInfo:;
+ (id)fc_invalidChannelErrorForTagID:()FCErrorAdditions;
+ (id)fc_invalidSectionErrorForTagID:()FCErrorAdditions;
+ (id)fc_missingANFDocumentErrorForArticleID:()FCErrorAdditions;
+ (id)fc_missingAppConfigErrorWithUnderlyingError:()FCErrorAdditions;
+ (id)fc_missingAssetErrorWithAssetHandles:()FCErrorAdditions;
+ (id)fc_missingResourceErrorWithDescription:()FCErrorAdditions;
+ (id)fc_notCachedErrorWithMissingObjects:()FCErrorAdditions;
+ (id)fc_offlineErrorWithReason:()FCErrorAdditions;
+ (id)fc_requestDroppedErrorForDroppedFeeds:()FCErrorAdditions totalFeeds:;
+ (id)fc_unauthorizedAVAssetKeyErrorWithKeyURI:()FCErrorAdditions;
+ (id)fc_unauthorizedAssetKeyErrorWithWrappingKeyID:()FCErrorAdditions;
+ (id)fc_unknownRecordZoneErrorWithZoneName:()FCErrorAdditions;
+ (id)fc_unzipFailedErrorWithErrorCode:()FCErrorAdditions;
+ (uint64_t)fc_authUserAccountInvalid;
+ (uint64_t)fc_belowMinimumVersionError;
+ (uint64_t)fc_canaryDownError;
+ (uint64_t)fc_emptyM3UPlaylistError;
+ (uint64_t)fc_encryptionRequiredError;
+ (uint64_t)fc_errorWithCode:()FCErrorAdditions description:;
+ (uint64_t)fc_exceededQueryBudgetErrorWithAdditionalUserInfo:()FCErrorAdditions;
+ (uint64_t)fc_expiredAVAssetCertificateError;
+ (uint64_t)fc_feedDroppedError;
+ (uint64_t)fc_invalidAVAssetKeyURIError;
+ (uint64_t)fc_invalidBookmarkErrorWithUserInfo:()FCErrorAdditions;
+ (uint64_t)fc_invalidGapErrorWithUserInfo:()FCErrorAdditions;
+ (uint64_t)fc_missingAssetKeyError;
+ (uint64_t)fc_missingBridgedGroupError;
+ (uint64_t)fc_notAvailableError;
+ (uint64_t)fc_operationCancelledErrorWithAdditionalUserInfo:()FCErrorAdditions;
+ (uint64_t)fc_partialFailureErrorWithUserInfo:()FCErrorAdditions;
+ (uint64_t)fc_secureSubscriptionsDisallowedError;
+ (uint64_t)fc_unauthorizedAVAssetCertificateError;
- (uint64_t)fc_hasErrorCode:()FCErrorAdditions;
@end

@implementation NSError(FCErrorAdditions)

- (uint64_t)fc_hasErrorCode:()FCErrorAdditions
{
  v5 = [a1 domain];
  if ([v5 isEqualToString:@"FCErrorDomain"])
  {
    uint64_t v6 = [a1 code];

    if (v6 == a3) {
      return 1;
    }
  }
  else
  {
  }
  v8 = [a1 userInfo];
  v9 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];

  if (v9) {
    uint64_t v7 = objc_msgSend(v9, "fc_hasErrorCode:", a3);
  }
  else {
    uint64_t v7 = 0;
  }

  return v7;
}

+ (id)fc_errorWithCode:()FCErrorAdditions description:additionalUserInfo:
{
  id v7 = a4;
  id v8 = a5;
  if (v8) {
    [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v8];
  }
  else {
  v9 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  v10 = v9;
  if (v7) {
    [v9 setObject:v7 forKey:*MEMORY[0x1E4F28568]];
  }
  v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"FCErrorDomain" code:a3 userInfo:v10];

  return v11;
}

+ (uint64_t)fc_errorWithCode:()FCErrorAdditions description:
{
  return objc_msgSend(a1, "fc_errorWithCode:description:additionalUserInfo:", a3, a4, 0);
}

+ (uint64_t)fc_authUserAccountInvalid
{
  return objc_msgSend(a1, "fc_errorWithCode:description:additionalUserInfo:", 32, @"User account is invalid or nonexistent and cannot be authenticated.", MEMORY[0x1E4F1CC08]);
}

+ (id)fc_notCachedErrorWithMissingObjects:()FCErrorAdditions
{
  v9[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v8 = @"FCErrorMissingObjectsDescriptionsKey";
    v4 = [a3 allObjects];
    v9[0] = v4;
    v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  }
  else
  {
    v5 = (void *)MEMORY[0x1E4F1CC08];
  }
  uint64_t v6 = objc_msgSend(a1, "fc_errorWithCode:description:additionalUserInfo:", 5, @"The operation could not be completed with just the contents of the cache.", v5);

  return v6;
}

+ (uint64_t)fc_belowMinimumVersionError
{
  return objc_msgSend(a1, "fc_errorWithCode:description:additionalUserInfo:", 6, @"Below minimum version to make modifications.", MEMORY[0x1E4F1CC08]);
}

+ (uint64_t)fc_feedDroppedError
{
  return objc_msgSend(a1, "fc_errorWithCode:description:additionalUserInfo:", 7, @"A feed request was dropped by CloudKit.", MEMORY[0x1E4F1CC08]);
}

+ (id)fc_requestDroppedErrorForDroppedFeeds:()FCErrorAdditions totalFeeds:
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v5 = objc_msgSend(NSString, "stringWithFormat:", @"Rejecting feed request because %lu of %lu feeds were dropped.", a3, a4);
  v9 = @"FCErrorRetryAfter";
  v10[0] = &unk_1EF8D9A18;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  id v7 = objc_msgSend(a1, "fc_errorWithCode:description:additionalUserInfo:", 2, v5, v6);

  return v7;
}

+ (uint64_t)fc_notAvailableError
{
  return objc_msgSend(a1, "fc_errorWithCode:description:additionalUserInfo:", 8, @"The requested data is not available.", MEMORY[0x1E4F1CC08]);
}

+ (uint64_t)fc_canaryDownError
{
  return objc_msgSend(a1, "fc_errorWithCode:description:additionalUserInfo:", 11, @"The canary in the coal mine is missing.", MEMORY[0x1E4F1CC08]);
}

+ (id)fc_offlineErrorWithReason:()FCErrorAdditions
{
  v7[1] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = @"FCErrorOfflineReasonKey";
  v2 = objc_msgSend(NSNumber, "numberWithInteger:");
  v7[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  v4 = objc_msgSend(a1, "fc_errorWithCode:description:additionalUserInfo:", 10, 0, v3);

  return v4;
}

+ (id)fc_missingAppConfigErrorWithUnderlyingError:()FCErrorAdditions
{
  id v3 = a3;
  if (v3
    && ([MEMORY[0x1E4F1CA98] null],
        v4 = objc_claimAutoreleasedReturnValue(),
        char v5 = [v3 isEqual:v4],
        v4,
        (v5 & 1) == 0))
  {
    id v7 = [MEMORY[0x1E4F1CA60] dictionary];
    [v7 setObject:@"Failed to load the configuration." forKeyedSubscript:*MEMORY[0x1E4F28568]];
    [v7 setObject:v3 forKeyedSubscript:*MEMORY[0x1E4F28A50]];
    uint64_t v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"FCErrorDomain" code:14 userInfo:v7];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

+ (id)fc_missingResourceErrorWithDescription:()FCErrorAdditions
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v9 = *MEMORY[0x1E4F28568];
  v10[0] = a3;
  v4 = (void *)MEMORY[0x1E4F1C9E8];
  id v5 = a3;
  uint64_t v6 = [v4 dictionaryWithObjects:v10 forKeys:&v9 count:1];
  id v7 = [v3 errorWithDomain:@"FCErrorDomain" code:19 userInfo:v6];

  return v7;
}

+ (uint64_t)fc_operationCancelledErrorWithAdditionalUserInfo:()FCErrorAdditions
{
  return objc_msgSend(a1, "fc_errorWithCode:description:additionalUserInfo:", 1, @"The operation was cancelled.", a3);
}

+ (id)fc_blockedInCurrentStorefrontErrorWithIdentifiers:()FCErrorAdditions
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v9 = @"FCErrorBlockedContentIdentifiersKey";
  v10[0] = a3;
  v4 = (void *)MEMORY[0x1E4F1C9E8];
  id v5 = a3;
  uint64_t v6 = [v4 dictionaryWithObjects:v10 forKeys:&v9 count:1];

  id v7 = objc_msgSend(a1, "fc_errorWithCode:description:additionalUserInfo:", 20, @"The requested content is not allowed in the current storefront", v6);

  return v7;
}

+ (uint64_t)fc_partialFailureErrorWithUserInfo:()FCErrorAdditions
{
  return objc_msgSend(a1, "fc_errorWithCode:description:additionalUserInfo:", 21, @"Some of the child operations failed.", a3);
}

+ (uint64_t)fc_missingBridgedGroupError
{
  return objc_msgSend(a1, "fc_errorWithCode:description:additionalUserInfo:", 22, @"A bridged group could not be restored from the persisted viewport.", MEMORY[0x1E4F1CC08]);
}

+ (uint64_t)fc_invalidBookmarkErrorWithUserInfo:()FCErrorAdditions
{
  return objc_msgSend(a1, "fc_errorWithCode:description:additionalUserInfo:", 23, @"The bookmark does not correspond to any of the underlying elements.", a3);
}

+ (uint64_t)fc_invalidGapErrorWithUserInfo:()FCErrorAdditions
{
  return objc_msgSend(a1, "fc_errorWithCode:description:additionalUserInfo:", 24, @"The gap does not correspond to any of the underlying elements.", a3);
}

+ (id)fc_missingAssetErrorWithAssetHandles:()FCErrorAdditions
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_msgSend(v4, "fc_arrayByTransformingWithBlock:", &__block_literal_global_133);
  uint64_t v6 = objc_msgSend(v4, "fc_arrayByTransformingWithBlock:", &__block_literal_global_96_0);

  uint64_t v7 = *MEMORY[0x1E4F28750];
  v11[0] = @"FCErrorMissingObjectsDescriptionsKey";
  v11[1] = v7;
  v12[0] = v5;
  v12[1] = v6;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  uint64_t v9 = objc_msgSend(a1, "fc_errorWithCode:description:additionalUserInfo:", 25, @"The requested asset could not be retrieved.", v8);

  return v9;
}

+ (id)fc_unzipFailedErrorWithErrorCode:()FCErrorAdditions
{
  v7[1] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = @"FCErrorUnderlyingErrorCodeKey";
  v2 = objc_msgSend(NSNumber, "numberWithInt:");
  v7[0] = v2;
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  id v4 = objc_msgSend(a1, "fc_errorWithCode:description:additionalUserInfo:", 26, @"Failed to unzip a zip archive.", v3);

  return v4;
}

+ (id)fc_unauthorizedAssetKeyErrorWithWrappingKeyID:()FCErrorAdditions
{
  id v4 = (void *)MEMORY[0x1E4F1CA60];
  id v5 = a3;
  uint64_t v6 = [v4 dictionary];
  objc_msgSend(v6, "fc_safelySetObjectAllowingNil:forKey:", v5, @"FCErrorAssetWrappingKeyIDKey");

  uint64_t v7 = objc_msgSend(a1, "fc_errorWithCode:description:additionalUserInfo:", 27, @"The requested asset wrapping key could not be retrieved because the user isn't authorized.", v6);

  return v7;
}

+ (id)fc_unauthorizedAVAssetKeyErrorWithKeyURI:()FCErrorAdditions
{
  id v4 = (void *)MEMORY[0x1E4F1CA60];
  id v5 = a3;
  uint64_t v6 = [v4 dictionary];
  objc_msgSend(v6, "fc_safelySetObjectAllowingNil:forKey:", v5, @"FCErrorAssetKeyURI");

  uint64_t v7 = objc_msgSend(a1, "fc_errorWithCode:description:additionalUserInfo:", 35, @"The requested AV asset key could not be retrieved because the user isn't authorized.", v6);

  return v7;
}

+ (uint64_t)fc_unauthorizedAVAssetCertificateError
{
  return objc_msgSend(a1, "fc_errorWithCode:description:additionalUserInfo:", 34, @"The AV asset key certificate could not be retrieved because the user isn't authorized.", MEMORY[0x1E4F1CC08]);
}

+ (uint64_t)fc_expiredAVAssetCertificateError
{
  return objc_msgSend(a1, "fc_errorWithCode:description:additionalUserInfo:", 38, @"The AV asset key certificate is expired.", MEMORY[0x1E4F1CC08]);
}

+ (uint64_t)fc_invalidAVAssetKeyURIError
{
  return objc_msgSend(a1, "fc_errorWithCode:description:additionalUserInfo:", 36, @"The AV asset key URI is invalid.", MEMORY[0x1E4F1CC08]);
}

+ (uint64_t)fc_missingAssetKeyError
{
  return objc_msgSend(a1, "fc_errorWithCode:description:additionalUserInfo:", 28, @"The requested asset wrapping key could not be retrieved.", 0);
}

+ (id)fc_missingANFDocumentErrorForArticleID:()FCErrorAdditions
{
  id v4 = (void *)MEMORY[0x1E4F1CA60];
  id v5 = a3;
  uint64_t v6 = [v4 dictionary];
  objc_msgSend(v6, "fc_safelySetObjectAllowingNil:forKey:", v5, @"FCErrorArticleIDKey");

  uint64_t v7 = objc_msgSend(a1, "fc_errorWithCode:description:additionalUserInfo:", 29, @"An ANF article is missing its main document asset handle.", v6);

  return v7;
}

+ (id)fc_invalidChannelErrorForTagID:()FCErrorAdditions
{
  id v4 = (void *)MEMORY[0x1E4F1CA60];
  id v5 = a3;
  uint64_t v6 = [v4 dictionary];
  objc_msgSend(v6, "fc_safelySetObjectAllowingNil:forKey:", v5, @"FCErrorTagIDKey");

  uint64_t v7 = objc_msgSend(a1, "fc_errorWithCode:description:additionalUserInfo:", 30, @"The operation could not be completed because the expected channel was invalid.", v6);

  return v7;
}

+ (id)fc_invalidSectionErrorForTagID:()FCErrorAdditions
{
  id v4 = (void *)MEMORY[0x1E4F1CA60];
  id v5 = a3;
  uint64_t v6 = [v4 dictionary];
  objc_msgSend(v6, "fc_safelySetObjectAllowingNil:forKey:", v5, @"FCErrorTagIDKey");

  uint64_t v7 = objc_msgSend(a1, "fc_errorWithCode:description:additionalUserInfo:", 31, @"The operation could not be completed because the expected section was invalid.", v6);

  return v7;
}

+ (uint64_t)fc_emptyM3UPlaylistError
{
  return objc_msgSend(a1, "fc_errorWithCode:description:", 33, @"M3U playlist has no streams.");
}

+ (uint64_t)fc_secureSubscriptionsDisallowedError
{
  return objc_msgSend(a1, "fc_errorWithCode:description:", 39, @"Subscriptions may not be stored in the secure private database.");
}

+ (uint64_t)fc_encryptionRequiredError
{
  return objc_msgSend(a1, "fc_errorWithCode:description:", 40, @"This operation may not run unless encryption is enabled.");
}

+ (id)fc_HTTPErrorWithURL:()FCErrorAdditions statusCode:requestUUID:additionalUserInfo:
{
  id v9 = a6;
  v10 = (void *)MEMORY[0x1E4F1CA60];
  id v11 = a5;
  id v12 = a3;
  v13 = [v10 dictionary];
  objc_msgSend(v13, "fc_safelySetObjectAllowingNil:forKey:", v12, @"FCErrorHTTPURL");

  objc_msgSend(v13, "fc_safelySetObjectAllowingNil:forKey:", v11, @"FCErrorHTTPRequestUUID");
  v14 = [NSNumber numberWithUnsignedInteger:a4];
  objc_msgSend(v13, "fc_safelySetObjectAllowingNil:forKey:", v14, @"FCErrorHTTPStatusCode");

  if (v9) {
    [v13 addEntriesFromDictionary:v9];
  }
  v15 = (void *)MEMORY[0x1E4F28C58];
  v16 = objc_msgSend(NSString, "stringWithFormat:", @"URL download failed with status code %lu", a4);
  v17 = objc_msgSend(v15, "fc_errorWithCode:description:additionalUserInfo:", 4, v16, v13);

  return v17;
}

+ (uint64_t)fc_exceededQueryBudgetErrorWithAdditionalUserInfo:()FCErrorAdditions
{
  return objc_msgSend(a1, "fc_errorWithCode:description:additionalUserInfo:", 43, @"The operation reached its maximum number of allowed queries.", a3);
}

+ (id)fc_unknownRecordZoneErrorWithZoneName:()FCErrorAdditions
{
  id v4 = [NSString stringWithFormat:@"Unknown record zone %@", a3];
  id v5 = objc_msgSend(a1, "fc_errorWithCode:description:additionalUserInfo:", 16, v4, 0);

  return v5;
}

@end