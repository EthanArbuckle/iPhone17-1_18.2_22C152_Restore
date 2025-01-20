@interface PKPassBucketView
- (NSArray)bucket;
- (PKPass)pass;
- (PKPassBucketTemplate)bucketTemplate;
- (PKPassColorProfile)colorProfile;
- (id)_fieldViewsByWidth;
- (id)description;
- (int64_t)_backgroundForBucketTemplate:(id)a3;
- (void)_measureAndFitEvenlySizedSubviews;
- (void)_measureAndFitVariablySizedSubviews;
- (void)_presentRecursiveDiff:(id)a3 inView:(id)a4 forSubviewAtIndex:(unint64_t)a5 withSubviews:(id)a6 completion:(id)a7;
- (void)_updateSubviews;
- (void)layoutSubviews;
- (void)presentDiff:(id)a3 inView:(id)a4 completion:(id)a5;
- (void)setBucket:(id)a3;
- (void)setBucketTemplate:(id)a3;
- (void)setColorProfile:(id)a3;
- (void)setPass:(id)a3;
@end

@implementation PKPassBucketView

- (int64_t)_backgroundForBucketTemplate:(id)a3
{
  if ([a3 sitsOnStripImage])
  {
    v4 = [(PKPass *)self->_pass displayProfile];
    char v5 = [v4 showsStripImage];

    if (v5) {
      return 1;
    }
  }
  v7 = [(PKPass *)self->_pass displayProfile];
  int v8 = [v7 showsBackgroundImage];

  if (v8) {
    return 2;
  }
  else {
    return 0;
  }
}

- (void)layoutSubviews
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  v64.receiver = self;
  v64.super_class = (Class)PKPassBucketView;
  [(PKPassBucketView *)&v64 layoutSubviews];
  if ([(NSArray *)self->_bucket count])
  {
    [(PKPassBucketView *)self _updateSubviews];
    [(PKPassBucketView *)self bounds];
    double v4 = v3;
    int64_t v5 = [(PKPassBucketTemplate *)self->_bucketTemplate bucketAlignment];
    if (v5 == 3) {
      [(PKPassBucketView *)self _measureAndFitEvenlySizedSubviews];
    }
    else {
      [(PKPassBucketView *)self _measureAndFitVariablySizedSubviews];
    }
    [(PKPassBucketTemplate *)self->_bucketTemplate minFieldPadding];
    double v7 = v6;
    unint64_t v8 = [(NSMutableArray *)self->_currentFieldViews count];
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    v9 = self->_currentFieldViews;
    uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v60 objects:v68 count:16];
    double v11 = 0.0;
    double v12 = 0.0;
    if (v10)
    {
      uint64_t v13 = v10;
      uint64_t v14 = *(void *)v61;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v61 != v14) {
            objc_enumerationMutation(v9);
          }
          [*(id *)(*((void *)&v60 + 1) + 8 * i) frame];
          double v12 = v12 + v7 + v16;
        }
        uint64_t v13 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v60 objects:v68 count:16];
      }
      while (v13);
    }

    double v17 = v4 - (v12 - v7);
    if (v17 > 0.0 && v8 >= 2) {
      double v11 = v17 / (double)(v8 - 1);
    }
    if ((v5 & 0xFFFFFFFFFFFFFFFELL) == 2)
    {
      long long v58 = 0u;
      long long v59 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      v19 = self->_currentFieldViews;
      uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v56 objects:v67 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v57;
        double v23 = 0.0;
        do
        {
          uint64_t v24 = 0;
          double v25 = v23;
          do
          {
            if (*(void *)v57 != v22) {
              objc_enumerationMutation(v19);
            }
            v26 = *(void **)(*((void *)&v56 + 1) + 8 * v24);
            [v26 frame];
            double width = v70.size.width;
            double height = v70.size.height;
            v70.origin.y = 0.0;
            v70.origin.x = v25;
            double v23 = v7 + v11 + CGRectGetMaxX(v70);
            objc_msgSend(v26, "setFrame:", v25, 0.0, width, height);
            ++v24;
            double v25 = v23;
          }
          while (v21 != v24);
          uint64_t v21 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v56 objects:v67 count:16];
        }
        while (v21);
      }
    }
    else if (v5)
    {
      if (v5 != 1) {
        return;
      }
      [(PKPassBucketTemplate *)self->_bucketTemplate bucketRect];
      double v30 = v29;
      long long v52 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      v19 = self->_currentFieldViews;
      uint64_t v31 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v52 objects:v66 count:16];
      if (v31)
      {
        uint64_t v32 = v31;
        uint64_t v33 = *(void *)v53;
        do
        {
          for (uint64_t j = 0; j != v32; ++j)
          {
            if (*(void *)v53 != v33) {
              objc_enumerationMutation(v19);
            }
            v35 = *(void **)(*((void *)&v52 + 1) + 8 * j);
            [v35 frame];
            double v36 = v71.size.width;
            double v37 = v71.size.height;
            double v38 = v30 - v71.size.width;
            v71.origin.y = 0.0;
            v71.origin.x = v30 - v71.size.width;
            double v30 = CGRectGetMinX(v71) - v7;
            objc_msgSend(v35, "setFrame:", v38, 0.0, v36, v37);
          }
          uint64_t v32 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v52 objects:v66 count:16];
        }
        while (v32);
      }
    }
    else
    {
      long long v50 = 0u;
      long long v51 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      v19 = self->_currentFieldViews;
      uint64_t v39 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v48 objects:v65 count:16];
      if (v39)
      {
        uint64_t v40 = v39;
        uint64_t v41 = *(void *)v49;
        double v42 = 0.0;
        do
        {
          uint64_t v43 = 0;
          double v44 = v42;
          do
          {
            if (*(void *)v49 != v41) {
              objc_enumerationMutation(v19);
            }
            v45 = *(void **)(*((void *)&v48 + 1) + 8 * v43);
            objc_msgSend(v45, "frame", (void)v48);
            double v46 = v72.size.width;
            double v47 = v72.size.height;
            v72.origin.y = 0.0;
            v72.origin.x = v44;
            double v42 = v7 + CGRectGetMaxX(v72);
            objc_msgSend(v45, "setFrame:", v44, 0.0, v46, v47);
            ++v43;
            double v44 = v42;
          }
          while (v40 != v43);
          uint64_t v40 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v48 objects:v65 count:16];
        }
        while (v40);
      }
    }
  }
}

- (void)_updateSubviews
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (!self->_fieldViews)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    objc_msgSend(MEMORY[0x1E4F28E10], "pk_strongPointerPersonalityToWeakObjectsMapTable");
    double v4 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    templateToOriginalValueFontMap = self->_templateToOriginalValueFontMap;
    self->_templateToOriginalValueFontMap = v4;

    bucket = self->_bucket;
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __35__PKPassBucketView__updateSubviews__block_invoke;
    v27[3] = &unk_1E59CD910;
    v27[4] = self;
    id v28 = v3;
    id v7 = v3;
    [(NSArray *)bucket enumerateObjectsUsingBlock:v27];
    unint64_t v8 = (NSArray *)[v7 copy];
    fieldViews = self->_fieldViews;
    self->_fieldViews = v8;
  }
  currentFieldViews = self->_currentFieldViews;
  if (currentFieldViews)
  {
    [(NSMutableArray *)currentFieldViews removeAllObjects];
  }
  else
  {
    double v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    double v12 = self->_currentFieldViews;
    self->_currentFieldViews = v11;
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  obuint64_t j = self->_fieldViews;
  uint64_t v13 = [(NSArray *)obj countByEnumeratingWithState:&v23 objects:v29 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v24 != v15) {
          objc_enumerationMutation(obj);
        }
        double v17 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        v18 = [v17 field];
        if (![v18 foreignReferenceType])
        {
          [v17 setHidden:0];
LABEL_16:
          [(NSMutableArray *)self->_currentFieldViews addObject:v17];
          goto LABEL_18;
        }
        uint64_t v19 = [v18 label];
        if (v19)
        {
          uint64_t v20 = (void *)v19;
          uint64_t v21 = [v18 value];

          [v17 setHidden:v21 == 0];
          if (v21) {
            goto LABEL_16;
          }
        }
        else
        {
          [v17 setHidden:1];
        }
LABEL_18:
      }
      uint64_t v14 = [(NSArray *)obj countByEnumeratingWithState:&v23 objects:v29 count:16];
    }
    while (v14);
  }
}

- (void)_measureAndFitVariablySizedSubviews
{
  v2 = self;
  uint64_t v118 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(NSMutableArray *)self->_currentFieldViews count];
  uint64_t v4 = 456;
  [(PKPassBucketTemplate *)v2->_bucketTemplate minFieldPadding];
  double v6 = v5;
  [(PKPassBucketTemplate *)v2->_bucketTemplate bucketRect];
  double v8 = v7;
  uint64_t v100 = v3;
  double v9 = (double)(v3 - 1);
  uint64_t v10 = [(PKPassBucketTemplate *)v2->_bucketTemplate defaultFieldTemplate];
  double v11 = [v10 labelFont];
  [v11 xHeight];
  double v13 = v12;
  uint64_t v14 = [v10 valueFont];
  [v14 xHeight];
  double v16 = 1.0;
  if (v13 / v15 <= 1.0)
  {
    double v17 = [v10 labelFont];
    [v17 xHeight];
    double v19 = v18;
    uint64_t v20 = [v10 valueFont];
    [v20 xHeight];
    double v16 = v19 / v21;
  }
  v101 = v10;
  double v22 = v8 - v9 * v6;

  long long v114 = 0u;
  long long v115 = 0u;
  long long v112 = 0u;
  long long v113 = 0u;
  obuint64_t j = v2->_currentFieldViews;
  uint64_t v23 = [(NSMutableArray *)obj countByEnumeratingWithState:&v112 objects:v117 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v113;
    double v26 = *MEMORY[0x1E4F1DAD8];
    double v27 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    double v28 = 0.0;
    double v29 = &OBJC_IVAR___PKTitleDetailValueTextView__accessory;
    double v30 = 0.0;
    do
    {
      uint64_t v31 = 0;
      uint64_t v102 = v24;
      do
      {
        if (*(void *)v113 != v25) {
          objc_enumerationMutation(obj);
        }
        uint64_t v32 = *(void **)(*((void *)&v112 + 1) + 8 * v31);
        uint64_t v33 = [v32 fieldTemplate];
        v34 = [*(id *)((char *)&v2->super.super.super.isa + v29[867]) objectForKey:v33];
        if (!v34)
        {
          v34 = [v33 valueFont];
        }
        [v33 setValueFont:v34];
        [v32 setFieldTemplate:v33];
        [*(id *)((char *)&v2->super.super.super.isa + v4) bucketRect];
        objc_msgSend(v32, "sizeThatFits:", v35, v36);
        double v38 = v37;
        objc_msgSend(v32, "setFrame:", v26, v27, v37, v39);
        double v40 = v38;
        if (([v33 valueCanWrap] & 1) == 0)
        {
          uint64_t v41 = [v32 valueLabel];
          [v41 attributedText];
          uint64_t v42 = v25;
          uint64_t v43 = v2;
          uint64_t v44 = v4;
          double v46 = v45 = v29;
          [v46 size];
          double v40 = ceil(v47);

          double v29 = v45;
          uint64_t v4 = v44;
          v2 = v43;
          uint64_t v25 = v42;
          uint64_t v24 = v102;
        }
        double v30 = v30 + v38;
        long long v48 = [v32 labelLabel];
        long long v49 = [v48 attributedText];
        [v49 size];
        double v51 = ceil(v50);

        double v52 = -0.0;
        if (v51 < v40) {
          double v52 = v40;
        }
        double v28 = v28 + v52;

        ++v31;
      }
      while (v24 != v31);
      uint64_t v24 = [(NSMutableArray *)obj countByEnumeratingWithState:&v112 objects:v117 count:16];
    }
    while (v24);
  }
  else
  {
    double v28 = 0.0;
    double v30 = 0.0;
  }
  double v103 = v16;

  if (v30 <= v22)
  {
    long long v54 = v101;
  }
  else
  {
    double v53 = ceil((v30 - v22) / (double)v100);
    long long v54 = v101;
    while (1)
    {
      long long v55 = [(PKPassBucketView *)v2 _fieldViewsByWidth];
      long long v56 = [v55 lastObject];

      long long v57 = [v56 fieldTemplate];
      int v58 = [v57 valueCanWrap];

      if (!v58) {
        break;
      }
      [v56 frame];
      if (v53 >= v59) {
        break;
      }
      [v56 frame];
      double v61 = v60;
      double v63 = v62;
      double v65 = v30 - v64;
      double v66 = v64 - v53;
      [*(id *)((char *)&v2->super.super.super.isa + v4) bucketRect];
      double v68 = v67;
      [v56 invalidateCachedFieldSize];
      objc_msgSend(v56, "sizeThatFits:", v66, v68);
      objc_msgSend(v56, "setFrame:", v61, v63, v66, v69);
      double v30 = v65 + v66;

      if (v30 <= v22) {
        goto LABEL_26;
      }
    }
  }
LABEL_26:
  double v70 = 1.0;
  if (v30 > v22 && v28 > 0.0)
  {
    CGRect v71 = [v54 valueFont];
    [v71 pointSize];
    double v73 = v72;

    if ((v22 - (v30 - v28)) / v28 >= v103) {
      double v70 = (v22 - (v30 - v28)) / v28;
    }
    else {
      double v70 = v103;
    }
    long long v110 = 0u;
    long long v111 = 0u;
    long long v108 = 0u;
    long long v109 = 0u;
    obja = v2->_currentFieldViews;
    uint64_t v74 = [(NSMutableArray *)obja countByEnumeratingWithState:&v108 objects:v116 count:16];
    if (v74)
    {
      uint64_t v75 = v74;
      float v76 = v70 * v73;
      double v77 = floorf(v76);
      uint64_t v78 = *(void *)v109;
      double v79 = *MEMORY[0x1E4F1DAD8];
      double v80 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
      double v30 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v75; ++i)
        {
          if (*(void *)v109 != v78) {
            objc_enumerationMutation(obja);
          }
          v82 = *(void **)(*((void *)&v108 + 1) + 8 * i);
          v83 = [v82 fieldTemplate];
          v84 = (void *)MEMORY[0x1E4FB08E0];
          v85 = [v83 valueFont];
          v86 = [v85 fontDescriptor];
          v87 = [v84 fontWithDescriptor:v86 size:v77];
          [v83 setValueFont:v87];

          [v82 setFieldTemplate:v83];
          [*(id *)((char *)&v2->super.super.super.isa + v4) bucketRect];
          objc_msgSend(v82, "sizeThatFits:", v88, v89);
          double v91 = v90;
          objc_msgSend(v82, "setFrame:", v79, v80, v90, v92);
          double v30 = v30 + v91;
        }
        uint64_t v75 = [(NSMutableArray *)obja countByEnumeratingWithState:&v108 objects:v116 count:16];
      }
      while (v75);
    }
    else
    {
      double v30 = 0.0;
    }

    long long v54 = v101;
  }
  if (v30 > v22)
  {
    v93 = [(PKPassBucketView *)v2 _fieldViewsByWidth];
    v94 = 0;
    uint64_t v95 = [v93 count] - 1;
    do
    {
      v96 = v94;
      v94 = [v93 objectAtIndex:v95];

      [v94 frame];
      memset(&remainder, 0, sizeof(remainder));
      memset(&slice, 0, sizeof(slice));
      CGRectDivide(v119, &slice, &remainder, v30 - v22, CGRectMaxXEdge);
      objc_msgSend(v94, "setFrame:", remainder.origin.x, remainder.origin.y, remainder.size.width, remainder.size.height);
      double width = slice.size.width;
      v98 = [v94 valueLabel];
      [v98 setAdjustsFontSizeToFitWidth:1];

      v99 = [v94 valueLabel];
      [v99 setMinimumScaleFactor:v70];

      if (!v95) {
        break;
      }
      double v30 = v30 - width;
      --v95;
    }
    while (v30 > v22);
  }
}

- (PKPassBucketTemplate)bucketTemplate
{
  return self->_bucketTemplate;
}

void __35__PKPassBucketView__updateSubviews__block_invoke(uint64_t a1, void *a2, unint64_t a3, unsigned char *a4)
{
  id v11 = a2;
  double v7 = [*(id *)(*(void *)(a1 + 32) + 456) templateForFieldAtIndex:a3];
  if (v7 && [*(id *)(*(void *)(a1 + 32) + 456) maxFields] > a3)
  {
    double v8 = *(void **)(*(void *)(a1 + 32) + 432);
    double v9 = [v7 valueFont];
    [v8 setObject:v9 forKey:v7];

    id v10 = +[PKPassFieldView newViewForField:v11 fieldTemplate:v7];
    [v10 setColorProfile:*(void *)(*(void *)(a1 + 32) + 448) background:*(void *)(*(void *)(a1 + 32) + 424)];
    [*(id *)(a1 + 40) addObject:v10];
    [*(id *)(a1 + 32) addSubview:v10];
  }
  else
  {
    *a4 = 1;
  }
}

- (void)setPass:(id)a3
{
  double v5 = (PKPass *)a3;
  if (self->_pass != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->_pass, a3);
    double v5 = v6;
  }
}

- (void)setColorProfile:(id)a3
{
  double v5 = (PKPassColorProfile *)a3;
  if (self->_colorProfile != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->_colorProfile, a3);
    double v5 = v6;
  }
}

- (void)setBucketTemplate:(id)a3
{
  double v5 = (PKPassBucketTemplate *)a3;
  if (self->_bucketTemplate != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->_bucketTemplate, a3);
    self->_background = [(PKPassBucketView *)self _backgroundForBucketTemplate:self->_bucketTemplate];
    double v5 = v6;
  }
}

- (void)setBucket:(id)a3
{
  double v5 = (NSArray *)a3;
  if (self->_bucket != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->_bucket, a3);
    double v5 = v6;
  }
}

- (id)description
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [(PKPassBucketView *)self frame];
  objc_msgSend(v3, "appendFormat:", @"frame = (%g %g; %g %g); ", v4, v5, v6, v7);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  double v8 = self->_fieldViews;
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        [v3 appendFormat:@"\n    %@", *(void *)(*((void *)&v15 + 1) + 8 * i)];
      }
      uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  [v3 appendString:@">"];
  double v13 = [NSString stringWithString:v3];

  return v13;
}

- (void)_measureAndFitEvenlySizedSubviews
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(PKPassBucketTemplate *)self->_bucketTemplate defaultFieldTemplate];
  uint64_t v4 = [(NSMutableArray *)self->_currentFieldViews count];
  [(PKPassBucketTemplate *)self->_bucketTemplate minFieldPadding];
  double v6 = v5;
  [(PKPassBucketTemplate *)self->_bucketTemplate bucketRect];
  double v8 = v7 - (double)(v4 - 1) * v6;
  double v9 = (double)v4;
  uint64_t v10 = [v3 valueFont];
  [v10 pointSize];
  double v12 = v11;

  double v13 = [v3 labelFont];
  [v13 xHeight];
  double v15 = v14;
  long long v16 = [v3 valueFont];
  [v16 xHeight];
  double v18 = 1.0;
  if (v15 / v17 <= 1.0)
  {
    double v19 = [v3 labelFont];
    [v19 xHeight];
    double v21 = v20;
    double v22 = [v3 valueFont];
    [v22 xHeight];
    double v18 = v21 / v23;
  }
  long long v55 = v3;
  double v24 = v8 / v9;

  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  obuint64_t j = 416;
  uint64_t v25 = self->_currentFieldViews;
  uint64_t v26 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v62 objects:v67 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v63;
    double v29 = v12;
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v63 != v28) {
          objc_enumerationMutation(v25);
        }
        uint64_t v31 = *(void **)(*((void *)&v62 + 1) + 8 * i);
        uint64_t v32 = objc_msgSend(v31, "fieldTemplate", v55, obj);
        uint64_t v33 = [(NSMapTable *)self->_templateToOriginalValueFontMap objectForKey:v32];
        if (!v33)
        {
          uint64_t v33 = [v32 valueFont];
        }
        [v32 setValueFont:v33];
        [v31 setFieldTemplate:v32];
        [(PKPassBucketTemplate *)self->_bucketTemplate bucketRect];
        objc_msgSend(v31, "sizeThatFits:", v34, v35);
        double v36 = [v31 valueLabel];
        [v36 bounds];
        double v38 = v37;

        if (v38 > v24)
        {
          double v39 = v24 / v38;
          if (v24 / v38 <= v18) {
            double v39 = v18;
          }
          double v40 = floor(v12 * v39);
          if (v40 < v29) {
            double v29 = v40;
          }
        }
      }
      uint64_t v27 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v62 objects:v67 count:16];
    }
    while (v27);
  }
  else
  {
    double v29 = v12;
  }

  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id obja = *(id *)((char *)&self->super.super.super.isa + obj);
  uint64_t v41 = [obja countByEnumeratingWithState:&v58 objects:v66 count:16];
  if (v41)
  {
    uint64_t v42 = v41;
    uint64_t v43 = *(void *)v59;
    double v44 = *MEMORY[0x1E4F1DAD8];
    double v45 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    do
    {
      for (uint64_t j = 0; j != v42; ++j)
      {
        if (*(void *)v59 != v43) {
          objc_enumerationMutation(obja);
        }
        double v47 = *(void **)(*((void *)&v58 + 1) + 8 * j);
        long long v48 = objc_msgSend(v47, "fieldTemplate", v55);
        long long v49 = (void *)MEMORY[0x1E4FB08E0];
        double v50 = [v48 valueFont];
        double v51 = [v50 fontDescriptor];
        double v52 = [v49 fontWithDescriptor:v51 size:v29];

        [v48 setValueFont:v52];
        [v47 setFieldTemplate:v48];
        [(PKPassBucketTemplate *)self->_bucketTemplate bucketRect];
        double v54 = v53;
        objc_msgSend(v47, "sizeThatFits:", v24, v53);
        objc_msgSend(v47, "setFrame:", v44, v45, v24, v54);
      }
      uint64_t v42 = [obja countByEnumeratingWithState:&v58 objects:v66 count:16];
    }
    while (v42);
  }
}

- (id)_fieldViewsByWidth
{
  return (id)[(NSMutableArray *)self->_currentFieldViews sortedArrayUsingComparator:&__block_literal_global_35];
}

uint64_t __38__PKPassBucketView__fieldViewsByWidth__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  [a2 frame];
  double v6 = v5;
  [v4 frame];
  double v8 = v7;

  if (v6 >= v8) {
    uint64_t v9 = 0;
  }
  else {
    uint64_t v9 = -1;
  }
  if (v6 > v8) {
    return 1;
  }
  else {
    return v9;
  }
}

- (void)presentDiff:(id)a3 inView:(id)a4 completion:(id)a5
{
}

- (void)_presentRecursiveDiff:(id)a3 inView:(id)a4 forSubviewAtIndex:(unint64_t)a5 withSubviews:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  double v15 = (void (**)(void))a7;
  if ([v14 count] <= a5)
  {
    if (v15) {
      v15[2](v15);
    }
  }
  else
  {
    objc_initWeak(&location, self);
    long long v16 = [v14 objectAtIndexedSubscript:a5];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __91__PKPassBucketView__presentRecursiveDiff_inView_forSubviewAtIndex_withSubviews_completion___block_invoke;
    v17[3] = &unk_1E59CD938;
    objc_copyWeak(v22, &location);
    id v18 = v12;
    id v19 = v13;
    v22[1] = (id)a5;
    id v20 = v14;
    double v21 = v15;
    [v16 presentDiff:v18 inView:v19 completion:v17];

    objc_destroyWeak(v22);
    objc_destroyWeak(&location);
  }
}

void __91__PKPassBucketView__presentRecursiveDiff_inView_forSubviewAtIndex_withSubviews_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  [WeakRetained _presentRecursiveDiff:*(void *)(a1 + 32) inView:*(void *)(a1 + 40) forSubviewAtIndex:*(void *)(a1 + 72) + 1 withSubviews:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
}

- (PKPass)pass
{
  return self->_pass;
}

- (PKPassColorProfile)colorProfile
{
  return self->_colorProfile;
}

- (NSArray)bucket
{
  return self->_bucket;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bucket, 0);
  objc_storeStrong((id *)&self->_bucketTemplate, 0);
  objc_storeStrong((id *)&self->_colorProfile, 0);
  objc_storeStrong((id *)&self->_pass, 0);
  objc_storeStrong((id *)&self->_templateToOriginalValueFontMap, 0);
  objc_storeStrong((id *)&self->_currentFieldViews, 0);

  objc_storeStrong((id *)&self->_fieldViews, 0);
}

@end