@interface NSError(PHAErrorExtensions)
+ (id)pl_analysisErrorForInvalidParameterValue:()PHAErrorExtensions named:;
+ (id)pl_analysisErrorWithCode:()PHAErrorExtensions;
+ (id)pl_analysisErrorWithCode:()PHAErrorExtensions localizedDescription:userInfo:;
+ (id)pl_analysisErrorWithCode:()PHAErrorExtensions userInfo:;
+ (uint64_t)pl_analysisErrorWithCode:()PHAErrorExtensions localizedDescription:;
@end

@implementation NSError(PHAErrorExtensions)

+ (id)pl_analysisErrorForInvalidParameterValue:()PHAErrorExtensions named:
{
  v5 = [NSString stringWithFormat:@"The '%@' parameter has an invalid value %@", a4, a3];
  v6 = objc_msgSend(a1, "pl_analysisErrorWithCode:localizedDescription:", 2, v5);

  return v6;
}

+ (id)pl_analysisErrorWithCode:()PHAErrorExtensions localizedDescription:userInfo:
{
  id v8 = a4;
  id v9 = a5;
  if ([v8 length])
  {
    if (v9) {
      id v10 = (id)[v9 mutableCopy];
    }
    else {
      id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    id v11 = v10;
    [v10 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F28568]];

    id v9 = v11;
  }
  v12 = [a1 errorWithDomain:@"com.apple.photoanalysis" code:a3 userInfo:v9];

  return v12;
}

+ (uint64_t)pl_analysisErrorWithCode:()PHAErrorExtensions localizedDescription:
{
  return objc_msgSend(a1, "pl_analysisErrorWithCode:localizedDescription:userInfo:", a3, a4, 0);
}

+ (id)pl_analysisErrorWithCode:()PHAErrorExtensions userInfo:
{
  id v6 = a4;
  v7 = PHAErrorDescriptionForCode(a3);
  id v8 = objc_msgSend(a1, "pl_analysisErrorWithCode:localizedDescription:userInfo:", a3, v7, v6);

  return v8;
}

+ (id)pl_analysisErrorWithCode:()PHAErrorExtensions
{
  v5 = PHAErrorDescriptionForCode(a3);
  id v6 = objc_msgSend(a1, "pl_analysisErrorWithCode:localizedDescription:userInfo:", a3, v5, 0);

  return v6;
}

@end