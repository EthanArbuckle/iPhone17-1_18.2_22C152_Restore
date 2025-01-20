@interface SKUIStackListCollectionViewCell
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
- (SKUIStackListCollectionViewCell)initWithFrame:(CGRect)a3;
- (id)viewForElementIdentifier:(id)a3;
- (unint64_t)alignment;
- (void)layoutSubviews;
- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (void)setAlignment:(unint64_t)a3;
- (void)setListViews:(id)a3;
@end

@implementation SKUIStackListCollectionViewCell

- (SKUIStackListCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v8 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v8) {
        -[SKUIStackListCollectionViewCell initWithFrame:](v8, v9, v10, v11, v12, v13, v14, v15);
      }
    }
  }
  v20.receiver = self;
  v20.super_class = (Class)SKUIStackListCollectionViewCell;
  v16 = -[SKUIViewReuseCollectionViewCell initWithFrame:](&v20, sel_initWithFrame_, x, y, width, height);
  if (v16)
  {
    uint64_t v17 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:517 valueOptions:0 capacity:0];
    listViews = v16->_listViews;
    v16->_listViews = (NSMapTable *)v17;
  }
  return v16;
}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [v8 style];
  -[SKUIStackListCollectionViewCell setAlignment:](self, "setAlignment:", [v10 elementAlignment]);

  uint64_t v11 = [(SKUIStackListCollectionViewCell *)self listViews];
  [v11 removeAllObjects];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __71__SKUIStackListCollectionViewCell_reloadWithViewElement_width_context___block_invoke;
  v14[3] = &unk_1E64234F8;
  double v18 = a4;
  id v15 = v8;
  id v16 = v9;
  uint64_t v17 = self;
  id v12 = v9;
  id v13 = v8;
  [(SKUIViewReuseCollectionViewCell *)self modifyUsingBlock:v14];
}

void __71__SKUIStackListCollectionViewCell_reloadWithViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) children];
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
              uint64_t v11 = (void *)v10;
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
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v9 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v9) {
        +[SKUIStackListCollectionViewCell prefetchResourcesForViewElement:reason:context:](v9, v10, v11, v12, v13, v14, v15, v16);
      }
    }
  }
  uint64_t v17 = [v7 children];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    int v20 = 0;
    uint64_t v21 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v25 != v21) {
          objc_enumerationMutation(v17);
        }
        v20 |= [v8 prefetchResourcesForViewElement:*(void *)(*((void *)&v24 + 1) + 8 * i) reason:a4];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v19);
  }
  else
  {
    LOBYTE(v20) = 0;
  }

  return v20 & 1;
}

+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v4 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v4) {
        +[SKUIStackListCollectionViewCell preferredSizeForViewElement:context:](v4, v5, v6, v7, v8, v9, v10, v11);
      }
    }
  }
  double v12 = *MEMORY[0x1E4F1DB30];
  double v13 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  result.double height = v13;
  result.double width = v12;
  return result;
}

+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v9 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v9) {
        +[SKUIStackListCollectionViewCell requestLayoutForViewElement:width:context:](v9, v10, v11, v12, v13, v14, v15, v16);
      }
    }
  }
  uint64_t v17 = [v7 children];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v24 != v20) {
          objc_enumerationMutation(v17);
        }
        v22 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if ([v22 elementType] == 59) {
          +[SKUIStackItemView requestLayoutForViewElement:v22 width:v8 context:a4];
        }
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v19);
  }
}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v8 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v8) {
        +[SKUIStackListCollectionViewCell sizeThatFitsWidth:viewElement:context:](v8, v9, v10, v11, v12, v13, v14, v15);
      }
    }
  }
  double v17 = *MEMORY[0x1E4F1DB30];
  double MaxY = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  [v6 children];
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v19 = [v18 countByEnumeratingWithState:&v69 objects:v75 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v70;
    double v22 = 0.0;
    double v23 = MaxY;
    double v24 = v17;
    while (2)
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v70 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v26 = *(void *)(*((void *)&v69 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          +[SKUIStackItemView sizeThatFitsWidth:v26 viewElement:v7 context:0 numberOfLines:a3];
          double v29 = v22 + 17.0;
          if (v22 <= 0.0) {
            double v29 = v22;
          }
          double v22 = v29 + v27;
          if (v29 + v27 > a3)
          {

            long long v67 = 0u;
            long long v68 = 0u;
            long long v65 = 0u;
            long long v66 = 0u;
            id v31 = v18;
            uint64_t v32 = [v31 countByEnumeratingWithState:&v65 objects:v74 count:16];
            if (v32)
            {
              uint64_t v33 = v32;
              float v34 = a3 * 0.5 + -8.5;
              double v35 = floorf(v34);
              uint64_t v36 = *(void *)v66;
              while (2)
              {
                for (uint64_t j = 0; j != v33; ++j)
                {
                  if (*(void *)v66 != v36) {
                    objc_enumerationMutation(v31);
                  }
                  uint64_t v38 = *(void *)(*((void *)&v65 + 1) + 8 * j);
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    unint64_t v64 = 0;
                    +[SKUIStackItemView sizeThatFitsWidth:v38 viewElement:v7 context:&v64 numberOfLines:v35];
                    if (MaxY < v39) {
                      double MaxY = v39;
                    }
                    if (v64 > 2)
                    {

                      double v41 = *MEMORY[0x1E4F1DB28];
                      double v40 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
                      CGFloat v42 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
                      CGFloat v43 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
                      long long v62 = 0u;
                      long long v63 = 0u;
                      long long v60 = 0u;
                      long long v61 = 0u;
                      id v44 = v31;
                      uint64_t v45 = [v44 countByEnumeratingWithState:&v60 objects:v73 count:16];
                      if (v45)
                      {
                        uint64_t v46 = v45;
                        uint64_t v47 = *(void *)v61;
                        do
                        {
                          for (uint64_t k = 0; k != v46; ++k)
                          {
                            if (*(void *)v61 != v47) {
                              objc_enumerationMutation(v44);
                            }
                            uint64_t v49 = *(void *)(*((void *)&v60 + 1) + 8 * k);
                            objc_opt_class();
                            if (objc_opt_isKindOfClass())
                            {
                              +[SKUIStackItemView sizeThatFitsWidth:v49 viewElement:v7 context:0 numberOfLines:a3];
                              double v52 = v51;
                              if (v50 >= 16.0) {
                                double v53 = v50;
                              }
                              else {
                                double v53 = 16.0;
                              }
                              v78.origin.double x = v41;
                              v78.origin.double y = v40;
                              v78.size.double width = v42;
                              v78.size.double height = v43;
                              if (v52 + CGRectGetMaxX(v78) <= a3)
                              {
                                double v41 = v41 + v52;
                              }
                              else
                              {
                                v79.origin.double x = v41;
                                v79.origin.double y = v40;
                                v79.size.double width = v42;
                                v79.size.double height = v43;
                                double v40 = v40 + CGRectGetHeight(v79) + 6.0;
                                double v41 = 0.0;
                              }
                              v80.origin.double x = v41;
                              v80.origin.double y = v40;
                              v80.size.double width = v52;
                              v80.size.double height = v53;
                              double MaxX = CGRectGetMaxX(v80);
                              if (v17 < MaxX) {
                                double v17 = MaxX;
                              }
                              CGFloat v42 = v52;
                              CGFloat v43 = v53;
                            }
                          }
                          uint64_t v46 = [v44 countByEnumeratingWithState:&v60 objects:v73 count:16];
                        }
                        while (v46);
                      }

                      v81.origin.double x = v41;
                      v81.origin.double y = v40;
                      v81.size.double width = v42;
                      v81.size.double height = v43;
                      double MaxY = CGRectGetMaxY(v81);
                      goto LABEL_55;
                    }
                  }
                }
                uint64_t v33 = [v31 countByEnumeratingWithState:&v65 objects:v74 count:16];
                if (v33) {
                  continue;
                }
                break;
              }
            }

            goto LABEL_58;
          }
          if (v28 >= 16.0) {
            double v30 = v28;
          }
          else {
            double v30 = 16.0;
          }
          if (v23 < v30) {
            double v23 = v30;
          }
          if (v24 < v22) {
            double v24 = v22;
          }
        }
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v69 objects:v75 count:16];
      if (v20) {
        continue;
      }
      break;
    }

    double v17 = v24;
    double MaxY = v23;
  }
  else
  {
  }
LABEL_55:
  v55 = [v6 style];
  uint64_t v56 = [v55 elementAlignment];

  if (v56 == 3) {
    double MaxY = MaxY + 6.0;
  }
  a3 = v17;
LABEL_58:

  double v57 = a3;
  double v58 = MaxY;
  result.double height = v58;
  result.double width = v57;
  return result;
}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(SKUIStackListCollectionViewCell *)self listViews];
  uint64_t v12 = [v11 keyEnumerator];

  uint64_t v13 = [v12 nextObject];
  if (v13)
  {
    uint64_t v14 = (void *)v13;
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

      uint64_t v14 = (void *)v16;
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
  long long v8 = *MEMORY[0x1E4F1DB30];
  if (!-[SKUIStackListCollectionViewCell layoutSubviewsWithFlowLayout:size:](self, "layoutSubviewsWithFlowLayout:size:", &v8, 0.0, 0.0, a3.width, a3.height))
  {
    if (-[SKUIStackListCollectionViewCell layoutSubviewsWithFixedWidth:size:](self, "layoutSubviewsWithFixedWidth:size:", &v8, 0.0, 0.0, width, height))
    {
      goto LABEL_6;
    }
    -[SKUIStackListCollectionViewCell layoutSubviewsWithFlowLayout:size:](self, "layoutSubviewsWithFlowLayout:size:", &v8, 0.0, 0.0, width, height);
  }
  if ([(SKUIStackListCollectionViewCell *)self alignment] == 3) {
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
  v12.super_class = (Class)SKUIStackListCollectionViewCell;
  [(SKUICollectionViewCell *)&v12 layoutSubviews];
  id v3 = [(SKUIStackListCollectionViewCell *)self contentView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  if (!-[SKUIStackListCollectionViewCell layoutSubviewsWithFlowLayout:size:](self, "layoutSubviewsWithFlowLayout:size:", 0, v5, v7, v9, v11)&& !-[SKUIStackListCollectionViewCell layoutSubviewsWithFixedWidth:size:](self, "layoutSubviewsWithFixedWidth:size:", 0, v5, v7, v9, v11))
  {
    -[SKUIStackListCollectionViewCell layoutSubviewsWithFlowLayout:size:](self, "layoutSubviewsWithFlowLayout:size:", 0, v5, v7, v9, v11);
  }
}

- (BOOL)layoutSubviewsWithFlowLayout:(CGRect)a3 size:(CGSize *)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  [(SKUIViewReuseCollectionViewCell *)self contentInset];
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
  double v18 = *MEMORY[0x1E4F1DB28];
  CGFloat v17 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v19 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v20 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  BOOL v21 = [(SKUIStackListCollectionViewCell *)self _isRightAligned];
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  double v22 = [(SKUIViewReuseCollectionViewCell *)self allExistingViews];
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
      uint64_t v32 = *(void **)(*((void *)&v71 + 1) + 8 * v29);
      objc_msgSend(v32, "sizeThatFits:", v70, 1.79769313e308, *(void *)&v61.origin.x, *(void *)&v61.origin.y, *(void *)&v61.size.width, *(void *)&v61.size.height);
      double v19 = v33;
      v79.size.CGFloat height = v34;
      v79.origin.CGFloat x = v63;
      v79.origin.CGFloat y = v17;
      v79.size.CGFloat width = v19;
      double v35 = fmax(CGRectGetHeight(v79), 16.0);
      if ([(SKUIStackListCollectionViewCell *)self _isRightAligned])
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
      BOOL v37 = [(SKUIStackListCollectionViewCell *)self _isRightAligned];
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
      if ([(SKUIStackListCollectionViewCell *)self _isRightAligned])
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
      BOOL v46 = [(SKUIStackListCollectionViewCell *)self _isRightAligned];
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
      BOOL v53 = [(SKUIStackListCollectionViewCell *)self _isRightAligned];
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
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  [(SKUIViewReuseCollectionViewCell *)self contentInset];
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
  CGFloat v17 = [(SKUIViewReuseCollectionViewCell *)self allExistingViews];
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
    CGFloat v32 = *MEMORY[0x1E4F1DB28];
    double v31 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v27 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v29 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
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
  return [(SKUIStackListCollectionViewCell *)self alignment] == 3;
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

- (void)initWithFrame:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)prefetchResourcesForViewElement:(uint64_t)a3 reason:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)preferredSizeForViewElement:(uint64_t)a3 context:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)requestLayoutForViewElement:(uint64_t)a3 width:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)sizeThatFitsWidth:(uint64_t)a3 viewElement:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end