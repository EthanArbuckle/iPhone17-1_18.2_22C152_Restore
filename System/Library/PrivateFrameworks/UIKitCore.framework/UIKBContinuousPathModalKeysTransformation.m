@interface UIKBContinuousPathModalKeysTransformation
+ (id)_donorControlKeysForLastDisplayRowForKeyplane:(id)a3 transformationContext:(id)a4;
+ (id)_donorKeyplaneForKeyplane:(id)a3 transformationContext:(id)a4;
+ (id)rollbackKeyplane:(id)a3 withTransformationContext:(id)a4;
+ (id)transformKeyplane:(id)a3 withTransformationContext:(id)a4;
+ (id)transformationIdentifier;
@end

@implementation UIKBContinuousPathModalKeysTransformation

+ (id)_donorKeyplaneForKeyplane:(id)a3 transformationContext:(id)a4
{
  id v5 = a4;
  v6 = [a3 alternateKeyplaneName];
  v7 = [v5 activeKeyboard];

  v8 = [v7 subtreeWithName:v6];

  return v8;
}

+ (id)_donorControlKeysForLastDisplayRowForKeyplane:(id)a3 transformationContext:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v4 = [a1 _donorKeyplaneForKeyplane:a3 transformationContext:a4];
  id v5 = [MEMORY[0x1E4F1CA70] orderedSet];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v6 = [&unk_1ED3F08F8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(&unk_1ED3F08F8);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        v11 = [v4 firstCachedKeyWithName:v10];
        if (!v11)
        {
          v12 = [v4 keysByKeyName:v10];
          v11 = [v12 firstObject];

          if (!v11) {
            continue;
          }
        }
        [v5 addObject:v11];
      }
      uint64_t v7 = [&unk_1ED3F08F8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v5;
}

+ (id)transformKeyplane:(id)a3 withTransformationContext:(id)a4
{
  id v4 = a3;
  id v5 = [v4 keys];
  [v5 enumerateObjectsUsingBlock:&__block_literal_global_370];

  return v4;
}

void __89__UIKBContinuousPathModalKeysTransformation_transformKeyplane_withTransformationContext___block_invoke(uint64_t a1, void *a2)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if ([v2 supportsSupplementalDisplayString])
  {
    if ([v2 displayType])
    {
      if ([v2 displayType] == 7)
      {
        v3 = [v2 secondaryRepresentedStrings];
        unint64_t v4 = [v3 count];

        id v5 = [v2 secondaryRepresentedStrings];
        uint64_t v6 = v5;
        unint64_t v7 = v4 - 2;
        if (v4 < 2)
        {
          uint64_t v8 = objc_msgSend(v5, "lastObject", v7);
          v10[0] = v8;
          v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
          [v2 setSecondaryDisplayStrings:v9];
        }
        else
        {
          uint64_t v8 = objc_msgSend(v5, "subarrayWithRange:", v7, 2);
          [v2 setSecondaryDisplayStrings:v8];
        }
      }
    }
    else
    {
      [v2 setDisplayType:7];
    }
  }
}

+ (id)rollbackKeyplane:(id)a3 withTransformationContext:(id)a4
{
  id v4 = a3;
  id v5 = [v4 keys];
  [v5 enumerateObjectsUsingBlock:&__block_literal_global_28_3];

  return v4;
}

void __88__UIKBContinuousPathModalKeysTransformation_rollbackKeyplane_withTransformationContext___block_invoke(uint64_t a1, void *a2)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if ([v2 supportsSupplementalDisplayString])
  {
    v3 = [v2 secondaryRepresentedStrings];
    unint64_t v4 = [v3 count];

    if (v4 < 2)
    {
      if ([v2 displayType] == 7) {
        [v2 setDisplayType:0];
      }
    }
    else
    {
      id v5 = [v2 secondaryRepresentedStrings];
      uint64_t v6 = [v5 firstObject];
      v8[0] = v6;
      unint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
      [v2 setSecondaryDisplayStrings:v7];
    }
  }
}

+ (id)transformationIdentifier
{
  return @"cpmodal";
}

@end