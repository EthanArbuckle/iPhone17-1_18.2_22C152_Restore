@interface PULegacyViewControllerSpec
+ (id)padSpec;
+ (id)phoneSpec;
+ (id)specForIdiom:(int64_t)a3;
+ (id)visionOSSpec;
@end

@implementation PULegacyViewControllerSpec

+ (id)visionOSSpec
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, a1, @"PULegacyViewControllerSpec.m", 51, @"Method %s is a responsibility of subclass %@", "+[PULegacyViewControllerSpec visionOSSpec]", v6 object file lineNumber description];

  abort();
}

+ (id)padSpec
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, a1, @"PULegacyViewControllerSpec.m", 46, @"Method %s is a responsibility of subclass %@", "+[PULegacyViewControllerSpec padSpec]", v6 object file lineNumber description];

  abort();
}

+ (id)phoneSpec
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, a1, @"PULegacyViewControllerSpec.m", 41, @"Method %s is a responsibility of subclass %@", "+[PULegacyViewControllerSpec phoneSpec]", v6 object file lineNumber description];

  abort();
}

+ (id)specForIdiom:(int64_t)a3
{
  switch(a3)
  {
    case 0:
    case 1:
    case 3:
      v5 = objc_msgSend(a1, "phoneSpec", v3);
      goto LABEL_8;
    case 2:
    case 4:
      v5 = objc_msgSend(a1, "padSpec", v3);
      goto LABEL_8;
    case 5:
      v5 = objc_msgSend(a1, "visionOSSpec", v3);
LABEL_8:
      break;
    default:
      v5 = 0;
      break;
  }
  return v5;
}

@end