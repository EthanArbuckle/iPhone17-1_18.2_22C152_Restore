@interface CNVCardXACTIVITYALERTParser
+ (id)valueWithParser:(id)a3;
@end

@implementation CNVCardXACTIVITYALERTParser

+ (id)valueWithParser:(id)a3
{
  v3 = [a3 parseRemainingLine];
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __47__CNVCardXACTIVITYALERTParser_valueWithParser___block_invoke;
  v9[3] = &unk_1E6C2CFE0;
  id v10 = v4;
  id v5 = v4;
  +[CNVCardActivityAlertSerialization parseString:v3 intoTypeAndInfo:v9];
  if ([v5 count]) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  return v7;
}

void __47__CNVCardXACTIVITYALERTParser_valueWithParser___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A298] + 16))() & 1) == 0 && [v5 count]) {
    [*(id *)(a1 + 32) setObject:v5 forKey:v6];
  }
}

@end