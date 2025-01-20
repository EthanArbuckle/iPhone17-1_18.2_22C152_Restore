@interface DDScannerResult(CRCodable)
+ (id)ddScannerResultWithCRCodableDataRepresentation:()CRCodable;
- (id)crCodableDataRepresentation;
@end

@implementation DDScannerResult(CRCodable)

- (id)crCodableDataRepresentation
{
  uint64_t v3 = 0;
  v1 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a1 requiringSecureCoding:1 error:&v3];
  return v1;
}

+ (id)ddScannerResultWithCRCodableDataRepresentation:()CRCodable
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1E4F28DC0];
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  v10[0] = objc_opt_class();
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  v7 = [v4 setWithArray:v6];
  v8 = [v3 unarchivedObjectOfClasses:v7 fromData:v5 error:0];

  return v8;
}

@end