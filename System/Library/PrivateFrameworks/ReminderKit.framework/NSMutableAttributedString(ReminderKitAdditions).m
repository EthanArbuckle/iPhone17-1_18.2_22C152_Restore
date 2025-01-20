@interface NSMutableAttributedString(ReminderKitAdditions)
- (BOOL)rem_replaceTTREMHashtag:()ReminderKitAdditions withTTREMHashtag:;
@end

@implementation NSMutableAttributedString(ReminderKitAdditions)

- (BOOL)rem_replaceTTREMHashtag:()ReminderKitAdditions withTTREMHashtag:
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3010000000;
  v23 = &unk_1B9C210DA;
  long long v24 = xmmword_1B9BF2060;
  uint64_t v8 = [a1 length];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  v15 = __92__NSMutableAttributedString_ReminderKitAdditions__rem_replaceTTREMHashtag_withTTREMHashtag___block_invoke;
  v16 = &unk_1E61DCC50;
  v17 = a1;
  id v9 = v6;
  id v18 = v9;
  v19 = &v20;
  objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:", @"_TTREMHashtag", 0, v8, 0, &v13);
  uint64_t v10 = v21[4];
  if (v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(a1, "removeAttribute:range:", @"_TTREMHashtag", v21[4], v21[5], v13, v14, v15, v16, v17);
    v25 = @"_TTREMHashtag";
    v26[0] = v7;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];
    objc_msgSend(a1, "setAttributes:range:", v11, v21[4], v21[5]);
  }
  _Block_object_dispose(&v20, 8);

  return v10 != 0x7FFFFFFFFFFFFFFFLL;
}

@end