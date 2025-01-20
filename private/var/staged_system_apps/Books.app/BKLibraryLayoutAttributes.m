@interface BKLibraryLayoutAttributes
+ (void)initialize;
+ (void)setGlobalLayoutDebugMode:(int)a3;
- (BKLibraryBookshelfCellMetrics)cellMetrics;
- (BKLibraryBookshelfColumnMetrics)columnMetrics;
- (BKLibraryBookshelfMainHeaderMetrics)mainHeaderMetrics;
- (BOOL)compactLayout;
- (BOOL)editMode;
- (BOOL)editable;
- (BOOL)firstItem;
- (BOOL)isEqual:(id)a3;
- (BOOL)lastItem;
- (BOOL)rtlLayout;
- (BOOL)useAllCaps;
- (BOOL)verticalStackedLayout;
- (NSDictionary)fontAttrs;
- (UIColor)foregroundColor;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)layoutDebugMode;
- (void)setCellMetrics:(id)a3;
- (void)setColumnMetrics:(id)a3;
- (void)setCompactLayout:(BOOL)a3;
- (void)setEditMode:(BOOL)a3;
- (void)setEditable:(BOOL)a3;
- (void)setFirstItem:(BOOL)a3;
- (void)setFontAttrs:(id)a3;
- (void)setForegroundColor:(id)a3;
- (void)setLastItem:(BOOL)a3;
- (void)setMainHeaderMetrics:(id)a3;
- (void)setRtlLayout:(BOOL)a3;
- (void)setUseAllCaps:(BOOL)a3;
- (void)setVerticalStackedLayout:(BOOL)a3;
@end

@implementation BKLibraryLayoutAttributes

+ (void)initialize
{
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___BKLibraryLayoutAttributes;
  [super initialize];
  uint64_t v2 = objc_opt_class();
  if (v2 == objc_opt_class())
  {
    v3 = +[NSUserDefaults standardUserDefaults];
    unsigned int v4 = [v3 BOOLForKey:@"BKLibraryBookshelfLayoutDebugEnabledUserDefaultsKey"];

    if (v4) {
      int v5 = 2;
    }
    else {
      int v5 = 0;
    }
    dword_100B4A230 = v5;
  }
}

+ (void)setGlobalLayoutDebugMode:(int)a3
{
  dword_100B4A230 = a3;
  v3 = +[NSUserDefaults standardUserDefaults];
  [v3 setBool:dword_100B4A230 == 2 forKey:@"BKLibraryBookshelfLayoutDebugEnabledUserDefaultsKey"];

  id v4 = +[NSUserDefaults standardUserDefaults];
  [v4 synchronize];
}

- (int)layoutDebugMode
{
  return dword_100B4A230;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)BKLibraryLayoutAttributes;
  id v4 = [(BKLibraryLayoutAttributes *)&v8 copyWithZone:a3];
  objc_storeStrong(v4 + 2, self->_foregroundColor);
  id v5 = [(NSDictionary *)self->_fontAttrs copy];
  id v6 = v4[3];
  v4[3] = v5;

  *((unsigned char *)v4 + 8) = self->_editable;
  objc_storeStrong(v4 + 5, self->_cellMetrics);
  objc_storeStrong(v4 + 4, self->_columnMetrics);
  objc_storeStrong(v4 + 6, self->_mainHeaderMetrics);
  *((unsigned char *)v4 + 9) = self->_rtlLayout;
  *((unsigned char *)v4 + 10) = self->_compactLayout;
  *((unsigned char *)v4 + 11) = self->_verticalStackedLayout;
  *((unsigned char *)v4 + 12) = self->_editMode;
  *((unsigned char *)v4 + 13) = self->_firstItem;
  *((unsigned char *)v4 + 14) = self->_lastItem;
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  v50.receiver = self;
  v50.super_class = (Class)BKLibraryLayoutAttributes;
  if (-[BKLibraryLayoutAttributes isEqual:](&v50, "isEqual:"))
  {
    objc_super v8 = [(BKLibraryLayoutAttributes *)self foregroundColor];
    v9 = [a3 foregroundColor];
    if (v8 != v9)
    {
      v3 = [(BKLibraryLayoutAttributes *)self foregroundColor];
      id v4 = [a3 foregroundColor];
      if (![v3 isEqual:v4])
      {
        LOBYTE(v10) = 0;
        goto LABEL_40;
      }
    }
    v11 = [(BKLibraryLayoutAttributes *)self fontAttrs];
    v12 = [a3 fontAttrs];
    if (v11 != v12)
    {
      v13 = [(BKLibraryLayoutAttributes *)self fontAttrs];
      id v5 = [a3 fontAttrs];
      if (![v13 isEqual:v5])
      {
        LOBYTE(v10) = 0;
        goto LABEL_38;
      }
      v49 = v13;
    }
    unsigned int v14 = [(BKLibraryLayoutAttributes *)self editable];
    if (v14 != [a3 editable])
    {
      LOBYTE(v10) = 0;
      v13 = v49;
      if (v11 == v12)
      {
LABEL_39:

        if (v8 == v9)
        {
LABEL_41:

          return v10;
        }
LABEL_40:

        goto LABEL_41;
      }
LABEL_38:

      goto LABEL_39;
    }
    v48 = v5;
    uint64_t v15 = [(BKLibraryLayoutAttributes *)self cellMetrics];
    uint64_t v16 = [a3 cellMetrics];
    v17 = (void *)v16;
    v47 = (void *)v15;
    if (v15 == v16)
    {
      v46 = (void *)v16;
    }
    else
    {
      v18 = [(BKLibraryLayoutAttributes *)self cellMetrics];
      v41 = [a3 cellMetrics];
      v42 = v18;
      if (!objc_msgSend(v18, "isEqual:"))
      {
        LOBYTE(v10) = 0;
        v13 = v49;
        v22 = v47;
LABEL_36:

LABEL_37:
        id v5 = v48;
        if (v11 == v12) {
          goto LABEL_39;
        }
        goto LABEL_38;
      }
      v46 = v17;
    }
    uint64_t v19 = [(BKLibraryLayoutAttributes *)self columnMetrics];
    [a3 columnMetrics];
    uint64_t v45 = v44 = (void *)v19;
    BOOL v20 = v19 == v45;
    v13 = v49;
    v43 = v3;
    if (!v20)
    {
      v21 = [(BKLibraryLayoutAttributes *)self columnMetrics];
      v38 = [a3 columnMetrics];
      v39 = v21;
      if (!objc_msgSend(v21, "isEqual:"))
      {
        LOBYTE(v10) = 0;
        v22 = v47;
        v23 = v44;
        v24 = (void *)v45;
LABEL_34:

LABEL_35:
        v17 = v46;
        v3 = v43;
        if (v22 == v46) {
          goto LABEL_37;
        }
        goto LABEL_36;
      }
    }
    v25 = [(BKLibraryLayoutAttributes *)self mainHeaderMetrics];
    v40 = [a3 mainHeaderMetrics];
    if (v25 == v40
      || ([(BKLibraryLayoutAttributes *)self mainHeaderMetrics],
          v26 = objc_claimAutoreleasedReturnValue(),
          [a3 mainHeaderMetrics],
          v36 = objc_claimAutoreleasedReturnValue(),
          v37 = v26,
          objc_msgSend(v26, "isEqual:")))
    {
      unsigned int v28 = [(BKLibraryLayoutAttributes *)self rtlLayout];
      if (v28 == [a3 rtlLayout]
        && (unsigned int v29 = [(BKLibraryLayoutAttributes *)self compactLayout],
            v29 == [a3 compactLayout])
        && (unsigned int v30 = [(BKLibraryLayoutAttributes *)self verticalStackedLayout],
            v30 == [a3 verticalStackedLayout])
        && (unsigned int v31 = [(BKLibraryLayoutAttributes *)self editMode],
            v31 == [a3 editMode])
        && (unsigned int v32 = [(BKLibraryLayoutAttributes *)self firstItem],
            v32 == [a3 firstItem]))
      {
        unsigned int v35 = [(BKLibraryLayoutAttributes *)self lastItem];
        unsigned int v10 = v35 ^ [a3 lastItem] ^ 1;
        char v33 = v10;
      }
      else
      {
        LOBYTE(v10) = 0;
        char v33 = 0;
      }
      v27 = v40;
      if (v25 == v40)
      {

        LOBYTE(v10) = v33;
LABEL_33:
        v23 = v44;
        v24 = (void *)v45;
        v13 = v49;
        v22 = v47;
        if (v44 == (void *)v45) {
          goto LABEL_35;
        }
        goto LABEL_34;
      }
    }
    else
    {
      LOBYTE(v10) = 0;
      v27 = v40;
    }

    goto LABEL_33;
  }
  LOBYTE(v10) = 0;
  return v10;
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)BKLibraryLayoutAttributes;
  v3 = [(BKLibraryLayoutAttributes *)&v6 description];
  id v4 = +[NSMutableString stringWithFormat:@"%@ ", v3];

  if (self->_cellMetrics) {
    [v4 appendFormat:@"cellMetrics: (%@); ", self->_cellMetrics];
  }

  return v4;
}

- (UIColor)foregroundColor
{
  return self->_foregroundColor;
}

- (void)setForegroundColor:(id)a3
{
}

- (NSDictionary)fontAttrs
{
  return self->_fontAttrs;
}

- (void)setFontAttrs:(id)a3
{
}

- (BOOL)editable
{
  return self->_editable;
}

- (void)setEditable:(BOOL)a3
{
  self->_editable = a3;
}

- (BKLibraryBookshelfColumnMetrics)columnMetrics
{
  return self->_columnMetrics;
}

- (void)setColumnMetrics:(id)a3
{
}

- (BKLibraryBookshelfCellMetrics)cellMetrics
{
  return self->_cellMetrics;
}

- (void)setCellMetrics:(id)a3
{
}

- (BKLibraryBookshelfMainHeaderMetrics)mainHeaderMetrics
{
  return self->_mainHeaderMetrics;
}

- (void)setMainHeaderMetrics:(id)a3
{
}

- (BOOL)rtlLayout
{
  return self->_rtlLayout;
}

- (void)setRtlLayout:(BOOL)a3
{
  self->_rtlLayout = a3;
}

- (BOOL)compactLayout
{
  return self->_compactLayout;
}

- (void)setCompactLayout:(BOOL)a3
{
  self->_compactLayout = a3;
}

- (BOOL)verticalStackedLayout
{
  return self->_verticalStackedLayout;
}

- (void)setVerticalStackedLayout:(BOOL)a3
{
  self->_verticalStackedLayout = a3;
}

- (BOOL)editMode
{
  return self->_editMode;
}

- (void)setEditMode:(BOOL)a3
{
  self->_editMode = a3;
}

- (BOOL)firstItem
{
  return self->_firstItem;
}

- (void)setFirstItem:(BOOL)a3
{
  self->_firstItem = a3;
}

- (BOOL)lastItem
{
  return self->_lastItem;
}

- (void)setLastItem:(BOOL)a3
{
  self->_lastItem = a3;
}

- (BOOL)useAllCaps
{
  return self->_useAllCaps;
}

- (void)setUseAllCaps:(BOOL)a3
{
  self->_useAllCaps = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mainHeaderMetrics, 0);
  objc_storeStrong((id *)&self->_cellMetrics, 0);
  objc_storeStrong((id *)&self->_columnMetrics, 0);
  objc_storeStrong((id *)&self->_fontAttrs, 0);

  objc_storeStrong((id *)&self->_foregroundColor, 0);
}

@end