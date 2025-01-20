@interface PHSearchSuggestion(PhotosUICore)
- (__CFString)px_symbolName;
- (id)px_formattedCount;
@end

@implementation PHSearchSuggestion(PhotosUICore)

- (id)px_formattedCount
{
  unint64_t v2 = [a1 count];
  int v3 = [a1 hasApproximateCount];
  if (v2 > 0x186A0) {
    int v4 = 1;
  }
  else {
    int v4 = v3;
  }
  unint64_t v5 = v2;
  if (v4 != 1) {
    goto LABEL_16;
  }
  if (v2 < 5)
  {
    unint64_t v5 = 1;
    goto LABEL_16;
  }
  if (v2 < 0xA)
  {
    unint64_t v5 = 5;
    goto LABEL_16;
  }
  if (v2 <= 0x1F3)
  {
    unint64_t v5 = 10 * vcvtmd_u64_f64((double)v2 / 10.0);
    goto LABEL_16;
  }
  if (v2 >> 3 > 0x270)
  {
    unint64_t v5 = 100000;
    if (v2 >> 4 > 0xC34) {
      goto LABEL_16;
    }
    unint64_t v6 = vcvtmd_u64_f64((double)v2 / 1000.0);
    uint64_t v7 = 1000;
  }
  else
  {
    unint64_t v6 = vcvtmd_u64_f64((double)v2 / 100.0);
    uint64_t v7 = 100;
  }
  unint64_t v5 = v6 * v7;
LABEL_16:
  v8 = (void *)MEMORY[0x1E4F28EE0];
  v9 = [NSNumber numberWithUnsignedInteger:v5];
  v10 = [v8 localizedStringFromNumber:v9 numberStyle:1];

  if (v4)
  {
    v11 = PXLocalizedStringFromTable(@"SEARCH_RESULT_COUNT_FOR_SUGGESTION", @"PhotosUICore");
    PXLocalizedStringWithValidatedFormat(v11, @"%@");
    id v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v12 = v10;
  }

  return v12;
}

- (__CFString)px_symbolName
{
  uint64_t v1 = [a1 categoriesType];
  if ((unint64_t)(v1 - 1) > 0x28) {
    return &stru_1F00B0030;
  }
  else {
    return off_1E5DC0788[v1 - 1];
  }
}

@end