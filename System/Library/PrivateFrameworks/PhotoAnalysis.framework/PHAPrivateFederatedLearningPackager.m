@interface PHAPrivateFederatedLearningPackager
- (BOOL)_generateError:(id *)a3 errorCode:(int64_t)a4 errorMessage:(id)a5 underlyingError:(id)a6;
- (_NSRange)privacyIdentifierLargeRange;
- (_NSRange)privacyIdentifierRange;
- (_NSRange)privacyIdentifierSmallRange;
- (id)_flattenTrainingResults:(id)a3;
- (id)dataPackageFromTrainingResults:(id)a3 error:(id *)a4;
@end

@implementation PHAPrivateFederatedLearningPackager

- (_NSRange)privacyIdentifierLargeRange
{
  NSUInteger length = self->_privacyIdentifierLargeRange.length;
  NSUInteger location = self->_privacyIdentifierLargeRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (_NSRange)privacyIdentifierSmallRange
{
  NSUInteger length = self->_privacyIdentifierSmallRange.length;
  NSUInteger location = self->_privacyIdentifierSmallRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (_NSRange)privacyIdentifierRange
{
  NSUInteger length = self->_privacyIdentifierRange.length;
  NSUInteger location = self->_privacyIdentifierRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (BOOL)_generateError:(id *)a3 errorCode:(int64_t)a4 errorMessage:(id)a5 underlyingError:(id)a6
{
  id v9 = a6;
  if (a3)
  {
    v10 = (objc_class *)MEMORY[0x1E4F1CA60];
    id v11 = a5;
    id v12 = objc_alloc_init(v10);
    [v12 setObject:v11 forKey:*MEMORY[0x1E4F28568]];

    if (v9) {
      [v12 setObject:v9 forKey:*MEMORY[0x1E4F28A50]];
    }
    *a3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.PhotoAnalysis.PHAPrivateFederatedLearningPackager" code:a4 userInfo:v12];
  }
  return 0;
}

- (id)_flattenTrainingResults:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F71EF8]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v11 = objc_msgSend(v10, "weightDeltas", (void)v14);
        [v4 appendVector:v11];

        id v12 = [v10 biasDeltas];
        [v4 appendVector:v12];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)dataPackageFromTrainingResults:(id)a3 error:(id *)a4
{
  uint64_t v6 = [(PHAPrivateFederatedLearningPackager *)self _flattenTrainingResults:a3];
  if ([v6 count])
  {
    uint64_t v7 = [v6 data];
  }
  else
  {
    [(PHAPrivateFederatedLearningPackager *)self _generateError:a4 errorCode:1 errorMessage:@"Training results are empty, will not continue." underlyingError:0];
    uint64_t v7 = 0;
  }

  return v7;
}

@end