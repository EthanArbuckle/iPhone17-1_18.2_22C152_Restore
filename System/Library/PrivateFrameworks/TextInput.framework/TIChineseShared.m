@interface TIChineseShared
+ (id)defaultFuzzyPinyinPairs;
+ (id)validFuzzyPinyinPairs;
@end

@implementation TIChineseShared

+ (id)defaultFuzzyPinyinPairs
{
  if (defaultFuzzyPinyinPairs___onceToken != -1) {
    dispatch_once(&defaultFuzzyPinyinPairs___onceToken, &__block_literal_global_75_1061);
  }
  v2 = (void *)defaultFuzzyPinyinPairs___defaultFuzzyPinyinPairs;

  return v2;
}

void __42__TIChineseShared_defaultFuzzyPinyinPairs__block_invoke()
{
  v0 = (void *)MEMORY[0x1E4F1C978];
  objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"z", @"zh", 0);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"s", @"sh", 0);
  v2 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"c", @"ch", 0);
  v3 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"an", @"ang", 0);
  v4 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"en", @"eng", 0);
  v5 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"in", @"ing", 0);
  uint64_t v6 = objc_msgSend(v0, "arrayWithObjects:", v8, v1, v2, v3, v4, v5, 0);
  v7 = (void *)defaultFuzzyPinyinPairs___defaultFuzzyPinyinPairs;
  defaultFuzzyPinyinPairs___defaultFuzzyPinyinPairs = v6;
}

+ (id)validFuzzyPinyinPairs
{
  if (validFuzzyPinyinPairs___onceToken != -1) {
    dispatch_once(&validFuzzyPinyinPairs___onceToken, &__block_literal_global_1100);
  }
  v2 = (void *)validFuzzyPinyinPairs___validFuzzyPinyinPairs;

  return v2;
}

void __40__TIChineseShared_validFuzzyPinyinPairs__block_invoke()
{
  v12 = (void *)MEMORY[0x1E4F1C978];
  v15 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"z", @"zh", 0);
  v11 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"s", @"sh", 0);
  v14 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"c", @"ch", 0);
  v13 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"an", @"ang", 0);
  v0 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"en", @"eng", 0);
  v1 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"in", @"ing", 0);
  v2 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"ian", @"iang", 0);
  v3 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"uan", @"uang", 0);
  v4 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"n", @"l", 0);
  v5 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"r", @"l", 0);
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"h", @"f", 0);
  v7 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"hui", @"fei", 0);
  id v8 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"huang", @"wang", 0);
  uint64_t v9 = objc_msgSend(v12, "arrayWithObjects:", v15, v11, v14, v13, v0, v1, v2, v3, v4, v5, v6, v7, v8, 0);
  v10 = (void *)validFuzzyPinyinPairs___validFuzzyPinyinPairs;
  validFuzzyPinyinPairs___validFuzzyPinyinPairs = v9;
}

@end