@interface CNVCardNameSerialization
+ (id)compositeNameForCompanyWithComponents:(id)a3;
+ (id)compositeNameForPersonWithComponents:(id)a3;
+ (id)compositeNameWithComponents:(id)a3;
@end

@implementation CNVCardNameSerialization

+ (id)compositeNameWithComponents:(id)a3
{
  id v4 = a3;
  if ([v4 isCompany]) {
    [a1 compositeNameForCompanyWithComponents:v4];
  }
  else {
  v5 = [a1 compositeNameForPersonWithComponents:v4];
  }

  return v5;
}

+ (id)compositeNameForPersonWithComponents:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v5 = *MEMORY[0x1E4F5A298];
  v6 = [v3 title];
  char v7 = (*(uint64_t (**)(uint64_t, void *))(v5 + 16))(v5, v6);

  if ((v7 & 1) == 0)
  {
    v8 = [v3 title];
    [v4 addObject:v8];
  }
  v9 = [v3 firstName];
  char v10 = (*(uint64_t (**)(uint64_t, void *))(v5 + 16))(v5, v9);

  if ((v10 & 1) == 0)
  {
    v11 = [v3 firstName];
    [v4 addObject:v11];
  }
  v12 = [v3 middleName];
  char v13 = (*(uint64_t (**)(uint64_t, void *))(v5 + 16))(v5, v12);

  if ((v13 & 1) == 0)
  {
    v14 = [v3 middleName];
    [v4 addObject:v14];
  }
  v15 = [v3 lastName];
  char v16 = (*(uint64_t (**)(uint64_t, void *))(v5 + 16))(v5, v15);

  if ((v16 & 1) == 0)
  {
    v17 = [v3 lastName];
    [v4 addObject:v17];
  }
  v18 = [v3 suffix];
  char v19 = (*(uint64_t (**)(uint64_t, void *))(v5 + 16))(v5, v18);

  if ((v19 & 1) == 0)
  {
    v20 = [v3 suffix];
    [v4 addObject:v20];
  }
  v21 = [v4 componentsJoinedByString:@" "];

  return v21;
}

+ (id)compositeNameForCompanyWithComponents:(id)a3
{
  return (id)[a3 companyName];
}

@end