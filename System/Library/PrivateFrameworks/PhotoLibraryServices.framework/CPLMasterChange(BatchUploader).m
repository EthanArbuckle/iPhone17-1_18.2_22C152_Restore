@interface CPLMasterChange(BatchUploader)
- (BOOL)hasResourceOfType:()BatchUploader notInMasterChange:;
@end

@implementation CPLMasterChange(BatchUploader)

- (BOOL)hasResourceOfType:()BatchUploader notInMasterChange:
{
  id v6 = a4;
  v7 = [a1 scopedIdentifier];
  v8 = [v6 scopedIdentifier];
  int v9 = [v7 isEqual:v8];

  if (v9)
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __70__CPLMasterChange_BatchUploader__hasResourceOfType_notInMasterChange___block_invoke;
    v17[3] = &__block_descriptor_40_e28_B32__0__CPLResource_8Q16_B24l;
    v17[4] = a3;
    v10 = (void *)MEMORY[0x19F38D650](v17);
    v11 = [a1 resources];
    uint64_t v12 = [v11 indexOfObjectPassingTest:v10];

    if (v12 == 0x7FFFFFFFFFFFFFFFLL)
    {
      BOOL v13 = 0;
    }
    else
    {
      v14 = [v6 resources];
      uint64_t v15 = [v14 indexOfObjectPassingTest:v10];

      BOOL v13 = v15 == 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

@end