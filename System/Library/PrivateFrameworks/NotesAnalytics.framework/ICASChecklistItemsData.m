@interface ICASChecklistItemsData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASChecklistItemsData)initWithCountOfCheckedItems:(id)a3 countOfTotalItems:(id)a4;
- (NSNumber)countOfCheckedItems;
- (NSNumber)countOfTotalItems;
- (id)toDict;
@end

@implementation ICASChecklistItemsData

- (ICASChecklistItemsData)initWithCountOfCheckedItems:(id)a3 countOfTotalItems:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICASChecklistItemsData;
  v9 = [(ICASChecklistItemsData *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_countOfCheckedItems, a3);
    objc_storeStrong((id *)&v10->_countOfTotalItems, a4);
  }

  return v10;
}

+ (NSString)dataName
{
  return (NSString *)@"ChecklistItemsData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v11[0] = @"countOfCheckedItems";
  v3 = [(ICASChecklistItemsData *)self countOfCheckedItems];
  if (v3)
  {
    uint64_t v4 = [(ICASChecklistItemsData *)self countOfCheckedItems];
  }
  else
  {
    uint64_t v4 = objc_opt_new();
  }
  v5 = (void *)v4;
  v11[1] = @"countOfTotalItems";
  v12[0] = v4;
  v6 = [(ICASChecklistItemsData *)self countOfTotalItems];
  if (v6)
  {
    uint64_t v7 = [(ICASChecklistItemsData *)self countOfTotalItems];
  }
  else
  {
    uint64_t v7 = objc_opt_new();
  }
  id v8 = (void *)v7;
  v12[1] = v7;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];

  return v9;
}

- (NSNumber)countOfCheckedItems
{
  return self->_countOfCheckedItems;
}

- (NSNumber)countOfTotalItems
{
  return self->_countOfTotalItems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countOfTotalItems, 0);
  objc_storeStrong((id *)&self->_countOfCheckedItems, 0);
}

@end