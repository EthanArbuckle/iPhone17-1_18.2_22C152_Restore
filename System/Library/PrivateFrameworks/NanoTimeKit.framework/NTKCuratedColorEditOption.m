@interface NTKCuratedColorEditOption
+ (id)_orderedValuesForDevice:(id)a3;
+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)curatedColorValuesForDevice:(id)a3;
- (id)_valueToFaceBundleStringDict;
@end

@implementation NTKCuratedColorEditOption

+ (id)_orderedValuesForDevice:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  v6 = [a1 curatedColorValuesForDevice:v4];
  [v5 addObjectsFromArray:v6];

  v13.receiver = a1;
  v13.super_class = (Class)&OBJC_METACLASS___NTKCuratedColorEditOption;
  v7 = objc_msgSendSuper2(&v13, sel__orderedValuesForDevice_, v4);

  v8 = (void *)[v7 mutableCopy];
  [v5 addObjectsFromArray:v8];
  v9 = (void *)_orderedValuesForDevice____colors_0;
  _orderedValuesForDevice____colors_0 = (uint64_t)v5;
  id v10 = v5;

  id v11 = (id)_orderedValuesForDevice____colors_0;
  return v11;
}

+ (id)curatedColorValuesForDevice:(id)a3
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"color-%lu", a4, a3);
}

- (id)_valueToFaceBundleStringDict
{
  v12.receiver = self;
  v12.super_class = (Class)NTKCuratedColorEditOption;
  v3 = [(NTKFaceColorEditOption *)&v12 _valueToFaceBundleStringDict];
  id v4 = (void *)[v3 mutableCopy];

  v5 = objc_opt_class();
  v6 = [(NTKEditOption *)self device];
  v7 = [v5 _curatedColorValuesForDevice:v6];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57__NTKCuratedColorEditOption__valueToFaceBundleStringDict__block_invoke;
  v10[3] = &unk_1E62C5DD8;
  id v8 = v4;
  id v11 = v8;
  [v7 enumerateObjectsUsingBlock:v10];

  return v8;
}

void __57__NTKCuratedColorEditOption__valueToFaceBundleStringDict__block_invoke(uint64_t a1, void *a2)
{
  v3 = NSString;
  id v4 = a2;
  id v5 = [v3 stringWithFormat:@"color %@", v4];
  [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v4];
}

@end