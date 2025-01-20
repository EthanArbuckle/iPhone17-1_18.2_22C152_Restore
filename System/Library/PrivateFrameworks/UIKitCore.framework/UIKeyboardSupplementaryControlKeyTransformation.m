@interface UIKeyboardSupplementaryControlKeyTransformation
+ (CGSize)layoutScaleFactorForContext:(id)a3;
+ (double)_derivedFiveRowControlKeyWidthForRow:(unint64_t)a3 keysForRow:(id)a4 context:(id)a5;
+ (double)_derivedLeadingControlKeyWidthForRow:(unint64_t)a3 keysForRow:(id)a4 context:(id)a5;
+ (double)_derivedTrailingControlKeyWidthForRow:(unint64_t)a3 orientation:(int64_t)a4;
+ (double)_keyPitchForKeyplane:(id)a3;
+ (double)_keyplanePaddingForOrientation:(int64_t)a3;
+ (double)_keyplanePaddingForOrientation:(int64_t)a3 row:(unint64_t)a4;
+ (double)_scaledDerivedLeadingControlKeyWidth:(double)a3 forKeysForRow:(id)a4 keyCount:(int64_t)a5 numberOfKeysInSpecification:(int64_t)a6 context:(id)a7;
+ (double)_totalKeyPaddingForOrientation:(int64_t)a3;
+ (id)_cachedUndoOrRedoKeyForKeyplane:(id)a3;
+ (id)_supplementaryControlKeySetForOrientation:(int64_t)a3 context:(id)a4;
+ (id)_supplementaryControlKeyWithName:(id)a3 context:(id)a4;
+ (id)_supplementaryScriptSwitchKeyWithContext:(id)a3;
+ (id)_supplementaryShiftKeysWithContext:(id)a3;
+ (id)cachedControlKeySetsForTransformationContext:(id)a3;
+ (id)transformKeyplane:(id)a3 withTransformationContext:(id)a4;
+ (id)transformationIdentifier;
+ (unint64_t)_numberOfKeysInRow:(id)a3 firstKey:(id *)a4 lastKey:(id *)a5;
+ (void)adjustHorizontalPaddingForKeyplane:(id)a3 withTransformationContext:(id)a4;
+ (void)transformKeysForFiveRowKeyplane:(id)a3 withTransformationContext:(id)a4;
+ (void)transformKeysForFourRowKeyplane:(id)a3 withTransformationContext:(id)a4;
+ (void)transformKeysForHandwritingKeyplane:(id)a3 withTransformationContext:(id)a4;
+ (void)transformKeysForVietnameseKeyPlane:(id)a3 withTransformationContext:(id)a4;
+ (void)transformLastRowKeysForKeyplane:(id)a3 row:(unint64_t)a4 withTransformationContext:(id)a5;
@end

@implementation UIKeyboardSupplementaryControlKeyTransformation

+ (double)_totalKeyPaddingForOrientation:(int64_t)a3
{
  double result = 10.0;
  if ((unint64_t)(a3 - 3) < 2) {
    return 14.0;
  }
  return result;
}

+ (double)_keyplanePaddingForOrientation:(int64_t)a3
{
  [a1 _totalKeyPaddingForOrientation:a3];
  return v3 * 0.5;
}

+ (double)_keyplanePaddingForOrientation:(int64_t)a3 row:(unint64_t)a4
{
  if (a4 == 5) {
    return 1.0;
  }
  [a1 _keyplanePaddingForOrientation:a3];
  return result;
}

+ (unint64_t)_numberOfKeysInRow:(id)a3 firstKey:(id *)a4 lastKey:(id *)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    v10 = 0;
    id v11 = 0;
    unint64_t v12 = 0;
    uint64_t v13 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v7);
        }
        v15 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        [v15 frame];
        if (!CGRectIsEmpty(v24))
        {
          if (!v11) {
            id v11 = v15;
          }
          ++v12;
          id v16 = v15;

          v10 = v16;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
    if (a4) {
      goto LABEL_13;
    }
  }
  else
  {
    v10 = 0;
    id v11 = 0;
    unint64_t v12 = 0;
    if (a4) {
LABEL_13:
    }
      *a4 = v11;
  }
  if (a5) {
    *a5 = v10;
  }

  return v12;
}

+ (double)_derivedLeadingControlKeyWidthForRow:(unint64_t)a3 keysForRow:(id)a4 context:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v22 = 0;
  id v23 = 0;
  uint64_t v10 = [a1 _numberOfKeysInRow:v8 firstKey:&v23 lastKey:&v22];
  id v11 = v23;
  id v12 = v22;
  uint64_t v13 = [v9 screenTraits];
  uint64_t v14 = [v13 orientation];

  unint64_t v15 = v14 - 3;
  switch(a3)
  {
    case 0uLL:
      double v16 = dbl_186B9AD60[v15 < 2];
      goto LABEL_10;
    case 1uLL:
      double v16 = 87.0;
      if (v15 < 2) {
        double v16 = 136.0;
      }
      uint64_t v17 = 10;
      break;
    case 2uLL:
      BOOL v18 = v15 < 2;
      if ([v11 interactionType] == 2) {
        ++v10;
      }
      double v16 = dbl_186B9AD50[v18];
LABEL_10:
      uint64_t v17 = 11;
      break;
    case 3uLL:
      uint64_t v17 = 0;
      double v16 = dbl_186B9AD40[v15 < 2];
      break;
    default:
      uint64_t v17 = 0;
      double v16 = 0.0;
      break;
  }
  [a1 _scaledDerivedLeadingControlKeyWidth:v8 forKeysForRow:v10 keyCount:v17 numberOfKeysInSpecification:v9 context:v16];
  double v20 = v19;

  return v20;
}

+ (double)_derivedFiveRowControlKeyWidthForRow:(unint64_t)a3 keysForRow:(id)a4 context:(id)a5
{
  uint64_t v21 = 0;
  id v22 = 0;
  id v8 = a5;
  id v9 = a4;
  uint64_t v10 = [a1 _numberOfKeysInRow:v9 firstKey:&v22 lastKey:&v21];
  id v11 = v22;
  id v12 = objc_msgSend(v8, "screenTraits", v21);
  uint64_t v13 = [v12 orientation];

  unint64_t v14 = v13 - 3;
  if (a3 == 2)
  {
    double v15 = dbl_186B9AD70[v14 < 2];
    uint64_t v17 = 10;
  }
  else if (a3 == 1)
  {
    double v15 = 84.0;
    if (v14 < 2) {
      double v15 = 101.0;
    }
    uint64_t v17 = 11;
  }
  else
  {
    double v15 = 0.0;
    double v16 = 42.0;
    if (v14 < 2) {
      double v16 = 52.0;
    }
    if (a3) {
      uint64_t v17 = 0;
    }
    else {
      uint64_t v17 = 11;
    }
    if (!a3) {
      double v15 = v16;
    }
  }
  [a1 _scaledDerivedLeadingControlKeyWidth:v9 forKeysForRow:v10 keyCount:v17 numberOfKeysInSpecification:v8 context:v15];
  double v19 = v18;

  return v19;
}

+ (double)_scaledDerivedLeadingControlKeyWidth:(double)a3 forKeysForRow:(id)a4 keyCount:(int64_t)a5 numberOfKeysInSpecification:(int64_t)a6 context:(id)a7
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v13 = a7;
  unint64_t v14 = [v13 screenTraits];
  uint64_t v15 = [v14 orientation];

  [a1 _totalKeyPaddingForOrientation:v15];
  double v17 = v16;
  if (a6 && a5 > a6)
  {
    a3 = 10.0 / (dbl_186B9AD80[(unint64_t)(v15 - 3) < 2] * (double)(a5 - a6) + 10.0) * a3;
    long long v35 = 0u;
    long long v36 = 0u;
    double v18 = v16 + a3;
    long long v33 = 0u;
    long long v34 = 0u;
    id v19 = v12;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v34 != v22) {
            objc_enumerationMutation(v19);
          }
          CGRect v24 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          if (objc_msgSend(v24, "interactionType", (void)v33) == 2)
          {
            [v24 frame];
            double v18 = v18 + CGRectGetWidth(v39);
          }
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v21);
    }

    v25 = [v13 screenTraits];
    [v25 keyboardWidth];
    double v27 = v26;

    if (v18 > v27)
    {
      v28 = [v13 screenTraits];
      [v28 keyboardWidth];
      a3 = v29 - (v18 - a3) - v17;
    }
  }
  objc_msgSend(a1, "layoutScaleFactorForContext:", v13, (void)v33);
  double v31 = v30;

  return (v17 + a3) * v31;
}

+ (double)_derivedTrailingControlKeyWidthForRow:(unint64_t)a3 orientation:(int64_t)a4
{
  [a1 _totalKeyPaddingForOrientation:a4];
  double v7 = dbl_186B9AD90[(unint64_t)(a4 - 3) < 2];
  if (a3 != 3) {
    double v7 = -1.0;
  }
  return v7 + v6;
}

+ (id)_supplementaryControlKeySetForOrientation:(int64_t)a3 context:(id)a4
{
  id v5 = a4;
  if (!__supplementaryControlKeysetCache)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    double v7 = (void *)__supplementaryControlKeysetCache;
    __supplementaryControlKeysetCache = (uint64_t)v6;
  }
  id v8 = UIKeyboardGetCurrentInputMode();
  id v9 = KBStarLayoutString(v8);

  uint64_t v10 = +[UIKeyboardPreferencesController sharedPreferencesController];
  id v11 = [v10 preferencesActions];
  char v12 = [v11 inputModeSupportsCrescendo:v9];

  if (v12)
  {
    id v13 = 0;
  }
  else
  {
    unint64_t v14 = NSString;
    uint64_t v15 = [v5 currentKeyplaneName];
    double v16 = [v14 stringWithFormat:@"%@-%@-%ld", v9, v15, a3];

    id v17 = [(id)__supplementaryControlKeysetCache objectForKey:v16];
    if (v17) {
      goto LABEL_6;
    }
    double v18 = @"Portrait";
    id v19 = [v5 screenTraits];
    unint64_t v20 = [v19 orientation] - 3;

    if (v20 <= 1)
    {
      uint64_t v21 = @"Landscape";

      double v18 = v21;
    }
    uint64_t v22 = [NSString stringWithFormat:@"Wildcat-%@Fudge-%@", v18, v9];
    id v23 = [v5 screenTraits];
    CGRect v24 = +[UIKeyboardLayoutStar keyboardWithName:v22 screenTraits:v23];

    v25 = [v5 currentKeyplaneName];
    [(__CFString *)v25 rangeOfString:@"alternate" options:1];
    if (v26)
    {

      v25 = @"Alternate";
    }
    double v27 = [v24 subtreeWithName:v25];
    long long v33 = (void *)v22;
    if (v27
      || (v25,
          v25 = @"Small-Letters",
          [v24 subtreeWithName:@"Small-Letters"],
          (double v27 = objc_claimAutoreleasedReturnValue()) != 0)
      || (v25 = @"Letters",
          [v24 subtreeWithName:@"Letters"],
          (double v27 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v28 = v27;
      double v29 = [v27 subtreeWithName:@"Wildcat-Fudge-Control-Keys-Keylayout"];
      double v30 = v29;
      if (v29)
      {
        id v17 = [v29 keySet];
        if (v17) {
          [(id)__supplementaryControlKeysetCache setObject:v17 forKey:v16];
        }
        int v31 = 0;
      }
      else
      {
        id v17 = 0;
        int v31 = 1;
      }
    }
    else
    {
      id v17 = 0;
      int v31 = 1;
    }

    if (!v31)
    {
LABEL_6:
      id v17 = v17;
      id v13 = v17;
    }
    else
    {
      id v13 = 0;
    }
  }
  return v13;
}

+ (id)_supplementaryControlKeyWithName:(id)a3 context:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v8 = [v7 screenTraits];
  id v9 = objc_msgSend(a1, "_supplementaryControlKeySetForOrientation:context:", objc_msgSend(v8, "orientation"), v7);
  uint64_t v10 = [v9 subtrees];

  uint64_t v26 = [v10 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v26)
  {
    uint64_t v11 = *(void *)v32;
    uint64_t v24 = *(void *)v32;
    id v25 = v7;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v32 != v11) {
          objc_enumerationMutation(v10);
        }
        id v13 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        unint64_t v14 = [v13 subtrees];
        uint64_t v15 = [v14 countByEnumeratingWithState:&v27 objects:v35 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v28;
          while (2)
          {
            for (uint64_t j = 0; j != v16; ++j)
            {
              if (*(void *)v28 != v17) {
                objc_enumerationMutation(v14);
              }
              id v19 = *(void **)(*((void *)&v27 + 1) + 8 * j);
              unint64_t v20 = [v19 name];
              char v21 = [v20 isEqualToString:v6];

              if (v21)
              {
                id v22 = v19;

                id v7 = v25;
                goto LABEL_19;
              }
            }
            uint64_t v16 = [v14 countByEnumeratingWithState:&v27 objects:v35 count:16];
            if (v16) {
              continue;
            }
            break;
          }
        }

        uint64_t v11 = v24;
      }
      id v22 = 0;
      id v7 = v25;
      uint64_t v26 = [v10 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v26);
  }
  else
  {
    id v22 = 0;
  }
LABEL_19:

  return v22;
}

+ (id)_supplementaryScriptSwitchKeyWithContext:(id)a3
{
  id v4 = a3;
  id v5 = [a1 _supplementaryControlKeyWithName:@"Roman-to-Non-Roman-Switch-Key" context:v4];
  if (!v5)
  {
    id v5 = [a1 _supplementaryControlKeyWithName:@"Non-Roman-to-Roman-Switch-Key" context:v4];
  }

  return v5;
}

+ (id)_cachedUndoOrRedoKeyForKeyplane:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 firstCachedKeyWithName:@"Undo-Key"];
  uint64_t v5 = [v3 firstCachedKeyWithName:@"Redo-Key"];
  id v6 = (void *)v5;
  if (v4) {
    id v7 = v4;
  }
  else {
    id v7 = (void *)v5;
  }
  id v8 = v7;
  if (!v8)
  {
    [v3 cachedKeysByKeyName:@"Modify-For-Writeboard-Key"];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v21;
      id v19 = v6;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v21 != v12) {
            objc_enumerationMutation(v9);
          }
          unint64_t v14 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          uint64_t v15 = [v14 name];
          if ([v15 isEqualToString:@"Undo-Key"])
          {

LABEL_17:
            id v8 = v14;
            id v6 = v19;
            goto LABEL_18;
          }
          uint64_t v16 = [v14 name];
          int v17 = [v16 isEqualToString:@"Redo-Key"];

          if (v17) {
            goto LABEL_17;
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
        id v8 = 0;
        id v6 = v19;
        if (v11) {
          continue;
        }
        break;
      }
    }
    else
    {
      id v8 = 0;
    }
LABEL_18:
  }
  return v8;
}

+ (id)_supplementaryShiftKeysWithContext:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v6 = [v4 screenTraits];
  long long v21 = v4;
  id v7 = objc_msgSend(a1, "_supplementaryControlKeySetForOrientation:context:", objc_msgSend(v6, "orientation"), v4);
  id v8 = [v7 subtrees];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v27 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        unint64_t v14 = [v13 subtrees];
        uint64_t v15 = [v14 countByEnumeratingWithState:&v22 objects:v30 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v23;
          do
          {
            for (uint64_t j = 0; j != v16; ++j)
            {
              if (*(void *)v23 != v17) {
                objc_enumerationMutation(v14);
              }
              id v19 = *(void **)(*((void *)&v22 + 1) + 8 * j);
              if ([v19 interactionType] == 14) {
                [v5 addObject:v19];
              }
            }
            uint64_t v16 = [v14 countByEnumeratingWithState:&v22 objects:v30 count:16];
          }
          while (v16);
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v10);
  }

  return v5;
}

+ (id)transformationIdentifier
{
  return @"supp_12.SU";
}

+ (id)cachedControlKeySetsForTransformationContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 screenTraits];
  id v6 = objc_msgSend(a1, "_supplementaryControlKeySetForOrientation:context:", objc_msgSend(v5, "orientation"), v4);

  id v7 = [v6 subtrees];

  return v7;
}

+ (double)_keyPitchForKeyplane:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v22 = 0;
  unint64_t v23 = 0;
  unint64_t v24 = 0;
  double v5 = 0.0;
  if ((unint64_t)[v4 numberOfRows] <= 4)
  {
    if ((unint64_t)[v4 numberOfRows] < 2)
    {
      unint64_t v16 = 0;
      unint64_t v15 = 0;
      unint64_t v14 = 0;
    }
    else
    {
      uint64_t v6 = 0;
      do
      {
        id v7 = [v4 keysForDisplayRowAtIndex:v6 + 1];
        id v20 = 0;
        id v21 = 0;
        uint64_t v8 = [a1 _numberOfKeysInRow:v7 firstKey:&v21 lastKey:&v20];
        id v9 = v21;
        id v10 = v20;
        uint64_t v11 = v8 - ([v9 interactionType] == 14);
        LODWORD(v8) = [v10 interactionType];

        *(&v22 + v6) = v11 - (v8 == 14);
        unint64_t v12 = [v4 numberOfRows];
        unint64_t v13 = v6 + 2;
        ++v6;
      }
      while (v13 < v12);
      unint64_t v14 = v22;
      unint64_t v15 = v23;
      unint64_t v16 = v24;
    }
    if (v14 > 0xB || v15 > 0xB || (double v5 = 18.0, v16 >= 0xB))
    {
      if (v14 > 0xC || v15 > 0xC || v16 >= 0xC)
      {
        if (v16 >= 0xC || v15 >= 0xD || v14 >= 0xE) {
          double v5 = 0.0;
        }
        else {
          double v5 = 16.0;
        }
      }
      else
      {
        double v5 = 16.8;
      }
    }
  }

  return v5;
}

+ (void)adjustHorizontalPaddingForKeyplane:(id)a3 withTransformationContext:(id)a4
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 screenTraits];
  uint64_t v9 = [v8 orientation];

  id v10 = [v7 screenTraits];
  uint64_t v11 = [v10 screen];
  [v11 scale];
  double v13 = v12;

  unint64_t v14 = [v7 screenTraits];
  [v14 keyboardWidth];
  double v16 = v15;

  [a1 _totalKeyPaddingForOrientation:v9];
  double v18 = v17;
  [a1 _derivedLeadingControlKeyWidthForRow:0 keysForRow:0 context:v7];
  double v20 = v19;
  [v6 frame];
  double Width = CGRectGetWidth(v71);
  double v22 = 0.0;
  unint64_t v59 = v9 - 5;
  if ((unint64_t)(v9 - 5) >= 0xFFFFFFFFFFFFFFFELL)
  {
    [a1 _keyPitchForKeyplane:v6];
    double v22 = v23;
  }
  objc_msgSend(a1, "layoutScaleFactorForContext:", v7, v7);
  double v25 = v24;
  double v27 = v26;
  if ((unint64_t)[v6 numberOfRows] >= 2)
  {
    double v28 = v18 + v20 + Width;
    BOOL v30 = v22 <= 0.0 || v59 < 0xFFFFFFFFFFFFFFFELL;
    double v31 = *MEMORY[0x1E4F1DAD8];
    double v32 = v22 * 5.2571428 * v25;
    double v33 = v16 / v28;
    unint64_t v34 = 1;
    do
    {
      long long v35 = [v6 keysForDisplayRowAtIndex:v34];
      long long v36 = v35;
      double v37 = v33;
      if (!v30)
      {
        unint64_t v38 = objc_msgSend(v35, "count", v33);
        double v37 = v33;
        if (v38 >= 2)
        {
          long long v66 = 0u;
          long long v67 = 0u;
          long long v64 = 0u;
          long long v65 = 0u;
          id v39 = v36;
          uint64_t v40 = [v39 countByEnumeratingWithState:&v64 objects:v69 count:16];
          double v41 = v31;
          double v42 = v31;
          if (v40)
          {
            uint64_t v43 = v40;
            char v44 = 0;
            uint64_t v45 = *(void *)v65;
            double v42 = v31;
            do
            {
              for (uint64_t i = 0; i != v43; ++i)
              {
                if (*(void *)v65 != v45) {
                  objc_enumerationMutation(v39);
                }
                v47 = *(void **)(*((void *)&v64 + 1) + 8 * i);
                [v47 frame];
                if (!CGRectIsEmpty(v72) && [v47 interactionType] != 14)
                {
                  [v47 frame];
                  double v41 = v48 + v49 * 0.5;
                  if (v44) {
                    goto LABEL_25;
                  }
                  char v44 = 1;
                  double v42 = v48 + v49 * 0.5;
                }
              }
              uint64_t v43 = [v39 countByEnumeratingWithState:&v64 objects:v69 count:16];
            }
            while (v43);
            double v41 = v31;
          }
LABEL_25:

          double v37 = v32 / (v41 - v42);
        }
      }
      objc_msgSend(v6, "scaleKeys:withFactor:scale:", v36, v37, v27, v13);

      ++v34;
    }
    while (v34 < [v6 numberOfRows]);
  }
  long long v62 = 0u;
  long long v63 = 0u;
  if (v59 >= 0xFFFFFFFFFFFFFFFELL) {
    double v50 = 4.0;
  }
  else {
    double v50 = 2.0;
  }
  long long v60 = 0uLL;
  long long v61 = 0uLL;
  v51 = [v6 keys];
  uint64_t v52 = [v51 countByEnumeratingWithState:&v60 objects:v68 count:16];
  if (v52)
  {
    uint64_t v53 = v52;
    uint64_t v54 = *(void *)v61;
    do
    {
      for (uint64_t j = 0; j != v53; ++j)
      {
        if (*(void *)v61 != v54) {
          objc_enumerationMutation(v51);
        }
        v56 = *(void **)(*((void *)&v60 + 1) + 8 * j);
        [v56 frame];
        [v56 setPaddedFrame:v50 + v57];
      }
      uint64_t v53 = [v51 countByEnumeratingWithState:&v60 objects:v68 count:16];
    }
    while (v53);
  }
}

+ (CGSize)layoutScaleFactorForContext:(id)a3
{
  id v3 = a3;
  id v4 = [v3 screenTraits];
  BOOL v5 = (unint64_t)([v4 orientation] - 3) < 2;

  double v6 = dbl_186B9ADA0[v5];
  [v3 keyboardSize];
  double v8 = v7 / v6;
  [v3 keyboardSize];
  double v10 = v9;
  uint64_t v11 = [v3 activeKeyplane];

  [v11 frame];
  double v13 = v10 / v12;

  double v14 = v8;
  double v15 = v13;
  result.height = v15;
  result.width = v14;
  return result;
}

+ (void)transformKeysForFourRowKeyplane:(id)a3 withTransformationContext:(id)a4
{
  uint64_t v125 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  double v8 = [v7 screenTraits];
  double v9 = [v8 screen];
  [v9 scale];
  double v11 = v10;

  double v12 = [v7 screenTraits];
  uint64_t v13 = [v12 orientation];

  [a1 adjustHorizontalPaddingForKeyplane:v6 withTransformationContext:v7];
  [a1 _keyplanePaddingForOrientation:v13];
  double v15 = v14;
  double v16 = [v6 keysForDisplayRowAtIndex:1];
  [a1 _derivedLeadingControlKeyWidthForRow:0 keysForRow:v16 context:v7];
  double v18 = v17;
  double v19 = 0;
  if ((unint64_t)[v16 count] >= 2)
  {
    double v19 = [a1 _supplementaryControlKeyWithName:@"Tab-Key" context:v7];
  }
  objc_msgSend(v6, "insertKey:withFrame:andShiftKeys:scale:", v19, v16, v15, -1.0, v18, -1.0, v11);
  double v20 = [v6 firstCachedKeyWithName:@"Delete-Key"];
  id v21 = [v7 screenTraits];
  [v21 keyboardWidth];
  double v23 = v22;
  [v19 frame];
  double v25 = v23 - v24;
  [v20 frame];
  double v26 = v25 - CGRectGetMinX(v126);

  objc_msgSend(v6, "shiftRowAndResizeLeadingControlKey:toSize:scale:", v20, v26, 0.0, v11);
  double v27 = [v6 keysForDisplayRowAtIndex:2];
  [a1 _derivedLeadingControlKeyWidthForRow:1 keysForRow:v27 context:v7];
  double v29 = v28;
  id v30 = [a1 _supplementaryControlKeyWithName:@"Caps-Lock-Key" context:v7];
  LODWORD(v20) = [v7 usesScriptSwitch];
  double v31 = [v6 scriptSwitchKey];
  double v32 = v31;
  if (!v20)
  {

    if (!v32) {
      goto LABEL_11;
    }
    double v33 = [v6 scriptSwitchKey];
    [v6 removeKey:v33];
    uint64_t v34 = (uint64_t)v30;
LABEL_10:

    id v30 = (id)v34;
LABEL_11:
    if (v30) {
      goto LABEL_36;
    }
    goto LABEL_12;
  }

  if (!v32)
  {
    uint64_t v34 = [a1 _supplementaryScriptSwitchKeyWithContext:v7];

    double v33 = [v6 firstCachedKeyWithName:@"Caps-Lock-Key"];
    if (v33) {
      [v6 removeKey:v33];
    }
    goto LABEL_10;
  }

LABEL_12:
  id v35 = [v6 scriptSwitchKey];
  uint64_t v36 = [a1 _cachedUndoOrRedoKeyForKeyplane:v6];
  double v37 = (void *)v36;
  if (v36) {
    unint64_t v38 = (void *)v36;
  }
  else {
    unint64_t v38 = v35;
  }
  id v30 = v38;

  id v39 = [v6 keysForDisplayRowAtIndex:4];
  uint64_t v40 = v39;
  if (v30 == v35)
  {
    v117 = v27;
    double v41 = [v6 cachedKeysByKeyName:@"More-Key"];
    if ([v40 containsObject:v35])
    {
      double v42 = [v41 firstObject];
      id v43 = (id)[v42 copy];

      id v44 = v35;
    }
    else
    {
      long long v122 = 0u;
      long long v123 = 0u;
      long long v120 = 0u;
      long long v121 = 0u;
      id v45 = v40;
      id v43 = (id)[v45 countByEnumeratingWithState:&v120 objects:v124 count:16];
      if (v43)
      {
        v113 = v40;
        id v114 = a1;
        uint64_t v46 = *(void *)v121;
        while (2)
        {
          for (uint64_t i = 0; i != v43; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v121 != v46) {
              objc_enumerationMutation(v45);
            }
            double v48 = *(void **)(*((void *)&v120 + 1) + 8 * i);
            if ([v48 interactionType] == 11
              && ([v41 containsObject:v48] & 1) == 0)
            {
              id v43 = v48;
              goto LABEL_31;
            }
          }
          id v43 = (id)[v45 countByEnumeratingWithState:&v120 objects:v124 count:16];
          if (v43) {
            continue;
          }
          break;
        }
LABEL_31:
        uint64_t v40 = v113;
        a1 = v114;
      }

      [v35 setMergeAsMoreKey:1];
      [v6 removeKey:v35];
      id v44 = 0;
    }
    [v6 replaceKey:v44 withKey:v43];
    [v35 setMergeAsMoreKey:0];

    double v27 = v117;
  }
  else if ([v39 containsObject:v30])
  {
    [v6 removeKey:v30 andShiftKeys:v40 scale:v11];
  }

  if (!v30)
  {
    [a1 _derivedLeadingControlKeyWidthForRow:0 keysForRow:0 context:v7];
    double v29 = v49;
  }
LABEL_36:
  objc_msgSend(v6, "insertKey:withFrame:andShiftKeys:scale:", v30, v27, v15, -1.0, v29, -1.0, v11);
  double v50 = [v6 firstCachedKeyWithName:@"Return-Key"];
  v51 = [v7 screenTraits];
  [v51 keyboardWidth];
  double v53 = v52;
  [v30 frame];
  double v55 = v53 - v54;
  [v50 frame];
  double v56 = v55 - CGRectGetMinX(v127);

  objc_msgSend(v6, "shiftRowAndResizeLeadingControlKey:toSize:scale:", v50, v56, 0.0, v11);
  double v57 = [v6 cachedKeysByKeyName:@"Shift-Key"];
  if ([v57 count] == 2)
  {
    v58 = [v57 objectAtIndexedSubscript:0];
    [v58 paddedFrame];
    double v60 = v59;
    long long v61 = [v57 objectAtIndexedSubscript:1];
    [v61 paddedFrame];
    double v63 = v62;

    if (v60 >= v63)
    {
      long long v64 = [v57 objectAtIndexedSubscript:1];
      long long v65 = v57;
      uint64_t v66 = 0;
    }
    else
    {
      long long v64 = [v57 objectAtIndexedSubscript:0];
      long long v65 = v57;
      uint64_t v66 = 1;
    }
    id v69 = [v65 objectAtIndexedSubscript:v66];
  }
  else
  {
    long long v64 = [v57 firstObject];
    long long v67 = [v6 keysForDisplayRowAtIndex:3];
    v68 = [v6 firstCachedKeyWithName:@"Return-Key"];
    if ([v67 containsObject:v68])
    {
      id v69 = v68;
    }
    else
    {
      uint64_t v70 = [v67 lastObject];
      uint64_t v71 = [v70 layoutTag];
      if (v71)
      {
        CGRect v72 = (void *)v71;
        id v115 = a1;
        v73 = [v67 lastObject];
        v74 = [v73 name];
        int v118 = [v74 hasSuffix:@"width-Toggle-Key"];

        if (v118)
        {
          id v69 = [v67 lastObject];
        }
        else
        {
          id v69 = 0;
        }
        a1 = v115;
      }
      else
      {

        id v69 = 0;
      }
    }
  }
  v75 = [v6 keysForDisplayRowAtIndex:3];
  v76 = [v75 firstObject];
  if ([v76 interactionType] == 2)
  {
    [v76 frame];
    CGFloat MinX = CGRectGetMinX(v128);
    uint64_t v78 = 2;
    if (MinX < 1.0) {
      uint64_t v78 = 0;
    }
  }
  else
  {
    uint64_t v78 = 2;
  }
  uint64_t v119 = v78;
  v79 = [a1 _supplementaryShiftKeysWithContext:v7];
  if ([v79 count] != 2 || v64 && (objc_msgSend(v75, "containsObject:", v64) & 1) != 0)
  {
    v80 = v64;
  }
  else
  {
    v80 = [v79 firstObject];

    [a1 _derivedLeadingControlKeyWidthForRow:2 keysForRow:v75 context:v7];
    double v82 = v81;
    [v80 frame];
    objc_msgSend(v6, "insertKey:withFrame:andShiftKeys:scale:", v80, v75, 0.0, -1.0, v82);
    if (!v69 || ([v75 containsObject:v69] & 1) == 0)
    {
      v83 = [v79 lastObject];

      [v75 lastObject];
      v84 = id v116 = a1;
      [v84 frame];
      CGFloat v86 = v85;
      CGFloat v88 = v87;
      CGFloat v90 = v89;
      CGFloat v92 = v91;

      v93 = [v7 screenTraits];
      [v93 keyboardWidth];
      double v95 = v94;
      v129.origin.x = v86;
      v129.origin.y = v88;
      v129.size.width = v90;
      v129.size.height = v92;
      double v96 = v95 - CGRectGetMaxX(v129);

      v97 = [v75 lastObject];
      v98 = [v97 shape];
      [v83 setShape:v98];

      a1 = v116;
      v130.origin.x = v86;
      v130.origin.y = v88;
      v130.size.width = v90;
      v130.size.height = v92;
      objc_msgSend(v6, "insertKey:withFrame:andShiftKeys:scale:", v83, 0, CGRectGetMaxX(v130), -1.0, v96, -1.0, v11);
      id v69 = v83;
    }
  }
  id v99 = v80;
  [v99 frame];
  objc_msgSend(v99, "setFrame:", v15 + v100, v102 + 0.0, v101 - (v15 + 0.0));
  [v99 paddedFrame];
  objc_msgSend(v99, "setPaddedFrame:", v15 + v103, v105 + 0.0, v104 - (v15 + 0.0));

  [a1 _derivedLeadingControlKeyWidthForRow:v119 keysForRow:v75 context:v7];
  objc_msgSend(v6, "shiftRowAndResizeLeadingControlKey:toSize:scale:", v99);
  [v7 screenTraits];
  v107 = id v106 = a1;
  [v107 keyboardWidth];
  double v109 = v108;
  [v99 frame];
  double v111 = v109 - v110;
  [v69 frame];
  double v112 = v111 - CGRectGetMinX(v131);

  objc_msgSend(v6, "shiftRowAndResizeLeadingControlKey:toSize:scale:", v69, v112, 0.0, v11);
  [v106 transformLastRowKeysForKeyplane:v6 row:4 withTransformationContext:v7];
}

+ (void)transformKeysForFiveRowKeyplane:(id)a3 withTransformationContext:(id)a4
{
  id v21 = a3;
  id v6 = a4;
  id v7 = [v6 screenTraits];
  double v8 = [v7 screen];
  [v8 scale];
  double v10 = v9;

  double v11 = [v6 screenTraits];
  [v11 orientation];

  double v12 = [v6 screenTraits];
  [v12 keyboardWidth];
  double v14 = v13;

  [v21 frame];
  double Width = CGRectGetWidth(v23);
  if (Width > 0.0)
  {
    double v16 = v14 / Width;
    [a1 layoutScaleFactorForContext:v6];
    double v18 = v17;
    for (uint64_t i = 1; i != 5; ++i)
    {
      double v20 = [v21 keysForDisplayRowAtIndex:i];
      objc_msgSend(v21, "scaleKeys:withFactor:scale:", v20, v16, v18, v10);
    }
  }
  [a1 transformLastRowKeysForKeyplane:v21 row:5 withTransformationContext:v6];
}

+ (void)transformKeysForHandwritingKeyplane:(id)a3 withTransformationContext:(id)a4
{
  id v28 = a3;
  id v6 = a4;
  id v7 = [v6 screenTraits];
  double v8 = [v7 screen];
  [v8 scale];
  double v10 = v9;

  double v11 = [v6 screenTraits];
  [v11 orientation];

  [a1 layoutScaleFactorForContext:v6];
  double v13 = v12;
  double v15 = v14;
  double v16 = [v28 keysForDisplayRowAtIndex:1];
  [a1 _derivedLeadingControlKeyWidthForRow:0 keysForRow:v16 context:v6];
  objc_msgSend(v28, "insertKey:withFrame:andShiftKeys:scale:", 0, v16, -1.0, -1.0, v17, -1.0, v10);
  objc_msgSend(v28, "scaleKeys:withFactor:scale:", v16, v13, v15, v10);
  double v18 = [v28 firstCachedKeyWithName:@"Delete-Key"];
  double v19 = [v6 screenTraits];
  [v19 keyboardWidth];
  double v21 = v20;
  [v18 frame];
  double v22 = v21 - CGRectGetMinX(v30);

  objc_msgSend(v28, "shiftRowAndResizeLeadingControlKey:toSize:scale:", v18, v22, 0.0, v10);
  CGRect v23 = [v28 keysForDisplayRowAtIndex:0];
  double v24 = [v6 screenTraits];
  [v24 keyboardWidth];
  double v26 = v25;

  [v28 frame];
  double Width = CGRectGetWidth(v31);
  if (Width > 0.0) {
    objc_msgSend(v28, "scaleKeys:withFactor:scale:", v23, v26 / Width, v15, v10);
  }
  [a1 transformLastRowKeysForKeyplane:v28 row:2 withTransformationContext:v6];
}

+ (void)transformLastRowKeysForKeyplane:(id)a3 row:(unint64_t)a4 withTransformationContext:(id)a5
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  double v10 = [v9 screenTraits];
  double v11 = [v10 screen];
  [v11 scale];
  double v13 = v12;

  double v14 = [v9 screenTraits];
  uint64_t v15 = [v14 orientation];

  double v16 = [v8 keysForDisplayRowAtIndex:a4];
  if ([v16 count])
  {
    [a1 _keyplanePaddingForOrientation:v15 row:a4];
    objc_msgSend(v8, "repositionKeys:withOffset:scale:", v16);
    uint64_t v17 = [v16 indexOfObjectPassingTest:&__block_literal_global_372];
    if (v17 == 0x7FFFFFFFFFFFFFFFLL)
    {
      [a1 layoutScaleFactorForContext:v9];
      double v19 = v18;
    }
    else
    {
      double v20 = [v16 objectAtIndex:v17];
      [a1 layoutScaleFactorForContext:v9];
      double v19 = v21;
      if (v20)
      {
        long long v57 = 0u;
        long long v58 = 0u;
        long long v55 = 0u;
        long long v56 = 0u;
        id v22 = v16;
        uint64_t v23 = [v22 countByEnumeratingWithState:&v55 objects:v61 count:16];
        double v53 = v16;
        if (v23)
        {
          uint64_t v24 = v23;
          uint64_t v54 = v15;
          char v25 = 0;
          uint64_t v26 = *(void *)v56;
          do
          {
            for (uint64_t i = 0; i != v24; ++i)
            {
              if (*(void *)v56 != v26) {
                objc_enumerationMutation(v22);
              }
              id v28 = *(void **)(*((void *)&v55 + 1) + 8 * i);
              if (objc_msgSend(v28, "visible", v53))
              {
                if ([v28 interactionType] == 15)
                {
                  id v29 = v28;

                  char v25 = 1;
                  double v20 = v29;
                }
                else
                {
                  [a1 _derivedLeadingControlKeyWidthForRow:3 keysForRow:v22 context:v9];
                  double v31 = v30;
                  if ((v25 & 1) != 0
                    && [v28 interactionType] != 1
                    && [v28 interactionType] != 2)
                  {
                    [a1 _derivedTrailingControlKeyWidthForRow:3 orientation:v54];
                    double v31 = v32;
                  }
                  objc_msgSend(v8, "shiftRowAndResizeLeadingControlKey:toSize:scale:", v28, v31, 0.0, v13);
                }
              }
            }
            uint64_t v24 = [v22 countByEnumeratingWithState:&v55 objects:v61 count:16];
          }
          while (v24);
        }

        double v33 = [v9 screenTraits];
        [v33 keyboardWidth];
        double v35 = v34;
        uint64_t v36 = [v22 objectAtIndexedSubscript:0];
        [v36 frame];
        double v38 = v35 - v37;
        id v39 = [v22 lastObject];
        [v39 frame];
        double v40 = v38 - CGRectGetMaxX(v63);

        [v20 frame];
        objc_msgSend(v8, "shiftRowAndResizeLeadingControlKey:toSize:scale:", v20, v40 + v41, 0.0, v13);
        objc_msgSend(v8, "scaleKeys:withFactor:scale:", v22, 1.0, v19, v13);
        double v16 = v53;
        goto LABEL_22;
      }
    }
    double v20 = [v16 firstObject];
    double v42 = [v16 lastObject];
    [v42 frame];
    double MinX = CGRectGetMinX(v64);
    double v60 = v42;
    id v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v60 count:1];
    [v20 frame];
    double Width = CGRectGetWidth(v65);
    [v42 frame];
    objc_msgSend(v8, "scaleKeys:withFactor:scale:", v44, Width / CGRectGetWidth(v66), 1.0, v13);

    double v59 = v42;
    uint64_t v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v59 count:1];
    [v42 frame];
    objc_msgSend(v8, "repositionKeys:withOffset:scale:", v46, MinX - CGRectGetMinX(v67), 0.0, v13);

    [v20 frame];
    double v47 = CGRectGetMinX(v68);
    [v42 frame];
    CGFloat v48 = CGRectGetMaxX(v69) - v47;
    double v49 = [v9 screenTraits];
    [v49 keyboardWidth];
    double v51 = v50 - v47;
    [v42 frame];
    double v52 = v51 - CGRectGetMaxX(v70);

    objc_msgSend(v8, "scaleKeys:withFactor:scale:", v16, (v48 + v52) / v48, v19, v13);
    [v20 frame];
    objc_msgSend(v8, "repositionKeys:withOffset:scale:", v16, v47 - CGRectGetMinX(v71), 0.0, v13);

LABEL_22:
  }
}

BOOL __113__UIKeyboardSupplementaryControlKeyTransformation_transformLastRowKeysForKeyplane_row_withTransformationContext___block_invoke(uint64_t a1, void *a2)
{
  return [a2 interactionType] == 15;
}

+ (void)transformKeysForVietnameseKeyPlane:(id)a3 withTransformationContext:(id)a4
{
  uint64_t v113 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 screenTraits];
  id v9 = [v8 screen];
  [v9 scale];
  double v11 = v10;

  double v12 = [v7 screenTraits];
  uint64_t v13 = [v12 orientation];

  [a1 adjustHorizontalPaddingForKeyplane:v6 withTransformationContext:v7];
  uint64_t v14 = [v6 keysForDisplayRowAtIndex:1];
  uint64_t v15 = [v6 keysForDisplayRowAtIndex:2];
  double v96 = [v6 keysForDisplayRowAtIndex:3];
  double v16 = [v6 keysForDisplayRowAtIndex:4];
  double v95 = [v6 keysForDisplayRowAtIndex:5];
  objc_msgSend(a1, "_derivedLeadingControlKeyWidthForRow:keysForRow:context:", 3);
  double v18 = v17 + v17;
  [a1 _derivedTrailingControlKeyWidthForRow:3 orientation:v13];
  double v20 = v19;
  long long v106 = 0u;
  long long v107 = 0u;
  long long v108 = 0u;
  long long v109 = 0u;
  id v21 = v16;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v106 objects:v112 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v107;
LABEL_3:
    uint64_t v25 = 0;
    while (1)
    {
      if (*(void *)v107 != v24) {
        objc_enumerationMutation(v21);
      }
      uint64_t v26 = *(void **)(*((void *)&v106 + 1) + 8 * v25);
      if (![v26 displayType]) {
        break;
      }
      if (v23 == ++v25)
      {
        uint64_t v23 = [v21 countByEnumeratingWithState:&v106 objects:v112 count:16];
        if (v23) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v28 = v26;

    if (!v28) {
      goto LABEL_10;
    }
  }
  else
  {
LABEL_9:

LABEL_10:
    if (os_variant_has_internal_diagnostics())
    {
      CGFloat v92 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v92, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v92, OS_LOG_TYPE_FAULT, "Key plane should have at least one letter key.", buf, 2u);
      }
    }
    else
    {
      double v27 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &transformKeysForVietnameseKeyPlane_withTransformationContext____s_category)+ 8);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1853B0000, v27, OS_LOG_TYPE_ERROR, "Key plane should have at least one letter key.", buf, 2u);
      }
    }
    id v28 = 0;
  }
  [v28 frame];
  double v30 = v29;
  double v31 = [v7 screenTraits];
  [v31 keyboardWidth];
  double v33 = (v32 - v18 - v20) / 9.0;

  double v34 = v33 / v30;
  objc_msgSend(v6, "scaleKeys:withFactor:scale:", v14, v34, 1.0, v11);
  objc_msgSend(v6, "scaleKeys:withFactor:scale:", v15, v34, 1.0, v11);
  objc_msgSend(v6, "scaleKeys:withFactor:scale:", v96, v34, 1.0, v11);
  objc_msgSend(v6, "scaleKeys:withFactor:scale:", v21, v34, 1.0, v11);

  [a1 _derivedFiveRowControlKeyWidthForRow:0 keysForRow:v14 context:v7];
  v93 = (void *)v14;
  objc_msgSend(v6, "repositionKeys:withOffset:scale:", v14);
  double v35 = [v6 firstCachedKeyWithName:@"Delete-Key"];
  uint64_t v36 = [v7 screenTraits];
  [v36 keyboardWidth];
  double v38 = v37;
  [v35 frame];
  double v39 = v38 - CGRectGetMinX(v114);

  objc_msgSend(v6, "shiftRowAndResizeLeadingControlKey:toSize:scale:", v35, v39, 0.0, v11);
  [a1 _derivedFiveRowControlKeyWidthForRow:1 keysForRow:v15 context:v7];
  double v41 = v40;
  double v42 = [v15 firstObject];
  [v42 frame];
  CGRectGetMinX(v115);

  id v43 = [a1 _supplementaryControlKeyWithName:@"Tab-Key" context:v7];
  objc_msgSend(v6, "insertKey:withFrame:andShiftKeys:scale:", v43, v15, 0.0, -1.0, v41, -1.0, v11);
  long long v103 = 0u;
  long long v104 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  id v44 = v15;
  uint64_t v45 = [v44 countByEnumeratingWithState:&v101 objects:v111 count:16];
  id v46 = v44;
  if (v45)
  {
    uint64_t v47 = v45;
    uint64_t v48 = *(void *)v102;
LABEL_17:
    uint64_t v49 = 0;
    while (1)
    {
      if (*(void *)v102 != v48) {
        objc_enumerationMutation(v44);
      }
      double v50 = *(void **)(*((void *)&v101 + 1) + 8 * v49);
      if ([v50 interactionType] == 13) {
        break;
      }
      if (v47 == ++v49)
      {
        uint64_t v47 = [v44 countByEnumeratingWithState:&v101 objects:v111 count:16];
        if (v47) {
          goto LABEL_17;
        }
        id v46 = v44;
        goto LABEL_26;
      }
    }
    id v46 = v50;

    if (!v46) {
      goto LABEL_27;
    }
    double v51 = [v7 screenTraits];
    [v51 keyboardWidth];
    double v53 = v52;
    [v46 frame];
    double v54 = v53 - CGRectGetMinX(v116);

    objc_msgSend(v6, "shiftRowAndResizeLeadingControlKey:toSize:scale:", v46, v54, 0.0, v11);
  }
LABEL_26:

LABEL_27:
  [a1 _derivedFiveRowControlKeyWidthForRow:2 keysForRow:v96 context:v7];
  double v56 = v55;
  long long v57 = [v6 name];
  int v58 = [v57 containsString:@"Alternate"];

  id v94 = a1;
  if (v58)
  {
    double v59 = @"Undo-Key";
    double v60 = [a1 _supplementaryControlKeyWithName:@"Undo-Key" context:v7];
    long long v61 = [a1 _supplementaryControlKeyWithName:@"Redo-Key" context:v7];
    uint64_t v62 = [v6 name];
    uint64_t v63 = [v62 containsString:@"First-Alternate"];

    CGRect v64 = v60;
    if ((v63 & 1) == 0)
    {
      CGRect v65 = [v6 name];
      int v66 = [v65 containsString:@"Second-Alternate"];

      if (!v66)
      {
        id v67 = 0;
LABEL_40:

        goto LABEL_41;
      }
      double v59 = @"Redo-Key";
      CGRect v64 = v61;
    }
    [v60 setVisible:v63];
    [v61 setVisible:v63 ^ 1];
    id v67 = v64;
    uint64_t v68 = [v6 firstCachedKeyWithName:v59];
    if (v68)
    {
      CGRect v69 = (void *)v68;
      if ([v95 containsObject:v68]) {
        [v6 removeKey:v69 andShiftKeys:v95 scale:v11];
      }
      else {
        [v6 removeKey:v69];
      }
    }
    goto LABEL_40;
  }
  CGRect v70 = [a1 _supplementaryControlKeyWithName:@"Caps-Lock-Key" context:v7];
  if (![v7 usesScriptSwitch]) {
    goto LABEL_42;
  }
  id v67 = [a1 _supplementaryScriptSwitchKeyWithContext:v7];

  double v60 = [v6 firstCachedKeyWithName:@"Caps-Lock-Key"];
  if (v60) {
    [v6 removeKey:v60];
  }
LABEL_41:

  CGRect v70 = v67;
LABEL_42:
  objc_msgSend(v6, "insertKey:withFrame:andShiftKeys:scale:", v70, v96, 0.0, -1.0, v56, -1.0, v11);
  long long v99 = 0u;
  long long v100 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  id v71 = v96;
  uint64_t v72 = [v71 countByEnumeratingWithState:&v97 objects:v110 count:16];
  id v73 = v71;
  if (v72)
  {
    uint64_t v74 = v72;
    uint64_t v75 = *(void *)v98;
LABEL_44:
    uint64_t v76 = 0;
    while (1)
    {
      if (*(void *)v98 != v75) {
        objc_enumerationMutation(v71);
      }
      v77 = *(void **)(*((void *)&v97 + 1) + 8 * v76);
      if ([v77 interactionType] == 13) {
        break;
      }
      if (v74 == ++v76)
      {
        uint64_t v74 = [v71 countByEnumeratingWithState:&v97 objects:v110 count:16];
        if (v74) {
          goto LABEL_44;
        }
        id v73 = v71;
        goto LABEL_53;
      }
    }
    id v73 = v77;

    if (!v73) {
      goto LABEL_54;
    }
    uint64_t v78 = [v7 screenTraits];
    [v78 keyboardWidth];
    double v80 = v79;
    [v73 frame];
    double v81 = v80 - CGRectGetMinX(v117);

    objc_msgSend(v6, "shiftRowAndResizeLeadingControlKey:toSize:scale:", v73, v81, 0.0, v11);
  }
LABEL_53:

LABEL_54:
  double v82 = [v6 cachedKeysByKeyName:@"Shift-Key"];
  v83 = [v82 objectAtIndexedSubscript:0];
  [v83 paddedFrame];
  double v85 = v84;
  CGFloat v86 = [v82 objectAtIndexedSubscript:1];
  [v86 paddedFrame];
  BOOL v88 = v85 < v87;
  BOOL v89 = v85 >= v87;

  CGFloat v90 = [v82 objectAtIndexedSubscript:v89];
  double v91 = [v82 objectAtIndexedSubscript:v88];
  objc_msgSend(v6, "shiftRowAndResizeLeadingControlKey:toSize:scale:", v90, v18, 0.0, v11);
  objc_msgSend(v6, "shiftRowAndResizeLeadingControlKey:toSize:scale:", v91, v20, 0.0, v11);

  [v94 transformLastRowKeysForKeyplane:v6 row:5 withTransformationContext:v7];
}

+ (id)transformKeyplane:(id)a3 withTransformationContext:(id)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 screenTraits];
  id v9 = [v8 screen];
  [v9 scale];
  double v11 = v10;

  double v12 = [v7 screenTraits];
  [v12 orientation];

  uint64_t v13 = [v6 visualStyling] & 0xFF0000;
  uint64_t v14 = [v6 numberOfRows];
  [a1 layoutScaleFactorForContext:v7];
  double v16 = v15;
  if (v13 == 589824)
  {
    [a1 transformKeysForHandwritingKeyplane:v6 withTransformationContext:v7];
  }
  else if (v14 == 5)
  {
    double v17 = [v6 name];
    int v18 = [v17 containsString:@"Wildcat-Vietnamese"];

    if (v18) {
      [a1 transformKeysForVietnameseKeyPlane:v6 withTransformationContext:v7];
    }
    else {
      [a1 transformKeysForFiveRowKeyplane:v6 withTransformationContext:v7];
    }
  }
  else if (v14 == 4)
  {
    [a1 transformKeysForFourRowKeyplane:v6 withTransformationContext:v7];
  }
  [v6 frame];
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  uint64_t v25 = [v7 screenTraits];
  [v25 keyboardWidth];
  double v27 = v26;

  objc_msgSend(v6, "setFrame:", v20, v22, v27, v24);
  id v28 = +[UIKBShapeOperator operatorWithScale:v11];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  double v29 = objc_msgSend(v6, "subtrees", 0);
  uint64_t v30 = [v29 countByEnumeratingWithState:&v44 objects:v48 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v31; ++i)
      {
        if (*(void *)v45 != v32) {
          objc_enumerationMutation(v29);
        }
        double v34 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        if ([v34 type] == 3)
        {
          double v35 = [v34 shape];

          if (v35)
          {
            uint64_t v36 = [v7 screenTraits];
            [v36 keyboardWidth];
            double v38 = v37;
            [v34 frame];
            double v40 = v38 / v39;

            double v41 = [v34 shape];
            double v42 = objc_msgSend(v28, "shapeByScalingShape:factor:", v41, v40, v16);
            [v34 setShape:v42];
          }
        }
      }
      uint64_t v31 = [v29 countByEnumeratingWithState:&v44 objects:v48 count:16];
    }
    while (v31);
  }

  [v6 setObject:0 forProperty:@"KBunionFrame"];
  [v6 setObject:0 forProperty:@"KBunionPaddedFrame"];

  return v6;
}

@end