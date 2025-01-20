@interface SXStringRecordValueTransformer
- (id)transformValueForRecord:(id)a3 descriptor:(id)a4;
@end

@implementation SXStringRecordValueTransformer

- (id)transformValueForRecord:(id)a3 descriptor:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 jsonDictionary];
  v8 = [v6 key];
  uint64_t v9 = [v7 objectForKey:v8];
  v10 = (void *)v9;
  v11 = &stru_26D5311C0;
  if (v9) {
    v11 = (__CFString *)v9;
  }
  v12 = v11;

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v13 = [SXFormattedText alloc];
    v14 = [v5 specificationVersion];
    uint64_t v15 = [(SXJSONObject *)v13 initWithJSONObject:v12 andVersion:v14];
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    v17 = [SXFormattedText alloc];
    v18 = v17;
    if (isKindOfClass)
    {
      v19 = [(SXFormattedText *)v17 initWithText:v12];
      goto LABEL_9;
    }
    v14 = [NSString stringWithFormat:@"%@", v12];
    uint64_t v15 = [(SXFormattedText *)v18 initWithText:v14];
  }
  v19 = (SXFormattedText *)v15;

LABEL_9:
  -[SXFormattedText setShouldWrapText:](v19, "setShouldWrapText:", [v6 dataType] == 2);

  return v19;
}

@end