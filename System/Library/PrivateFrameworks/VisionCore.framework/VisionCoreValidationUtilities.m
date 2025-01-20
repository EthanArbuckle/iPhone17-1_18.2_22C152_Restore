@interface VisionCoreValidationUtilities
+ (BOOL)validateObject:(id)a3 isKindOfClass:(Class)a4 basedOnClass:(Class)a5 error:(id *)a6;
@end

@implementation VisionCoreValidationUtilities

+ (BOOL)validateObject:(id)a3 isKindOfClass:(Class)a4 basedOnClass:(Class)a5 error:(id *)a6
{
  id v9 = a3;
  if (!v9)
  {
    if (a6)
    {
      [MEMORY[0x263F087E8] VisionCoreErrorForInvalidArgumentWithLocalizedDescription:@"object is nil"];
      BOOL v10 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
LABEL_12:
    BOOL v10 = 0;
    goto LABEL_13;
  }
  if (a5 && ([(objc_class *)a4 isSubclassOfClass:a5] & 1) == 0)
  {
    if (a6)
    {
      id v16 = [NSString alloc];
      v17 = NSStringFromClass(a4);
      v18 = NSStringFromClass(a5);
      v19 = (void *)[v16 initWithFormat:@"%@ is not a %@", v17, v18];

      *a6 = [MEMORY[0x263F087E8] VisionCoreErrorForInvalidArgumentWithLocalizedDescription:v19];
    }
    goto LABEL_12;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a6)
    {
      id v11 = [NSString alloc];
      v12 = (objc_class *)objc_opt_class();
      v13 = NSStringFromClass(v12);
      v14 = NSStringFromClass(a4);
      v15 = (void *)[v11 initWithFormat:@"%@ is not a %@", v13, v14];

      *a6 = [MEMORY[0x263F087E8] VisionCoreErrorForUnavailableResourceWithLocalizedDescription:v15];
    }
    goto LABEL_12;
  }
  BOOL v10 = 1;
LABEL_13:

  return v10;
}

@end