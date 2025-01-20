@interface UIView(PosterUIFoundation)
- (id)pui_constraintsPinningSubview:()PosterUIFoundation toEdges:;
@end

@implementation UIView(PosterUIFoundation)

- (id)pui_constraintsPinningSubview:()PosterUIFoundation toEdges:
{
  id v6 = a3;
  int v7 = [v6 isDescendantOfView:a1];
  v8 = (void *)MEMORY[0x263EFFA68];
  if (a4 && v7)
  {
    v9 = objc_opt_new();
    if (a4)
    {
      v14 = [v6 topAnchor];
      v15 = [a1 topAnchor];
      v16 = [v14 constraintEqualToAnchor:v15];
      [v9 addObject:v16];

      if ((a4 & 4) == 0)
      {
LABEL_5:
        if ((a4 & 2) == 0) {
          goto LABEL_6;
        }
        goto LABEL_14;
      }
    }
    else if ((a4 & 4) == 0)
    {
      goto LABEL_5;
    }
    v17 = [v6 bottomAnchor];
    v18 = [a1 bottomAnchor];
    v19 = [v17 constraintEqualToAnchor:v18];
    [v9 addObject:v19];

    if ((a4 & 2) == 0)
    {
LABEL_6:
      if ((a4 & 8) == 0)
      {
LABEL_8:
        v8 = (void *)[v9 copy];

        goto LABEL_9;
      }
LABEL_7:
      v10 = [v6 trailingAnchor];
      v11 = [a1 trailingAnchor];
      v12 = [v10 constraintEqualToAnchor:v11];
      [v9 addObject:v12];

      goto LABEL_8;
    }
LABEL_14:
    v20 = [v6 leadingAnchor];
    v21 = [a1 leadingAnchor];
    v22 = [v20 constraintEqualToAnchor:v21];
    [v9 addObject:v22];

    if ((a4 & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_9:

  return v8;
}

@end