@interface WFAskParameterDialogRequest(Parameter)
+ (uint64_t)dialogComponentStyleForParameter:()Parameter;
@end

@implementation WFAskParameterDialogRequest(Parameter)

+ (uint64_t)dialogComponentStyleForParameter:()Parameter
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v5, v6, v7, objc_opt_class(), 0);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    while (2)
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        if ([(id)objc_opt_class() isSubclassOfClass:*(void *)(*((void *)&v15 + 1) + 8 * v12)])
        {

          uint64_t v13 = 1;
          goto LABEL_13;
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v13 = [v3 liveUpdatesPossibleStatesInEditor];
  }
  else {
    uint64_t v13 = 0;
  }
LABEL_13:

  return v13;
}

@end