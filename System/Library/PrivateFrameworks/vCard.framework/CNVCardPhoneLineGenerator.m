@interface CNVCardPhoneLineGenerator
+ (id)sanitizeNumber:(id)a3;
- (id)makeLineWithName:(id)a3 value:(id)a4;
- (id)standardLabelsForLabel:(id)a3;
@end

@implementation CNVCardPhoneLineGenerator

- (id)makeLineWithName:(id)a3 value:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_opt_class();
  id v8 = v6;
  if (v8)
  {
    if (objc_opt_isKindOfClass()) {
      v9 = v8;
    }
    else {
      v9 = 0;
    }
    id v10 = v9;
  }
  else
  {
    id v10 = 0;
  }

  v11 = [(id)objc_opt_class() sanitizeNumber:v10];
  v14.receiver = self;
  v14.super_class = (Class)CNVCardPhoneLineGenerator;
  v12 = [(CNVCardLineGenerator *)&v14 makeLineWithName:v7 value:v11];

  return v12;
}

+ (id)sanitizeNumber:(id)a3
{
  return (id)objc_msgSend(a3, "_cn_stringBySanitizingPhoneNumber");
}

- (id)standardLabelsForLabel:(id)a3
{
  v19[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 isEqualToString:@"_$!<Work>!$_"])
  {
    v19[0] = @"WORK";
    v19[1] = @"VOICE";
    v4 = (void *)MEMORY[0x1E4F1C978];
    v5 = (__CFString **)v19;
LABEL_9:
    uint64_t v6 = 2;
LABEL_10:
    id v7 = [v4 arrayWithObjects:v5 count:v6];
    goto LABEL_11;
  }
  if ([v3 isEqualToString:@"_$!<Home>!$_"])
  {
    v18[0] = @"HOME";
    v18[1] = @"VOICE";
    v4 = (void *)MEMORY[0x1E4F1C978];
    v5 = (__CFString **)v18;
    goto LABEL_9;
  }
  if ([v3 isEqualToString:@"_$!<Other>!$_"])
  {
    v17[0] = @"OTHER";
    v17[1] = @"VOICE";
    v4 = (void *)MEMORY[0x1E4F1C978];
    v5 = (__CFString **)v17;
    goto LABEL_9;
  }
  if ([v3 isEqualToString:@"_$!<Mobile>!$_"])
  {
    v16[0] = @"CELL";
    v16[1] = @"VOICE";
    v4 = (void *)MEMORY[0x1E4F1C978];
    v5 = (__CFString **)v16;
    goto LABEL_9;
  }
  if ([v3 isEqualToString:@"iPhone"])
  {
    v15[0] = @"IPHONE";
    v15[1] = @"CELL";
    v15[2] = @"VOICE";
    v4 = (void *)MEMORY[0x1E4F1C978];
    v5 = (__CFString **)v15;
LABEL_18:
    uint64_t v6 = 3;
    goto LABEL_10;
  }
  if ([v3 isEqualToString:@"Apple Watch"])
  {
    v14[0] = @"APPLEWATCH";
    v14[1] = @"CELL";
    v14[2] = @"VOICE";
    v4 = (void *)MEMORY[0x1E4F1C978];
    v5 = (__CFString **)v14;
    goto LABEL_18;
  }
  if ([v3 isEqualToString:@"_$!<Main>!$_"])
  {
    v13 = @"MAIN";
    v4 = (void *)MEMORY[0x1E4F1C978];
    v5 = &v13;
LABEL_21:
    uint64_t v6 = 1;
    goto LABEL_10;
  }
  if ([v3 isEqualToString:@"_$!<WorkFAX>!$_"])
  {
    v12[0] = @"WORK";
    v12[1] = @"FAX";
    v4 = (void *)MEMORY[0x1E4F1C978];
    v5 = (__CFString **)v12;
    goto LABEL_9;
  }
  if ([v3 isEqualToString:@"_$!<HomeFAX>!$_"])
  {
    v11[0] = @"HOME";
    v11[1] = @"FAX";
    v4 = (void *)MEMORY[0x1E4F1C978];
    v5 = (__CFString **)v11;
    goto LABEL_9;
  }
  if ([v3 isEqualToString:@"_$!<OtherFAX>!$_"])
  {
    v10[0] = @"OTHER";
    v10[1] = @"FAX";
    v4 = (void *)MEMORY[0x1E4F1C978];
    v5 = (__CFString **)v10;
    goto LABEL_9;
  }
  if ([v3 isEqualToString:@"_$!<Pager>!$_"])
  {
    v9 = @"PAGER";
    v4 = (void *)MEMORY[0x1E4F1C978];
    v5 = &v9;
    goto LABEL_21;
  }
  id v7 = 0;
LABEL_11:

  return v7;
}

@end