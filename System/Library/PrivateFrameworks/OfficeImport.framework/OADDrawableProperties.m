@interface OADDrawableProperties
- (BOOL)hasAltDescription;
- (BOOL)hasAltTitle;
- (BOOL)hasAspectRatioLocked;
- (BOOL)hasClickHyperlink;
- (BOOL)hasHoverHyperlink;
- (BOOL)hasOrientedBounds;
- (BOOL)hasWrdInline;
- (BOOL)isAspectRatioLocked;
- (BOOL)isEqual:(id)a3;
- (BOOL)isWrdInline;
- (OADDrawableProperties)initWithDefaults;
- (id)altDescription;
- (id)altTitle;
- (id)clickHyperlink;
- (id)description;
- (id)hoverHyperlink;
- (id)orientedBounds;
- (id)orientedBoundsForCharts;
- (unint64_t)hash;
- (void)fixPropertiesForChangingParentPreservingEffectiveValues:(id)a3;
- (void)removeUnnecessaryOverrides;
- (void)setAltDescription:(id)a3;
- (void)setAltTitle:(id)a3;
- (void)setAspectRatioLocked:(BOOL)a3;
- (void)setClickHyperlink:(id)a3;
- (void)setHoverHyperlink:(id)a3;
- (void)setOrientedBounds:(id)a3;
- (void)setWrdInline:(BOOL)a3;
@end

@implementation OADDrawableProperties

- (OADDrawableProperties)initWithDefaults
{
  v6.receiver = self;
  v6.super_class = (Class)OADDrawableProperties;
  v2 = [(OADProperties *)&v6 initWithDefaults];
  if (v2)
  {
    v3 = [OADOrientedBounds alloc];
    v4 = -[OADOrientedBounds initWithBounds:](v3, "initWithBounds:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    [(OADDrawableProperties *)v2 setOrientedBounds:v4];
    [(OADDrawableProperties *)v2 setAspectRatioLocked:0];
    [(OADDrawableProperties *)v2 setWrdInline:0];
  }
  return v2;
}

- (void)setOrientedBounds:(id)a3
{
}

- (BOOL)hasOrientedBounds
{
  return self->mOrientedBounds
      || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (id)orientedBounds
{
  v2 = [(OADProperties *)self overrideForSelector:sel_hasOrientedBounds];
  id v3 = v2[3];

  return v3;
}

- (void)removeUnnecessaryOverrides
{
  id v3 = [(OADProperties *)self parent];

  if (!v3) {
    return;
  }
  BOOL v4 = [(OADProperties *)self isMerged];
  BOOL v5 = [(OADProperties *)self isMergedWithParent];
  [(OADProperties *)self setMerged:0];
  [(OADProperties *)self setMergedWithParent:0];
  if ([(OADDrawableProperties *)self hasAspectRatioLocked])
  {
    objc_super v6 = [(OADProperties *)self parent];
    int v7 = [(OADDrawableProperties *)self isAspectRatioLocked];
    if (v7 == [v6 isAspectRatioLocked])
    {
      [(OADDrawableProperties *)self setAspectRatioLocked:0];
      *((unsigned char *)self + 64) &= ~1u;
    }
  }
  if ([(OADDrawableProperties *)self hasOrientedBounds])
  {
    v8 = [(OADProperties *)self parent];
    v9 = [(OADDrawableProperties *)self orientedBounds];
    v10 = [v8 orientedBounds];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(objc_object *)v9 removeUnnecessaryOverrides];
      uint64_t v11 = objc_opt_class();
      if (v11 != objc_opt_class()) {
        goto LABEL_13;
      }
      uint64_t v12 = [(objc_object *)v9 isMergedWithParent];
      [(objc_object *)v9 setMergedWithParent:0];
      char v13 = [(objc_object *)v9 isAnythingOverridden];
      [(objc_object *)v9 setMergedWithParent:v12];
      if (v13) {
        goto LABEL_13;
      }
    }
    else if (!TCObjectEqual(v9, v10))
    {
LABEL_13:

      goto LABEL_14;
    }
    mOrientedBounds = self->mOrientedBounds;
    self->mOrientedBounds = 0;

    goto LABEL_13;
  }
LABEL_14:
  if (![(OADDrawableProperties *)self hasClickHyperlink]) {
    goto LABEL_22;
  }
  v15 = [(OADProperties *)self parent];
  v16 = [(OADDrawableProperties *)self clickHyperlink];
  v17 = [v15 clickHyperlink];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(objc_object *)v16 removeUnnecessaryOverrides];
    uint64_t v18 = objc_opt_class();
    if (v18 != objc_opt_class()) {
      goto LABEL_21;
    }
    uint64_t v19 = [(objc_object *)v16 isMergedWithParent];
    [(objc_object *)v16 setMergedWithParent:0];
    char v20 = [(objc_object *)v16 isAnythingOverridden];
    [(objc_object *)v16 setMergedWithParent:v19];
    if (v20) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
  if (TCObjectEqual(v16, v17))
  {
LABEL_20:
    mClickHyperlink = self->mClickHyperlink;
    self->mClickHyperlink = 0;
  }
LABEL_21:

LABEL_22:
  if ([(OADDrawableProperties *)self hasHoverHyperlink])
  {
    v22 = [(OADProperties *)self parent];
    v23 = [(OADDrawableProperties *)self hoverHyperlink];
    v24 = [v22 hoverHyperlink];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(objc_object *)v23 removeUnnecessaryOverrides];
      uint64_t v25 = objc_opt_class();
      if (v25 != objc_opt_class()) {
        goto LABEL_29;
      }
      uint64_t v26 = [(objc_object *)v23 isMergedWithParent];
      [(objc_object *)v23 setMergedWithParent:0];
      char v27 = [(objc_object *)v23 isAnythingOverridden];
      [(objc_object *)v23 setMergedWithParent:v26];
      if (v27) {
        goto LABEL_29;
      }
    }
    else if (!TCObjectEqual(v23, v24))
    {
LABEL_29:

      goto LABEL_30;
    }
    mHoverHyperlink = self->mHoverHyperlink;
    self->mHoverHyperlink = 0;

    goto LABEL_29;
  }
LABEL_30:
  if ([(OADDrawableProperties *)self hasWrdInline])
  {
    v29 = [(OADProperties *)self parent];
    int v30 = [(OADDrawableProperties *)self isWrdInline];
    if (v30 == [v29 isWrdInline])
    {
      [(OADDrawableProperties *)self setWrdInline:0];
      *((unsigned char *)self + 64) &= ~4u;
    }
  }
  [(OADProperties *)self setMerged:v4];
  [(OADProperties *)self setMergedWithParent:v5];
  v31.receiver = self;
  v31.super_class = (Class)OADDrawableProperties;
  [(OADProperties *)&v31 removeUnnecessaryOverrides];
}

- (BOOL)hasAspectRatioLocked
{
  return *((unsigned char *)self + 64) & 1;
}

- (BOOL)hasClickHyperlink
{
  return self->mClickHyperlink
      || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (BOOL)hasHoverHyperlink
{
  return self->mHoverHyperlink
      || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (BOOL)hasWrdInline
{
  return (*((unsigned __int8 *)self + 64) >> 2) & 1;
}

- (void)setAspectRatioLocked:(BOOL)a3
{
  *((unsigned char *)self + 64) |= 1u;
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 64) = *((unsigned char *)self + 64) & 0xFD | v3;
}

- (void)setClickHyperlink:(id)a3
{
}

- (void)setHoverHyperlink:(id)a3
{
}

- (id)clickHyperlink
{
  return self->mClickHyperlink;
}

- (void)setWrdInline:(BOOL)a3
{
  *((unsigned char *)self + 64) |= 4u;
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 64) = *((unsigned char *)self + 64) & 0xF7 | v3;
}

- (BOOL)isAspectRatioLocked
{
  return (*((unsigned __int8 *)self + 64) >> 1) & 1;
}

- (id)orientedBoundsForCharts
{
  uint64_t v2 = [(OADProperties *)self possiblyInexistentOverrideForSelector:sel_hasOrientedBounds];
  char v3 = (void *)v2;
  if (v2) {
    id v4 = *(id *)(v2 + 24);
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (id)hoverHyperlink
{
  return self->mHoverHyperlink;
}

- (BOOL)isWrdInline
{
  return (*((unsigned __int8 *)self + 64) >> 3) & 1;
}

- (id)altTitle
{
  return self->mTitle;
}

- (void)setAltTitle:(id)a3
{
  BOOL v5 = (NSString *)a3;
  if (self->mTitle != v5)
  {
    objc_super v6 = v5;
    objc_storeStrong((id *)&self->mTitle, a3);
    BOOL v5 = v6;
  }
}

- (BOOL)hasAltTitle
{
  return self->mTitle || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (id)altDescription
{
  return self->mDescription;
}

- (void)setAltDescription:(id)a3
{
  BOOL v5 = (NSString *)a3;
  if (self->mDescription != v5)
  {
    objc_super v6 = v5;
    objc_storeStrong((id *)&self->mDescription, a3);
    BOOL v5 = v6;
  }
}

- (BOOL)hasAltDescription
{
  return self->mDescription || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (void)fixPropertiesForChangingParentPreservingEffectiveValues:(id)a3
{
  id v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)OADDrawableProperties;
  [(OADProperties *)&v37 fixPropertiesForChangingParentPreservingEffectiveValues:v4];
  if ([(OADDrawableProperties *)self hasOrientedBounds]
    || ([(OADProperties *)self parent], id v5 = (id)objc_claimAutoreleasedReturnValue(),
                                                 v5,
                                                 v5 != v4))
  {
    objc_super v6 = [(OADProperties *)self possiblyInexistentOverrideForSelector:sel_hasOrientedBounds];

    if (v6)
    {
      int v7 = [(OADDrawableProperties *)self orientedBounds];
    }
    else
    {
      int v7 = 0;
    }
    v8 = [v4 possiblyInexistentOverrideForSelector:sel_hasOrientedBounds];

    if (v8)
    {
      v9 = [v4 orientedBounds];
    }
    else
    {
      v9 = 0;
    }
    int v10 = TCObjectEqual(v7, v9);
    mOrientedBounds = self->mOrientedBounds;
    if (v10)
    {
      self->mOrientedBounds = 0;
    }
    else if (!mOrientedBounds && v6)
    {
      [(OADDrawableProperties *)self setOrientedBounds:v7];
    }
  }
  if ([(OADDrawableProperties *)self hasClickHyperlink]
    || ([(OADProperties *)self parent],
        id v12 = (id)objc_claimAutoreleasedReturnValue(),
        v12,
        v12 != v4))
  {
    char v13 = [(OADProperties *)self possiblyInexistentOverrideForSelector:sel_hasClickHyperlink];

    if (v13)
    {
      v14 = [(OADDrawableProperties *)self clickHyperlink];
    }
    else
    {
      v14 = 0;
    }
    v15 = [v4 possiblyInexistentOverrideForSelector:sel_hasClickHyperlink];

    if (v15)
    {
      v16 = [v4 clickHyperlink];
    }
    else
    {
      v16 = 0;
    }
    int v17 = TCObjectEqual(v14, v16);
    mClickHyperlink = self->mClickHyperlink;
    if (v17)
    {
      self->mClickHyperlink = 0;
    }
    else if (!mClickHyperlink && v13)
    {
      [(OADDrawableProperties *)self setClickHyperlink:v14];
    }
  }
  if ([(OADDrawableProperties *)self hasHoverHyperlink]
    || ([(OADProperties *)self parent],
        id v19 = (id)objc_claimAutoreleasedReturnValue(),
        v19,
        v19 != v4))
  {
    char v20 = [(OADProperties *)self possiblyInexistentOverrideForSelector:sel_hasHoverHyperlink];

    if (v20)
    {
      v21 = [(OADDrawableProperties *)self hoverHyperlink];
    }
    else
    {
      v21 = 0;
    }
    v22 = [v4 possiblyInexistentOverrideForSelector:sel_hasHoverHyperlink];

    if (v22)
    {
      v23 = [v4 hoverHyperlink];
    }
    else
    {
      v23 = 0;
    }
    int v24 = TCObjectEqual(v21, v23);
    mHoverHyperlink = self->mHoverHyperlink;
    if (v24)
    {
      self->mHoverHyperlink = 0;
    }
    else if (!mHoverHyperlink && v20)
    {
      [(OADDrawableProperties *)self setHoverHyperlink:v21];
    }
  }
  if ([(OADDrawableProperties *)self hasAltTitle]
    || ([(OADProperties *)self parent],
        id v26 = (id)objc_claimAutoreleasedReturnValue(),
        v26,
        v26 != v4))
  {
    char v27 = [(OADProperties *)self possiblyInexistentOverrideForSelector:sel_hasAltTitle];

    if (v27)
    {
      v28 = [(OADDrawableProperties *)self altTitle];
    }
    else
    {
      v28 = 0;
    }
    v29 = [v4 possiblyInexistentOverrideForSelector:sel_hasAltTitle];

    if (v29)
    {
      int v30 = [v4 altTitle];
    }
    else
    {
      int v30 = 0;
    }
    int v31 = TCObjectEqual(v28, v30);
    mTitle = self->mTitle;
    if (v31)
    {
      self->mTitle = 0;
    }
    else if (!mTitle && v27)
    {
      [(OADDrawableProperties *)self setAltTitle:v28];
    }
  }
  if ((*((unsigned char *)self + 64) & 2) != 0
    || ([(OADProperties *)self parent],
        id v33 = (id)objc_claimAutoreleasedReturnValue(),
        v33,
        v33 != v4))
  {
    int v34 = [(OADDrawableProperties *)self isAspectRatioLocked];
    if (v34 == [v4 isAspectRatioLocked])
    {
      *((unsigned char *)self + 64) &= ~2u;
    }
    else if ((*((unsigned char *)self + 64) & 2) == 0)
    {
      [(OADDrawableProperties *)self setAspectRatioLocked:[(OADDrawableProperties *)self isAspectRatioLocked]];
    }
  }
  if ((*((unsigned char *)self + 64) & 4) != 0
    || ([(OADProperties *)self parent],
        id v35 = (id)objc_claimAutoreleasedReturnValue(),
        v35,
        v35 != v4))
  {
    int v36 = [(OADDrawableProperties *)self isWrdInline];
    if (v36 == [v4 isWrdInline])
    {
      *((unsigned char *)self + 64) &= ~4u;
    }
    else if ((*((unsigned char *)self + 64) & 4) == 0)
    {
      [(OADDrawableProperties *)self setWrdInline:[(OADDrawableProperties *)self isWrdInline]];
    }
  }
}

- (unint64_t)hash
{
  unint64_t v3 = [(OADOrientedBounds *)self->mOrientedBounds hash];
  unint64_t v4 = [(OADHyperlink *)self->mClickHyperlink hash];
  unint64_t v5 = [(OADHyperlink *)self->mHoverHyperlink hash];
  unint64_t v6 = ((unint64_t)*((unsigned __int8 *)self + 64) >> 1) & 1;
  unint64_t v7 = ((unint64_t)*((unsigned __int8 *)self + 64) >> 3) & 1;
  v9.receiver = self;
  v9.super_class = (Class)OADDrawableProperties;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ [(OADProperties *)&v9 hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    unint64_t v6 = [(OADDrawableProperties *)self hash];
    if (v6 != [v5 hash]) {
      goto LABEL_16;
    }
    int v7 = [v5 hasOrientedBounds];
    if (v7 != [(OADDrawableProperties *)self hasOrientedBounds]) {
      goto LABEL_16;
    }
    if ([v5 hasOrientedBounds])
    {
      v8 = [v5 orientedBounds];
      objc_super v9 = [(OADDrawableProperties *)self orientedBounds];
      char v10 = [v8 isEqual:v9];

      if ((v10 & 1) == 0) {
        goto LABEL_16;
      }
    }
    uint64_t v11 = [v5 clickHyperlink];
    id v12 = [(OADDrawableProperties *)self clickHyperlink];
    char v13 = (v11 == 0) ^ (v12 != 0);

    if ((v13 & 1) == 0) {
      goto LABEL_16;
    }
    v14 = [v5 clickHyperlink];
    if (v14)
    {
      v15 = [v5 clickHyperlink];
      v16 = [(OADDrawableProperties *)self clickHyperlink];
      char v17 = [v15 isEqual:v16];

      if ((v17 & 1) == 0) {
        goto LABEL_16;
      }
    }
    uint64_t v18 = [v5 hoverHyperlink];
    id v19 = [(OADDrawableProperties *)self hoverHyperlink];
    char v20 = (v18 == 0) ^ (v19 != 0);

    if ((v20 & 1) == 0) {
      goto LABEL_16;
    }
    v21 = [v5 hoverHyperlink];
    if (v21)
    {
      v22 = [v5 hoverHyperlink];
      v23 = [(OADDrawableProperties *)self hoverHyperlink];
      char v24 = [v22 isEqual:v23];

      if ((v24 & 1) == 0) {
        goto LABEL_16;
      }
    }
    if ((int v25 = [v5 hasAspectRatioLocked],
          v25 == [(OADDrawableProperties *)self hasAspectRatioLocked])
      && (![v5 hasAspectRatioLocked]
       || (int v26 = [v5 isAspectRatioLocked],
           v26 == [(OADDrawableProperties *)self isAspectRatioLocked]))
      && (int v27 = [v5 hasWrdInline], v27 == -[OADDrawableProperties hasWrdInline](self, "hasWrdInline"))
      && (![v5 hasWrdInline]
       || (int v30 = [v5 isWrdInline], v30 == -[OADDrawableProperties isWrdInline](self, "isWrdInline"))))
    {
      v31.receiver = self;
      v31.super_class = (Class)OADDrawableProperties;
      BOOL v28 = [(OADProperties *)&v31 isEqual:v5];
    }
    else
    {
LABEL_16:
      BOOL v28 = 0;
    }
  }
  else
  {
    BOOL v28 = 0;
  }

  return v28;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)OADDrawableProperties;
  uint64_t v2 = [(OADProperties *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mDescription, 0);
  objc_storeStrong((id *)&self->mTitle, 0);
  objc_storeStrong((id *)&self->mHoverHyperlink, 0);
  objc_storeStrong((id *)&self->mClickHyperlink, 0);
  objc_storeStrong((id *)&self->mOrientedBounds, 0);
}

@end