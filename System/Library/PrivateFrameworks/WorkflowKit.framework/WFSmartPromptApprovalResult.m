@interface WFSmartPromptApprovalResult
+ (BOOL)supportsSecureCoding;
- (NSArray)allowedStates;
- (NSArray)deniedStates;
- (NSArray)restrictedStates;
- (NSArray)undefinedStates;
- (NSString)actionUUID;
- (WFContentAttributionSet)previousAttributions;
- (WFSmartPromptApprovalResult)initWithActionUUID:(id)a3;
- (WFSmartPromptApprovalResult)initWithAllowedStates:(id)a3 deniedStates:(id)a4 undefinedStates:(id)a5 restrictedStates:(id)a6 actionUUID:(id)a7 previousAttributions:(id)a8;
- (WFSmartPromptApprovalResult)initWithCoder:(id)a3;
- (id)resultByAddingDatabaseResult:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFSmartPromptApprovalResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionUUID, 0);
  objc_storeStrong((id *)&self->_previousAttributions, 0);
  objc_storeStrong((id *)&self->_restrictedStates, 0);
  objc_storeStrong((id *)&self->_undefinedStates, 0);
  objc_storeStrong((id *)&self->_deniedStates, 0);
  objc_storeStrong((id *)&self->_allowedStates, 0);
}

- (NSString)actionUUID
{
  return self->_actionUUID;
}

- (WFContentAttributionSet)previousAttributions
{
  return self->_previousAttributions;
}

- (NSArray)restrictedStates
{
  return self->_restrictedStates;
}

- (NSArray)undefinedStates
{
  return self->_undefinedStates;
}

- (NSArray)deniedStates
{
  return self->_deniedStates;
}

- (NSArray)allowedStates
{
  return self->_allowedStates;
}

- (WFSmartPromptApprovalResult)initWithCoder:(id)a3
{
  v28[2] = *MEMORY[0x1E4F143B8];
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  v28[0] = objc_opt_class();
  v28[1] = objc_opt_class();
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];
  v7 = [v4 setWithArray:v6];
  v8 = [v5 decodeObjectOfClasses:v7 forKey:@"allowedStates"];

  v9 = (void *)MEMORY[0x1E4F1CAD0];
  v27[0] = objc_opt_class();
  v27[1] = objc_opt_class();
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
  v11 = [v9 setWithArray:v10];
  v12 = [v5 decodeObjectOfClasses:v11 forKey:@"deniedStates"];

  v13 = (void *)MEMORY[0x1E4F1CAD0];
  v26[0] = objc_opt_class();
  v26[1] = objc_opt_class();
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
  v15 = [v13 setWithArray:v14];
  v16 = [v5 decodeObjectOfClasses:v15 forKey:@"undefinedStates"];

  v17 = (void *)MEMORY[0x1E4F1CAD0];
  v25[0] = objc_opt_class();
  v25[1] = objc_opt_class();
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
  v19 = [v17 setWithArray:v18];
  v20 = [v5 decodeObjectOfClasses:v19 forKey:@"restrictedStates"];

  v21 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"actionUUID"];
  v22 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"previousAttributions"];

  v23 = [(WFSmartPromptApprovalResult *)self initWithAllowedStates:v8 deniedStates:v12 undefinedStates:v16 restrictedStates:v20 actionUUID:v21 previousAttributions:v22];
  return v23;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(WFSmartPromptApprovalResult *)self allowedStates];
  [v4 encodeObject:v5 forKey:@"allowedStates"];

  v6 = [(WFSmartPromptApprovalResult *)self deniedStates];
  [v4 encodeObject:v6 forKey:@"deniedStates"];

  v7 = [(WFSmartPromptApprovalResult *)self undefinedStates];
  [v4 encodeObject:v7 forKey:@"undefinedStates"];

  v8 = [(WFSmartPromptApprovalResult *)self restrictedStates];
  [v4 encodeObject:v8 forKey:@"restrictedStates"];

  v9 = [(WFSmartPromptApprovalResult *)self actionUUID];
  [v4 encodeObject:v9 forKey:@"actionUUID"];

  id v10 = [(WFSmartPromptApprovalResult *)self previousAttributions];
  [v4 encodeObject:v10 forKey:@"previousAttributions"];
}

- (id)resultByAddingDatabaseResult:(id)a3
{
  v38[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(WFSmartPromptApprovalResult *)self previousAttributions];
  if (v5)
  {
    v6 = [v4 previousAttribution];

    if (v6)
    {
      v7 = (void *)MEMORY[0x1E4F5A828];
      v8 = [(WFSmartPromptApprovalResult *)self previousAttributions];
      v38[0] = v8;
      v9 = (void *)MEMORY[0x1E4F5A828];
      id v10 = [v4 previousAttribution];
      v37 = v10;
      uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v37 count:1];
      v12 = [v9 attributionSetWithAttributions:v11];
      v38[1] = v12;
      v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:2];
      uint64_t v14 = [v7 attributionSetByMergingAttributionSets:v13];

      id v5 = (void *)v11;
LABEL_6:

      v35 = (void *)v14;
      goto LABEL_8;
    }
  }
  v15 = [v4 previousAttribution];

  if (v15)
  {
    v16 = (void *)MEMORY[0x1E4F5A828];
    v8 = [v4 previousAttribution];
    v36 = v8;
    id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v36 count:1];
    uint64_t v14 = [v16 attributionSetWithAttributions:v10];
    goto LABEL_6;
  }
  v35 = v5;
LABEL_8:
  v17 = self;
  v34 = [(WFSmartPromptApprovalResult *)v17 allowedStates];
  v33 = [v4 allowedStates];
  v18 = [v34 arrayByAddingObjectsFromArray:v33];
  v32 = [(WFSmartPromptApprovalResult *)v17 deniedStates];
  v31 = [v4 deniedStates];
  v19 = [v32 arrayByAddingObjectsFromArray:v31];
  v20 = [(WFSmartPromptApprovalResult *)v17 undefinedStates];
  v21 = [v4 undefinedStates];
  [v20 arrayByAddingObjectsFromArray:v21];
  v22 = v4;
  v23 = v30 = v4;
  v24 = [(WFSmartPromptApprovalResult *)v17 restrictedStates];
  v25 = [v22 restrictedStates];
  v26 = [v24 arrayByAddingObjectsFromArray:v25];
  v27 = [(WFSmartPromptApprovalResult *)v17 actionUUID];
  v29 = [(WFSmartPromptApprovalResult *)v17 initWithAllowedStates:v18 deniedStates:v19 undefinedStates:v23 restrictedStates:v26 actionUUID:v27 previousAttributions:v35];

  return v29;
}

- (WFSmartPromptApprovalResult)initWithAllowedStates:(id)a3 deniedStates:(id)a4 undefinedStates:(id)a5 restrictedStates:(id)a6 actionUUID:(id)a7 previousAttributions:(id)a8
{
  id v24 = a3;
  id v23 = a4;
  id v22 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v25.receiver = self;
  v25.super_class = (Class)WFSmartPromptApprovalResult;
  v18 = [(WFSmartPromptApprovalResult *)&v25 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_allowedStates, a3);
    objc_storeStrong((id *)&v19->_deniedStates, a4);
    objc_storeStrong((id *)&v19->_undefinedStates, a5);
    objc_storeStrong((id *)&v19->_restrictedStates, a6);
    objc_storeStrong((id *)&v19->_actionUUID, a7);
    objc_storeStrong((id *)&v19->_previousAttributions, a8);
    v20 = v19;
  }

  return v19;
}

- (WFSmartPromptApprovalResult)initWithActionUUID:(id)a3
{
  return [(WFSmartPromptApprovalResult *)self initWithAllowedStates:MEMORY[0x1E4F1CBF0] deniedStates:MEMORY[0x1E4F1CBF0] undefinedStates:MEMORY[0x1E4F1CBF0] restrictedStates:MEMORY[0x1E4F1CBF0] actionUUID:a3 previousAttributions:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end