@interface WFSmartPromptDialogResponse
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
+ (id)prepareDeletionAuthorizationDatabaseDataFromConfiguration:(id)a3 resultCode:(unint64_t)a4 error:(id *)a5;
+ (id)prepareSmartPromptsDatabaseDataFromConfiguration:(id)a3 resultCode:(unint64_t)a4 error:(id *)a5;
+ (id)updatedStatusFromResultCode:(unint64_t)a3;
- (NSArray)promptedStatesData;
- (WFSmartPromptDialogResponse)initWithBSXPCCoder:(id)a3;
- (WFSmartPromptDialogResponse)initWithCoder:(id)a3;
- (WFSmartPromptDialogResponse)initWithResult:(unint64_t)a3 promptedStatesData:(id)a4;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFSmartPromptDialogResponse

- (void).cxx_destruct
{
}

- (NSArray)promptedStatesData
{
  return self->_promptedStatesData;
}

- (WFSmartPromptDialogResponse)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WFSmartPromptDialogResponse;
  v5 = [(WFRequestAuthorizationDialogResponse *)&v11 initWithBSXPCCoder:v4];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = [v4 decodeCollectionOfClass:v6 containingClass:objc_opt_class() forKey:@"promptedStatesData"];
    promptedStatesData = v5->_promptedStatesData;
    v5->_promptedStatesData = (NSArray *)v7;

    v9 = v5;
  }

  return v5;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)WFSmartPromptDialogResponse;
  id v4 = a3;
  [(WFRequestAuthorizationDialogResponse *)&v6 encodeWithBSXPCCoder:v4];
  v5 = [(WFSmartPromptDialogResponse *)self promptedStatesData];
  [v4 encodeObject:v5 forKey:@"promptedStatesData"];
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)WFSmartPromptDialogResponse;
  id v4 = a3;
  [(WFRequestAuthorizationDialogResponse *)&v6 encodeWithCoder:v4];
  v5 = [(WFSmartPromptDialogResponse *)self promptedStatesData];
  [v4 encodeObject:v5 forKey:@"promptedStatesData"];
}

- (WFSmartPromptDialogResponse)initWithCoder:(id)a3
{
  v14[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WFSmartPromptDialogResponse;
  v5 = [(WFRequestAuthorizationDialogResponse *)&v13 initWithCoder:v4];
  if (v5)
  {
    objc_super v6 = (void *)MEMORY[0x1E4F1CAD0];
    v14[0] = objc_opt_class();
    v14[1] = objc_opt_class();
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
    v8 = [v6 setWithArray:v7];
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"promptedStatesData"];
    promptedStatesData = v5->_promptedStatesData;
    v5->_promptedStatesData = (NSArray *)v9;

    objc_super v11 = v5;
  }

  return v5;
}

- (WFSmartPromptDialogResponse)initWithResult:(unint64_t)a3 promptedStatesData:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)WFSmartPromptDialogResponse;
  uint64_t v7 = [(WFRequestAuthorizationDialogResponse *)&v12 initWithResult:a3 cancelled:0];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    promptedStatesData = v7->_promptedStatesData;
    v7->_promptedStatesData = (NSArray *)v8;

    v10 = v7;
  }

  return v7;
}

+ (id)prepareDeletionAuthorizationDatabaseDataFromConfiguration:(id)a3 resultCode:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v9 = [a1 updatedStatusFromResultCode:a4];
  v10 = [v8 deletionAuthorizationState];

  objc_super v11 = objc_msgSend(v10, "stateWithStatus:count:", v9, objc_msgSend(v10, "count"));
  objc_super v12 = [v11 databaseDataWithError:a5];

  return v12;
}

+ (id)prepareSmartPromptsDatabaseDataFromConfiguration:(id)a3 resultCode:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v9 = [v8 actionUUID];
  v10 = [a1 updatedStatusFromResultCode:a4];
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__59026;
  v26 = __Block_byref_object_dispose__59027;
  id v27 = 0;
  objc_super v11 = [v8 smartPromptStates];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __97__WFSmartPromptDialogResponse_prepareSmartPromptsDatabaseDataFromConfiguration_resultCode_error___block_invoke;
  v18[3] = &unk_1E6556248;
  id v12 = v10;
  id v19 = v12;
  id v13 = v9;
  id v20 = v13;
  v21 = &v22;
  v14 = objc_msgSend(v11, "if_compactMap:", v18);

  v15 = (void *)v23[5];
  if (v15)
  {
    id v16 = 0;
    *a5 = v15;
  }
  else
  {
    id v16 = v14;
  }

  _Block_object_dispose(&v22, 8);
  return v16;
}

id __97__WFSmartPromptDialogResponse_prepareSmartPromptsDatabaseDataFromConfiguration_resultCode_error___block_invoke(void *a1, void *a2)
{
  v3 = [a2 stateWithStatus:a1[4] actionUUID:a1[5]];
  uint64_t v4 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v4 + 40);
  v5 = [v3 databaseDataWithError:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);

  return v5;
}

+ (id)updatedStatusFromResultCode:(unint64_t)a3
{
  if (a3 == 1) {
    return @"Allow";
  }
  else {
    return @"Undefined";
  }
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end