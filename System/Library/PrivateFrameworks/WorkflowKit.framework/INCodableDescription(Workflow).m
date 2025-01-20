@interface INCodableDescription(Workflow)
- (Class)wf_contentItemClassForCustomObjectWithNamespace:()Workflow;
@end

@implementation INCodableDescription(Workflow)

- (Class)wf_contentItemClassForCustomObjectWithNamespace:()Workflow
{
  id v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  v6 = NSString;
  v7 = NSStringFromClass(v5);
  v8 = [a1 typeName];
  v9 = [v6 stringWithFormat:@"%@_%@_%@", v7, v4, v8];

  Class v10 = NSClassFromString(v9);
  if (v10)
  {
    v11 = v10;
LABEL_3:
    Class v12 = v11;
    goto LABEL_6;
  }
  os_unfair_lock_lock((os_unfair_lock_t)&classRegistrationLock);
  v13 = v9;
  Class ClassPair = objc_allocateClassPair(v5, [(NSString *)v13 cStringUsingEncoding:4], 0);
  if (!ClassPair)
  {
    os_unfair_lock_unlock((os_unfair_lock_t)&classRegistrationLock);
    NSClassFromString(v13);
    v11 = (objc_class *)objc_claimAutoreleasedReturnValue();
    goto LABEL_3;
  }
  Class v15 = ClassPair;
  id v16 = a1;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __82__INCodableDescription_Workflow__wf_contentItemClassForCustomObjectWithNamespace___block_invoke;
  aBlock[3] = &unk_1E654C5E8;
  id v26 = v16;
  id v17 = v16;
  v18 = _Block_copy(aBlock);
  v19 = imp_implementationWithBlock(v18);

  ClassMethod = class_getClassMethod(v5, sel_codableDescription);
  TypeEncoding = method_getTypeEncoding(ClassMethod);
  Class = object_getClass(v15);
  class_addMethod(Class, sel_codableDescription, v19, TypeEncoding);
  objc_registerClassPair(v15);
  os_unfair_lock_unlock((os_unfair_lock_t)&classRegistrationLock);
  id v23 = (id)[(objc_class *)v15 properties];
  Class v12 = v15;

LABEL_6:
  return v12;
}

@end