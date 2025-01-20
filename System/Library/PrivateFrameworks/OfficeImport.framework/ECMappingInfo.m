@interface ECMappingInfo
+ (id)mappingInfoWithSheetName:(id)a3;
- (ECMappingInfo)initWithSheetName:(id)a3;
- (NSString)sheetName;
- (int)columnOffset;
- (int)rowOffset;
@end

@implementation ECMappingInfo

- (ECMappingInfo)initWithSheetName:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ECMappingInfo;
  v6 = [(ECMappingInfo *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->mSheetName, a3);
  }

  return v7;
}

+ (id)mappingInfoWithSheetName:(id)a3
{
  id v3 = a3;
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithSheetName:v3];

  return v4;
}

- (int)rowOffset
{
  return 0;
}

- (int)columnOffset
{
  return 0;
}

- (NSString)sheetName
{
  return self->mSheetName;
}

- (void).cxx_destruct
{
}

@end