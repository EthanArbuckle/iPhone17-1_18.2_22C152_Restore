@interface ICASImportItemData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASImportFileType)importFileType;
- (ICASImportItemData)initWithImportFileType:(id)a3 importItemCount:(id)a4;
- (NSNumber)importItemCount;
- (id)toDict;
@end

@implementation ICASImportItemData

- (ICASImportItemData)initWithImportFileType:(id)a3 importItemCount:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICASImportItemData;
  v9 = [(ICASImportItemData *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_importFileType, a3);
    objc_storeStrong((id *)&v10->_importItemCount, a4);
  }

  return v10;
}

+ (NSString)dataName
{
  return (NSString *)@"ImportItemData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v11[0] = @"importFileType";
  v3 = [(ICASImportItemData *)self importFileType];
  if (v3)
  {
    uint64_t v4 = [(ICASImportItemData *)self importFileType];
  }
  else
  {
    uint64_t v4 = objc_opt_new();
  }
  v5 = (void *)v4;
  v11[1] = @"importItemCount";
  v12[0] = v4;
  v6 = [(ICASImportItemData *)self importItemCount];
  if (v6)
  {
    uint64_t v7 = [(ICASImportItemData *)self importItemCount];
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

- (ICASImportFileType)importFileType
{
  return self->_importFileType;
}

- (NSNumber)importItemCount
{
  return self->_importItemCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_importItemCount, 0);
  objc_storeStrong((id *)&self->_importFileType, 0);
}

@end