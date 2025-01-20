@interface PFVideoAdjustments(PUReviewAdditions)
+ (id)videoAdjustmentsFromAssetAdjustmentsIfRecognized:()PUReviewAdditions;
@end

@implementation PFVideoAdjustments(PUReviewAdditions)

+ (id)videoAdjustmentsFromAssetAdjustmentsIfRecognized:()PUReviewAdditions
{
  id v3 = a3;
  if (!v3) {
    goto LABEL_5;
  }
  v4 = objc_opt_class();
  v5 = [v3 adjustmentFormatIdentifier];
  v6 = [v3 adjustmentFormatVersion];
  LODWORD(v4) = [v4 isRecognizedSlowMotionFormatWithIdentifier:v5 version:v6];

  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = v3;
    }
    else
    {
      v9 = [v3 propertyListDictionary];
      id v7 = (id)[objc_alloc(MEMORY[0x1E4F8CE18]) initWithPropertyListDictionary:v9];
    }
  }
  else
  {
LABEL_5:
    id v7 = 0;
  }

  return v7;
}

@end