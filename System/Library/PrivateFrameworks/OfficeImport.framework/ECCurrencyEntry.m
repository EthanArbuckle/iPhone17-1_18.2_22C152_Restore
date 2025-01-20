@interface ECCurrencyEntry
+ (id)currencyWithLassoCode:(id)a3 langId:(int)a4 xlSymbol:(id)a5;
+ (id)currencyWithLassoCode:(id)a3 langId:(int)a4 xlSymbol:(id)a5 accountingFormat:(int)a6;
+ (id)currencyWithLassoCode:(id)a3 langId:(int)a4 xlSymbol:(id)a5 isExport:(BOOL)a6;
+ (id)currencyWithLassoCode:(id)a3 langId:(int)a4 xlSymbol:(id)a5 isExport:(BOOL)a6 accountingFormat:(int)a7;
- (ECCurrencyEntry)initWithLassoCode:(id)a3 langId:(int)a4 xlSymbol:(id)a5 isExport:(BOOL)a6 accountingFormat:(int)a7;
@end

@implementation ECCurrencyEntry

- (ECCurrencyEntry)initWithLassoCode:(id)a3 langId:(int)a4 xlSymbol:(id)a5 isExport:(BOOL)a6 accountingFormat:(int)a7
{
  uint64_t v10 = *(void *)&a4;
  id v13 = a3;
  id v14 = a5;
  v20.receiver = self;
  v20.super_class = (Class)ECCurrencyEntry;
  v15 = [(ECCurrencyEntry *)&v20 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->mLassoCurrencyCode, a3);
    uint64_t v17 = objc_msgSend([NSString alloc], "initWithFormat:", @"%X", v10);
    mXlLangId = v16->mXlLangId;
    v16->mXlLangId = (NSString *)v17;

    objc_storeStrong((id *)&v16->mXlCurrencySymbol, a5);
    v16->mAppliesToExport = a6;
    v16->mXlAccountingFormat = a7;
  }

  return v16;
}

+ (id)currencyWithLassoCode:(id)a3 langId:(int)a4 xlSymbol:(id)a5
{
  v5 = [a1 currencyWithLassoCode:a3 langId:*(void *)&a4 xlSymbol:a5 isExport:1 accountingFormat:0];
  return v5;
}

+ (id)currencyWithLassoCode:(id)a3 langId:(int)a4 xlSymbol:(id)a5 accountingFormat:(int)a6
{
  v6 = [a1 currencyWithLassoCode:a3 langId:*(void *)&a4 xlSymbol:a5 isExport:1 accountingFormat:*(void *)&a6];
  return v6;
}

+ (id)currencyWithLassoCode:(id)a3 langId:(int)a4 xlSymbol:(id)a5 isExport:(BOOL)a6
{
  v6 = [a1 currencyWithLassoCode:a3 langId:*(void *)&a4 xlSymbol:a5 isExport:a6 accountingFormat:0];
  return v6;
}

+ (id)currencyWithLassoCode:(id)a3 langId:(int)a4 xlSymbol:(id)a5 isExport:(BOOL)a6 accountingFormat:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  BOOL v8 = a6;
  uint64_t v10 = *(void *)&a4;
  id v11 = a3;
  id v12 = a5;
  id v13 = (void *)[objc_alloc((Class)objc_opt_class()) initWithLassoCode:v11 langId:v10 xlSymbol:v12 isExport:v8 accountingFormat:v7];

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mXlCurrencySymbol, 0);
  objc_storeStrong((id *)&self->mXlLangId, 0);
  objc_storeStrong((id *)&self->mLassoCurrencyCode, 0);
}

@end