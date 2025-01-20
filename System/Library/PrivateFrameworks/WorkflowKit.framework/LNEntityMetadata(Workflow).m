@interface LNEntityMetadata(Workflow)
- (objc_class)wf_contentItemClassWithQueryMetadata:()Workflow appBundleIdentifier:displayedAppBundleIdentifier:;
@end

@implementation LNEntityMetadata(Workflow)

- (objc_class)wf_contentItemClassWithQueryMetadata:()Workflow appBundleIdentifier:displayedAppBundleIdentifier:
{
  v47[3] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v10)
  {
    v34 = [MEMORY[0x1E4F28B00] currentHandler];
    [v34 handleFailureInMethod:a2, a1, @"LNEntityMetadata+Workflow.m", 29, @"Invalid parameter not satisfying: %@", @"appBundleIdentifier" object file lineNumber description];
  }
  v12 = (objc_class *)objc_opt_class();
  v13 = NSStringFromClass(v12);
  v47[0] = v13;
  v47[1] = v10;
  v14 = [a1 identifier];
  v47[2] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:3];

  v16 = [v15 componentsJoinedByString:@"_"];
  Class v17 = NSClassFromString(v16);
  if (v17)
  {
    v18 = v17;
LABEL_5:
    v19 = v18;
    goto LABEL_8;
  }
  os_unfair_lock_lock((os_unfair_lock_t)&classRegistrationLock_50600);
  v20 = v16;
  Class ClassPair = objc_allocateClassPair(v12, [(NSString *)v20 cStringUsingEncoding:4], 0);
  if (!ClassPair)
  {
    os_unfair_lock_unlock((os_unfair_lock_t)&classRegistrationLock_50600);
    NSClassFromString(v20);
    v18 = (objc_class *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  v22 = ClassPair;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __116__LNEntityMetadata_Workflow__wf_contentItemClassWithQueryMetadata_appBundleIdentifier_displayedAppBundleIdentifier___block_invoke;
  aBlock[3] = &__block_descriptor_40_e14_B32__0_8_16_24lu32l8;
  aBlock[4] = v12;
  v36 = v9;
  v23 = (void (**)(void *, objc_class *, char *, void *))_Block_copy(aBlock);
  id v24 = a1;
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __116__LNEntityMetadata_Workflow__wf_contentItemClassWithQueryMetadata_appBundleIdentifier_displayedAppBundleIdentifier___block_invoke_2;
  v44[3] = &unk_1E6554D98;
  id v45 = v24;
  id v35 = v24;
  v25 = _Block_copy(v44);
  v23[2](v23, v22, sel_entityMetadata, v25);

  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __116__LNEntityMetadata_Workflow__wf_contentItemClassWithQueryMetadata_appBundleIdentifier_displayedAppBundleIdentifier___block_invoke_3;
  v42[3] = &unk_1E6554DC0;
  id v43 = v36;
  v26 = _Block_copy(v42);
  v23[2](v23, v22, sel_queryMetadata, v26);

  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __116__LNEntityMetadata_Workflow__wf_contentItemClassWithQueryMetadata_appBundleIdentifier_displayedAppBundleIdentifier___block_invoke_4;
  v40[3] = &unk_1E6554DE8;
  id v27 = v10;
  id v41 = v27;
  v28 = _Block_copy(v40);
  v23[2](v23, v22, sel_appBundleIdentifier, v28);

  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __116__LNEntityMetadata_Workflow__wf_contentItemClassWithQueryMetadata_appBundleIdentifier_displayedAppBundleIdentifier___block_invoke_5;
  v37[3] = &unk_1E6554E10;
  id v38 = v11;
  id v29 = v27;
  id v39 = v29;
  v30 = _Block_copy(v37);
  v23[2](v23, v22, sel_displayedAppBundleIdentifier, v30);

  v31 = (void *)MEMORY[0x1E4F72C48];
  v32 = [v35 identifier];
  objc_msgSend(v31, "wf_addDescriptionMethodsToClass:withEntityType:appBundleIdentifier:", v22, v32, v29);

  objc_registerClassPair(v22);
  os_unfair_lock_unlock((os_unfair_lock_t)&classRegistrationLock_50600);
  v19 = v22;

  id v9 = v36;
LABEL_8:

  return v19;
}

@end