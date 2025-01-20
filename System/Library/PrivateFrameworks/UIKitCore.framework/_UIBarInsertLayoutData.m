@interface _UIBarInsertLayoutData
+ (double)calculateLayoutHeights:(uint64_t)a1;
+ (id)calculateRestingHeightsForLayouts:(uint64_t)a1;
+ (id)layoutPriorToItemWithOrder:(void *)a3 inLayouts:;
+ (void)assignVerticalOriginsToItemsInLayouts:(uint64_t)a1;
+ (void)updateLayoutParameters:(void *)a3 overflowLayout:(void *)a4 forAvailableHeight:;
- (_UIBarInsertLayoutData)init;
- (double)transitionProgress;
- (double)verticalOrigin;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
@end

@implementation _UIBarInsertLayoutData

- (double)transitionProgress
{
  if (!a1) {
    return 0.0;
  }
  double v1 = *(double *)(a1 + 64);
  double v2 = *(double *)(a1 + 48);
  double v3 = *(double *)(a1 + 40) - v2;
  double result = 1.0;
  if (v1 < v3)
  {
    double result = 0.0;
    double v5 = 0.0;
    if ((*(unsigned char *)(a1 + 8) & 1) == 0) {
      double v5 = *(double *)(a1 + 32);
    }
    if (v1 > v5) {
      return (v1 - v2) / v3;
    }
  }
  return result;
}

- (void).cxx_destruct
{
}

+ (void)assignVerticalOriginsToItemsInLayouts:(uint64_t)a1
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  self;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = v2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    double v7 = 0.0;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void *)(*((void *)&v10 + 1) + 8 * v8);
        *(double *)(v9 + 16) = v7;
        *(unsigned char *)(v9 + 8) |= 0x10u;
        double v7 = v7 + *(double *)(v9 + 64);
        ++v8;
      }
      while (v5 != v8);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

+ (void)updateLayoutParameters:(void *)a3 overflowLayout:(void *)a4 forAvailableHeight:
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  double v7 = a4;
  self;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v64 objects:v72 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v65;
    double v12 = 0.0;
    double v13 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v65 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v15 = *(void *)(*((void *)&v64 + 1) + 8 * i);
        if ((*(unsigned char *)(v15 + 8) & 1) == 0) {
          double v13 = v13 + *(double *)(v15 + 32);
        }
        double v12 = v12 + *(double *)(v15 + 40);
        *(unsigned char *)(v15 + 8) &= ~0x10u;
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v64 objects:v72 count:16];
    }
    while (v10);
  }
  else
  {
    double v12 = 0.0;
    double v13 = 0.0;
  }

  if (v12 <= a1)
  {
    long long v62 = 0uLL;
    long long v63 = 0uLL;
    long long v60 = 0uLL;
    long long v61 = 0uLL;
    id v30 = v8;
    uint64_t v31 = [v30 countByEnumeratingWithState:&v60 objects:v71 count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v33 = *(void *)v61;
      do
      {
        for (uint64_t j = 0; j != v32; ++j)
        {
          if (*(void *)v61 != v33) {
            objc_enumerationMutation(v30);
          }
          v35 = *(void **)(*((void *)&v60 + 1) + 8 * j);
          uint64_t v36 = v35[5];
          v35[7] = v36;
          v35[8] = v36;
        }
        uint64_t v32 = [v30 countByEnumeratingWithState:&v60 objects:v71 count:16];
      }
      while (v32);
    }

    if (v7)
    {
      double v37 = a1 - v12 + v7[5];
      v7[7] = v37;
      v7[8] = v37;
    }
    goto LABEL_63;
  }
  if (v13 <= a1)
  {
    long long v58 = 0uLL;
    long long v59 = 0uLL;
    long long v56 = 0uLL;
    long long v57 = 0uLL;
    id v23 = v8;
    uint64_t v38 = [v23 countByEnumeratingWithState:&v56 objects:v70 count:16];
    if (!v38) {
      goto LABEL_62;
    }
    uint64_t v39 = v38;
    double v40 = a1 - v13;
    uint64_t v41 = *(void *)v57;
    while (1)
    {
      for (uint64_t k = 0; k != v39; ++k)
      {
        if (*(void *)v57 != v41) {
          objc_enumerationMutation(v23);
        }
        uint64_t v43 = *(void *)(*((void *)&v56 + 1) + 8 * k);
        if (v40 <= 0.0)
        {
          double v46 = *(double *)(v43 + 32);
          if ((*(unsigned char *)(v43 + 8) & 1) == 0) {
            goto LABEL_55;
          }
          *(double *)(v43 + 56) = v46;
          *(void *)(v43 + 64) = 0;
        }
        else
        {
          if ((*(unsigned char *)(v43 + 8) & 1) == 0)
          {
            double v44 = *(double *)(v43 + 32);
            double v45 = *(double *)(v43 + 40) - v44;
            if (v45 >= v40) {
              double v45 = v40;
            }
            double v40 = v40 - v45;
            double v46 = v44 + v45;
LABEL_55:
            *(double *)(v43 + 56) = v46;
            *(double *)(v43 + 64) = v46;
            continue;
          }
          double v47 = *(double *)(v43 + 40);
          if (v47 >= v40) {
            double v47 = v40;
          }
          double v40 = v40 - v47;
          *(void *)(v43 + 56) = *(void *)(v43 + 32);
          *(double *)(v43 + 64) = v47;
        }
      }
      uint64_t v39 = [v23 countByEnumeratingWithState:&v56 objects:v70 count:16];
      if (!v39) {
        goto LABEL_62;
      }
    }
  }
  long long v54 = 0uLL;
  long long v55 = 0uLL;
  long long v52 = 0uLL;
  long long v53 = 0uLL;
  id v16 = v8;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v52 objects:v69 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v53;
    do
    {
      for (uint64_t m = 0; m != v18; ++m)
      {
        if (*(void *)v53 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void *)(*((void *)&v52 + 1) + 8 * m);
        if ((*(unsigned char *)(v21 + 8) & 1) == 0)
        {
          double v22 = *(double *)(v21 + 32);
          *(double *)(v21 + 56) = v22;
          *(double *)(v21 + 64) = v22;
          a1 = a1 - v22;
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v52 objects:v69 count:16];
    }
    while (v18);
  }

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v23 = v16;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v48 objects:v68 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v49;
    do
    {
      for (uint64_t n = 0; n != v25; ++n)
      {
        if (*(void *)v49 != v26) {
          objc_enumerationMutation(v23);
        }
        uint64_t v28 = *(void *)(*((void *)&v48 + 1) + 8 * n);
        if (*(unsigned char *)(v28 + 8))
        {
          double v29 = *(double *)(v28 + 32);
          *(double *)(v28 + 56) = v29;
          if (a1 >= v29)
          {
            *(double *)(v28 + 64) = v29;
            a1 = a1 - v29;
          }
          else
          {
            *(double *)(v28 + 64) = a1;
            a1 = 0.0;
          }
        }
      }
      uint64_t v25 = [v23 countByEnumeratingWithState:&v48 objects:v68 count:16];
    }
    while (v25);
  }
LABEL_62:

LABEL_63:
}

+ (double)calculateLayoutHeights:(uint64_t)a1
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  self;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v3 = v2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v17;
    double v7 = 0.0;
    double v8 = 0.0;
    double v9 = 0.0;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * v10);
        if (v11)
        {
          char v12 = *(unsigned char *)(v11 + 8);
          double v13 = 0.0;
          if ((v12 & 1) == 0) {
            double v13 = *(double *)(v11 + 32);
          }
        }
        else
        {
          char v12 = MEMORY[8];
          double v13 = 0.0;
        }
        double v9 = v9 + v13;
        if ((v12 & 2) != 0) {
          double v13 = *(double *)(v11 + 40);
        }
        double v8 = v8 + v13;
        double v7 = v7 + *(double *)(v11 + 40);
        ++v10;
      }
      while (v5 != v10);
      uint64_t v14 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
      uint64_t v5 = v14;
    }
    while (v14);
  }
  else
  {
    double v9 = 0.0;
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = ($B130A0C233D57C7B44158004461CDAA8 *)objc_alloc_init((Class)objc_opt_class());
  uint64_t v5 = [(NSString *)self->_identifier copy];
  uint64_t v6 = *(void **)&v4[6];
  *(void *)&v4[6] = v5;

  *(double *)&v4[8] = self->_minimumHeight;
  *(double *)&v4[10] = self->_preferredHeight;
  *(double *)&v4[14] = self->_assignedHeight;
  *(double *)&v4[16] = self->_collapsingHeight;
  *(void *)&v4[4] = 0;
  *(void *)&v4[18] = self->_priority;
  *(void *)&v4[20] = self->_order;
  $B130A0C233D57C7B44158004461CDAA8 flags = self->_flags;
  v4[2] = flags;
  *(unsigned char *)&v4[2] = *(unsigned char *)&flags & 0xE7;
  return v4;
}

- (_UIBarInsertLayoutData)init
{
  v6.receiver = self;
  v6.super_class = (Class)_UIBarInsertLayoutData;
  id v2 = [(_UIBarInsertLayoutData *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    identifier = v2->_identifier;
    v2->_identifier = (NSString *)&stru_1ED0E84C0;
  }
  return v3;
}

- (double)verticalOrigin
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0.0;
  }
  if ((*(unsigned char *)(a1 + 8) & 0x10) == 0)
  {
    if (os_variant_has_internal_diagnostics())
    {
      uint64_t v4 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      {
        int v5 = 138412290;
        uint64_t v6 = a1;
        _os_log_fault_impl(&dword_1853B0000, v4, OS_LOG_TYPE_FAULT, "Accessing invalid yOrigin on %@", (uint8_t *)&v5, 0xCu);
      }
    }
    else
    {
      id v3 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &verticalOrigin___s_category) + 8);
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        int v5 = 138412290;
        uint64_t v6 = a1;
        _os_log_impl(&dword_1853B0000, v3, OS_LOG_TYPE_ERROR, "Accessing invalid yOrigin on %@", (uint8_t *)&v5, 0xCu);
      }
    }
  }
  return *(double *)(a1 + 16);
}

+ (id)calculateRestingHeightsForLayouts:(uint64_t)a1
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  self;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v3 = v2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (!v4)
  {
    char v6 = 0;
    double v8 = 0.0;
    goto LABEL_15;
  }
  uint64_t v5 = v4;
  char v6 = 0;
  uint64_t v7 = *(void *)v29;
  double v8 = 0.0;
  do
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if (*(void *)v29 != v7) {
        objc_enumerationMutation(v3);
      }
      uint64_t v10 = *(void *)(*((void *)&v28 + 1) + 8 * i);
      if (*(unsigned char *)(v10 + 8)) {
        goto LABEL_9;
      }
      double v11 = *(double *)(v10 + 32);
      double v12 = *(double *)(v10 + 40);
      if (v11 < v12)
      {
        double v8 = v8 + v11;
LABEL_9:
        char v6 = 1;
        continue;
      }
      double v8 = v8 + v12;
    }
    uint64_t v5 = [v3 countByEnumeratingWithState:&v28 objects:v33 count:16];
  }
  while (v5);
LABEL_15:

  double v13 = objc_opt_new();
  uint64_t v14 = [NSNumber numberWithDouble:v8];
  [v13 addObject:v14];

  if (v6)
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v15 = v3;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v24 objects:v32 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v25;
      do
      {
        for (uint64_t j = 0; j != v17; ++j)
        {
          if (*(void *)v25 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void *)(*((void *)&v24 + 1) + 8 * j);
          double v21 = *(double *)(v20 + 40);
          if ((*(unsigned char *)(v20 + 8) & 1) == 0) {
            double v21 = v21 - *(double *)(v20 + 32);
          }
          if (v21 > 0.0)
          {
            double v8 = v8 + v21;
            double v22 = objc_msgSend(NSNumber, "numberWithDouble:", v8, (void)v24);
            [v13 addObject:v22];
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v24 objects:v32 count:16];
      }
      while (v17);
    }
  }
  return v13;
}

- (id)description
{
  v9.receiver = self;
  v9.super_class = (Class)_UIBarInsertLayoutData;
  id v3 = [(_UIBarInsertLayoutData *)&v9 description];
  uint64_t v4 = (void *)[v3 mutableCopy];

  if ([(NSString *)self->_identifier length]) {
    [v4 appendFormat:@" '%@'", self->_identifier];
  }
  objc_msgSend(v4, "appendFormat:", @" minimumHeight=%f preferredHeight=%f assignedHeight=%f", *(void *)&self->_minimumHeight, *(void *)&self->_preferredHeight, *(void *)&self->_assignedHeight);
  if (*(unsigned char *)&self->_flags)
  {
    if (self->_collapsingHeight >= self->_assignedHeight) {
      [v4 appendString:@" collapsible"];
    }
    else {
      objc_msgSend(v4, "appendFormat:", @" collapsingHeight=%f", *(void *)&self->_collapsingHeight);
    }
  }
  char flags = (char)self->_flags;
  if ((flags & 2) != 0 && ((*(unsigned char *)&self->_flags & 1) != 0 || self->_minimumHeight < self->_preferredHeight))
  {
    [v4 appendString:@" prefersExpanded"];
    char flags = (char)self->_flags;
  }
  if ((flags & 0x10) != 0) {
    objc_msgSend(v4, "appendFormat:", @" verticalOrigin=%f", *(void *)&self->_verticalOrigin);
  }
  if (self->_bottomInsetForTransitionProgress > 0.0) {
    objc_msgSend(v4, "appendFormat:", @" bottomInsetForTransitionProgress=%f", *(void *)&self->_bottomInsetForTransitionProgress);
  }
  char v6 = @" ignoredForCollapsingBehaviors";
  if ((*(unsigned char *)&self->_flags & 4) == 0) {
    char v6 = &stru_1ED0E84C0;
  }
  if ((*(unsigned char *)&self->_flags & 8) != 0) {
    uint64_t v7 = &stru_1ED0E84C0;
  }
  else {
    uint64_t v7 = @" inactive";
  }
  [v4 appendFormat:@" priority=%li order=%li%@%@", self->_priority, self->_order, v6, v7];
  return v4;
}

+ (id)layoutPriorToItemWithOrder:(void *)a3 inLayouts:
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  self;
  if ([v4 count])
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = 0;
      uint64_t v9 = *(void *)v18;
      uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_4:
      uint64_t v11 = 0;
      uint64_t v12 = v8;
      uint64_t v13 = v10;
      v8 += v7;
      uint64_t v10 = v8 - 1;
      while (1)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v14 = *(void *)(*((void *)&v17 + 1) + 8 * v11);
        if (v14) {
          uint64_t v14 = *(void *)(v14 + 80);
        }
        if (v14 <= a2) {
          break;
        }
        uint64_t v13 = v12++;
        if (v7 == ++v11)
        {
          uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
          uint64_t v13 = v8 - 1;
          if (v7) {
            goto LABEL_4;
          }
          break;
        }
      }

      if (v13 != 0x7FFFFFFFFFFFFFFFLL)
      {
        id v15 = objc_msgSend(v5, "objectAtIndexedSubscript:", v13, (void)v17);
        goto LABEL_16;
      }
    }
    else
    {
    }
  }
  id v15 = 0;
LABEL_16:

  return v15;
}

@end