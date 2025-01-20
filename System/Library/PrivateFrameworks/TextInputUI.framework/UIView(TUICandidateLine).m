@interface UIView(TUICandidateLine)
- (id)_allLines;
- (void)_attachLine:()TUICandidateLine toEdge:;
- (void)_setImage:()TUICandidateLine onEdges:outside:style:;
- (void)_setShowsLinesOnEdges:()TUICandidateLine style:;
@end

@implementation UIView(TUICandidateLine)

- (id)_allLines
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1CA48] array];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v3 = objc_msgSend(a1, "subviews", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v10 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v2 addObject:v8];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  return v2;
}

- (void)_setImage:()TUICandidateLine onEdges:outside:style:
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v46 = a6;
  long long v10 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:4];
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  v44 = a1;
  long long v11 = [a1 subviews];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v51 objects:v56 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v52;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v52 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v51 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v17 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v16, "tag"));
          [v10 setObject:v16 forKeyedSubscript:v17];
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v51 objects:v56 count:16];
    }
    while (v13);
  }

  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  uint64_t v18 = [&unk_1EDC79B90 countByEnumeratingWithState:&v47 objects:v55 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v48;
    double v21 = *MEMORY[0x1E4F1DB28];
    double v22 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v23 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v24 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v48 != v20) {
          objc_enumerationMutation(&unk_1EDC79B90);
        }
        v26 = *(void **)(*((void *)&v47 + 1) + 8 * j);
        uint64_t v27 = [v26 integerValue];
        uint64_t v28 = [v10 objectForKeyedSubscript:v26];
        v29 = (TUICandidateLine *)v28;
        if ((v27 & a4) != 0)
        {
          if (!v28)
          {
            v29 = -[TUICandidateLine initWithFrame:]([TUICandidateLine alloc], "initWithFrame:", v21, v22, v23, v24);
            [v44 _attachLine:v29 toEdge:v27];
          }
          v30 = [(TUICandidateLine *)v29 subviews];
          uint64_t v31 = [v30 count];

          if (!v31)
          {
            id v32 = objc_alloc_init(MEMORY[0x1E4FB1838]);
            [(TUICandidateLine *)v29 addSubview:v32];
          }
          [(TUICandidateLine *)v29 setBackgroundColor:0];
          v33 = [(TUICandidateLine *)v29 subviews];
          v34 = [v33 firstObject];

          if (v9)
          {
            [v34 setImage:v9];
            [v46 foregroundOpacity];
            -[TUICandidateLine setAlpha:](v29, "setAlpha:");
            [(TUICandidateLine *)v29 bounds];
            double v37 = v36;
            double v38 = v35;
            if (a5)
            {
              double v39 = v35;
              if (v27 == 2)
              {
                [v9 size];
                double v39 = -v40;
              }
            }
            else
            {
              double v39 = 0.0;
              if (v27 != 2)
              {
                [v9 size];
                double v39 = v38 - v41;
              }
            }
            [v9 size];
            double v43 = v42;
            [(TUICandidateLine *)v29 bounds];
            objc_msgSend(v34, "setFrame:", v39, v37, v43, CGRectGetHeight(v58));
          }
          else
          {
            [(TUICandidateLine *)v29 setAlpha:0.0];
          }
        }
      }
      uint64_t v19 = [&unk_1EDC79B90 countByEnumeratingWithState:&v47 objects:v55 count:16];
    }
    while (v19);
  }
}

- (void)_setShowsLinesOnEdges:()TUICandidateLine style:
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = v6;
  if (a3 == 15 && ([v6 cornerRadius], v8 > 0.0))
  {
    double v9 = 1.0 / TUIScreenScaleForView(a1);
    long long v10 = [a1 layer];
    [v10 setBorderWidth:v9];

    id v11 = [v7 lineColor];
    uint64_t v12 = [v11 CGColor];
    uint64_t v13 = [a1 layer];
    [v13 setBorderColor:v12];

    a3 = 0;
  }
  else
  {
    uint64_t v14 = [a1 layer];
    [v14 setBorderWidth:0.0];

    id v11 = [a1 layer];
    [v11 setBorderColor:0];
  }

  uint64_t v15 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:4];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  double v36 = a1;
  v16 = [a1 subviews];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v41 objects:v46 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v42 != v19) {
          objc_enumerationMutation(v16);
        }
        double v21 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          double v22 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v21, "tag"));
          [v15 setObject:v21 forKeyedSubscript:v22];
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v41 objects:v46 count:16];
    }
    while (v18);
  }

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v23 = [&unk_1EDC79B78 countByEnumeratingWithState:&v37 objects:v45 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v38;
    double v26 = *MEMORY[0x1E4F1DB28];
    double v27 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v28 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v29 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    do
    {
      for (uint64_t j = 0; j != v24; ++j)
      {
        if (*(void *)v38 != v25) {
          objc_enumerationMutation(&unk_1EDC79B78);
        }
        uint64_t v31 = *(void **)(*((void *)&v37 + 1) + 8 * j);
        uint64_t v32 = [v31 integerValue];
        uint64_t v33 = [v15 objectForKeyedSubscript:v31];
        v34 = (TUICandidateLine *)v33;
        if ((v32 & a3) != 0)
        {
          if (!v33)
          {
            v34 = -[TUICandidateLine initWithFrame:]([TUICandidateLine alloc], "initWithFrame:", v26, v27, v28, v29);
            [v36 _attachLine:v34 toEdge:v32];
          }
          [(TUICandidateLine *)v34 setStyle:v7];
          [v7 backgroundOpacity];
        }
        else
        {
          double v35 = 0.0;
        }
        [(TUICandidateLine *)v34 setAlpha:v35];
      }
      uint64_t v24 = [&unk_1EDC79B78 countByEnumeratingWithState:&v37 objects:v45 count:16];
    }
    while (v24);
  }
}

- (void)_attachLine:()TUICandidateLine toEdge:
{
  id v23 = a3;
  [a1 bounds];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  uint64_t v14 = 0;
  double v15 = 1.0 / TUIScreenScaleForView(a1);
  double v16 = v15;
  double v17 = v15;
  switch(a4)
  {
    case 1:
    case 4:
      [a1 bounds];
      double v17 = v18;
      uint64_t v14 = 2;
      double v16 = v15;
      break;
    case 2:
    case 8:
      [a1 bounds];
      double v16 = v19;
      uint64_t v14 = 16;
      double v17 = v15;
      break;
    default:
      break;
  }
  double v20 = 0.0;
  double v21 = 0.0;
  switch(a4)
  {
    case 1:
      v14 |= 0x20uLL;
      break;
    case 2:
      v14 |= 4uLL;
      break;
    case 3:
    case 5:
    case 6:
    case 7:
      break;
    case 4:
      v25.origin.x = v7;
      v25.origin.y = v9;
      v25.size.width = v11;
      v25.size.height = v13;
      double v21 = CGRectGetMaxY(v25) - v15;
      v14 |= 8uLL;
      break;
    case 8:
      v26.origin.x = v7;
      v26.origin.y = v9;
      v26.size.width = v11;
      v26.size.height = v13;
      double v20 = CGRectGetMaxX(v26) - v15;
      v14 |= 1uLL;
      goto LABEL_9;
    default:
LABEL_9:
      double v21 = 0.0;
      break;
  }
  objc_msgSend(v23, "setFrame:", v20, v21, v17, v16);
  [a1 addSubview:v23];
  [v23 setAutoresizingMask:v14];
  double v22 = [v23 layer];
  [v22 setZPosition:1.0];

  [v23 setTag:a4];
}

@end