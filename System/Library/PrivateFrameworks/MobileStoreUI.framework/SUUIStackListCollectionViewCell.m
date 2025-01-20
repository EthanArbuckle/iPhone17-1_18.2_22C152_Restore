@interface SUUIStackListCollectionViewCell
+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5;
+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4;
+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5;
+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (BOOL)_isRightAligned;
- (BOOL)layoutSubviewsWithFixedWidth:(CGRect)a3 size:(CGSize *)a4;
- (BOOL)layoutSubviewsWithFlowLayout:(CGRect)a3 size:(CGSize *)a4;
- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5;
- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSMapTable)listViews;
- (SUUIStackListCollectionViewCell)initWithFrame:(CGRect)a3;
- (id)viewForElementIdentifier:(id)a3;
- (unint64_t)alignment;
- (void)layoutSubviews;
- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (void)setAlignment:(unint64_t)a3;
- (void)setListViews:(id)a3;
@end

@implementation SUUIStackListCollectionViewCell

- (SUUIStackListCollectionViewCell)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SUUIStackListCollectionViewCell;
  v3 = -[SUUIViewReuseCollectionViewCell initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:517 valueOptions:0 capacity:0];
    listViews = v3->_listViews;
    v3->_listViews = (NSMapTable *)v4;
  }
  return v3;
}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = [v8 style];
  -[SUUIStackListCollectionViewCell setAlignment:](self, "setAlignment:", [v10 elementAlignment]);

  v11 = [(SUUIStackListCollectionViewCell *)self listViews];
  [v11 removeAllObjects];

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __71__SUUIStackListCollectionViewCell_reloadWithViewElement_width_context___block_invoke;
  v14[3] = &unk_265400C88;
  double v18 = a4;
  id v15 = v8;
  id v16 = v9;
  v17 = self;
  id v12 = v9;
  id v13 = v8;
  [(SUUIViewReuseCollectionViewCell *)self modifyUsingBlock:v14];
}

void __71__SUUIStackListCollectionViewCell_reloadWithViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) children];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v9 elementType] == 59)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v10 = [v3 addStackItemViewWithElement:v9 width:*(void *)(a1 + 40) context:*(double *)(a1 + 56)];
            if (v10)
            {
              v11 = (void *)v10;
              id v12 = [*(id *)(a1 + 48) listViews];
              [v12 setObject:v9 forKey:v11];
            }
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
}

+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v7 = a5;
  id v8 = [a3 children];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    int v11 = 0;
    uint64_t v12 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v8);
        }
        v11 |= [v7 prefetchResourcesForViewElement:*(void *)(*((void *)&v15 + 1) + 8 * i) reason:a4];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }
  else
  {
    LOBYTE(v11) = 0;
  }

  return v11 & 1;
}

+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4
{
  double v4 = *MEMORY[0x263F001B0];
  double v5 = *(double *)(MEMORY[0x263F001B0] + 8);
  result.height = v5;
  result.width = v4;
  return result;
}

+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v7 = a5;
  id v8 = [a3 children];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v13 elementType] == 59) {
          +[SUUIStackItemView requestLayoutForViewElement:v13 width:v7 context:a4];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }
}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a5;
  double v9 = *MEMORY[0x263F001B0];
  double MaxY = *(double *)(MEMORY[0x263F001B0] + 8);
  [v6 children];
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = [v10 countByEnumeratingWithState:&v61 objects:v67 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v62;
    double v14 = 0.0;
    double v15 = MaxY;
    double v16 = v9;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v62 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v18 = *(void *)(*((void *)&v61 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          +[SUUIStackItemView sizeThatFitsWidth:v18 viewElement:v7 context:0 numberOfLines:a3];
          double v21 = v14 + 17.0;
          if (v14 <= 0.0) {
            double v21 = v14;
          }
          double v14 = v21 + v19;
          if (v21 + v19 > a3)
          {

            long long v59 = 0u;
            long long v60 = 0u;
            long long v57 = 0u;
            long long v58 = 0u;
            id v23 = v10;
            uint64_t v24 = [v23 countByEnumeratingWithState:&v57 objects:v66 count:16];
            if (v24)
            {
              uint64_t v25 = v24;
              float v26 = a3 * 0.5 + -8.5;
              double v27 = floorf(v26);
              uint64_t v28 = *(void *)v58;
              while (2)
              {
                for (uint64_t j = 0; j != v25; ++j)
                {
                  if (*(void *)v58 != v28) {
                    objc_enumerationMutation(v23);
                  }
                  uint64_t v30 = *(void *)(*((void *)&v57 + 1) + 8 * j);
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    unint64_t v56 = 0;
                    +[SUUIStackItemView sizeThatFitsWidth:v30 viewElement:v7 context:&v56 numberOfLines:v27];
                    if (MaxY < v31) {
                      double MaxY = v31;
                    }
                    if (v56 > 2)
                    {

                      double v33 = *MEMORY[0x263F001A8];
                      double v32 = *(double *)(MEMORY[0x263F001A8] + 8);
                      CGFloat v34 = *(double *)(MEMORY[0x263F001A8] + 16);
                      CGFloat v35 = *(double *)(MEMORY[0x263F001A8] + 24);
                      long long v54 = 0u;
                      long long v55 = 0u;
                      long long v52 = 0u;
                      long long v53 = 0u;
                      id v36 = v23;
                      uint64_t v37 = [v36 countByEnumeratingWithState:&v52 objects:v65 count:16];
                      if (v37)
                      {
                        uint64_t v38 = v37;
                        uint64_t v39 = *(void *)v53;
                        do
                        {
                          for (uint64_t k = 0; k != v38; ++k)
                          {
                            if (*(void *)v53 != v39) {
                              objc_enumerationMutation(v36);
                            }
                            uint64_t v41 = *(void *)(*((void *)&v52 + 1) + 8 * k);
                            objc_opt_class();
                            if (objc_opt_isKindOfClass())
                            {
                              +[SUUIStackItemView sizeThatFitsWidth:v41 viewElement:v7 context:0 numberOfLines:a3];
                              double v44 = v43;
                              if (v42 >= 16.0) {
                                double v45 = v42;
                              }
                              else {
                                double v45 = 16.0;
                              }
                              v70.origin.x = v33;
                              v70.origin.y = v32;
                              v70.size.width = v34;
                              v70.size.height = v35;
                              if (v44 + CGRectGetMaxX(v70) <= a3)
                              {
                                double v33 = v33 + v44;
                              }
                              else
                              {
                                v71.origin.x = v33;
                                v71.origin.y = v32;
                                v71.size.width = v34;
                                v71.size.height = v35;
                                double v32 = v32 + CGRectGetHeight(v71) + 6.0;
                                double v33 = 0.0;
                              }
                              v72.origin.x = v33;
                              v72.origin.y = v32;
                              v72.size.width = v44;
                              v72.size.height = v45;
                              double MaxX = CGRectGetMaxX(v72);
                              if (v9 < MaxX) {
                                double v9 = MaxX;
                              }
                              CGFloat v34 = v44;
                              CGFloat v35 = v45;
                            }
                          }
                          uint64_t v38 = [v36 countByEnumeratingWithState:&v52 objects:v65 count:16];
                        }
                        while (v38);
                      }

                      v73.origin.x = v33;
                      v73.origin.y = v32;
                      v73.size.width = v34;
                      v73.size.height = v35;
                      double MaxY = CGRectGetMaxY(v73);
                      goto LABEL_51;
                    }
                  }
                }
                uint64_t v25 = [v23 countByEnumeratingWithState:&v57 objects:v66 count:16];
                if (v25) {
                  continue;
                }
                break;
              }
            }

            goto LABEL_54;
          }
          if (v20 >= 16.0) {
            double v22 = v20;
          }
          else {
            double v22 = 16.0;
          }
          if (v15 < v22) {
            double v15 = v22;
          }
          if (v16 < v14) {
            double v16 = v14;
          }
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v61 objects:v67 count:16];
      if (v12) {
        continue;
      }
      break;
    }

    double v9 = v16;
    double MaxY = v15;
  }
  else
  {
  }
LABEL_51:
  v47 = [v6 style];
  uint64_t v48 = [v47 elementAlignment];

  if (v48 == 3) {
    double MaxY = MaxY + 6.0;
  }
  a3 = v9;
LABEL_54:

  double v49 = a3;
  double v50 = MaxY;
  result.height = v50;
  result.width = v49;
  return result;
}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(SUUIStackListCollectionViewCell *)self listViews];
  uint64_t v12 = [v11 keyEnumerator];

  uint64_t v13 = [v12 nextObject];
  if (v13)
  {
    double v14 = (void *)v13;
    char v15 = 0;
    do
    {
      if (v15) {
        char v15 = 1;
      }
      else {
        char v15 = [v14 setImage:v8 forArtworkRequest:v9 context:v10];
      }
      uint64_t v16 = [v12 nextObject];

      double v14 = (void *)v16;
    }
    while (v16);
  }
  else
  {
    char v15 = 0;
  }

  return v15;
}

- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5
{
  return 0;
}

- (id)viewForElementIdentifier:(id)a3
{
  return 0;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  long long v8 = *MEMORY[0x263F001B0];
  if (!-[SUUIStackListCollectionViewCell layoutSubviewsWithFlowLayout:size:](self, "layoutSubviewsWithFlowLayout:size:", &v8, 0.0, 0.0, a3.width, a3.height))
  {
    if (-[SUUIStackListCollectionViewCell layoutSubviewsWithFixedWidth:size:](self, "layoutSubviewsWithFixedWidth:size:", &v8, 0.0, 0.0, width, height))
    {
      goto LABEL_6;
    }
    -[SUUIStackListCollectionViewCell layoutSubviewsWithFlowLayout:size:](self, "layoutSubviewsWithFlowLayout:size:", &v8, 0.0, 0.0, width, height);
  }
  if ([(SUUIStackListCollectionViewCell *)self alignment] == 3) {
    *((double *)&v8 + 1) = *((double *)&v8 + 1) + 6.0;
  }
LABEL_6:
  double v7 = *((double *)&v8 + 1);
  double v6 = *(double *)&v8;
  result.double height = v7;
  result.double width = v6;
  return result;
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)SUUIStackListCollectionViewCell;
  [(SUUICollectionViewCell *)&v12 layoutSubviews];
  id v3 = [(SUUIStackListCollectionViewCell *)self contentView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  if (!-[SUUIStackListCollectionViewCell layoutSubviewsWithFlowLayout:size:](self, "layoutSubviewsWithFlowLayout:size:", 0, v5, v7, v9, v11)&& !-[SUUIStackListCollectionViewCell layoutSubviewsWithFixedWidth:size:](self, "layoutSubviewsWithFixedWidth:size:", 0, v5, v7, v9, v11))
  {
    -[SUUIStackListCollectionViewCell layoutSubviewsWithFlowLayout:size:](self, "layoutSubviewsWithFlowLayout:size:", 0, v5, v7, v9, v11);
  }
}

- (BOOL)layoutSubviewsWithFlowLayout:(CGRect)a3 size:(CGSize *)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v76 = *MEMORY[0x263EF8340];
  [(SUUIViewReuseCollectionViewCell *)self contentInset];
  CGFloat rect = v10;
  double v12 = v11;
  double v14 = v13;
  v77.origin.CGFloat x = x;
  v77.origin.CGFloat y = y;
  v77.size.CGFloat width = width;
  v77.size.CGFloat height = height;
  double v15 = CGRectGetWidth(v77);
  v61.origin.CGFloat x = x;
  v61.origin.CGFloat y = y;
  v78.origin.CGFloat x = x;
  v78.origin.CGFloat y = y;
  v61.size.CGFloat width = width;
  v61.size.CGFloat height = height;
  v78.size.CGFloat width = width;
  v78.size.CGFloat height = height;
  double v16 = CGRectGetWidth(v78);
  double v18 = *MEMORY[0x263F001A8];
  CGFloat v17 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v19 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v20 = *(double *)(MEMORY[0x263F001A8] + 24);
  BOOL v21 = [(SUUIStackListCollectionViewCell *)self _isRightAligned];
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  double v22 = [(SUUIViewReuseCollectionViewCell *)self allExistingViews];
  uint64_t v23 = [v22 countByEnumeratingWithState:&v71 objects:v75 count:16];
  CGFloat v68 = v18;
  CGFloat v69 = v17;
  if (!v23)
  {
    char v26 = 1;
    double v27 = 0.0;
    goto LABEL_32;
  }
  uint64_t v24 = v23;
  double v70 = v15 - v12 - v14;
  double v65 = v12;
  double v62 = v16 - v14;
  CGFloat v63 = v18;
  if (v21) {
    double v12 = v16 - v14;
  }
  uint64_t v25 = *(void *)v72;
  char v26 = 1;
  double v27 = 0.0;
  double v28 = rect;
  double v64 = v17;
  do
  {
    uint64_t v29 = 0;
    double v30 = v20;
    CGFloat v31 = v19;
    do
    {
      CGFloat v67 = v30;
      if (*(void *)v72 != v25) {
        objc_enumerationMutation(v22);
      }
      double v32 = *(void **)(*((void *)&v71 + 1) + 8 * v29);
      objc_msgSend(v32, "sizeThatFits:", v70, 1.79769313e308, *(void *)&v61.origin.x, *(void *)&v61.origin.y, *(void *)&v61.size.width, *(void *)&v61.size.height);
      double v19 = v33;
      v79.size.CGFloat height = v34;
      v79.origin.CGFloat x = v63;
      v79.origin.CGFloat y = v17;
      v79.size.CGFloat width = v19;
      double v35 = fmax(CGRectGetHeight(v79), 16.0);
      if ([(SUUIStackListCollectionViewCell *)self _isRightAligned])
      {
        v80.origin.CGFloat x = v63;
        v80.origin.CGFloat y = v17;
        v80.size.CGFloat width = v19;
        double v36 = v35;
        v80.size.CGFloat height = v35;
        double v12 = v12 - CGRectGetWidth(v80);
      }
      else
      {
        double v36 = v35;
      }
      BOOL v37 = [(SUUIStackListCollectionViewCell *)self _isRightAligned];
      double v38 = v12;
      double v39 = v28;
      double v40 = v19;
      double v20 = v36;
      double v41 = v36;
      if (v37)
      {
        double MinX = CGRectGetMinX(*(CGRect *)&v38);
        if (MinX >= v65 + CGRectGetMinX(v61)) {
          goto LABEL_13;
        }
      }
      else if (CGRectGetMaxX(*(CGRect *)&v38) <= v62)
      {
LABEL_13:
        double v43 = v12;
        double v44 = v12;
        goto LABEL_20;
      }
      if (v70 < v27) {
        double v27 = v70;
      }
      objc_msgSend(v32, "setFrame:", v12, v28, v19, v20);
      [v32 layoutIfNeeded];
      BOOL v45 = (unint64_t)[v32 numberOfLines] > 1;
      double v43 = v65;
      if ([(SUUIStackListCollectionViewCell *)self _isRightAligned])
      {
        v81.origin.CGFloat x = v12;
        v81.origin.CGFloat y = rect;
        v81.size.CGFloat width = v19;
        v81.size.CGFloat height = v20;
        double v43 = v62 - CGRectGetWidth(v81);
      }
      v26 &= v45;
      v82.origin.CGFloat x = v68;
      v82.origin.CGFloat y = v69;
      v82.size.CGFloat width = v31;
      v82.size.CGFloat height = v67;
      double v28 = CGRectGetMaxY(v82) + 6.0;
      double v44 = v43;
LABEL_20:
      objc_msgSend(v32, "setFrame:", v43, v28, v19, v20);
      BOOL v46 = [(SUUIStackListCollectionViewCell *)self _isRightAligned];
      double v47 = v43;
      double v48 = v28;
      double v49 = v19;
      double v50 = v20;
      if (v46)
      {
        double MaxX = CGRectGetMinX(*(CGRect *)&v47);
        double v52 = -17.0;
      }
      else
      {
        double MaxX = CGRectGetMaxX(*(CGRect *)&v47);
        double v52 = 17.0;
      }
      double v12 = MaxX + v52;
      BOOL v53 = [(SUUIStackListCollectionViewCell *)self _isRightAligned];
      CGFloat v68 = v44;
      CGFloat v69 = v28;
      double v54 = v43;
      double v55 = v28;
      double v56 = v19;
      double v57 = v20;
      if (v53) {
        double v58 = v70 - CGRectGetMinX(*(CGRect *)&v54);
      }
      else {
        double v58 = CGRectGetMaxX(*(CGRect *)&v54);
      }
      if (v27 < v58) {
        double v27 = v58;
      }
      ++v29;
      double v30 = v20;
      CGFloat v31 = v19;
      double v28 = rect;
      CGFloat v17 = v64;
    }
    while (v24 != v29);
    uint64_t v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v71, v75, 16, v20);
  }
  while (v24);
LABEL_32:

  if (a4)
  {
    v83.origin.CGFloat x = v68;
    v83.origin.CGFloat y = v69;
    v83.size.CGFloat width = v19;
    v83.size.CGFloat height = v20;
    CGFloat MaxY = CGRectGetMaxY(v83);
    a4->CGFloat width = v27;
    a4->CGFloat height = MaxY;
  }
  return v26 & 1;
}

- (BOOL)layoutSubviewsWithFixedWidth:(CGRect)a3 size:(CGSize *)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v43 = *MEMORY[0x263EF8340];
  [(SUUIViewReuseCollectionViewCell *)self contentInset];
  CGFloat v11 = v10;
  double v13 = v12;
  double v15 = v14;
  v37.origin.CGFloat x = x;
  v37.origin.CGFloat y = y;
  v44.origin.CGFloat x = x;
  v44.origin.CGFloat y = y;
  v37.size.CGFloat width = width;
  v37.size.CGFloat height = height;
  v44.size.CGFloat width = width;
  v44.size.CGFloat height = height;
  long long v38 = 0u;
  long long v39 = 0u;
  double v36 = v15;
  double v16 = CGRectGetWidth(v44) - v13 - v15;
  long long v40 = 0u;
  long long v41 = 0u;
  CGFloat v17 = [(SUUIViewReuseCollectionViewCell *)self allExistingViews];
  uint64_t v18 = [v17 countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    float v20 = v16 * 0.5 + -8.5;
    double v35 = floorf(v20);
    uint64_t v21 = *(void *)v39;
    char v22 = 1;
    double v23 = v13;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v39 != v21) {
          objc_enumerationMutation(v17);
        }
        uint64_t v25 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        objc_msgSend(v25, "sizeThatFits:", v35, 1.79769313e308);
        double v27 = v26;
        double v29 = v28;
        v45.origin.CGFloat x = v23;
        v45.origin.CGFloat y = v11;
        v45.size.CGFloat width = v27;
        v45.size.CGFloat height = v29;
        double MaxX = CGRectGetMaxX(v45);
        if (MaxX <= CGRectGetMaxX(v37) - v36)
        {
          double v31 = v11;
          CGFloat v32 = v23;
        }
        else
        {
          v46.origin.CGFloat x = v13;
          v46.origin.CGFloat y = v11;
          v46.size.CGFloat width = v27;
          v46.size.CGFloat height = v29;
          double v31 = CGRectGetMaxY(v46) + 6.0;
          double v23 = v13;
          CGFloat v32 = v13;
        }
        objc_msgSend(v25, "setFrame:", v23, v31, v27, v29);
        [v25 layoutIfNeeded];
        v22 &= (unint64_t)[v25 numberOfLines] < 3;
        v47.origin.CGFloat x = v23;
        v47.origin.CGFloat y = v31;
        v47.size.CGFloat width = v27;
        v47.size.CGFloat height = v29;
        double v23 = CGRectGetMaxX(v47) + 17.0;
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v38 objects:v42 count:16];
    }
    while (v19);
  }
  else
  {
    CGFloat v32 = *MEMORY[0x263F001A8];
    double v31 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v27 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v29 = *(double *)(MEMORY[0x263F001A8] + 24);
    char v22 = 1;
  }

  if (a4)
  {
    v48.origin.CGFloat x = v32;
    v48.origin.CGFloat y = v31;
    v48.size.CGFloat width = v27;
    v48.size.CGFloat height = v29;
    CGFloat MaxY = CGRectGetMaxY(v48);
    a4->CGFloat width = v16;
    a4->CGFloat height = MaxY;
  }
  return v22;
}

- (BOOL)_isRightAligned
{
  return [(SUUIStackListCollectionViewCell *)self alignment] == 3;
}

- (unint64_t)alignment
{
  return self->_alignment;
}

- (void)setAlignment:(unint64_t)a3
{
  self->_alignment = a3;
}

- (NSMapTable)listViews
{
  return self->_listViews;
}

- (void)setListViews:(id)a3
{
}

- (void).cxx_destruct
{
}

@end