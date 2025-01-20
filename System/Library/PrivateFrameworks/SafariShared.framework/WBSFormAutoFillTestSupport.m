@interface WBSFormAutoFillTestSupport
+ (id)stringRepresentationFromMetadataProvider:(id)a3;
@end

@implementation WBSFormAutoFillTestSupport

+ (id)stringRepresentationFromMetadataProvider:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 formCount];
  if (v4)
  {
    v5 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v4];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __71__WBSFormAutoFillTestSupport_stringRepresentationFromMetadataProvider___block_invoke;
    v10[3] = &unk_1E5C9B3A8;
    id v11 = v5;
    id v6 = v5;
    [v3 enumerateFormsUsingBlock:v10];
    v7 = [v6 componentsJoinedByString:@" "];
    v8 = [v7 stringByAppendingString:@"\n"];
  }
  else
  {
    v8 = @"No forms exist on this page.\n";
  }

  return v8;
}

void __71__WBSFormAutoFillTestSupport_stringRepresentationFromMetadataProvider___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v24[5] = *MEMORY[0x1E4F143B8];
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = [a3 dictionaryRepresentation];
  v5 = sanitizedMetadata(v4);
  id v6 = objc_msgSend(v4, "safari_arrayForKey:", @"FormControls");
  v7 = objc_msgSend(v6, "safari_mapObjectsUsingBlock:", &__block_literal_global_49);
  [v5 setObject:v7 forKey:@"FormControls"];
  [v5 removeObjectForKey:@"FormID"];
  [v5 removeObjectForKey:@"RequestType"];
  [v5 removeObjectForKey:@"TextSample"];
  v23[0] = @"UsernameElementUniqueID";
  v23[1] = @"PasswordElementUniqueID";
  v24[0] = @"UsernameElement";
  v24[1] = @"PasswordElement";
  v23[2] = @"OldPasswordElementUniqueID";
  v23[3] = @"ConfirmPasswordElementUniqueID";
  v24[2] = @"OldPasswordElement";
  v24[3] = @"ConfirmPasswordElement";
  v23[4] = @"FirstCreditCardCardholderFieldOrCreditCardNumberFieldUniqueID";
  v24[4] = @"FirstCreditCardCardholderFieldOrCreditCardNumberField";
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:5];
  v9 = (void *)[v5 copy];
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  v18 = __sanitizedFormMetadata_block_invoke_2;
  v19 = &unk_1E5C9B3F0;
  id v20 = v8;
  id v10 = v5;
  id v21 = v10;
  v22 = v6;
  id v11 = v8;
  id v12 = v6;
  [v9 enumerateKeysAndObjectsUsingBlock:&v16];
  v13 = v22;
  id v14 = v10;

  v15 = objc_msgSend(v14, "description", v16, v17, v18, v19);
  [v3 addObject:v15];
}

@end