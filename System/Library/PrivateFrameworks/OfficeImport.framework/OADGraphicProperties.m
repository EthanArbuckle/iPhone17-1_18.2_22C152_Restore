@interface OADGraphicProperties
- (BOOL)hasEffects;
- (BOOL)hasExts;
- (BOOL)hasFill;
- (BOOL)hasIsBehindText;
- (BOOL)hasNonEmptyFill;
- (BOOL)hasScene3D;
- (BOOL)hasShape3D;
- (BOOL)hasStroke;
- (BOOL)isBehindText;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (OADGraphicProperties)initWithDefaults;
- (id)effects;
- (id)exts;
- (id)fill;
- (id)scene3D;
- (id)shape3D;
- (id)stroke;
- (unint64_t)hash;
- (void)fixPropertiesForChangingParentPreservingEffectiveValues:(id)a3;
- (void)removeUnnecessaryOverrides;
- (void)setEffects:(id)a3;
- (void)setExts:(id)a3;
- (void)setFill:(id)a3;
- (void)setIsBehindText:(BOOL)a3;
- (void)setParent:(id)a3;
- (void)setScene3D:(id)a3;
- (void)setShape3D:(id)a3;
- (void)setStroke:(id)a3;
@end

@implementation OADGraphicProperties

- (OADGraphicProperties)initWithDefaults
{
  v10.receiver = self;
  v10.super_class = (Class)OADGraphicProperties;
  v2 = [(OADDrawableProperties *)&v10 initWithDefaults];
  if (v2)
  {
    v3 = +[OADNullFill nullFill];
    [(OADGraphicProperties *)v2 setFill:v3];

    v4 = [MEMORY[0x263EFF8C0] array];
    [(OADGraphicProperties *)v2 setEffects:v4];

    v5 = [MEMORY[0x263EFF8C0] array];
    [(OADGraphicProperties *)v2 setExts:v5];

    v6 = +[OADStroke nullStroke];
    [(OADGraphicProperties *)v2 setStroke:v6];

    v7 = +[OADScene3D nullScene3D];
    [(OADGraphicProperties *)v2 setScene3D:v7];

    v8 = +[OADShape3D nullShape3D];
    [(OADGraphicProperties *)v2 setShape3D:v8];

    [(OADGraphicProperties *)v2 setIsBehindText:0];
  }
  return v2;
}

- (void)setFill:(id)a3
{
}

- (void)setEffects:(id)a3
{
}

- (void)setStroke:(id)a3
{
}

- (void)setScene3D:(id)a3
{
}

- (void)setShape3D:(id)a3
{
}

- (void)setIsBehindText:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 120) = *((unsigned char *)self + 120) & 0xFD | v3;
  *((unsigned char *)self + 120) |= 1u;
}

- (void)setParent:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)OADGraphicProperties;
  [(OADProperties *)&v17 setParent:v4];
  if (self->mFill)
  {
    v5 = [v4 fill];
    v6 = self->mFill;
    v7 = [(OADProperties *)self->mFill parent];

    if (v7 != v5)
    {
      v8 = [(OADProperties *)self->mFill parent];
      v9 = [v8 parent];

      if (v9)
      {
        uint64_t v10 = [(OADProperties *)self->mFill parent];

        v6 = (OADFill *)v10;
      }
      if ([v5 isMemberOfClass:objc_opt_class()]) {
        [(OADProperties *)v6 setParent:v5];
      }
    }
  }
  if (self->mStroke)
  {
    v11 = [v4 stroke];
    v12 = self->mStroke;
    v13 = [(OADProperties *)self->mStroke parent];

    if (v13 != v11)
    {
      v14 = [(OADProperties *)self->mStroke parent];
      v15 = [v14 parent];

      if (v15)
      {
        uint64_t v16 = [(OADProperties *)self->mStroke parent];

        v12 = (OADStroke *)v16;
      }
      [(OADStroke *)v12 setParent:v11];
    }
  }
}

- (void)removeUnnecessaryOverrides
{
  char v3 = [(OADProperties *)self parent];

  if (!v3) {
    return;
  }
  BOOL v4 = [(OADProperties *)self isMerged];
  BOOL v5 = [(OADProperties *)self isMergedWithParent];
  [(OADProperties *)self setMerged:0];
  [(OADProperties *)self setMergedWithParent:0];
  if ([(OADGraphicProperties *)self hasFill])
  {
    v6 = [(OADProperties *)self parent];
    v7 = [(OADGraphicProperties *)self fill];
    v8 = [v6 fill];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(objc_object *)v7 removeUnnecessaryOverrides];
      uint64_t v9 = objc_opt_class();
      if (v9 != objc_opt_class()) {
        goto LABEL_9;
      }
      uint64_t v10 = [(objc_object *)v7 isMergedWithParent];
      [(objc_object *)v7 setMergedWithParent:0];
      char v11 = [(objc_object *)v7 isAnythingOverridden];
      [(objc_object *)v7 setMergedWithParent:v10];
      if (v11) {
        goto LABEL_9;
      }
    }
    else if (!TCObjectEqual(v7, v8))
    {
LABEL_9:

      goto LABEL_10;
    }
    mFill = self->mFill;
    self->mFill = 0;

    goto LABEL_9;
  }
LABEL_10:
  if (![(OADGraphicProperties *)self hasEffects]) {
    goto LABEL_18;
  }
  v13 = [(OADProperties *)self parent];
  v14 = [(OADGraphicProperties *)self effects];
  v15 = [v13 effects];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(objc_object *)v14 removeUnnecessaryOverrides];
    uint64_t v16 = objc_opt_class();
    if (v16 != objc_opt_class()) {
      goto LABEL_17;
    }
    uint64_t v17 = [(objc_object *)v14 isMergedWithParent];
    [(objc_object *)v14 setMergedWithParent:0];
    char v18 = [(objc_object *)v14 isAnythingOverridden];
    [(objc_object *)v14 setMergedWithParent:v17];
    if (v18) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  if (TCObjectEqual(v14, v15))
  {
LABEL_16:
    mEffects = self->mEffects;
    self->mEffects = 0;
  }
LABEL_17:

LABEL_18:
  if (![(OADGraphicProperties *)self hasExts]) {
    goto LABEL_26;
  }
  v20 = [(OADProperties *)self parent];
  v21 = [(OADGraphicProperties *)self exts];
  v22 = [v20 exts];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(objc_object *)v21 removeUnnecessaryOverrides];
    uint64_t v23 = objc_opt_class();
    if (v23 != objc_opt_class()) {
      goto LABEL_25;
    }
    uint64_t v24 = [(objc_object *)v21 isMergedWithParent];
    [(objc_object *)v21 setMergedWithParent:0];
    char v25 = [(objc_object *)v21 isAnythingOverridden];
    [(objc_object *)v21 setMergedWithParent:v24];
    if (v25) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  if (TCObjectEqual(v21, v22))
  {
LABEL_24:
    mExts = self->mExts;
    self->mExts = 0;
  }
LABEL_25:

LABEL_26:
  if (![(OADGraphicProperties *)self hasScene3D]) {
    goto LABEL_34;
  }
  v27 = [(OADProperties *)self parent];
  v28 = [(OADGraphicProperties *)self scene3D];
  v29 = [v27 scene3D];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(objc_object *)v28 removeUnnecessaryOverrides];
    uint64_t v30 = objc_opt_class();
    if (v30 != objc_opt_class()) {
      goto LABEL_33;
    }
    uint64_t v31 = [(objc_object *)v28 isMergedWithParent];
    [(objc_object *)v28 setMergedWithParent:0];
    char v32 = [(objc_object *)v28 isAnythingOverridden];
    [(objc_object *)v28 setMergedWithParent:v31];
    if (v32) {
      goto LABEL_33;
    }
    goto LABEL_32;
  }
  if (TCObjectEqual(v28, v29))
  {
LABEL_32:
    mScene3D = self->mScene3D;
    self->mScene3D = 0;
  }
LABEL_33:

LABEL_34:
  if (![(OADGraphicProperties *)self hasShape3D]) {
    goto LABEL_42;
  }
  v34 = [(OADProperties *)self parent];
  v35 = [(OADGraphicProperties *)self shape3D];
  v36 = [v34 shape3D];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(objc_object *)v35 removeUnnecessaryOverrides];
    uint64_t v37 = objc_opt_class();
    if (v37 != objc_opt_class()) {
      goto LABEL_41;
    }
    uint64_t v38 = [(objc_object *)v35 isMergedWithParent];
    [(objc_object *)v35 setMergedWithParent:0];
    char v39 = [(objc_object *)v35 isAnythingOverridden];
    [(objc_object *)v35 setMergedWithParent:v38];
    if (v39) {
      goto LABEL_41;
    }
    goto LABEL_40;
  }
  if (TCObjectEqual(v35, v36))
  {
LABEL_40:
    mShape3D = self->mShape3D;
    self->mShape3D = 0;
  }
LABEL_41:

LABEL_42:
  if ([(OADGraphicProperties *)self hasStroke])
  {
    v41 = [(OADProperties *)self parent];
    v42 = [(OADGraphicProperties *)self stroke];
    v43 = [v41 stroke];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(objc_object *)v42 removeUnnecessaryOverrides];
      uint64_t v44 = objc_opt_class();
      if (v44 != objc_opt_class()) {
        goto LABEL_49;
      }
      uint64_t v45 = [(objc_object *)v42 isMergedWithParent];
      [(objc_object *)v42 setMergedWithParent:0];
      char v46 = [(objc_object *)v42 isAnythingOverridden];
      [(objc_object *)v42 setMergedWithParent:v45];
      if (v46) {
        goto LABEL_49;
      }
    }
    else if (!TCObjectEqual(v42, v43))
    {
LABEL_49:

      goto LABEL_50;
    }
    mStroke = self->mStroke;
    self->mStroke = 0;

    goto LABEL_49;
  }
LABEL_50:
  if ([(OADGraphicProperties *)self hasIsBehindText])
  {
    v48 = [(OADProperties *)self parent];
    int v49 = [(OADGraphicProperties *)self isBehindText];
    if (v49 == [v48 isBehindText])
    {
      [(OADGraphicProperties *)self setIsBehindText:0];
      *((unsigned char *)self + 120) &= ~1u;
    }
  }
  [(OADProperties *)self setMerged:v4];
  [(OADProperties *)self setMergedWithParent:v5];
  v50.receiver = self;
  v50.super_class = (Class)OADGraphicProperties;
  [(OADDrawableProperties *)&v50 removeUnnecessaryOverrides];
}

- (BOOL)hasFill
{
  return self->mFill || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (id)fill
{
  v2 = [(OADProperties *)self overrideForSelector:sel_hasFill];
  id v3 = v2[9];

  return v3;
}

- (BOOL)hasEffects
{
  return self->mEffects || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (id)effects
{
  v2 = [(OADProperties *)self overrideForSelector:sel_hasEffects];
  id v3 = v2[10];

  return v3;
}

- (BOOL)hasScene3D
{
  return self->mScene3D || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (BOOL)hasShape3D
{
  return self->mShape3D || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (BOOL)hasStroke
{
  return self->mStroke || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (id)stroke
{
  v2 = [(OADProperties *)self overrideForSelector:sel_hasStroke];
  id v3 = v2[14];

  return v3;
}

- (BOOL)hasIsBehindText
{
  return (*((unsigned char *)self + 120) & 1) != 0
      || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (BOOL)isBehindText
{
  v2 = [(OADProperties *)self overrideForSelector:sel_hasIsBehindText];
  BOOL v3 = (v2[120] >> 1) & 1;

  return v3;
}

- (BOOL)hasNonEmptyFill
{
  if ([(OADGraphicProperties *)self hasFill])
  {
    BOOL v3 = [(OADGraphicProperties *)self fill];
    objc_opt_class();
    char v4 = objc_opt_isKindOfClass() ^ 1;
  }
  else
  {
    char v4 = 0;
  }
  return v4 & 1;
}

- (id)exts
{
  v2 = [(OADProperties *)self overrideForSelector:sel_hasExts];
  id v3 = v2[11];

  return v3;
}

- (void)setExts:(id)a3
{
}

- (BOOL)hasExts
{
  return self->mExts || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (id)scene3D
{
  v2 = [(OADProperties *)self overrideForSelector:sel_hasScene3D];
  id v3 = v2[12];

  return v3;
}

- (id)shape3D
{
  v2 = [(OADProperties *)self overrideForSelector:sel_hasShape3D];
  id v3 = v2[13];

  return v3;
}

- (void)fixPropertiesForChangingParentPreservingEffectiveValues:(id)a3
{
  id v4 = a3;
  v53.receiver = self;
  v53.super_class = (Class)OADGraphicProperties;
  [(OADDrawableProperties *)&v53 fixPropertiesForChangingParentPreservingEffectiveValues:v4];
  p_mFill = &self->mFill;
  if (self->mFill
    || ([(OADProperties *)self parent], id v6 = (id)objc_claimAutoreleasedReturnValue(),
                                                 v6,
                                                 v6 != v4))
  {
    v7 = [(OADGraphicProperties *)self fill];
    id v8 = objc_alloc_init((Class)objc_opt_class());

    uint64_t v9 = [(OADGraphicProperties *)self fill];
    [v8 setParent:v9];

    objc_storeStrong((id *)&self->mFill, v8);
    uint64_t v10 = [v4 possiblyInexistentOverrideForSelector:sel_hasFill];

    if (v10)
    {
      uint64_t v10 = [v4 fill];
    }
    if (*p_mFill == v10)
    {
      v13 = v10;
    }
    else
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      if ((isKindOfClass & 1) == 0)
      {
        uint64_t v12 = [(id)objc_opt_class() defaultProperties];

        uint64_t v10 = (OADFill *)v12;
      }
      [(OADProperties *)*p_mFill changeParentPreservingEffectiveValues:v10];
      if ((isKindOfClass & 1) == 0 || [(OADProperties *)*p_mFill isAnythingOverridden]) {
        goto LABEL_13;
      }
      v13 = *p_mFill;
    }
    *p_mFill = 0;

LABEL_13:
  }
  if ([(OADGraphicProperties *)self hasEffects]
    || ([(OADProperties *)self parent],
        id v14 = (id)objc_claimAutoreleasedReturnValue(),
        v14,
        v14 != v4))
  {
    v15 = [(OADProperties *)self possiblyInexistentOverrideForSelector:sel_hasEffects];

    if (v15)
    {
      uint64_t v16 = [(OADGraphicProperties *)self effects];
    }
    else
    {
      uint64_t v16 = 0;
    }
    uint64_t v17 = [v4 possiblyInexistentOverrideForSelector:sel_hasEffects];

    if (v17)
    {
      char v18 = [v4 effects];
    }
    else
    {
      char v18 = 0;
    }
    int v19 = TCObjectEqual(v16, v18);
    mEffects = self->mEffects;
    if (v19)
    {
      self->mEffects = 0;
    }
    else if (!mEffects && v15)
    {
      [(OADGraphicProperties *)self setEffects:v16];
    }
  }
  if ([(OADGraphicProperties *)self hasExts]
    || ([(OADProperties *)self parent],
        id v21 = (id)objc_claimAutoreleasedReturnValue(),
        v21,
        v21 != v4))
  {
    v22 = [(OADProperties *)self possiblyInexistentOverrideForSelector:sel_hasExts];

    if (v22)
    {
      uint64_t v23 = [(OADGraphicProperties *)self exts];
    }
    else
    {
      uint64_t v23 = 0;
    }
    uint64_t v24 = [v4 possiblyInexistentOverrideForSelector:sel_hasExts];

    if (v24)
    {
      char v25 = [v4 exts];
    }
    else
    {
      char v25 = 0;
    }
    int v26 = TCObjectEqual(v23, v25);
    mExts = self->mExts;
    if (v26)
    {
      self->mExts = 0;
    }
    else if (!mExts && v22)
    {
      [(OADGraphicProperties *)self setExts:v23];
    }
  }
  if ([(OADGraphicProperties *)self hasScene3D]
    || ([(OADProperties *)self parent],
        id v28 = (id)objc_claimAutoreleasedReturnValue(),
        v28,
        v28 != v4))
  {
    v29 = [(OADProperties *)self possiblyInexistentOverrideForSelector:sel_hasScene3D];

    if (v29)
    {
      uint64_t v30 = [(OADGraphicProperties *)self scene3D];
    }
    else
    {
      uint64_t v30 = 0;
    }
    uint64_t v31 = [v4 possiblyInexistentOverrideForSelector:sel_hasScene3D];

    if (v31)
    {
      char v32 = [v4 scene3D];
    }
    else
    {
      char v32 = 0;
    }
    int v33 = TCObjectEqual(v30, v32);
    mScene3D = self->mScene3D;
    if (v33)
    {
      self->mScene3D = 0;
    }
    else if (!mScene3D && v29)
    {
      [(OADGraphicProperties *)self setScene3D:v30];
    }
  }
  if ([(OADGraphicProperties *)self hasShape3D]
    || ([(OADProperties *)self parent],
        id v35 = (id)objc_claimAutoreleasedReturnValue(),
        v35,
        v35 != v4))
  {
    v36 = [(OADProperties *)self possiblyInexistentOverrideForSelector:sel_hasShape3D];

    if (v36)
    {
      uint64_t v37 = [(OADGraphicProperties *)self shape3D];
    }
    else
    {
      uint64_t v37 = 0;
    }
    uint64_t v38 = [v4 possiblyInexistentOverrideForSelector:sel_hasShape3D];

    if (v38)
    {
      char v39 = [v4 shape3D];
    }
    else
    {
      char v39 = 0;
    }
    int v40 = TCObjectEqual(v37, v39);
    mShape3D = self->mShape3D;
    if (v40)
    {
      self->mShape3D = 0;
    }
    else if (!mShape3D && v36)
    {
      [(OADGraphicProperties *)self setShape3D:v37];
    }
  }
  p_mStroke = &self->mStroke;
  if (self->mStroke
    || ([(OADProperties *)self parent],
        id v43 = (id)objc_claimAutoreleasedReturnValue(),
        v43,
        v43 != v4))
  {
    uint64_t v44 = [(OADGraphicProperties *)self stroke];
    id v45 = objc_alloc_init((Class)objc_opt_class());

    char v46 = [(OADGraphicProperties *)self stroke];
    [v45 setParent:v46];

    objc_storeStrong((id *)&self->mStroke, v45);
    v47 = [v4 possiblyInexistentOverrideForSelector:sel_hasStroke];

    if (v47)
    {
      v47 = [v4 stroke];
    }
    if (*p_mStroke == v47)
    {
      objc_super v50 = v47;
    }
    else
    {
      objc_opt_class();
      char v48 = objc_opt_isKindOfClass();
      if ((v48 & 1) == 0)
      {
        uint64_t v49 = [(id)objc_opt_class() defaultProperties];

        v47 = (OADStroke *)v49;
      }
      [(OADProperties *)*p_mStroke changeParentPreservingEffectiveValues:v47];
      if ((v48 & 1) == 0 || [(OADStroke *)*p_mStroke isAnythingOverridden]) {
        goto LABEL_82;
      }
      objc_super v50 = *p_mStroke;
    }
    *p_mStroke = 0;

LABEL_82:
  }
  if ((*((unsigned char *)self + 120) & 1) != 0
    || ([(OADProperties *)self parent],
        id v51 = (id)objc_claimAutoreleasedReturnValue(),
        v51,
        v51 != v4))
  {
    int v52 = [(OADGraphicProperties *)self isBehindText];
    if (v52 == [v4 isBehindText])
    {
      *((unsigned char *)self + 120) &= ~1u;
    }
    else if ((*((unsigned char *)self + 120) & 1) == 0)
    {
      [(OADGraphicProperties *)self setIsBehindText:[(OADGraphicProperties *)self isBehindText]];
    }
  }
}

- (unint64_t)hash
{
  unint64_t v3 = [(OADFill *)self->mFill hash];
  unint64_t v4 = [(OADScene3D *)self->mScene3D hash] ^ v3;
  unint64_t v5 = [(OADShape3D *)self->mShape3D hash];
  unint64_t v6 = v4 ^ v5 ^ [(OADStroke *)self->mStroke hash];
  if ([(NSArray *)self->mEffects count])
  {
    uint64_t v7 = 0;
    unsigned int v8 = 1;
    do
    {
      uint64_t v9 = [(NSArray *)self->mEffects objectAtIndex:v7];
      v6 ^= [v9 hash];

      uint64_t v7 = v8;
      BOOL v10 = [(NSArray *)self->mEffects count] > v8++;
    }
    while (v10);
  }
  if ([(NSArray *)self->mExts count])
  {
    uint64_t v11 = 0;
    unsigned int v12 = 1;
    do
    {
      v13 = [(NSArray *)self->mExts objectAtIndex:v11];
      v6 ^= [v13 hash];

      uint64_t v11 = v12;
      BOOL v10 = [(NSArray *)self->mExts count] > v12++;
    }
    while (v10);
  }
  unint64_t v14 = ((unint64_t)*((unsigned __int8 *)self + 120) >> 1) & 1;
  v16.receiver = self;
  v16.super_class = (Class)OADGraphicProperties;
  return v6 ^ [(OADDrawableProperties *)&v16 hash] ^ v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    unint64_t v6 = [(OADGraphicProperties *)self hash];
    if (v6 != [v5 hash]) {
      goto LABEL_19;
    }
    int v7 = [v5 hasFill];
    if (v7 != [(OADGraphicProperties *)self hasFill]) {
      goto LABEL_19;
    }
    if ([v5 hasFill])
    {
      unsigned int v8 = [v5 fill];
      uint64_t v9 = [(OADGraphicProperties *)self fill];
      char v10 = [v8 isEqual:v9];

      if ((v10 & 1) == 0) {
        goto LABEL_19;
      }
    }
    int v11 = [v5 hasEffects];
    if (v11 != [(OADGraphicProperties *)self hasEffects]) {
      goto LABEL_19;
    }
    if ([v5 hasEffects])
    {
      unsigned int v12 = [v5 effects];
      v13 = [(OADGraphicProperties *)self effects];
      char v14 = [v12 isEqualToArray:v13];

      if ((v14 & 1) == 0) {
        goto LABEL_19;
      }
    }
    int v15 = [v5 hasScene3D];
    if (v15 != [(OADGraphicProperties *)self hasScene3D]) {
      goto LABEL_19;
    }
    if ([v5 hasScene3D])
    {
      objc_super v16 = [v5 scene3D];
      uint64_t v17 = [(OADGraphicProperties *)self scene3D];
      char v18 = [v16 isEqual:v17];

      if ((v18 & 1) == 0) {
        goto LABEL_19;
      }
    }
    int v19 = [v5 hasShape3D];
    if (v19 != [(OADGraphicProperties *)self hasShape3D]) {
      goto LABEL_19;
    }
    if ([v5 hasShape3D])
    {
      v20 = [v5 shape3D];
      id v21 = [(OADGraphicProperties *)self shape3D];
      char v22 = [v20 isEqual:v21];

      if ((v22 & 1) == 0) {
        goto LABEL_19;
      }
    }
    int v23 = [v5 hasStroke];
    if (v23 != [(OADGraphicProperties *)self hasStroke]) {
      goto LABEL_19;
    }
    if ([v5 hasStroke])
    {
      uint64_t v24 = [v5 stroke];
      char v25 = [(OADGraphicProperties *)self stroke];
      char v26 = [v24 isEqual:v25];

      if ((v26 & 1) == 0) {
        goto LABEL_19;
      }
    }
    int v27 = [v5 hasIsBehindText];
    if (v27 == [(OADGraphicProperties *)self hasIsBehindText]
      && (![v5 hasIsBehindText]
       || (int v30 = [v5 isBehindText], v30 == -[OADGraphicProperties isBehindText](self, "isBehindText"))))
    {
      v31.receiver = self;
      v31.super_class = (Class)OADGraphicProperties;
      BOOL v28 = [(OADDrawableProperties *)&v31 isEqual:v5];
    }
    else
    {
LABEL_19:
      BOOL v28 = 0;
    }
  }
  else
  {
    BOOL v28 = 0;
  }

  return v28;
}

- (NSString)description
{
  v4.receiver = self;
  v4.super_class = (Class)OADGraphicProperties;
  v2 = [(OADDrawableProperties *)&v4 description];
  return (NSString *)v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mStroke, 0);
  objc_storeStrong((id *)&self->mShape3D, 0);
  objc_storeStrong((id *)&self->mScene3D, 0);
  objc_storeStrong((id *)&self->mExts, 0);
  objc_storeStrong((id *)&self->mEffects, 0);
  objc_storeStrong((id *)&self->mFill, 0);
}

@end