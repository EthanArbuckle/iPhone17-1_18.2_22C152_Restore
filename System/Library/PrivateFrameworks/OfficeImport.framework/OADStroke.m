@interface OADStroke
+ (id)blackStroke;
+ (id)defaultProperties;
+ (id)nullStroke;
- (BOOL)isAnythingOverridden;
- (BOOL)isCapOverridden;
- (BOOL)isColorOverridden;
- (BOOL)isCompoundTypeOverridden;
- (BOOL)isDashOverridden;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFillOverridden;
- (BOOL)isHeadOverridden;
- (BOOL)isJoinOverridden;
- (BOOL)isPenAlignmentOverridden;
- (BOOL)isTailOverridden;
- (BOOL)isWidthOverridden;
- (OADLineEnd)head;
- (OADLineEnd)tail;
- (OADStroke)init;
- (OADStroke)initWithDefaults;
- (float)width;
- (id)color;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dash;
- (id)fill;
- (id)join;
- (int)penAlignment;
- (unint64_t)hash;
- (unsigned)cap;
- (unsigned)compoundType;
- (void)fixPropertiesForChangingParentPreservingEffectiveValues:(id)a3;
- (void)removeUnnecessaryOverrides;
- (void)setCap:(unsigned __int8)a3;
- (void)setColor:(id)a3;
- (void)setCompoundType:(unsigned __int8)a3;
- (void)setDash:(id)a3;
- (void)setFill:(id)a3;
- (void)setHead:(id)a3;
- (void)setJoin:(id)a3;
- (void)setParent:(id)a3;
- (void)setPenAlignment:(int)a3;
- (void)setStyleColor:(id)a3;
- (void)setTail:(id)a3;
- (void)setWidth:(float)a3;
@end

@implementation OADStroke

- (OADStroke)init
{
  v3.receiver = self;
  v3.super_class = (Class)OADStroke;
  return [(OADProperties *)&v3 init];
}

+ (id)defaultProperties
{
  if (+[OADStroke defaultProperties]::once != -1) {
    dispatch_once(&+[OADStroke defaultProperties]::once, &__block_literal_global_180);
  }
  v2 = (void *)+[OADStroke defaultProperties]::defaultProperties;
  return v2;
}

- (OADStroke)initWithDefaults
{
  v15.receiver = self;
  v15.super_class = (Class)OADStroke;
  v2 = [(OADProperties *)&v15 initWithDefaults];
  objc_super v3 = v2;
  if (v2)
  {
    [(OADStroke *)v2 setColor:0];
    v4 = +[OADNullFill nullFill];
    [(OADStroke *)v3 setFill:v4];

    v5 = +[OADPresetDash defaultProperties];
    v6 = (void *)[v5 copy];
    [(OADStroke *)v3 setDash:v6];

    v7 = +[OADRoundLineJoin defaultProperties];
    v8 = (void *)[v7 copy];
    [(OADStroke *)v3 setJoin:v8];

    v9 = +[OADLineEnd defaultProperties];
    v10 = (void *)[v9 copy];
    [(OADStroke *)v3 setHead:v10];

    v11 = +[OADLineEnd defaultProperties];
    v12 = (void *)[v11 copy];
    [(OADStroke *)v3 setTail:v12];

    LODWORD(v13) = 0.75;
    [(OADStroke *)v3 setWidth:v13];
    [(OADStroke *)v3 setCap:2];
    [(OADStroke *)v3 setCompoundType:0];
    [(OADStroke *)v3 setPenAlignment:0];
  }
  return v3;
}

- (void)setColor:(id)a3
{
  *((unsigned char *)self + 84) |= 1u;
}

- (void)setFill:(id)a3
{
}

- (void)setDash:(id)a3
{
}

- (void)setJoin:(id)a3
{
}

- (void)setHead:(id)a3
{
}

- (void)setTail:(id)a3
{
}

- (void)setWidth:(float)a3
{
  self->mWidth = a3;
  *((unsigned char *)self + 84) |= 2u;
}

- (void)setCap:(unsigned __int8)a3
{
  self->mCap = a3;
  *((unsigned char *)self + 84) |= 4u;
}

- (void)setCompoundType:(unsigned __int8)a3
{
  self->mCompoundType = a3;
  *((unsigned char *)self + 84) |= 8u;
}

- (void)setPenAlignment:(int)a3
{
  self->mPenAlignment = a3;
  *((unsigned char *)self + 84) |= 0x10u;
}

- (void)setParent:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)OADStroke;
  [(OADProperties *)&v12 setParent:v4];
  if (self->mFill)
  {
    v5 = [v4 fill];
    if ([v5 isMemberOfClass:objc_opt_class()]) {
      [(OADProperties *)self->mFill setParent:v5];
    }
  }
  if (self->mDash)
  {
    v6 = [v4 dash];
    if ([v6 isMemberOfClass:objc_opt_class()]) {
      [(OADProperties *)self->mDash setParent:v6];
    }
  }
  if (self->mJoin)
  {
    v7 = [v4 join];
    if ([v7 isMemberOfClass:objc_opt_class()]) {
      [(OADProperties *)self->mJoin setParent:v7];
    }
  }
  mHead = self->mHead;
  if (mHead)
  {
    v9 = [v4 head];
    [(OADProperties *)mHead setParent:v9];
  }
  mTail = self->mTail;
  if (mTail)
  {
    v11 = [v4 tail];
    [(OADProperties *)mTail setParent:v11];
  }
}

- (OADLineEnd)head
{
  v2 = [(OADProperties *)self overrideForSelector:sel_isHeadOverridden];
  objc_super v3 = (OADLineEnd *)v2[7];

  return v3;
}

- (OADLineEnd)tail
{
  v2 = [(OADProperties *)self overrideForSelector:sel_isTailOverridden];
  objc_super v3 = (OADLineEnd *)v2[8];

  return v3;
}

+ (id)nullStroke
{
  v2 = objc_alloc_init(OADStroke);
  objc_super v3 = +[OADNullFill nullFill];
  [(OADStroke *)v2 setFill:v3];

  return v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    v7 = (unsigned __int8 *)v4;
    BOOL v6 = (*((unsigned char *)self + 84) & 1) == (v7[84] & 1)
      && ((*((unsigned char *)self + 84) & 1) == 0 || [(OADColor *)self->mColor isEqual:*((void *)v7 + 3)])
      && TCObjectEqual((objc_object *)self->mFill, *((objc_object **)v7 + 4))
      && TCObjectEqual((objc_object *)self->mDash, *((objc_object **)v7 + 5))
      && TCObjectEqual((objc_object *)self->mJoin, *((objc_object **)v7 + 6))
      && TCObjectEqual((objc_object *)self->mHead, *((objc_object **)v7 + 7))
      && TCObjectEqual((objc_object *)self->mTail, *((objc_object **)v7 + 8))
      && ((v7[84] >> 1) & 1) == (*((unsigned char *)self + 84) & 2) >> 1
      && ((*((unsigned char *)self + 84) & 2) == 0 || self->mWidth == *((float *)v7 + 18))
      && ((v7[84] >> 2) & 1) == (*((unsigned char *)self + 84) & 4) >> 2
      && ((*((unsigned char *)self + 84) & 4) == 0 || self->mCap == v7[76])
      && ((v7[84] >> 3) & 1) == (*((unsigned char *)self + 84) & 8) >> 3
      && ((*((unsigned char *)self + 84) & 8) == 0 || self->mCompoundType == v7[77])
      && ((v7[84] >> 4) & 1) == (*((unsigned char *)self + 84) & 0x10) >> 4
      && ((*((unsigned char *)self + 84) & 0x10) == 0 || self->mPenAlignment == *((_DWORD *)v7 + 20));
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)fill
{
  v2 = [(OADProperties *)self overrideForSelector:sel_isFillOverridden];
  id v3 = v2[4];

  return v3;
}

- (BOOL)isFillOverridden
{
  return self->mFill || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (unint64_t)hash
{
  if (*((unsigned char *)self + 84)) {
    unint64_t v3 = [(OADColor *)self->mColor hash];
  }
  else {
    unint64_t v3 = 0;
  }
  mFill = self->mFill;
  if (mFill) {
    v3 ^= [(OADFill *)mFill hash];
  }
  mDash = self->mDash;
  if (mDash) {
    v3 ^= [(OADDash *)mDash hash];
  }
  mJoin = self->mJoin;
  if (mJoin) {
    v3 ^= [(OADProperties *)mJoin hash];
  }
  mHead = self->mHead;
  if (mHead) {
    v3 ^= [(OADLineEnd *)mHead hash];
  }
  mTail = self->mTail;
  if (mTail) {
    v3 ^= [(OADLineEnd *)mTail hash];
  }
  if ((*((unsigned char *)self + 84) & 2) != 0) {
    v3 ^= (unint64_t)self->mWidth;
  }
  if ((*((unsigned char *)self + 84) & 4) != 0) {
    v3 ^= self->mCap;
  }
  if ((*((unsigned char *)self + 84) & 8) != 0) {
    v3 ^= self->mCompoundType;
  }
  if ((*((unsigned char *)self + 84) & 0x10) != 0) {
    v3 ^= self->mPenAlignment;
  }
  return v3;
}

- (float)width
{
  v2 = [(OADProperties *)self overrideForSelector:sel_isWidthOverridden];
  float v3 = v2[18];

  return v3;
}

- (BOOL)isWidthOverridden
{
  return (*((unsigned char *)self + 84) & 2) != 0
      || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (BOOL)isDashOverridden
{
  return self->mDash || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (id)dash
{
  v2 = [(OADProperties *)self overrideForSelector:sel_isDashOverridden];
  id v3 = v2[5];

  return v3;
}

- (BOOL)isCompoundTypeOverridden
{
  return (*((unsigned char *)self + 84) & 8) != 0
      || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (unsigned)compoundType
{
  v2 = [(OADProperties *)self overrideForSelector:sel_isCompoundTypeOverridden];
  unsigned __int8 v3 = v2[77];

  return v3;
}

- (id)color
{
  v2 = [(OADProperties *)self overrideForSelector:sel_isColorOverridden];
  id v3 = v2[3];

  return v3;
}

- (BOOL)isColorOverridden
{
  return (*((unsigned char *)self + 84) & 1) != 0
      || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (*((unsigned char *)self + 84))
  {
    id v7 = [(OADColor *)self->mColor copyWithZone:a3];
    [v5 setColor:v7];
  }
  mFill = self->mFill;
  if (mFill)
  {
    id v9 = [(OADFill *)mFill copyWithZone:a3];
    [v5 setFill:v9];
  }
  mDash = self->mDash;
  if (mDash)
  {
    id v11 = [(OADDash *)mDash copyWithZone:a3];
    [v5 setDash:v11];
  }
  mJoin = self->mJoin;
  if (mJoin)
  {
    id v13 = [(OADLineJoin *)mJoin copyWithZone:a3];
    [v5 setJoin:v13];
  }
  mHead = self->mHead;
  if (mHead)
  {
    id v15 = [(OADLineEnd *)mHead copyWithZone:a3];
    [v5 setHead:v15];
  }
  mTail = self->mTail;
  if (mTail)
  {
    id v17 = [(OADLineEnd *)mTail copyWithZone:a3];
    [v5 setTail:v17];
  }
  if ((*((unsigned char *)self + 84) & 2) != 0)
  {
    *(float *)&double v6 = self->mWidth;
    [v5 setWidth:v6];
  }
  if ((*((unsigned char *)self + 84) & 4) != 0) {
    [v5 setCap:self->mCap];
  }
  if ((*((unsigned char *)self + 84) & 8) != 0) {
    [v5 setCompoundType:self->mCompoundType];
  }
  if ((*((unsigned char *)self + 84) & 0x10) != 0) {
    [v5 setPenAlignment:self->mPenAlignment];
  }
  return v5;
}

+ (id)blackStroke
{
  v2 = objc_alloc_init(OADStroke);
  id v3 = +[OADSolidFill blackFill];
  [(OADStroke *)v2 setFill:v3];

  return v2;
}

- (void)setStyleColor:(id)a3
{
}

- (id)join
{
  v2 = [(OADProperties *)self overrideForSelector:sel_isJoinOverridden];
  id v3 = v2[6];

  return v3;
}

- (BOOL)isJoinOverridden
{
  return self->mJoin || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (BOOL)isAnythingOverridden
{
  v4.receiver = self;
  v4.super_class = (Class)OADStroke;
  return [(OADProperties *)&v4 isAnythingOverridden]
      || [(OADStroke *)self isColorOverridden]
      || [(OADStroke *)self isFillOverridden]
      || [(OADStroke *)self isDashOverridden]
      || [(OADStroke *)self isJoinOverridden]
      || [(OADStroke *)self isWidthOverridden]
      || [(OADStroke *)self isCapOverridden]
      || [(OADStroke *)self isCompoundTypeOverridden]
      || [(OADStroke *)self isPenAlignmentOverridden]
      || [(OADStroke *)self isHeadOverridden]
      || [(OADStroke *)self isTailOverridden];
}

- (void)fixPropertiesForChangingParentPreservingEffectiveValues:(id)a3
{
  id v4 = a3;
  v66.receiver = self;
  v66.super_class = (Class)OADStroke;
  [(OADProperties *)&v66 fixPropertiesForChangingParentPreservingEffectiveValues:v4];
  if ((*((unsigned char *)self + 84) & 1) != 0
    || ([(OADProperties *)self parent], id v5 = (id)objc_claimAutoreleasedReturnValue(),
                                                 v5,
                                                 v5 != v4))
  {
    double v6 = [(OADProperties *)self possiblyInexistentOverrideForSelector:sel_isColorOverridden];

    if (v6)
    {
      id v7 = [(OADStroke *)self color];
    }
    else
    {
      id v7 = 0;
    }
    v8 = [v4 possiblyInexistentOverrideForSelector:sel_isColorOverridden];

    if (v8)
    {
      id v9 = [v4 color];
    }
    else
    {
      id v9 = 0;
    }
    if (TCObjectEqual(v7, v9))
    {
      mColor = self->mColor;
      self->mColor = 0;

      *((unsigned char *)self + 84) &= ~1u;
    }
    else if ((*((unsigned char *)self + 84) & 1) == 0 && v6)
    {
      [(OADStroke *)self setColor:v7];
    }
  }
  p_mFill = &self->mFill;
  if (self->mFill
    || ([(OADProperties *)self parent],
        id v12 = (id)objc_claimAutoreleasedReturnValue(),
        v12,
        v12 != v4))
  {
    id v13 = [(OADStroke *)self fill];
    id v14 = objc_alloc_init((Class)objc_opt_class());

    id v15 = [(OADStroke *)self fill];
    [v14 setParent:v15];

    objc_storeStrong((id *)&self->mFill, v14);
    v16 = [v4 possiblyInexistentOverrideForSelector:sel_isFillOverridden];

    if (v16)
    {
      v16 = [v4 fill];
    }
    if (*p_mFill == v16)
    {
      v19 = v16;
    }
    else
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      if ((isKindOfClass & 1) == 0)
      {
        uint64_t v18 = [(id)objc_opt_class() defaultProperties];

        v16 = (OADFill *)v18;
      }
      [(OADProperties *)*p_mFill changeParentPreservingEffectiveValues:v16];
      if ((isKindOfClass & 1) == 0 || [(OADProperties *)*p_mFill isAnythingOverridden]) {
        goto LABEL_27;
      }
      v19 = *p_mFill;
    }
    *p_mFill = 0;

LABEL_27:
  }
  p_mDash = &self->mDash;
  if (self->mDash
    || ([(OADProperties *)self parent],
        id v21 = (id)objc_claimAutoreleasedReturnValue(),
        v21,
        v21 != v4))
  {
    v22 = [(OADStroke *)self dash];
    id v23 = objc_alloc_init((Class)objc_opt_class());

    v24 = [(OADStroke *)self dash];
    [v23 setParent:v24];

    objc_storeStrong((id *)&self->mDash, v23);
    v25 = [v4 possiblyInexistentOverrideForSelector:sel_isDashOverridden];

    if (v25)
    {
      v25 = [v4 dash];
    }
    if (*p_mDash == v25)
    {
      v28 = v25;
    }
    else
    {
      objc_opt_class();
      char v26 = objc_opt_isKindOfClass();
      if ((v26 & 1) == 0)
      {
        uint64_t v27 = [(id)objc_opt_class() defaultProperties];

        v25 = (OADDash *)v27;
      }
      [(OADProperties *)*p_mDash changeParentPreservingEffectiveValues:v25];
      if ((v26 & 1) == 0 || [(OADProperties *)*p_mDash isAnythingOverridden]) {
        goto LABEL_40;
      }
      v28 = *p_mDash;
    }
    *p_mDash = 0;

LABEL_40:
  }
  p_mJoin = &self->mJoin;
  if (self->mJoin
    || ([(OADProperties *)self parent],
        id v30 = (id)objc_claimAutoreleasedReturnValue(),
        v30,
        v30 != v4))
  {
    v31 = [(OADStroke *)self join];
    id v32 = objc_alloc_init((Class)objc_opt_class());

    v33 = [(OADStroke *)self join];
    [v32 setParent:v33];

    objc_storeStrong((id *)&self->mJoin, v32);
    v34 = [v4 possiblyInexistentOverrideForSelector:sel_isJoinOverridden];

    if (v34)
    {
      v34 = [v4 join];
    }
    if (*p_mJoin == v34)
    {
      v37 = v34;
    }
    else
    {
      objc_opt_class();
      char v35 = objc_opt_isKindOfClass();
      if ((v35 & 1) == 0)
      {
        uint64_t v36 = [(id)objc_opt_class() defaultProperties];

        v34 = (OADLineJoin *)v36;
      }
      [(OADProperties *)*p_mJoin changeParentPreservingEffectiveValues:v34];
      if ((v35 & 1) == 0 || [(OADProperties *)*p_mJoin isAnythingOverridden]) {
        goto LABEL_53;
      }
      v37 = *p_mJoin;
    }
    *p_mJoin = 0;

LABEL_53:
  }
  p_mHead = &self->mHead;
  if (self->mHead
    || ([(OADProperties *)self parent],
        id v39 = (id)objc_claimAutoreleasedReturnValue(),
        v39,
        v39 != v4))
  {
    v40 = [(OADStroke *)self head];
    id v41 = objc_alloc_init((Class)objc_opt_class());

    v42 = [(OADStroke *)self head];
    [v41 setParent:v42];

    objc_storeStrong((id *)&self->mHead, v41);
    v43 = [v4 possiblyInexistentOverrideForSelector:sel_isHeadOverridden];

    if (v43)
    {
      v43 = [v4 head];
    }
    if (*p_mHead == v43)
    {
      v46 = v43;
    }
    else
    {
      objc_opt_class();
      char v44 = objc_opt_isKindOfClass();
      if ((v44 & 1) == 0)
      {
        uint64_t v45 = [(id)objc_opt_class() defaultProperties];

        v43 = (OADLineEnd *)v45;
      }
      [(OADProperties *)*p_mHead changeParentPreservingEffectiveValues:v43];
      if ((v44 & 1) == 0 || [(OADLineEnd *)*p_mHead isAnythingOverridden]) {
        goto LABEL_66;
      }
      v46 = *p_mHead;
    }
    *p_mHead = 0;

LABEL_66:
  }
  p_mTail = &self->mTail;
  if (self->mTail
    || ([(OADProperties *)self parent],
        id v48 = (id)objc_claimAutoreleasedReturnValue(),
        v48,
        v48 != v4))
  {
    v49 = [(OADStroke *)self tail];
    id v50 = objc_alloc_init((Class)objc_opt_class());

    v51 = [(OADStroke *)self tail];
    [v50 setParent:v51];

    objc_storeStrong((id *)&self->mTail, v50);
    v52 = [v4 possiblyInexistentOverrideForSelector:sel_isTailOverridden];

    if (v52)
    {
      v52 = [v4 tail];
    }
    if (*p_mTail == v52)
    {
      v55 = v52;
    }
    else
    {
      objc_opt_class();
      char v53 = objc_opt_isKindOfClass();
      if ((v53 & 1) == 0)
      {
        uint64_t v54 = [(id)objc_opt_class() defaultProperties];

        v52 = (OADLineEnd *)v54;
      }
      [(OADProperties *)*p_mTail changeParentPreservingEffectiveValues:v52];
      if ((v53 & 1) == 0 || [(OADLineEnd *)*p_mTail isAnythingOverridden]) {
        goto LABEL_79;
      }
      v55 = *p_mTail;
    }
    *p_mTail = 0;

LABEL_79:
  }
  if ((*((unsigned char *)self + 84) & 2) != 0
    || ([(OADProperties *)self parent],
        id v56 = (id)objc_claimAutoreleasedReturnValue(),
        v56,
        v56 != v4))
  {
    [(OADStroke *)self width];
    float v58 = v57;
    [v4 width];
    if (v58 == v59)
    {
      *((unsigned char *)self + 84) &= ~2u;
    }
    else if ((*((unsigned char *)self + 84) & 2) == 0)
    {
      [(OADStroke *)self width];
      -[OADStroke setWidth:](self, "setWidth:");
    }
  }
  if ((*((unsigned char *)self + 84) & 4) != 0
    || ([(OADProperties *)self parent],
        id v60 = (id)objc_claimAutoreleasedReturnValue(),
        v60,
        v60 != v4))
  {
    int v61 = [(OADStroke *)self cap];
    if (v61 == [v4 cap])
    {
      *((unsigned char *)self + 84) &= ~4u;
    }
    else if ((*((unsigned char *)self + 84) & 4) == 0)
    {
      [(OADStroke *)self setCap:[(OADStroke *)self cap]];
    }
  }
  if ((*((unsigned char *)self + 84) & 8) != 0
    || ([(OADProperties *)self parent],
        id v62 = (id)objc_claimAutoreleasedReturnValue(),
        v62,
        v62 != v4))
  {
    int v63 = [(OADStroke *)self compoundType];
    if (v63 == [v4 compoundType])
    {
      *((unsigned char *)self + 84) &= ~8u;
    }
    else if ((*((unsigned char *)self + 84) & 8) == 0)
    {
      [(OADStroke *)self setCompoundType:[(OADStroke *)self compoundType]];
    }
  }
  if ((*((unsigned char *)self + 84) & 0x10) != 0
    || ([(OADProperties *)self parent],
        id v64 = (id)objc_claimAutoreleasedReturnValue(),
        v64,
        v64 != v4))
  {
    int v65 = [(OADStroke *)self penAlignment];
    if (v65 == [v4 penAlignment])
    {
      *((unsigned char *)self + 84) &= ~0x10u;
    }
    else if ((*((unsigned char *)self + 84) & 0x10) == 0)
    {
      [(OADStroke *)self setPenAlignment:[(OADStroke *)self penAlignment]];
    }
  }
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
  if ([(OADStroke *)self isColorOverridden])
  {
    double v6 = [(OADProperties *)self parent];
    id v7 = [(OADStroke *)self color];
    v8 = [v6 color];
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
    mColor = self->mColor;
    self->mColor = 0;

    *((unsigned char *)self + 84) &= ~1u;
    goto LABEL_9;
  }
LABEL_10:
  if (![(OADStroke *)self isFillOverridden]) {
    goto LABEL_18;
  }
  id v13 = [(OADProperties *)self parent];
  id v14 = [(OADStroke *)self fill];
  id v15 = [v13 fill];
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
    mFill = self->mFill;
    self->mFill = 0;
  }
LABEL_17:

LABEL_18:
  if (![(OADStroke *)self isDashOverridden]) {
    goto LABEL_26;
  }
  v20 = [(OADProperties *)self parent];
  id v21 = [(OADStroke *)self dash];
  v22 = [v20 dash];
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
    mDash = self->mDash;
    self->mDash = 0;
  }
LABEL_25:

LABEL_26:
  if (![(OADStroke *)self isJoinOverridden]) {
    goto LABEL_34;
  }
  uint64_t v27 = [(OADProperties *)self parent];
  v28 = [(OADStroke *)self join];
  v29 = [v27 join];
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
    mJoin = self->mJoin;
    self->mJoin = 0;
  }
LABEL_33:

LABEL_34:
  if (![(OADStroke *)self isHeadOverridden]) {
    goto LABEL_42;
  }
  v34 = [(OADProperties *)self parent];
  char v35 = [(OADStroke *)self head];
  uint64_t v36 = [v34 head];
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
    mHead = self->mHead;
    self->mHead = 0;
  }
LABEL_41:

LABEL_42:
  if ([(OADStroke *)self isTailOverridden])
  {
    id v41 = [(OADProperties *)self parent];
    v42 = [(OADStroke *)self tail];
    v43 = [v41 tail];
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
    mTail = self->mTail;
    self->mTail = 0;

    goto LABEL_49;
  }
LABEL_50:
  if ([(OADStroke *)self isWidthOverridden])
  {
    id v48 = [(OADProperties *)self parent];
    [(OADStroke *)self width];
    float v50 = v49;
    [v48 width];
    if (v50 == *(float *)&v51)
    {
      LODWORD(v51) = 0.75;
      [(OADStroke *)self setWidth:v51];
      *((unsigned char *)self + 84) &= ~2u;
    }
  }
  if ([(OADStroke *)self isCapOverridden])
  {
    v52 = [(OADProperties *)self parent];
    int v53 = [(OADStroke *)self cap];
    if (v53 == [v52 cap])
    {
      [(OADStroke *)self setCap:2];
      *((unsigned char *)self + 84) &= ~4u;
    }
  }
  if ([(OADStroke *)self isCompoundTypeOverridden])
  {
    uint64_t v54 = [(OADProperties *)self parent];
    int v55 = [(OADStroke *)self compoundType];
    if (v55 == [v54 compoundType])
    {
      [(OADStroke *)self setCompoundType:0];
      *((unsigned char *)self + 84) &= ~8u;
    }
  }
  if ([(OADStroke *)self isPenAlignmentOverridden])
  {
    id v56 = [(OADProperties *)self parent];
    int v57 = [(OADStroke *)self penAlignment];
    if (v57 == [v56 penAlignment])
    {
      [(OADStroke *)self setPenAlignment:0];
      *((unsigned char *)self + 84) &= ~0x10u;
    }
  }
  [(OADProperties *)self setMerged:v4];
  [(OADProperties *)self setMergedWithParent:v5];
  v58.receiver = self;
  v58.super_class = (Class)OADStroke;
  [(OADProperties *)&v58 removeUnnecessaryOverrides];
}

void __30__OADStroke_defaultProperties__block_invoke()
{
  v0 = [[OADStroke alloc] initWithDefaults];
  v1 = (void *)+[OADStroke defaultProperties]::defaultProperties;
  +[OADStroke defaultProperties]::defaultProperties = (uint64_t)v0;
}

- (BOOL)isHeadOverridden
{
  return self->mHead || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (BOOL)isTailOverridden
{
  return self->mTail || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (unsigned)cap
{
  v2 = [(OADProperties *)self overrideForSelector:sel_isCapOverridden];
  unsigned __int8 v3 = v2[76];

  return v3;
}

- (BOOL)isCapOverridden
{
  return (*((unsigned char *)self + 84) & 4) != 0
      || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (int)penAlignment
{
  v2 = [(OADProperties *)self overrideForSelector:sel_isPenAlignmentOverridden];
  int v3 = v2[20];

  return v3;
}

- (BOOL)isPenAlignmentOverridden
{
  return (*((unsigned char *)self + 84) & 0x10) != 0
      || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mTail, 0);
  objc_storeStrong((id *)&self->mHead, 0);
  objc_storeStrong((id *)&self->mJoin, 0);
  objc_storeStrong((id *)&self->mDash, 0);
  objc_storeStrong((id *)&self->mFill, 0);
  objc_storeStrong((id *)&self->mColor, 0);
}

@end