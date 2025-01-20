@interface UIKBFloatingKeyplaneTransformation
+ (id)transformKeyplane:(id)a3 withTransformationContext:(id)a4;
+ (id)transformationIdentifier;
@end

@implementation UIKBFloatingKeyplaneTransformation

+ (id)transformationIdentifier
{
  return @"flt";
}

+ (id)transformKeyplane:(id)a3 withTransformationContext:(id)a4
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (([v5 visualStyling] & 0xFF0000) == 0x90000)
  {
    +[UIKeyboardPopoverContainer contentInsets];
    double v8 = v7;
    double v10 = v9;
    v11 = [v6 screenTraits];
    v12 = [v11 screen];
    [v12 scale];
    double v14 = v13;

    uint64_t v15 = [v5 firstCachedKeyWithName:@"Handwriting-Input"];
    v16 = (void *)v15;
    double v17 = -v8;
    if (v15)
    {
      v28[0] = v15;
      v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];
      objc_msgSend(v5, "insetKeys:withInsets:scale:", v18, 0.0, v17, -7.0, -v10, v14);
    }
    uint64_t v19 = [v5 firstCachedKeyWithName:@"Candidate-Selection"];
    v20 = (void *)v19;
    if (v19)
    {
      uint64_t v27 = v19;
      v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v27 count:1];
      objc_msgSend(v5, "insetKeys:withInsets:scale:", v21, 0.0, v17, 0.0, -v10, v14);
    }
    uint64_t v22 = [v5 firstCachedKeyWithName:@"Delete-Key"];
    v23 = (void *)v22;
    if (v22)
    {
      uint64_t v26 = v22;
      v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
      objc_msgSend(v5, "repositionKeys:withOffset:scale:", v24, v10, 0.0, v14);
    }
  }

  return v5;
}

@end