@interface SXFloatRecordValueTransformer
- (id)transformValueForRecord:(id)a3 descriptor:(id)a4;
@end

@implementation SXFloatRecordValueTransformer

- (id)transformValueForRecord:(id)a3 descriptor:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [v5 format];
  v8 = [v6 jsonDictionary];

  v9 = [v5 key];

  v10 = [v8 objectForKey:v9];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (v7) {
      uint64_t v11 = [v7 decimals];
    }
    else {
      uint64_t v11 = 2;
    }
    id v13 = objc_alloc_init(MEMORY[0x263F08A30]);
    [v13 setMinimumFractionDigits:v11];
    [v13 setMaximumFractionDigits:v11];
    v14 = [SXFormattedText alloc];
    v15 = [v13 stringFromNumber:v10];
    v12 = [(SXFormattedText *)v14 initWithText:v15];
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

@end