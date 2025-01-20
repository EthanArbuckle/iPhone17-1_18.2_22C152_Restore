@interface NSAttributedString(SXAdditions)
- (id)stringByTruncatingToLength:()SXAdditions options:;
- (uint64_t)tokenCountWithEnumerationOptions:()SXAdditions maxTokenCount:outLimitLength:;
@end

@implementation NSAttributedString(SXAdditions)

- (uint64_t)tokenCountWithEnumerationOptions:()SXAdditions maxTokenCount:outLimitLength:
{
  if (a5) {
    *a5 = [a1 length];
  }
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0;
  v9 = [a1 string];
  uint64_t v10 = [a1 length];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __97__NSAttributedString_SXAdditions__tokenCountWithEnumerationOptions_maxTokenCount_outLimitLength___block_invoke;
  v13[3] = &unk_264652108;
  v13[4] = &v14;
  v13[5] = a4;
  v13[6] = a5;
  objc_msgSend(v9, "enumerateSubstringsInRange:options:usingBlock:", 0, v10, a3, v13);

  uint64_t v11 = v15[3];
  _Block_object_dispose(&v14, 8);
  return v11;
}

- (id)stringByTruncatingToLength:()SXAdditions options:
{
  if ([a1 length] <= a3)
  {
    id v10 = a1;
  }
  else
  {
    uint64_t v13 = 0;
    uint64_t v14 = &v13;
    uint64_t v15 = 0x2020000000;
    uint64_t v16 = 0;
    v7 = [a1 string];
    uint64_t v8 = [a1 length];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __70__NSAttributedString_SXAdditions__stringByTruncatingToLength_options___block_invoke;
    v12[3] = &unk_264652130;
    v12[4] = &v13;
    v12[5] = a3;
    objc_msgSend(v7, "enumerateSubstringsInRange:options:usingBlock:", 0, v8, a4, v12);

    unint64_t v9 = v14[3];
    if (!v9)
    {
      v14[3] = a3;
      unint64_t v9 = a3;
    }
    objc_msgSend(a1, "attributedSubstringFromRange:", 0, v9);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    _Block_object_dispose(&v13, 8);
  }
  return v10;
}

@end