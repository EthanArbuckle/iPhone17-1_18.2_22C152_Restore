@interface NSKeyedUnarchiver(FRAdditions)
+ (id)nf_securelyUnarchiveObjectOfClass:()FRAdditions withData:;
+ (id)nf_securelyUnarchiveObjectOfClass:()FRAdditions withFile:;
+ (id)nf_securelyUnarchiveObjectOfClasses:()FRAdditions withData:;
+ (id)nf_securelyUnarchiveObjectOfClasses:()FRAdditions withFile:;
- (uint64_t)nf_securelyUnarchiveObjectOfClass:()FRAdditions;
@end

@implementation NSKeyedUnarchiver(FRAdditions)

+ (id)nf_securelyUnarchiveObjectOfClass:()FRAdditions withData:
{
  v5 = (objc_class *)MEMORY[0x263F08928];
  id v6 = a4;
  v7 = (void *)[[v5 alloc] initForReadingFromData:v6 error:0];

  v8 = objc_msgSend(v7, "nf_securelyUnarchiveObjectOfClass:", a3);

  return v8;
}

+ (id)nf_securelyUnarchiveObjectOfClass:()FRAdditions withFile:
{
  v5 = (void *)MEMORY[0x263F08928];
  id v6 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:a4];
  v7 = objc_msgSend(v5, "nf_securelyUnarchiveObjectOfClass:withData:", a3, v6);

  return v7;
}

- (uint64_t)nf_securelyUnarchiveObjectOfClass:()FRAdditions
{
  return [a1 decodeObjectOfClass:a3 forKey:*MEMORY[0x263F081D0]];
}

+ (id)nf_securelyUnarchiveObjectOfClasses:()FRAdditions withData:
{
  v5 = (objc_class *)MEMORY[0x263F08928];
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[[v5 alloc] initForReadingFromData:v6 error:0];

  v9 = [v8 decodeObjectOfClasses:v7 forKey:*MEMORY[0x263F081D0]];

  return v9;
}

+ (id)nf_securelyUnarchiveObjectOfClasses:()FRAdditions withFile:
{
  v5 = (void *)MEMORY[0x263F08928];
  id v6 = (void *)MEMORY[0x263EFF8F8];
  id v7 = a3;
  v8 = [v6 dataWithContentsOfFile:a4];
  v9 = objc_msgSend(v5, "nf_securelyUnarchiveObjectOfClasses:withData:", v7, v8);

  return v9;
}

@end