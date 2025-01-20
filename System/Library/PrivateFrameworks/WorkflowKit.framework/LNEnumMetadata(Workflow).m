@interface LNEnumMetadata(Workflow)
- (id)wf_contentItemClassWithAppBundleIdentifier:()Workflow;
- (id)wf_contentItemWithAppBundleIdentifier:()Workflow enumCaseIdentifier:;
- (objc_class)wf_contentItemClassWithAppBundleIdentifier:()Workflow superclass:;
@end

@implementation LNEnumMetadata(Workflow)

- (objc_class)wf_contentItemClassWithAppBundleIdentifier:()Workflow superclass:
{
  v34[3] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = NSStringFromClass(a4);
  v34[0] = v7;
  v34[1] = v6;
  v8 = [a1 identifier];
  v34[2] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:3];

  v10 = [v9 componentsJoinedByString:@"_"];
  Class v11 = NSClassFromString(v10);
  if (v11)
  {
    v12 = v11;
LABEL_3:
    v13 = v12;
    goto LABEL_6;
  }
  os_unfair_lock_lock((os_unfair_lock_t)&classRegistrationLock_70501);
  v14 = v10;
  Class ClassPair = objc_allocateClassPair(a4, [(NSString *)v14 cStringUsingEncoding:4], 0);
  if (!ClassPair)
  {
    os_unfair_lock_unlock((os_unfair_lock_t)&classRegistrationLock_70501);
    NSClassFromString(v14);
    v12 = (objc_class *)objc_claimAutoreleasedReturnValue();
    goto LABEL_3;
  }
  v16 = ClassPair;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __82__LNEnumMetadata_Workflow__wf_contentItemClassWithAppBundleIdentifier_superclass___block_invoke;
  aBlock[3] = &__block_descriptor_40_e14_B32__0_8_16_24lu32l8;
  aBlock[4] = a4;
  v17 = (void (**)(void *, objc_class *, char *, void *))_Block_copy(aBlock);
  id v18 = a1;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __82__LNEnumMetadata_Workflow__wf_contentItemClassWithAppBundleIdentifier_superclass___block_invoke_2;
  v31[3] = &unk_1E6558828;
  id v32 = v18;
  id v19 = v18;
  v20 = _Block_copy(v31);
  v17[2](v17, v16, sel_enumMetadata, v20);

  uint64_t v26 = MEMORY[0x1E4F143A8];
  uint64_t v27 = 3221225472;
  v28 = __82__LNEnumMetadata_Workflow__wf_contentItemClassWithAppBundleIdentifier_superclass___block_invoke_3;
  v29 = &unk_1E6558850;
  id v21 = v6;
  id v30 = v21;
  v22 = _Block_copy(&v26);
  v17[2](v17, v16, sel_appBundleIdentifier, v22);

  v23 = (void *)MEMORY[0x1E4F72C48];
  v24 = objc_msgSend(v19, "identifier", v26, v27, v28, v29);
  objc_msgSend(v23, "wf_addDescriptionMethodsToClass:withEntityType:appBundleIdentifier:", v16, v24, v21);

  objc_registerClassPair(v16);
  os_unfair_lock_unlock((os_unfair_lock_t)&classRegistrationLock_70501);
  v13 = v16;

LABEL_6:
  return v13;
}

- (id)wf_contentItemClassWithAppBundleIdentifier:()Workflow
{
  id v5 = a3;
  if (!v5)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, a1, @"LNEnumMetadata+Workflow.m", 26, @"Invalid parameter not satisfying: %@", @"appBundleIdentifier" object file lineNumber description];
  }
  id v6 = objc_msgSend(a1, "wf_contentItemClassWithAppBundleIdentifier:superclass:", v5, objc_opt_class());

  return v6;
}

- (id)wf_contentItemWithAppBundleIdentifier:()Workflow enumCaseIdentifier:
{
  id v6 = a4;
  v7 = objc_msgSend(a1, "wf_contentItemClassWithAppBundleIdentifier:", a3);
  v8 = [[WFLinkEnumerationCase alloc] initWithIdentifier:v6];

  v9 = [v7 itemWithObject:v8];

  return v9;
}

@end