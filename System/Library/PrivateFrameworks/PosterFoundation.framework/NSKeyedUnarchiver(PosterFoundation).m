@interface NSKeyedUnarchiver(PosterFoundation)
+ (id)pf_unarchivedObjectOfClass:()PosterFoundation fromData:classReplacementMap:error:;
+ (id)pf_unarchivedObjectOfClasses:()PosterFoundation fromData:classReplacementMap:error:;
@end

@implementation NSKeyedUnarchiver(PosterFoundation)

+ (id)pf_unarchivedObjectOfClass:()PosterFoundation fromData:classReplacementMap:error:
{
  v10 = (void *)MEMORY[0x263EFFA08];
  id v11 = a5;
  id v12 = a4;
  v13 = [v10 setWithObject:a3];
  v14 = objc_msgSend(a1, "pf_unarchivedObjectOfClasses:fromData:classReplacementMap:error:", v13, v12, v11, a6);

  return v14;
}

+ (id)pf_unarchivedObjectOfClasses:()PosterFoundation fromData:classReplacementMap:error:
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = (void *)[[a1 alloc] initForReadingFromData:v11 error:a6];
  [v13 setRequiresSecureCoding:1];
  [v13 setDecodingFailurePolicy:1];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __103__NSKeyedUnarchiver_PosterFoundation__pf_unarchivedObjectOfClasses_fromData_classReplacementMap_error___block_invoke;
  v17[3] = &unk_26546ED00;
  id v14 = v13;
  id v18 = v14;
  [v12 enumerateKeysAndObjectsUsingBlock:v17];
  v15 = [v14 decodeTopLevelObjectOfClasses:v10 forKey:*MEMORY[0x263F081D0] error:a6];

  return v15;
}

@end