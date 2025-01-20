@interface NSDateFormatter(HKSPSleep)
- (id)hksp_timeStringFromDate:()HKSPSleep designatorString:designatorIsBeforeTime:;
@end

@implementation NSDateFormatter(HKSPSleep)

- (id)hksp_timeStringFromDate:()HKSPSleep designatorString:designatorIsBeforeTime:
{
  id v8 = a3;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__11;
  v31 = __Block_byref_object_dispose__11;
  v32 = &stru_1EFE54160;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3010000000;
  v25 = &unk_1A7EE0F45;
  long long v26 = xmmword_1A7ED5680;
  v9 = [a1 _attributedStringWithFieldsFromDate:v8];
  uint64_t v10 = [v9 length];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __94__NSDateFormatter_HKSPSleep__hksp_timeStringFromDate_designatorString_designatorIsBeforeTime___block_invoke;
  v18[3] = &unk_1E5D343C8;
  v20 = &v27;
  id v11 = v9;
  id v19 = v11;
  v21 = &v22;
  objc_msgSend(v11, "enumerateAttributesInRange:options:usingBlock:", 0, v10, 0, v18);
  *a4 = (id) v28[5];
  *a5 = v23[4] == 0;
  v12 = [a1 stringFromDate:v8];
  v13 = v12;
  uint64_t v14 = v23[4];
  if (v14 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v15 = objc_msgSend(v12, "stringByReplacingOccurrencesOfString:withString:options:range:", v28[5], &stru_1EFE54160, 0, v14, v23[5]);

    v13 = (void *)v15;
  }
  v16 = objc_msgSend(v13, "hk_stringByReplacingSpacesWithString:", &stru_1EFE54160);

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v27, 8);

  return v16;
}

@end