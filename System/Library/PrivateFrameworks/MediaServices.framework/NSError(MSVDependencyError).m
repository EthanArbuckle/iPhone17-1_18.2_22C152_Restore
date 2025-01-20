@interface NSError(MSVDependencyError)
+ (id)MSVErrorWithMissingDependencies:()MSVDependencyError;
+ (id)MSVErrorWithMissingDependency:()MSVDependencyError;
@end

@implementation NSError(MSVDependencyError)

+ (id)MSVErrorWithMissingDependencies:()MSVDependencyError
{
  id v5 = a3;
  if (![v5 count])
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:a1 file:@"NSError+MSVAdditions.m" lineNumber:333 description:@"Array of dependencies is empty."];
  }
  v6 = (void *)MEMORY[0x1E4F28C58];
  v7 = [v5 componentsJoinedByString:@", "];
  uint64_t v8 = [v5 count];

  v9 = @"are";
  if (v8 == 1) {
    v9 = @"is";
  }
  v10 = objc_msgSend(v6, "msv_errorWithDomain:code:debugDescription:", @"MSVError", 1, @"%@ %@ required to use this functionality.", v7, v9);

  return v10;
}

+ (id)MSVErrorWithMissingDependency:()MSVDependencyError
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F28C58];
  v9 = a3;
  v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  v6 = [v4 arrayWithObjects:&v9 count:1];
  v7 = objc_msgSend(v3, "MSVErrorWithMissingDependencies:", v6, v9, v10);

  return v7;
}

@end