@interface WBSContactsHelper
+ (id)CNContactKeyFromWBSABKey:(id)a3;
+ (id)WBSABKeyFromCNContactKey:(id)a3;
@end

@implementation WBSContactsHelper

+ (id)CNContactKeyFromWBSABKey:(id)a3
{
  uint64_t v3 = CNContactKeyFromWBSABKey__once;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&CNContactKeyFromWBSABKey__once, &__block_literal_global_26);
  }
  v5 = [(id)CNContactKeyFromWBSABKey__map objectForKeyedSubscript:v4];
  if ([v5 length]) {
    v6 = v5;
  }
  else {
    v6 = v4;
  }
  id v7 = v6;

  return v7;
}

void __46__WBSContactsHelper_CNContactKeyFromWBSABKey___block_invoke()
{
  v35[29] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F1AF10];
  uint64_t v1 = *MEMORY[0x1E4F98028];
  v34[0] = *MEMORY[0x1E4F98020];
  v34[1] = v1;
  uint64_t v2 = *MEMORY[0x1E4F1AD90];
  v35[0] = v0;
  v35[1] = v2;
  uint64_t v3 = *MEMORY[0x1E4F1ADC8];
  uint64_t v4 = *MEMORY[0x1E4F98050];
  v34[2] = *MEMORY[0x1E4F98030];
  v34[3] = v4;
  uint64_t v5 = *MEMORY[0x1E4F1ADF0];
  v35[2] = v3;
  v35[3] = v5;
  uint64_t v6 = *MEMORY[0x1E4F1AE60];
  v34[4] = *MEMORY[0x1E4F98038];
  v34[5] = @"JobTitle";
  uint64_t v7 = *MEMORY[0x1E4F1AE78];
  v35[4] = v6;
  v35[5] = v7;
  uint64_t v8 = *MEMORY[0x1E4F1ADE0];
  uint64_t v9 = *MEMORY[0x1E4F98060];
  v34[6] = *MEMORY[0x1E4F98058];
  v34[7] = v9;
  uint64_t v10 = *MEMORY[0x1E4F1AEA0];
  v35[6] = v8;
  v35[7] = v10;
  uint64_t v11 = *MEMORY[0x1E4F1AED8];
  uint64_t v12 = *MEMORY[0x1E4F98048];
  v34[8] = *MEMORY[0x1E4F98040];
  v34[9] = v12;
  uint64_t v13 = *MEMORY[0x1E4F1AEE0];
  v35[8] = v11;
  v35[9] = v13;
  uint64_t v14 = *MEMORY[0x1E4F1AFB0];
  v34[10] = @"URLs";
  v34[11] = @"Street";
  uint64_t v15 = *MEMORY[0x1E4F1B7C8];
  v35[10] = v14;
  v35[11] = v15;
  uint64_t v16 = *MEMORY[0x1E4F1B798];
  v34[12] = @"City";
  v34[13] = @"State";
  uint64_t v17 = *MEMORY[0x1E4F1B7C0];
  v35[12] = v16;
  v35[13] = v17;
  uint64_t v18 = *MEMORY[0x1E4F1B7A0];
  v34[14] = @"Country";
  v34[15] = @"ZIP";
  uint64_t v19 = *MEMORY[0x1E4F1B7B0];
  v35[14] = v18;
  v35[15] = v19;
  uint64_t v20 = *MEMORY[0x1E4F1B000];
  v34[16] = @"InstantMessageUsername";
  v34[17] = @"InstantMessageService";
  uint64_t v21 = *MEMORY[0x1E4F1AFF8];
  v35[16] = v20;
  v35[17] = v21;
  uint64_t v22 = *MEMORY[0x1E4F1B6F8];
  v34[18] = @"_$!<Home>!$_";
  v34[19] = @"_$!<HomePage>!$_";
  uint64_t v23 = *MEMORY[0x1E4F1B768];
  v35[18] = v22;
  v35[19] = v23;
  uint64_t v24 = *MEMORY[0x1E4F1B770];
  v34[20] = @"_$!<Work>!$_";
  v34[21] = @"_$!<Other>!$_";
  uint64_t v25 = *MEMORY[0x1E4F1B700];
  v35[20] = v24;
  v35[21] = v25;
  uint64_t v26 = *MEMORY[0x1E4F1B728];
  v34[22] = @"_$!<Mobile>!$_";
  v34[23] = @"iPhone";
  uint64_t v27 = *MEMORY[0x1E4F1B758];
  v35[22] = v26;
  v35[23] = v27;
  uint64_t v28 = *MEMORY[0x1E4F1B720];
  v34[24] = @"_$!<Main>!$_";
  v34[25] = @"_$!<HomeFAX>!$_";
  uint64_t v29 = *MEMORY[0x1E4F1B710];
  v35[24] = v28;
  v35[25] = v29;
  uint64_t v30 = *MEMORY[0x1E4F1B750];
  v34[26] = @"_$!<WorkFAX>!$_";
  v34[27] = @"_$!<OtherFAX>!$_";
  uint64_t v31 = *MEMORY[0x1E4F1B730];
  v35[26] = v30;
  v35[27] = v31;
  v34[28] = @"_$!<Pager>!$_";
  v35[28] = *MEMORY[0x1E4F1B738];
  uint64_t v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:29];
  v33 = (void *)CNContactKeyFromWBSABKey__map;
  CNContactKeyFromWBSABKey__map = v32;
}

+ (id)WBSABKeyFromCNContactKey:(id)a3
{
  uint64_t v3 = WBSABKeyFromCNContactKey__once;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&WBSABKeyFromCNContactKey__once, &__block_literal_global_2);
  }
  uint64_t v5 = [(id)WBSABKeyFromCNContactKey__map objectForKeyedSubscript:v4];
  if ([v5 length]) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = v4;
  }
  id v7 = v6;

  return v7;
}

void __46__WBSContactsHelper_WBSABKeyFromCNContactKey___block_invoke()
{
  v26[29] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F98020];
  uint64_t v1 = *MEMORY[0x1E4F1AD90];
  v25[0] = *MEMORY[0x1E4F1AF10];
  v25[1] = v1;
  uint64_t v2 = *MEMORY[0x1E4F98028];
  v26[0] = v0;
  v26[1] = v2;
  uint64_t v3 = *MEMORY[0x1E4F98030];
  uint64_t v4 = *MEMORY[0x1E4F1ADF0];
  v25[2] = *MEMORY[0x1E4F1ADC8];
  v25[3] = v4;
  uint64_t v5 = *MEMORY[0x1E4F98050];
  v26[2] = v3;
  v26[3] = v5;
  uint64_t v6 = *MEMORY[0x1E4F98038];
  uint64_t v7 = *MEMORY[0x1E4F1AE78];
  v25[4] = *MEMORY[0x1E4F1AE60];
  v25[5] = v7;
  v26[4] = v6;
  v26[5] = @"JobTitle";
  uint64_t v8 = *MEMORY[0x1E4F98058];
  uint64_t v9 = *MEMORY[0x1E4F1AEA0];
  v25[6] = *MEMORY[0x1E4F1ADE0];
  v25[7] = v9;
  uint64_t v10 = *MEMORY[0x1E4F98060];
  v26[6] = v8;
  v26[7] = v10;
  uint64_t v11 = *MEMORY[0x1E4F98040];
  uint64_t v12 = *MEMORY[0x1E4F1AEE0];
  v25[8] = *MEMORY[0x1E4F1AED8];
  v25[9] = v12;
  uint64_t v13 = *MEMORY[0x1E4F98048];
  v26[8] = v11;
  v26[9] = v13;
  uint64_t v14 = *MEMORY[0x1E4F1B7C8];
  v25[10] = *MEMORY[0x1E4F1AFB0];
  v25[11] = v14;
  v26[10] = @"URLs";
  v26[11] = @"Street";
  uint64_t v15 = *MEMORY[0x1E4F1B7C0];
  v25[12] = *MEMORY[0x1E4F1B798];
  v25[13] = v15;
  v26[12] = @"City";
  v26[13] = @"State";
  uint64_t v16 = *MEMORY[0x1E4F1B7B0];
  v25[14] = *MEMORY[0x1E4F1B7A0];
  v25[15] = v16;
  v26[14] = @"Country";
  v26[15] = @"ZIP";
  uint64_t v17 = *MEMORY[0x1E4F1AFF8];
  v25[16] = *MEMORY[0x1E4F1B000];
  v25[17] = v17;
  v26[16] = @"InstantMessageUsername";
  v26[17] = @"InstantMessageService";
  uint64_t v18 = *MEMORY[0x1E4F1B768];
  v25[18] = *MEMORY[0x1E4F1B6F8];
  v25[19] = v18;
  v26[18] = @"_$!<Home>!$_";
  v26[19] = @"_$!<HomePage>!$_";
  uint64_t v19 = *MEMORY[0x1E4F1B700];
  v25[20] = *MEMORY[0x1E4F1B770];
  v25[21] = v19;
  v26[20] = @"_$!<Work>!$_";
  v26[21] = @"_$!<Other>!$_";
  uint64_t v20 = *MEMORY[0x1E4F1B758];
  v25[22] = *MEMORY[0x1E4F1B728];
  v25[23] = v20;
  v26[22] = @"_$!<Mobile>!$_";
  v26[23] = @"iPhone";
  uint64_t v21 = *MEMORY[0x1E4F1B710];
  v25[24] = *MEMORY[0x1E4F1B720];
  v25[25] = v21;
  v26[24] = @"_$!<Main>!$_";
  v26[25] = @"_$!<HomeFAX>!$_";
  uint64_t v22 = *MEMORY[0x1E4F1B730];
  v25[26] = *MEMORY[0x1E4F1B750];
  v25[27] = v22;
  v26[26] = @"_$!<WorkFAX>!$_";
  v26[27] = @"_$!<OtherFAX>!$_";
  v25[28] = *MEMORY[0x1E4F1B738];
  v26[28] = @"_$!<Pager>!$_";
  uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:29];
  uint64_t v24 = (void *)WBSABKeyFromCNContactKey__map;
  WBSABKeyFromCNContactKey__map = v23;
}

@end