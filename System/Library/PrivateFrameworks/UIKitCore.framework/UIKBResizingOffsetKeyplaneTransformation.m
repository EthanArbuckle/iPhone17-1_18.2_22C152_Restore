@interface UIKBResizingOffsetKeyplaneTransformation
+ (id)transformKeyplane:(id)a3 withTransformationContext:(id)a4;
+ (id)transformationIdentifier;
@end

@implementation UIKBResizingOffsetKeyplaneTransformation

+ (id)transformationIdentifier
{
  return @"rs";
}

+ (id)transformKeyplane:(id)a3 withTransformationContext:(id)a4
{
  v64[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 visualStyling] & 0xFF0000;
  uint64_t v8 = [v5 visualStyling] & 0xFF0000;
  [v6 resizingOffset];
  if (v9 >= -170.0) {
    double v10 = v9;
  }
  else {
    double v10 = -170.0;
  }
  if (v7 != 589824 && v8 != 2490368 && v10 != 0.0)
  {
    v11 = +[UIKeyboardImpl activeInstance];
    v12 = [v11 candidateController];
    [v12 candidateBarHeight];
    double v10 = v10 + v13;
  }
  [v5 resizingOffset];
  double v15 = v14;
  v16 = [v6 screenTraits];
  [v16 orientation];

  v17 = [v6 screenTraits];
  v18 = [v17 screen];
  [v18 scale];
  double v20 = v19;

  [v5 numberOfRows];
  double v21 = v10 - v15;
  if (v21 != 0.0)
  {
    [v5 setResizingOffset:v10];
    uint64_t v50 = v7;
    id v51 = v6;
    if (v7 == 589824)
    {
      uint64_t v23 = [v5 firstCachedKeyWithName:@"Handwriting-Input"];
      v22 = (void *)v23;
      if (v23)
      {
        v64[0] = v23;
        v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v64 count:1];
        objc_msgSend(v5, "resizeKeys:withOffset:scale:", v24, 0.0, v21, v20);
      }
      v27 = [v5 keysForDisplayRowAtIndex:2];
      objc_msgSend(v5, "repositionKeys:withOffset:scale:", v27, 0.0, v21, v20);
    }
    else if (v8 == 2490368)
    {
      uint64_t v25 = [v5 firstCachedKeyWithName:@"Emoji-InputView-Key"];
      v22 = (void *)v25;
      if (v25)
      {
        uint64_t v63 = v25;
        v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v63 count:1];
        objc_msgSend(v5, "resizeKeys:withOffset:scale:", v26, 0.0, v21, v20);
      }
      v28 = [v5 keys];
      v29 = (void *)[v28 mutableCopy];

      [v29 removeObject:v22];
      objc_msgSend(v5, "repositionKeys:withOffset:scale:", v29, 0.0, v21, v20);
    }
    else
    {
      v22 = [v5 keys];
      objc_msgSend(v5, "repositionKeys:withOffset:scale:", v22, 0.0, v21, v20);
    }

    v30 = +[UIKBShapeOperator operatorWithScale:v20];
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    v52 = v5;
    v31 = [v5 subtrees];
    uint64_t v32 = [v31 countByEnumeratingWithState:&v53 objects:v62 count:16];
    if (v32)
    {
      uint64_t v33 = v32;
      uint64_t v34 = *(void *)v54;
      do
      {
        for (uint64_t i = 0; i != v33; ++i)
        {
          if (*(void *)v54 != v34) {
            objc_enumerationMutation(v31);
          }
          v36 = *(void **)(*((void *)&v53 + 1) + 8 * i);
          if ([v36 type] == 3)
          {
            v37 = [v36 shape];
            v61 = v37;
            v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v61 count:1];
            v39 = objc_msgSend(v30, "shapesByResizingShapes:withOffset:", v38, 0.0, v21);
            v40 = [v39 firstObject];
            [v36 setShape:v40];
          }
        }
        uint64_t v33 = [v31 countByEnumeratingWithState:&v53 objects:v62 count:16];
      }
      while (v33);
    }

    id v5 = v52;
    [v52 setObject:0 forProperty:@"KBunionFrame"];
    [v52 setObject:0 forProperty:@"KBunionPaddedFrame"];

    uint64_t v7 = v50;
    id v6 = v51;
  }
  if (v7 == 589824)
  {
    v41 = [v5 firstCachedKeyWithName:@"Candidate-Selection"];
    v42 = v41;
    if (v41)
    {
      [v41 paddedFrame];
      if (CGRectGetMinY(v66) == 0.0)
      {
        v60 = v42;
        v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v60 count:1];
        objc_msgSend(v5, "insetKeys:withInsets:scale:", v43, 11.0, 0.0, 0.0, 0.0, v20);

        v59 = v42;
        v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v59 count:1];
        objc_msgSend(v5, "resizeKeys:withOffset:scale:", v44, 0.0, 11.0, v20);
      }
    }
    v45 = [v5 firstCachedKeyWithName:@"Delete-Key"];
    v46 = v45;
    if (v45)
    {
      [v45 paddedFrame];
      if (CGRectGetMinY(v67) == 0.0)
      {
        v58 = v46;
        v47 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v58 count:1];
        objc_msgSend(v5, "insetKeys:withInsets:scale:", v47, 11.0, 0.0, 0.0, 0.0, v20);

        v57 = v46;
        v48 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v57 count:1];
        objc_msgSend(v5, "resizeKeys:withOffset:scale:", v48, 0.0, 11.0, v20);
      }
    }
  }
  return v5;
}

@end