@interface NSLayoutConstraint(NAUIAdditions)
+ (id)naui_constraintsByAttachingView:()NAUIAdditions toView:alongEdges:relatedBy:insets:;
+ (id)naui_constraintsByCenteringView:()NAUIAdditions withView:alongAxes:offset:;
+ (id)naui_constraintsBySizingView:()NAUIAdditions toSize:;
+ (id)naui_constraintsWithVisualFormat:()NAUIAdditions options:metrics:views:label:;
+ (id)naui_viewsInConstraints:()NAUIAdditions;
+ (uint64_t)naui_areConstraints:()NAUIAdditions equalToConstraints:;
+ (uint64_t)naui_constraintsByAttachingView:()NAUIAdditions toView:alongEdges:insets:;
- (BOOL)naui_isEqualToConstraint:()NAUIAdditions;
- (id)naui_debugIdentifierWithBaseLabel:()NAUIAdditions;
- (void)naui_setIdentifierWithLabel:()NAUIAdditions;
@end

@implementation NSLayoutConstraint(NAUIAdditions)

+ (uint64_t)naui_areConstraints:()NAUIAdditions equalToConstraints:
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 count];
  if (v7 == [v6 count])
  {
    if ([v5 count])
    {
      unint64_t v8 = 0;
      do
      {
        v9 = [v5 objectAtIndexedSubscript:v8];
        v10 = [v6 objectAtIndexedSubscript:v8];
        uint64_t v11 = objc_msgSend(v9, "naui_isEqualToConstraint:", v10);

        if ((v11 & 1) == 0) {
          break;
        }
        ++v8;
      }
      while (v8 < [v5 count]);
    }
    else
    {
      uint64_t v11 = 1;
    }
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (BOOL)naui_isEqualToConstraint:()NAUIAdditions
{
  id v4 = a3;
  id v5 = [a1 firstItem];
  id v6 = [v4 firstItem];
  int v7 = [v5 isEqual:v6];

  if (!v7) {
    goto LABEL_7;
  }
  uint64_t v8 = [a1 firstAttribute];
  if (v8 != [v4 firstAttribute]) {
    goto LABEL_7;
  }
  v9 = [a1 secondItem];
  v10 = [v4 secondItem];
  int v11 = [v9 isEqual:v10];

  if (!v11) {
    goto LABEL_7;
  }
  uint64_t v12 = [a1 secondAttribute];
  if (v12 == [v4 secondAttribute]
    && (uint64_t v13 = [a1 relation], v13 == objc_msgSend(v4, "relation")))
  {
    [a1 constant];
    double v15 = v14;
    [v4 constant];
    BOOL v17 = v15 == v16;
  }
  else
  {
LABEL_7:
    BOOL v17 = 0;
  }

  return v17;
}

+ (id)naui_constraintsByCenteringView:()NAUIAdditions withView:alongAxes:offset:
{
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = [MEMORY[0x263EFF980] array];
  if (a7)
  {
    double v14 = [MEMORY[0x263F34230] constraintWithItem:v11 attribute:9 relatedBy:0 toItem:v12 attribute:9 multiplier:1.0 constant:a1];
    [v13 addObject:v14];
  }
  if ((a7 & 2) != 0)
  {
    double v15 = [MEMORY[0x263F34230] constraintWithItem:v11 attribute:10 relatedBy:0 toItem:v12 attribute:10 multiplier:1.0 constant:a2];
    [v13 addObject:v15];
  }
  return v13;
}

+ (id)naui_constraintsByAttachingView:()NAUIAdditions toView:alongEdges:relatedBy:insets:
{
  id v17 = a7;
  id v18 = a8;
  v19 = [MEMORY[0x263EFF980] array];
  if (a9)
  {
    v22 = [MEMORY[0x263F34230] constraintWithItem:v17 attribute:3 relatedBy:a10 toItem:v18 attribute:3 multiplier:1.0 constant:a1];
    [v19 addObject:v22];

    if ((a9 & 4) == 0)
    {
LABEL_3:
      if ((a9 & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((a9 & 4) == 0)
  {
    goto LABEL_3;
  }
  v23 = [MEMORY[0x263F34230] constraintWithItem:v17 attribute:4 relatedBy:a10 toItem:v18 attribute:4 multiplier:1.0 constant:-a3];
  [v19 addObject:v23];

  if ((a9 & 2) == 0)
  {
LABEL_4:
    if ((a9 & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  v24 = [MEMORY[0x263F34230] constraintWithItem:v17 attribute:5 relatedBy:a10 toItem:v18 attribute:5 multiplier:1.0 constant:a2];
  [v19 addObject:v24];

  if ((a9 & 8) != 0)
  {
LABEL_5:
    v20 = [MEMORY[0x263F34230] constraintWithItem:v17 attribute:6 relatedBy:a10 toItem:v18 attribute:6 multiplier:1.0 constant:-a4];
    [v19 addObject:v20];
  }
LABEL_6:

  return v19;
}

+ (uint64_t)naui_constraintsByAttachingView:()NAUIAdditions toView:alongEdges:insets:
{
  return objc_msgSend(a1, "naui_constraintsByAttachingView:toView:alongEdges:relatedBy:insets:", a3, a4, a5, 0);
}

+ (id)naui_constraintsBySizingView:()NAUIAdditions toSize:
{
  id v7 = a5;
  uint64_t v8 = [MEMORY[0x263EFF980] array];
  if (a1 != -1.0)
  {
    v9 = [MEMORY[0x263F34230] constraintWithItem:v7 attribute:7 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:a1];
    [v8 addObject:v9];
  }
  if (a2 != -1.0)
  {
    v10 = [MEMORY[0x263F34230] constraintWithItem:v7 attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:a2];
    [v8 addObject:v10];
  }
  return v8;
}

+ (id)naui_viewsInConstraints:()NAUIAdditions
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [MEMORY[0x263EFF980] array];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v11 = objc_msgSend(v10, "firstItem", (void)v18);
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          uint64_t v13 = [v10 firstItem];
          [v4 addObject:v13];
        }
        double v14 = [v10 secondItem];
        objc_opt_class();
        char v15 = objc_opt_isKindOfClass();

        if (v15)
        {
          double v16 = [v10 secondItem];
          [v4 addObject:v16];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (id)naui_constraintsWithVisualFormat:()NAUIAdditions options:metrics:views:label:
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v11 = a7;
  id v12 = [MEMORY[0x263F34230] constraintsWithVisualFormat:a3 options:a4 metrics:a5 views:a6];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v21 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        long long v18 = objc_msgSend(v17, "naui_debugIdentifierWithBaseLabel:", v11);
        [v17 setIdentifier:v18];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v14);
  }

  return v12;
}

- (id)naui_debugIdentifierWithBaseLabel:()NAUIAdditions
{
  id v4 = NSString;
  id v5 = a3;
  uint64_t v6 = NAUIStringFromLayoutAttribute([a1 firstAttribute]);
  unint64_t v7 = [a1 relation] + 1;
  if (v7 > 2) {
    uint64_t v8 = @"NSLayoutRelation(?)";
  }
  else {
    uint64_t v8 = off_264627E00[v7];
  }
  v9 = NAUIStringFromLayoutAttribute([a1 secondAttribute]);
  v10 = [v4 stringWithFormat:@"%@%@,%@", v6, v8, v9];

  id v11 = [NSString stringWithFormat:@"%@(%@)", v5, v10];

  return v11;
}

- (void)naui_setIdentifierWithLabel:()NAUIAdditions
{
  objc_msgSend(a1, "naui_debugIdentifierWithBaseLabel:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [a1 setIdentifier:v2];
}

@end