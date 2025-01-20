@interface _UIContextMenuSection
+ (id)sectionWithMenu:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMultiColorPalette;
- (BOOL)isRoot;
- (BOOL)wantsSectionSeparator;
- (NSString)title;
- (int64_t)cellSizeGivenTraits:(id)a3;
- (int64_t)layout;
- (int64_t)preferredCellSize;
- (unint64_t)actionLineLimit;
- (unint64_t)hash;
- (void)setIsRoot:(BOOL)a3;
- (void)setWantsSectionSeparator:(BOOL)a3;
@end

@implementation _UIContextMenuSection

+ (id)sectionWithMenu:(id)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = objc_opt_new();
  uint64_t v5 = [MEMORY[0x1E4F29128] UUID];
  v6 = *(void **)(v4 + 8);
  *(void *)(v4 + 8) = v5;

  if ([v3 _omitsInlineTitle])
  {
    v7 = *(void **)(v4 + 24);
    *(void *)(v4 + 24) = &stru_1ED0E84C0;
  }
  else
  {
    uint64_t v8 = [v3 title];
    v7 = *(void **)(v4 + 24);
    *(void *)(v4 + 24) = v8;
  }

  v9 = +[UIDevice currentDevice];
  v10 = _UIContextMenuGetPlatformMetrics([v9 userInterfaceIdiom]);

  uint64_t v11 = [v3 _resolvedElementSize];
  v51 = v10;
  if (([v3 options] & 0x80) != 0)
  {
    uint64_t v50 = v4;
    if ([v10 supportsLargePaletteMenus]) {
      uint64_t v32 = v11;
    }
    else {
      uint64_t v32 = 0;
    }
    uint64_t v47 = _UIContextMenuCellSizeForElementSize(v32);
    v33 = [v10 gradientMaskingConfiguration];
    BOOL v48 = v33 != 0;

    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    v34 = [v3 children];
    uint64_t v35 = [v34 countByEnumeratingWithState:&v52 objects:v56 count:16];
    if (v35)
    {
      uint64_t v36 = v35;
      uint64_t v37 = *(void *)v53;
      do
      {
        for (uint64_t i = 0; i != v36; ++i)
        {
          if (*(void *)v53 != v37) {
            objc_enumerationMutation(v34);
          }
          v39 = *(void **)(*((void *)&v52 + 1) + 8 * i);
          v40 = [v39 image];
          if ([v40 _isSymbolImage])
          {
            v41 = [v39 image];
            v42 = [v41 symbolConfiguration];
            v43 = [v42 _colors];
            uint64_t v44 = [v43 count];

            if (v44)
            {
              *(unsigned char *)(v50 + 19) = 1;
              goto LABEL_38;
            }
          }
          else
          {
          }
        }
        uint64_t v36 = [v34 countByEnumeratingWithState:&v52 objects:v56 count:16];
      }
      while (v36);
    }
LABEL_38:

    BOOL v27 = 0;
    int64x2_t v17 = vdupq_n_s64(1uLL);
    v17.i64[0] = v47;
    uint64_t v4 = v50;
    char v31 = v48;
  }
  else
  {
    v12 = [v10 overrideElementSize];

    if (v12)
    {
      v13 = [v10 overrideElementSize];
      uint64_t v11 = v13[2](v13, v11);
    }
    uint64_t v14 = _UIContextMenuCellSizeForElementSize(v11);
    uint64_t v15 = 3;
    if (v14 != 1) {
      uint64_t v15 = 0;
    }
    if (v14) {
      unint64_t v16 = v15;
    }
    else {
      unint64_t v16 = 4;
    }
    int64x2_t v17 = (int64x2_t)(unint64_t)v14;
    if (v16)
    {
      int64x2_t v49 = (int64x2_t)(unint64_t)v14;
      v18 = [v3 children];
      unint64_t v19 = [v18 count];

      if (v16 >= v19) {
        unint64_t v20 = v19;
      }
      else {
        unint64_t v20 = v16;
      }
      if (v20)
      {
        uint64_t v21 = v4;
        unint64_t v22 = 0;
        do
        {
          v23 = [v3 children];
          v24 = [v23 objectAtIndexedSubscript:v22];

          v25 = [v24 title];
          uint64_t v26 = [v25 length];
          BOOL v27 = v26 != 0;

          if (v26) {
            break;
          }
          ++v22;
          v28 = [v3 children];
          unint64_t v29 = [v28 count];

          unint64_t v30 = v16 >= v29 ? v29 : v16;
        }
        while (v30 > v22);
        char v31 = 1;
        uint64_t v4 = v21;
      }
      else
      {
        BOOL v27 = 0;
        char v31 = 1;
      }
      int64x2_t v17 = v49;
    }
    else
    {
      BOOL v27 = 0;
      char v31 = 1;
    }
  }
  *(int64x2_t *)(v4 + 32) = v17;
  *(unsigned char *)(v4 + 18) = v31;
  *(unsigned char *)(v4 + 16) = v27;
  v45 = [v3 displayPreferences];
  *(void *)(v4 + 48) = [v45 maximumNumberOfTitleLines];

  return (id)v4;
}

- (int64_t)cellSizeGivenTraits:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(_UIContextMenuSection *)self preferredCellSize];
  int64_t v6 = v5;
  if (self->_overridesCellSizeForLargeText && v5 == 1)
  {
    uint64_t v8 = [v4 preferredContentSizeCategory];
    int IsAccessibilityContentSizeCategory = _UIContentSizeCategoryIsAccessibilityContentSizeCategory(v8, v9);

    if (IsAccessibilityContentSizeCategory) {
      int64_t v6 = 2;
    }
    else {
      int64_t v6 = 1;
    }
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v5 = [(NSUUID *)self->_identifier isEqual:v4[1]];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  return [(NSUUID *)self->_identifier hash];
}

- (BOOL)isRoot
{
  return self->_isRoot;
}

- (void)setIsRoot:(BOOL)a3
{
  self->_isRoot = a3;
}

- (BOOL)wantsSectionSeparator
{
  return self->_wantsSectionSeparator;
}

- (void)setWantsSectionSeparator:(BOOL)a3
{
  self->_wantsSectionSeparator = a3;
}

- (NSString)title
{
  return self->_title;
}

- (int64_t)preferredCellSize
{
  return self->_preferredCellSize;
}

- (int64_t)layout
{
  return self->_layout;
}

- (unint64_t)actionLineLimit
{
  return self->_actionLineLimit;
}

- (BOOL)isMultiColorPalette
{
  return self->_isMultiColorPalette;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end