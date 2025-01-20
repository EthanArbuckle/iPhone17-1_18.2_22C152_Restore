@interface SKUIHorizontalLockupLayout
+ (id)fontForButtonViewElement:(id)a3 context:(id)a4;
+ (id)fontForLabelViewElement:(id)a3 context:(id)a4;
+ (id)fontForOrdinalViewElement:(id)a3 context:(id)a4;
- (CGSize)_sizeForRightAlignedColumn:(id)a3 width:(double)a4 context:(id)a5;
- (CGSize)_sizeForViewElement:(id)a3 width:(int64_t)a4 context:(id)a5;
- (NSArray)columns;
- (SKUIHorizontalLockupLayout)initWithLockup:(id)a3 context:(id)a4;
- (UIEdgeInsets)metadataColumnEdgeInsets;
- (double)_heightForMetadataColumn:(id)a3 width:(double)a4 context:(id)a5;
- (double)bottomPaddingForViewElement:(id)a3;
- (double)columnSpacingForColumnIdentifier:(int64_t)a3;
- (double)topPaddingForViewElement:(id)a3;
- (void)sizeColumnsToFitWidth:(double)a3 context:(id)a4;
@end

@implementation SKUIHorizontalLockupLayout

- (SKUIHorizontalLockupLayout)initWithLockup:(id)a3 context:(id)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIHorizontalLockupLayout initWithLockup:context:]();
  }
  v48.receiver = self;
  v48.super_class = (Class)SKUIHorizontalLockupLayout;
  v8 = [(SKUIHorizontalLockupLayout *)&v48 init];
  if (v8)
  {
    int v9 = [v6 containsElementGroups];
    v49[0] = xmmword_1C1CCC110;
    v49[1] = xmmword_1C1CCC120;
    v49[2] = xmmword_1C1CCC130;
    uint64_t v50 = 6;
    v10 = (void *)[objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:1282 valueOptions:0 capacity:7];
    v47[0] = 0;
    v47[1] = v47;
    v47[2] = 0x2020000000;
    v47[3] = 0;
    v45[0] = 0;
    v45[1] = v45;
    v45[2] = 0x2020000000;
    char v46 = 0;
    v43[0] = 0;
    v43[1] = v43;
    v43[2] = 0x2020000000;
    char v44 = 0;
    v42[0] = 0;
    v42[1] = v42;
    v42[2] = 0x2020000000;
    uint64_t v11 = 3;
    if (v9) {
      uint64_t v11 = 4;
    }
    v42[3] = v11;
    if ([v6 lockupViewType] == 6) {
      double v12 = 0.0;
    }
    else {
      double v12 = 10.0;
    }
    char v41 = 0;
    v13 = [v6 firstChildForElementType:49];
    v14 = [v13 style];
    SKUIViewElementMarginForStyle(v14, &v41);
    double v16 = v15;

    if (v41) {
      double v17 = v16;
    }
    else {
      double v17 = v12;
    }
    *((double *)v8 + 2) = v17;
    if ([v6 lockupViewType] == 7)
    {
      *(_OWORD *)(v8 + 24) = xmmword_1C1CCC140;
      *(_OWORD *)(v8 + 40) = xmmword_1C1CCC150;
      uint64_t v18 = 0x4052000000000000;
    }
    else
    {
      if ([v6 lockupViewType] == 6)
      {
        __asm { FMOV            V0.2D, #15.0 }
        *(_OWORD *)(v8 + 24) = _Q0;
        *(_OWORD *)(v8 + 40) = _Q0;
      }
      else
      {
        long long v24 = *(_OWORD *)(MEMORY[0x1E4FB2848] + 16);
        *(_OWORD *)(v8 + 24) = *MEMORY[0x1E4FB2848];
        *(_OWORD *)(v8 + 40) = v24;
      }
      uint64_t v18 = 0;
    }
    *((void *)v8 + 7) = v18;
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __53__SKUIHorizontalLockupLayout_initWithLockup_context___block_invoke;
    v31[3] = &unk_1E64286C8;
    v35 = v42;
    char v40 = v9 ^ 1;
    id v32 = v6;
    v36 = v45;
    v37 = v43;
    id v33 = v7;
    v38 = v47;
    uint64_t v39 = 6;
    v25 = v10;
    v34 = v25;
    [v32 enumerateChildrenUsingBlock:v31];
    uint64_t v26 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMapTable count](v25, "count"));
    v27 = (void *)*((void *)v8 + 1);
    *((void *)v8 + 1) = v26;

    for (uint64_t i = 0; i != 56; i += 8)
    {
      v29 = NSMapGet(v25, (const void *)(*(void *)((char *)v49 + i) + 1));
      if (v29) {
        [*((id *)v8 + 1) addObject:v29];
      }
    }
    _Block_object_dispose(v42, 8);
    _Block_object_dispose(v43, 8);
    _Block_object_dispose(v45, 8);
    _Block_object_dispose(v47, 8);
  }
  return (SKUIHorizontalLockupLayout *)v8;
}

void __53__SKUIHorizontalLockupLayout_initWithLockup_context___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  id v23 = v3;
  id v5 = v23;
  if ([v23 elementType] == 90)
  {
    id v6 = [v23 flattenedChildren];
    id v7 = [v6 firstObject];

    id v5 = v23;
    if (v7)
    {
      id v5 = v7;
    }
  }
  uint64_t v8 = [v5 elementType];
  if (v8 <= 76)
  {
    if (v8 > 31)
    {
      switch(v8)
      {
        case '0':
          goto LABEL_52;
        case '1':
        case '3':
          goto LABEL_36;
        case '2':
          if (!*(unsigned char *)(a1 + 96)) {
            goto LABEL_52;
          }
          int v9 = [v5 style];
          v10 = [v9 columnType];
          int v11 = [v10 isEqualToString:@"buttons"];

          if (!v11) {
            goto LABEL_52;
          }
          goto LABEL_29;
        default:
          if (v8 == 32 || v8 == 62) {
            goto LABEL_52;
          }
          break;
      }
      goto LABEL_55;
    }
    if (v8 <= 11)
    {
      if (v8 == 7)
      {
        uint64_t v20 = [v23 firstChildForElementType:49];
        if (!v20) {
          goto LABEL_55;
        }
        v21 = (void *)v20;

        uint64_t v4 = 5;
        id v5 = v21;
      }
      else if (v8 != 8)
      {
        goto LABEL_55;
      }
      goto LABEL_52;
    }
    if ((unint64_t)(v8 - 12) >= 2)
    {
      if (v8 != 29) {
        goto LABEL_55;
      }
      if (!*(unsigned char *)(a1 + 96)) {
        goto LABEL_52;
      }
      uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8);
      uint64_t v4 = 2;
      goto LABEL_30;
    }
LABEL_28:
    if (!*(unsigned char *)(a1 + 96))
    {
LABEL_52:
      NSMapGet(*(NSMapTable **)(a1 + 48), (const void *)(v4 + 1));
      v22 = (SKUIHorizontalLockupColumn *)objc_claimAutoreleasedReturnValue();
      if (!v22)
      {
        v22 = objc_alloc_init(SKUIHorizontalLockupColumn);
        [(SKUIHorizontalLockupColumn *)v22 setIdentifier:v4];
        NSMapInsert(*(NSMapTable **)(a1 + 48), (const void *)(v4 + 1), v22);
      }
      [(SKUIHorizontalLockupColumn *)v22 _addChildViewElement:v5];

      goto LABEL_55;
    }
LABEL_29:
    uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v4 = 1;
LABEL_30:
    *(void *)(v15 + 24) = v4;
    goto LABEL_52;
  }
  if (v8 > 134)
  {
    switch(v8)
    {
      case 135:
      case 144:
        goto LABEL_52;
      case 136:
      case 137:
      case 139:
      case 140:
      case 142:
      case 143:
        goto LABEL_55;
      case 138:
        if ([*(id *)(a1 + 32) lockupViewType] != 7) {
          goto LABEL_52;
        }
        double v12 = [v5 text];
        v13 = [v12 string];

        uint64_t v14 = [v13 length];
        if (v14) {
          goto LABEL_52;
        }
        goto LABEL_55;
      case 141:
        goto LABEL_28;
      default:
        if (v8 != 152 && v8 != 154) {
          goto LABEL_55;
        }
LABEL_36:
        if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) && *(unsigned char *)(a1 + 96))
        {
          if ([*(id *)(a1 + 32) lockupViewType] == 7) {
            uint64_t v4 = 6;
          }
          else {
            uint64_t v4 = 0;
          }
          *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
        }
        break;
    }
    goto LABEL_52;
  }
  if (v8 <= 89)
  {
    if (v8 != 77)
    {
      if (v8 != 80) {
        goto LABEL_55;
      }
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)) {
        goto LABEL_55;
      }
      if (!*(unsigned char *)(a1 + 96)) {
        goto LABEL_55;
      }
      double v16 = [*(id *)(a1 + 40) aggregateValueForKey:0x1F1C92648];
      int v17 = [v16 BOOLValue];

      if (!v17) {
        goto LABEL_55;
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
      uint64_t v4 = 4;
      goto LABEL_52;
    }
    goto LABEL_28;
  }
  if (v8 == 90)
  {
    uint64_t v4 = 0;
    goto LABEL_52;
  }
  if (v8 == 127)
  {
    uint64_t v18 = *(void *)(*(void *)(a1 + 80) + 8);
    uint64_t v19 = *(void *)(v18 + 24);
    if (v19 < *(void *)(a1 + 88) - 1)
    {
      v24[0] = xmmword_1C1CCC110;
      v24[1] = xmmword_1C1CCC120;
      v24[2] = xmmword_1C1CCC130;
      uint64_t v25 = 6;
      *(void *)(v18 + 24) = v19 + 1;
      *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = *((void *)v24
                                                                    + *(void *)(*(void *)(*(void *)(a1 + 80) + 8)
                                                                                + 24));
    }
  }
LABEL_55:
}

+ (id)fontForButtonViewElement:(id)a3 context:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    +[SKUIHorizontalLockupLayout fontForButtonViewElement:context:]();
  }
  id v7 = [v5 buttonTitleStyle];
  uint64_t v8 = v7;
  if (v7)
  {
    int v9 = SKUIViewElementFontWithStyle(v7);
  }
  else
  {
    v10 = [v5 style];
    int v9 = SKUIViewElementFontWithStyle(v10);
  }
  if (!v9)
  {
    if ([v6 containerViewElementType] == 118) {
      uint64_t v11 = 8;
    }
    else {
      uint64_t v11 = 7;
    }
    int v9 = SKUIFontLimitedPreferredFontForTextStyle(v11, 5);
  }

  return v9;
}

+ (id)fontForLabelViewElement:(id)a3 context:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    +[SKUIHorizontalLockupLayout fontForLabelViewElement:context:]();
  }
  id v7 = [v5 style];
  uint64_t v8 = SKUIViewElementFontWithStyle(v7);

  if (!v8)
  {
    unint64_t v9 = [v5 labelViewStyle];
    if (v9 > 5)
    {
      uint64_t v8 = 0;
    }
    else
    {
      if (((1 << v9) & 0x1B) != 0)
      {
        if ([v6 containerViewElementType] == 118) {
          uint64_t v10 = 8;
        }
        else {
          uint64_t v10 = 7;
        }
      }
      else if ([v6 containerViewElementType] == 118)
      {
        uint64_t v10 = 6;
      }
      else
      {
        uint64_t v10 = 19;
      }
      uint64_t v8 = SKUIFontLimitedPreferredFontForTextStyle(v10, 5);
    }
  }

  return v8;
}

+ (id)fontForOrdinalViewElement:(id)a3 context:(id)a4
{
  id v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    +[SKUIHorizontalLockupLayout fontForOrdinalViewElement:context:]();
  }
  id v5 = [v4 style];
  id v6 = SKUIViewElementFontWithStyle(v5);

  if (!v6)
  {
    id v7 = SKUIFontForTextStyle(25);
    uint64_t v8 = (void *)MEMORY[0x1E4FB08E0];
    [v7 pointSize];
    id v6 = objc_msgSend(v8, "_lightSystemFontOfSize:");
  }

  return v6;
}

- (double)bottomPaddingForViewElement:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 elementType];
  double v6 = 0.0;
  if (v5 <= 76)
  {
    if (v5 == 8)
    {
      if ([v4 badgeType] == 1) {
        double v6 = 2.0;
      }
      else {
        double v6 = 0.0;
      }
      goto LABEL_13;
    }
    if (v5 != 13) {
      goto LABEL_13;
    }
LABEL_9:
    double v6 = 5.0;
    goto LABEL_13;
  }
  if (v5 == 77) {
    goto LABEL_9;
  }
  if ((v5 == 135 || v5 == 138) && self->_tallestNonMetadataColumnHeight > 60.0) {
    double v6 = 2.0;
  }
LABEL_13:

  return v6;
}

- (double)columnSpacingForColumnIdentifier:(int64_t)a3
{
  double result = 0.0;
  if ((unint64_t)(a3 - 4) >= 3)
  {
    if (a3) {
      return 15.0;
    }
    else {
      return self->_imageMarginRight;
    }
  }
  return result;
}

- (void)sizeColumnsToFitWidth:(double)a3 context:(id)a4
{
  id v6 = a4;
  uint64_t v31 = 0;
  id v32 = &v31;
  uint64_t v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__65;
  v35 = __Block_byref_object_dispose__65;
  id v36 = 0;
  uint64_t v25 = 0;
  uint64_t v26 = (double *)&v25;
  uint64_t v27 = 0x3010000000;
  v28 = &unk_1C1D0F257;
  double v29 = a3;
  uint64_t v30 = 0;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2020000000;
  uint64_t v24 = 0;
  self->_tallestNonMetadataColumnHeight = 0.0;
  uint64_t v7 = [(NSMutableArray *)self->_columns count];
  columns = self->_columns;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __60__SKUIHorizontalLockupLayout_sizeColumnsToFitWidth_context___block_invoke;
  v14[3] = &unk_1E64286F0;
  uint64_t v19 = v7;
  v14[4] = self;
  double v20 = a3;
  id v9 = v6;
  id v15 = v9;
  double v16 = &v25;
  int v17 = &v21;
  uint64_t v18 = &v31;
  [(NSMutableArray *)columns enumerateObjectsUsingBlock:v14];
  uint64_t v10 = v32[5];
  if (v10)
  {
    [(SKUIHorizontalLockupLayout *)self _heightForMetadataColumn:v10 width:v9 context:v26[4]];
    uint64_t v11 = v26;
    double metadataColumnMinHeight = v12 + self->_metadataColumnEdgeInsets.top + self->_metadataColumnEdgeInsets.bottom;
    v26[5] = metadataColumnMinHeight;
    v11[4] = v11[4] - self->_metadataColumnEdgeInsets.left - self->_metadataColumnEdgeInsets.right;
    if (metadataColumnMinHeight < self->_metadataColumnMinHeight) {
      double metadataColumnMinHeight = self->_metadataColumnMinHeight;
    }
    v11[5] = metadataColumnMinHeight;
    objc_msgSend((id)v32[5], "setSize:");
  }
  *(void *)&self->_tallestNonMetadataColumnHeight = v22[3];

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);
}

void __60__SKUIHorizontalLockupLayout_sizeColumnsToFitWidth_context___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v28 = a2;
  uint64_t v6 = [v28 identifier];
  double v7 = 0.0;
  if (*(void *)(a1 + 72) - 1 > a3)
  {
    [*(id *)(a1 + 32) columnSpacingForColumnIdentifier:v6];
    double v7 = v8;
  }
  switch(v6)
  {
    case 0:
      uint64_t v14 = [v28 childViewElements];
      id v15 = [v14 firstObject];

      [*(id *)(a1 + 32) _sizeForViewElement:v15 width:(uint64_t)*(double *)(a1 + 80) context:*(void *)(a1 + 40)];
      *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 32) = *(double *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                              + 32)
                                                                  - (v7
                                                                   + v17);
      goto LABEL_10;
    case 1:
    case 2:
      [*(id *)(a1 + 32) _sizeForRightAlignedColumn:v28 width:*(void *)(a1 + 40) context:*(double *)(a1 + 80)];
      *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 32) = *(double *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                              + 32)
                                                                  - (v7
                                                                   + v9);
      uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
      double v12 = *(double *)(v11 + 24);
      if (v12 < v10) {
        double v12 = v10;
      }
      *(double *)(v11 + 24) = v12;
      v13 = v28;
      goto LABEL_14;
    case 3:
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), a2);
      *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 32) = *(double *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                              + 32)
                                                                  - v7;
      break;
    case 4:
      uint64_t v21 = [v28 childViewElements];
      v22 = [v21 firstObject];

      uint64_t v23 = [(id)objc_opt_class() fontForOrdinalViewElement:v22 context:*(void *)(a1 + 40)];
      [v23 lineHeight];
      *(float *)&double v24 = v24;
      double v25 = ceilf(*(float *)&v24);
      *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 32) = *(double *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                              + 32)
                                                                  - (v7
                                                                   + 43.0
                                                                   - v7);
      uint64_t v26 = *(void *)(*(void *)(a1 + 56) + 8);
      double v27 = *(double *)(v26 + 24);
      if (v27 < v25) {
        double v27 = v25;
      }
      *(double *)(v26 + 24) = v27;
      [v28 setSize:43.0 - v7];

      break;
    case 5:
      uint64_t v18 = [v28 childViewElements];
      id v15 = [v18 firstObject];

      [*(id *)(a1 + 32) _sizeForViewElement:v15 width:(uint64_t)*(double *)(a1 + 80) context:*(void *)(a1 + 40)];
LABEL_10:
      uint64_t v19 = *(void *)(*(void *)(a1 + 56) + 8);
      double v20 = *(double *)(v19 + 24);
      if (v20 < v16) {
        double v20 = v16;
      }
      *(double *)(v19 + 24) = v20;
      objc_msgSend(v28, "setSize:");

      break;
    case 6:
      double v9 = *(double *)(a1 + 80);
      v13 = v28;
      double v10 = v9;
LABEL_14:
      objc_msgSend(v13, "setSize:", v9, v10);
      break;
    default:
      break;
  }
}

- (double)topPaddingForViewElement:(id)a3
{
  id v3 = a3;
  if ([v3 elementType] != 8 || (double v4 = 3.0, objc_msgSend(v3, "badgeType") != 1)) {
    double v4 = 0.0;
  }

  return v4;
}

- (double)_heightForMetadataColumn:(id)a3 width:(double)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v19 = 0;
  double v20 = (double *)&v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0;
  double v10 = [v8 childViewElements];
  uint64_t v11 = [v10 count];
  if (v11 >= 1)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __69__SKUIHorizontalLockupLayout__heightForMetadataColumn_width_context___block_invoke;
    v14[3] = &unk_1E6427000;
    v14[4] = self;
    double v17 = a4;
    id v15 = v9;
    double v16 = &v19;
    uint64_t v18 = v11;
    [v10 enumerateObjectsUsingBlock:v14];
  }
  double v12 = v20[3];

  _Block_object_dispose(&v19, 8);
  return v12;
}

uint64_t __69__SKUIHorizontalLockupLayout__heightForMetadataColumn_width_context___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v10 = a2;
  objc_opt_class();
  uint64_t isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) == 0)
  {
    uint64_t isKindOfClass = [*(id *)(a1 + 32) _sizeForViewElement:v10 width:(uint64_t)*(double *)(a1 + 56) context:*(void *)(a1 + 40)];
    *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v6
                                                                + *(double *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
    if (*(void *)(a1 + 64) - 1 > a3)
    {
      uint64_t isKindOfClass = [*(id *)(a1 + 32) bottomPaddingForViewElement:v10];
      *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v7
                                                                  + *(double *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                              + 24);
    }
    if (a3)
    {
      uint64_t isKindOfClass = [*(id *)(a1 + 32) topPaddingForViewElement:v10];
      *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v8
                                                                  + *(double *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                              + 24);
    }
  }

  return MEMORY[0x1F4181820](isKindOfClass);
}

- (CGSize)_sizeForRightAlignedColumn:(id)a3 width:(double)a4 context:(id)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  uint64_t v33 = 0;
  v34 = (double *)&v33;
  uint64_t v35 = 0x3010000000;
  id v36 = &unk_1C1D0F257;
  long long v37 = *MEMORY[0x1E4F1DB30];
  id v10 = [v8 childViewElements];
  uint64_t v11 = [v10 count];
  if (v11 >= 1)
  {
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __71__SKUIHorizontalLockupLayout__sizeForRightAlignedColumn_width_context___block_invoke;
    v28[3] = &unk_1E6427000;
    v28[4] = self;
    double v31 = a4;
    id v12 = v9;
    id v29 = v12;
    uint64_t v30 = &v33;
    uint64_t v32 = v11;
    [v10 enumerateObjectsUsingBlock:v28];
    id v23 = v9;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v13 = v10;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v38 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v25 != v15) {
            objc_enumerationMutation(v13);
          }
          double v17 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          if ([v17 elementType] == 138)
          {
            [(SKUIHorizontalLockupLayout *)self _sizeForViewElement:v17 width:(uint64_t)a4 context:v12];
            v34[5] = v18 + v34[5];
          }
        }
        uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v38 count:16];
      }
      while (v14);
    }

    id v9 = v23;
  }
  double v19 = v34[4];
  double v20 = v34[5];

  _Block_object_dispose(&v33, 8);
  double v21 = v19;
  double v22 = v20;
  result.height = v22;
  result.width = v21;
  return result;
}

void __71__SKUIHorizontalLockupLayout__sizeForRightAlignedColumn_width_context___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v11 = a2;
  if ([v11 elementType] != 138)
  {
    [*(id *)(a1 + 32) _sizeForViewElement:v11 width:(uint64_t)*(double *)(a1 + 56) context:*(void *)(a1 + 40)];
    *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = v6
                                                                + *(double *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 40);
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
    if (*(double *)(v7 + 32) >= v5) {
      double v5 = *(double *)(v7 + 32);
    }
    *(double *)(v7 + 32) = v5;
  }
  if (*(void *)(a1 + 64) - 1 > a3)
  {
    [*(id *)(a1 + 32) bottomPaddingForViewElement:v11];
    *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = v8
                                                                + *(double *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 40);
  }
  id v9 = v11;
  if (a3)
  {
    [*(id *)(a1 + 32) topPaddingForViewElement:v11];
    id v9 = v11;
    *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = v10
                                                                + *(double *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 40);
  }
}

- (CGSize)_sizeForViewElement:(id)a3 width:(int64_t)a4 context:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  if ([v8 elementType] == 90
    && ([v8 flattenedChildren],
        id v9 = objc_claimAutoreleasedReturnValue(),
        v8,
        [v9 firstObject],
        id v8 = (id)objc_claimAutoreleasedReturnValue(),
        v9,
        !v8))
  {
    double v11 = 29.0;
    double v13 = 29.0;
  }
  else
  {
    [v7 sizeForViewElement:v8 width:(double)a4];
    double v11 = v10;
    double v13 = v12;
  }

  double v14 = v11;
  double v15 = v13;
  result.height = v15;
  result.width = v14;
  return result;
}

- (NSArray)columns
{
  return &self->_columns->super;
}

- (UIEdgeInsets)metadataColumnEdgeInsets
{
  double top = self->_metadataColumnEdgeInsets.top;
  double left = self->_metadataColumnEdgeInsets.left;
  double bottom = self->_metadataColumnEdgeInsets.bottom;
  double right = self->_metadataColumnEdgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void).cxx_destruct
{
}

- (void)initWithLockup:context:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIHorizontalLockupLayout initWithLockup:context:]";
}

+ (void)fontForButtonViewElement:context:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "+[SKUIHorizontalLockupLayout fontForButtonViewElement:context:]";
}

+ (void)fontForLabelViewElement:context:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "+[SKUIHorizontalLockupLayout fontForLabelViewElement:context:]";
}

+ (void)fontForOrdinalViewElement:context:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "+[SKUIHorizontalLockupLayout fontForOrdinalViewElement:context:]";
}

@end