@interface PKPaymentSetupFieldsModel(PKUIAdditions)
- (double)minimumRequiredWidthForFieldIdentifiers:()PKUIAdditions withFont:;
@end

@implementation PKPaymentSetupFieldsModel(PKUIAdditions)

- (double)minimumRequiredWidthForFieldIdentifiers:()PKUIAdditions withFont:
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = PKUIGetMinScreenWidthType();
  uint64_t v26 = *MEMORY[0x1E4FB06F8];
  v27[0] = v7;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:&v26 count:1];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v10 = v6;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v22;
    double v14 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v22 != v13) {
          objc_enumerationMutation(v10);
        }
        v16 = objc_msgSend(a1, "paymentSetupFieldWithIdentifier:", *(void *)(*((void *)&v21 + 1) + 8 * i), (void)v21);
        if (([v16 isFieldTypeLabel] & 1) == 0)
        {
          if (v8) {
            [v16 localizedDisplayName];
          }
          else {
          v17 = [v16 compactLocalizedDisplayName];
          }
          [v17 sizeWithAttributes:v9];
          double v19 = v18;

          if (v19 > v14) {
            double v14 = v19;
          }
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v12);
  }
  else
  {
    double v14 = 0.0;
  }

  return v14;
}

@end