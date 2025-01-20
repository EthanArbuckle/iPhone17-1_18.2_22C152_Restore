@interface WBSFormFieldFingerprinter
+ (id)_fingerprintComponentsForControlMetadata:(id)a3;
+ (id)_hashForString:(id)a3;
+ (id)fingerprintForControlMetadata:(id)a3;
@end

@implementation WBSFormFieldFingerprinter

+ (id)fingerprintForControlMetadata:(id)a3
{
  v3 = [a1 _fingerprintComponentsForControlMetadata:a3];
  v4 = [v3 componentsJoinedByString:@":"];

  return v4;
}

+ (id)_fingerprintComponentsForControlMetadata:(id)a3
{
  v22[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 fieldName];
  v6 = (void *)v5;
  if (v5) {
    v7 = (__CFString *)v5;
  }
  else {
    v7 = &stru_1EFBE3CF8;
  }
  v8 = [a1 _hashForString:v7];

  uint64_t v9 = [v4 fieldID];
  v10 = (void *)v9;
  if (v9) {
    v11 = (__CFString *)v9;
  }
  else {
    v11 = &stru_1EFBE3CF8;
  }
  v12 = [a1 _hashForString:v11];

  uint64_t v13 = [v4 fieldClass];
  v14 = (void *)v13;
  if (v13) {
    v15 = (__CFString *)v13;
  }
  else {
    v15 = &stru_1EFBE3CF8;
  }
  v16 = [a1 _hashForString:v15];

  v17 = [v4 selectElementInfo];
  v18 = @"1";
  if (!v17) {
    v18 = @"0";
  }
  v19 = v18;

  v22[0] = v8;
  v22[1] = v12;
  v22[2] = v16;
  v22[3] = v19;
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:4];

  return v20;
}

+ (id)_hashForString:(id)a3
{
  v3 = objc_msgSend(a3, "safari_md5Hash");
  return v3;
}

@end