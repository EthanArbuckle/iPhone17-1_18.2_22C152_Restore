@interface OADTextBodyProperties
+ (id)defaultEscherWordArtProperties;
+ (id)defaultProperties;
- (BOOL)hasAutoFit;
- (BOOL)hasBottomInset;
- (BOOL)hasColumnCount;
- (BOOL)hasColumnSpacing;
- (BOOL)hasFlowType;
- (BOOL)hasHorizontalOverflowType;
- (BOOL)hasIsAnchorCenter;
- (BOOL)hasIsLeftToRightColumns;
- (BOOL)hasIsUpright;
- (BOOL)hasLeftInset;
- (BOOL)hasRespectLastFirstLineSpacing;
- (BOOL)hasRightInset;
- (BOOL)hasRotation;
- (BOOL)hasTextAnchorType;
- (BOOL)hasTextBodyId;
- (BOOL)hasTextWarp;
- (BOOL)hasTopInset;
- (BOOL)hasVerticalOverflowType;
- (BOOL)hasWrapType;
- (BOOL)isAnchorCenter;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLeftToRightColumns;
- (BOOL)isUpright;
- (BOOL)isWarped;
- (BOOL)respectLastFirstLineSpacing;
- (OADTextBodyProperties)init;
- (OADTextBodyProperties)initWithDefaults;
- (float)bottomInset;
- (float)columnSpacing;
- (float)leftInset;
- (float)rightInset;
- (float)rotation;
- (float)topInset;
- (id)autoFit;
- (id)description;
- (id)textWarp;
- (int)columnCount;
- (int)textBodyId;
- (unint64_t)hash;
- (unsigned)flowType;
- (unsigned)horizontalOverflowType;
- (unsigned)textAnchorType;
- (unsigned)verticalOverflowType;
- (unsigned)wrapType;
- (void)fixPropertiesForChangingParentPreservingEffectiveValues:(id)a3;
- (void)removeUnnecessaryOverrides;
- (void)setAutoFit:(id)a3;
- (void)setBottomInset:(float)a3;
- (void)setColumnCount:(int)a3;
- (void)setColumnSpacing:(float)a3;
- (void)setFlowType:(unsigned __int8)a3;
- (void)setHorizontalOverflowType:(unsigned __int8)a3;
- (void)setIsAnchorCenter:(BOOL)a3;
- (void)setIsLeftToRightColumns:(BOOL)a3;
- (void)setIsUpright:(BOOL)a3;
- (void)setLeftInset:(float)a3;
- (void)setRespectLastFirstLineSpacing:(BOOL)a3;
- (void)setRightInset:(float)a3;
- (void)setRotation:(float)a3;
- (void)setTextAnchorType:(unsigned __int8)a3;
- (void)setTextBodyId:(int)a3;
- (void)setTextWarp:(id)a3;
- (void)setTopInset:(float)a3;
- (void)setVerticalOverflowType:(unsigned __int8)a3;
- (void)setWrapType:(unsigned __int8)a3;
@end

@implementation OADTextBodyProperties

- (OADTextBodyProperties)init
{
  v3.receiver = self;
  v3.super_class = (Class)OADTextBodyProperties;
  return [(OADProperties *)&v3 init];
}

+ (id)defaultProperties
{
  if (+[OADTextBodyProperties defaultProperties]::once != -1) {
    dispatch_once(&+[OADTextBodyProperties defaultProperties]::once, &__block_literal_global_64);
  }
  v2 = (void *)+[OADTextBodyProperties defaultProperties]::defaultProperties;
  return v2;
}

- (OADTextBodyProperties)initWithDefaults
{
  v13.receiver = self;
  v13.super_class = (Class)OADTextBodyProperties;
  v2 = [(OADProperties *)&v13 initWithDefaults];
  objc_super v3 = v2;
  if (v2)
  {
    [(OADTextBodyProperties *)v2 setRespectLastFirstLineSpacing:1];
    LODWORD(v4) = 1080452710;
    [(OADTextBodyProperties *)v3 setTopInset:v4];
    LODWORD(v5) = 1088841318;
    [(OADTextBodyProperties *)v3 setLeftInset:v5];
    LODWORD(v6) = 1080452710;
    [(OADTextBodyProperties *)v3 setBottomInset:v6];
    LODWORD(v7) = 1088841318;
    [(OADTextBodyProperties *)v3 setRightInset:v7];
    [(OADTextBodyProperties *)v3 setColumnCount:1];
    LODWORD(v8) = 3.0;
    [(OADTextBodyProperties *)v3 setColumnSpacing:v8];
    [(OADTextBodyProperties *)v3 setIsLeftToRightColumns:1];
    v9 = [[OADTextBodyAutoFit alloc] initWithType:0];
    [(OADTextBodyProperties *)v3 setAutoFit:v9];
    [(OADTextBodyProperties *)v3 setFlowType:0];
    [(OADTextBodyProperties *)v3 setWrapType:1];
    [(OADTextBodyProperties *)v3 setVerticalOverflowType:0];
    [(OADTextBodyProperties *)v3 setHorizontalOverflowType:0];
    v10 = +[OADTextWarp nullWarp];
    [(OADTextBodyProperties *)v3 setTextWarp:v10];

    [(OADTextBodyProperties *)v3 setIsAnchorCenter:0];
    [(OADTextBodyProperties *)v3 setTextAnchorType:0];
    [(OADTextBodyProperties *)v3 setIsUpright:0];
    [(OADTextBodyProperties *)v3 setRotation:0.0];
    v11 = v3;
  }
  return v3;
}

- (void)setRespectLastFirstLineSpacing:(BOOL)a3
{
  *((unsigned char *)self + 73) = *((unsigned char *)self + 73) & 0xFE | a3;
  *((unsigned char *)self + 75) |= 1u;
}

- (void)setTopInset:(float)a3
{
  self->mTopInset = a3;
  *((unsigned char *)self + 75) |= 2u;
}

- (void)setLeftInset:(float)a3
{
  self->mLeftInset = a3;
  *((unsigned char *)self + 75) |= 4u;
}

- (void)setBottomInset:(float)a3
{
  self->mBottomInset = a3;
  *((unsigned char *)self + 75) |= 0x10u;
}

- (void)setRightInset:(float)a3
{
  self->mRightInset = a3;
  *((unsigned char *)self + 75) |= 8u;
}

- (void)setColumnCount:(int)a3
{
  self->mColumnCount = a3;
  *((unsigned char *)self + 74) |= 0x20u;
}

- (void)setColumnSpacing:(float)a3
{
  self->mColumnSpacing = a3;
  *((unsigned char *)self + 74) |= 0x40u;
}

- (void)setIsLeftToRightColumns:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 73) = *((unsigned char *)self + 73) & 0xF7 | v3;
  *((unsigned char *)self + 74) |= 0x80u;
}

- (void)setAutoFit:(id)a3
{
}

- (void)setFlowType:(unsigned __int8)a3
{
  self->mFlowType = a3;
  *((unsigned char *)self + 73) |= 0x80u;
}

- (void)setWrapType:(unsigned __int8)a3
{
  self->mWrapType = a3;
  *((unsigned char *)self + 74) |= 1u;
}

- (void)setVerticalOverflowType:(unsigned __int8)a3
{
  self->mVerticalOverflowType = a3;
  *((unsigned char *)self + 73) |= 0x10u;
}

- (void)setHorizontalOverflowType:(unsigned __int8)a3
{
  self->mHorizontalOverflowType = a3;
  *((unsigned char *)self + 73) |= 0x20u;
}

- (void)setTextWarp:(id)a3
{
}

- (void)setIsAnchorCenter:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 73) = *((unsigned char *)self + 73) & 0xFB | v3;
  *((unsigned char *)self + 74) |= 4u;
}

- (void)setTextAnchorType:(unsigned __int8)a3
{
  *((unsigned char *)self + 74) |= 2u;
  self->mTextAnchorType = a3;
}

- (void)setIsUpright:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 73) = *((unsigned char *)self + 73) & 0xFD | v3;
  *((unsigned char *)self + 74) |= 8u;
}

- (void)setRotation:(float)a3
{
  self->mRotation = a3;
  *((unsigned char *)self + 74) |= 0x10u;
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
  if ([(OADTextBodyProperties *)self hasRespectLastFirstLineSpacing])
  {
    double v6 = [(OADProperties *)self parent];
    int v7 = [(OADTextBodyProperties *)self respectLastFirstLineSpacing];
    if (v7 == [v6 respectLastFirstLineSpacing])
    {
      [(OADTextBodyProperties *)self setRespectLastFirstLineSpacing:0];
      *((unsigned char *)self + 75) &= ~1u;
    }
  }
  if ([(OADTextBodyProperties *)self hasTopInset])
  {
    double v8 = [(OADProperties *)self parent];
    [(OADTextBodyProperties *)self topInset];
    float v10 = v9;
    [v8 topInset];
    if (v10 == v11)
    {
      [(OADTextBodyProperties *)self setTopInset:0.0];
      *((unsigned char *)self + 75) &= ~2u;
    }
  }
  if ([(OADTextBodyProperties *)self hasLeftInset])
  {
    v12 = [(OADProperties *)self parent];
    [(OADTextBodyProperties *)self leftInset];
    float v14 = v13;
    [v12 leftInset];
    if (v14 == v15)
    {
      [(OADTextBodyProperties *)self setLeftInset:0.0];
      *((unsigned char *)self + 75) &= ~4u;
    }
  }
  if ([(OADTextBodyProperties *)self hasRightInset])
  {
    v16 = [(OADProperties *)self parent];
    [(OADTextBodyProperties *)self rightInset];
    float v18 = v17;
    [v16 rightInset];
    if (v18 == v19)
    {
      [(OADTextBodyProperties *)self setRightInset:0.0];
      *((unsigned char *)self + 75) &= ~8u;
    }
  }
  if ([(OADTextBodyProperties *)self hasBottomInset])
  {
    v20 = [(OADProperties *)self parent];
    [(OADTextBodyProperties *)self bottomInset];
    float v22 = v21;
    [v20 bottomInset];
    if (v22 == v23)
    {
      [(OADTextBodyProperties *)self setBottomInset:0.0];
      *((unsigned char *)self + 75) &= ~0x10u;
    }
  }
  if ([(OADTextBodyProperties *)self hasColumnCount])
  {
    v24 = [(OADProperties *)self parent];
    int v25 = [(OADTextBodyProperties *)self columnCount];
    if (v25 == [v24 columnCount])
    {
      [(OADTextBodyProperties *)self setColumnCount:0];
      *((unsigned char *)self + 74) &= ~0x20u;
    }
  }
  if ([(OADTextBodyProperties *)self hasColumnSpacing])
  {
    v26 = [(OADProperties *)self parent];
    [(OADTextBodyProperties *)self columnSpacing];
    float v28 = v27;
    [v26 columnSpacing];
    if (v28 == v29)
    {
      [(OADTextBodyProperties *)self setColumnSpacing:0.0];
      *((unsigned char *)self + 74) &= ~0x40u;
    }
  }
  if ([(OADTextBodyProperties *)self hasIsLeftToRightColumns])
  {
    v30 = [(OADProperties *)self parent];
    int v31 = [(OADTextBodyProperties *)self isLeftToRightColumns];
    if (v31 == [v30 isLeftToRightColumns])
    {
      [(OADTextBodyProperties *)self setIsLeftToRightColumns:0];
      *((unsigned char *)self + 74) &= ~0x80u;
    }
  }
  if ([(OADTextBodyProperties *)self hasAutoFit])
  {
    v32 = [(OADProperties *)self parent];
    v33 = [(OADTextBodyProperties *)self autoFit];
    v34 = [v32 autoFit];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(objc_object *)v33 removeUnnecessaryOverrides];
      uint64_t v35 = objc_opt_class();
      if (v35 != objc_opt_class()) {
        goto LABEL_41;
      }
      uint64_t v36 = [(objc_object *)v33 isMergedWithParent];
      [(objc_object *)v33 setMergedWithParent:0];
      char v37 = [(objc_object *)v33 isAnythingOverridden];
      [(objc_object *)v33 setMergedWithParent:v36];
      if (v37) {
        goto LABEL_41;
      }
    }
    else if (!TCObjectEqual(v33, v34))
    {
LABEL_41:

      goto LABEL_42;
    }
    mAutoFit = self->mAutoFit;
    self->mAutoFit = 0;

    goto LABEL_41;
  }
LABEL_42:
  if ([(OADTextBodyProperties *)self hasFlowType])
  {
    v39 = [(OADProperties *)self parent];
    int v40 = [(OADTextBodyProperties *)self flowType];
    if (v40 == [v39 flowType])
    {
      [(OADTextBodyProperties *)self setFlowType:0];
      *((unsigned char *)self + 73) &= ~0x80u;
    }
  }
  if ([(OADTextBodyProperties *)self hasWrapType])
  {
    v41 = [(OADProperties *)self parent];
    int v42 = [(OADTextBodyProperties *)self wrapType];
    if (v42 == [v41 wrapType])
    {
      [(OADTextBodyProperties *)self setWrapType:0];
      *((unsigned char *)self + 74) &= ~1u;
    }
  }
  if ([(OADTextBodyProperties *)self hasVerticalOverflowType])
  {
    v43 = [(OADProperties *)self parent];
    int v44 = [(OADTextBodyProperties *)self verticalOverflowType];
    if (v44 == [v43 verticalOverflowType])
    {
      [(OADTextBodyProperties *)self setVerticalOverflowType:0];
      *((unsigned char *)self + 73) &= ~0x10u;
    }
  }
  if ([(OADTextBodyProperties *)self hasTextBodyId])
  {
    v45 = [(OADProperties *)self parent];
    int v46 = [(OADTextBodyProperties *)self textBodyId];
    if (v46 == [v45 textBodyId])
    {
      [(OADTextBodyProperties *)self setTextBodyId:0];
      *((unsigned char *)self + 73) &= ~0x40u;
    }
  }
  if (![(OADTextBodyProperties *)self hasTextWarp]) {
    goto LABEL_66;
  }
  v47 = [(OADProperties *)self parent];
  v48 = [(OADTextBodyProperties *)self textWarp];
  v49 = [v47 textWarp];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(objc_object *)v48 removeUnnecessaryOverrides];
    uint64_t v50 = objc_opt_class();
    if (v50 != objc_opt_class()) {
      goto LABEL_65;
    }
    uint64_t v51 = [(objc_object *)v48 isMergedWithParent];
    [(objc_object *)v48 setMergedWithParent:0];
    char v52 = [(objc_object *)v48 isAnythingOverridden];
    [(objc_object *)v48 setMergedWithParent:v51];
    if (v52) {
      goto LABEL_65;
    }
    goto LABEL_64;
  }
  if (TCObjectEqual(v48, v49))
  {
LABEL_64:
    mTextWarp = self->mTextWarp;
    self->mTextWarp = 0;
  }
LABEL_65:

LABEL_66:
  if ([(OADTextBodyProperties *)self hasIsAnchorCenter])
  {
    v54 = [(OADProperties *)self parent];
    int v55 = [(OADTextBodyProperties *)self isAnchorCenter];
    if (v55 == [v54 isAnchorCenter])
    {
      [(OADTextBodyProperties *)self setIsAnchorCenter:0];
      *((unsigned char *)self + 74) &= ~4u;
    }
  }
  if ([(OADTextBodyProperties *)self hasTextAnchorType])
  {
    v56 = [(OADProperties *)self parent];
    int v57 = [(OADTextBodyProperties *)self textAnchorType];
    if (v57 == [v56 textAnchorType])
    {
      [(OADTextBodyProperties *)self setTextAnchorType:0];
      *((unsigned char *)self + 74) &= ~2u;
    }
  }
  if ([(OADTextBodyProperties *)self hasIsUpright])
  {
    v58 = [(OADProperties *)self parent];
    int v59 = [(OADTextBodyProperties *)self isUpright];
    if (v59 == [v58 isUpright])
    {
      [(OADTextBodyProperties *)self setIsUpright:0];
      *((unsigned char *)self + 74) &= ~8u;
    }
  }
  if ([(OADTextBodyProperties *)self hasRotation])
  {
    v60 = [(OADProperties *)self parent];
    [(OADTextBodyProperties *)self rotation];
    float v62 = v61;
    [v60 rotation];
    if (v62 == v63)
    {
      [(OADTextBodyProperties *)self setRotation:0.0];
      *((unsigned char *)self + 74) &= ~0x10u;
    }
  }
  [(OADProperties *)self setMerged:v4];
  [(OADProperties *)self setMergedWithParent:v5];
  v64.receiver = self;
  v64.super_class = (Class)OADTextBodyProperties;
  [(OADProperties *)&v64 removeUnnecessaryOverrides];
}

- (BOOL)hasRespectLastFirstLineSpacing
{
  return (*((unsigned char *)self + 75) & 1) != 0
      || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (BOOL)hasTopInset
{
  return (*((unsigned char *)self + 75) & 2) != 0
      || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (float)topInset
{
  v2 = [(OADProperties *)self overrideForSelector:sel_hasTopInset];
  float v3 = v2[10];

  return v3;
}

- (BOOL)hasLeftInset
{
  return (*((unsigned char *)self + 75) & 4) != 0
      || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (float)leftInset
{
  v2 = [(OADProperties *)self overrideForSelector:sel_hasLeftInset];
  float v3 = v2[11];

  return v3;
}

- (BOOL)hasRightInset
{
  return (*((unsigned char *)self + 75) & 8) != 0
      || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (float)rightInset
{
  v2 = [(OADProperties *)self overrideForSelector:sel_hasRightInset];
  float v3 = v2[13];

  return v3;
}

- (BOOL)hasBottomInset
{
  return (*((unsigned char *)self + 75) & 0x10) != 0
      || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (float)bottomInset
{
  v2 = [(OADProperties *)self overrideForSelector:sel_hasBottomInset];
  float v3 = v2[12];

  return v3;
}

- (BOOL)hasColumnCount
{
  return (*((unsigned char *)self + 74) & 0x20) != 0
      || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (int)columnCount
{
  v2 = [(OADProperties *)self overrideForSelector:sel_hasColumnCount];
  int v3 = v2[32];

  return v3;
}

- (BOOL)hasColumnSpacing
{
  return (*((unsigned char *)self + 74) & 0x40) != 0
      || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (float)columnSpacing
{
  v2 = [(OADProperties *)self overrideForSelector:sel_hasColumnSpacing];
  float v3 = v2[15];

  return v3;
}

- (BOOL)hasIsLeftToRightColumns
{
  return *((char *)self + 74) < 0
      || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (BOOL)isLeftToRightColumns
{
  v2 = [(OADProperties *)self overrideForSelector:sel_hasIsLeftToRightColumns];
  BOOL v3 = (v2[73] >> 3) & 1;

  return v3;
}

- (BOOL)hasAutoFit
{
  return self->mAutoFit || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (id)autoFit
{
  v2 = [(OADProperties *)self overrideForSelector:sel_hasAutoFit];
  id v3 = v2[3];

  return v3;
}

- (BOOL)hasFlowType
{
  return *((char *)self + 73) < 0
      || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (unsigned)flowType
{
  v2 = [(OADProperties *)self overrideForSelector:sel_hasFlowType];
  unsigned __int8 v3 = v2[69];

  return v3;
}

- (BOOL)hasWrapType
{
  return (*((unsigned char *)self + 74) & 1) != 0
      || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (unsigned)wrapType
{
  v2 = [(OADProperties *)self overrideForSelector:sel_hasWrapType];
  unsigned __int8 v3 = v2[70];

  return v3;
}

- (BOOL)hasVerticalOverflowType
{
  return (*((unsigned char *)self + 73) & 0x10) != 0
      || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (unsigned)verticalOverflowType
{
  v2 = [(OADProperties *)self overrideForSelector:sel_hasVerticalOverflowType];
  unsigned __int8 v3 = v2[71];

  return v3;
}

- (BOOL)hasTextBodyId
{
  return (*((unsigned __int8 *)self + 73) >> 6) & 1;
}

- (BOOL)hasTextWarp
{
  return self->mTextWarp || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (BOOL)hasIsAnchorCenter
{
  return (*((unsigned char *)self + 74) & 4) != 0
      || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (BOOL)isAnchorCenter
{
  v2 = [(OADProperties *)self overrideForSelector:sel_hasIsAnchorCenter];
  BOOL v3 = (v2[73] >> 2) & 1;

  return v3;
}

- (BOOL)hasTextAnchorType
{
  return (*((unsigned char *)self + 74) & 2) != 0
      || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (unsigned)textAnchorType
{
  v2 = [(OADProperties *)self overrideForSelector:sel_hasTextAnchorType];
  unsigned __int8 v3 = v2[68];

  return v3;
}

- (BOOL)hasIsUpright
{
  return (*((unsigned char *)self + 74) & 8) != 0
      || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (BOOL)isUpright
{
  v2 = [(OADProperties *)self overrideForSelector:sel_hasIsUpright];
  BOOL v3 = (v2[73] >> 1) & 1;

  return v3;
}

- (BOOL)hasRotation
{
  return (*((unsigned char *)self + 74) & 0x10) != 0
      || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (float)rotation
{
  v2 = [(OADProperties *)self overrideForSelector:sel_hasRotation];
  float v3 = v2[14];

  return v3;
}

+ (id)defaultEscherWordArtProperties
{
  if (+[OADTextBodyProperties defaultEscherWordArtProperties]::once != -1) {
    dispatch_once(&+[OADTextBodyProperties defaultEscherWordArtProperties]::once, &__block_literal_global_200);
  }
  v2 = (void *)+[OADTextBodyProperties defaultEscherWordArtProperties]::defaultProperties;
  return v2;
}

- (id)textWarp
{
  v2 = [(OADProperties *)self overrideForSelector:sel_hasTextWarp];
  id v3 = v2[4];

  return v3;
}

void __42__OADTextBodyProperties_defaultProperties__block_invoke()
{
  v0 = [[OADTextBodyProperties alloc] initWithDefaults];
  v1 = (void *)+[OADTextBodyProperties defaultProperties]::defaultProperties;
  +[OADTextBodyProperties defaultProperties]::defaultProperties = (uint64_t)v0;
}

- (BOOL)respectLastFirstLineSpacing
{
  v2 = [(OADProperties *)self overrideForSelector:sel_hasRespectLastFirstLineSpacing];
  BOOL v3 = v2[73] & 1;

  return v3;
}

- (BOOL)hasHorizontalOverflowType
{
  return (*((unsigned char *)self + 73) & 0x20) != 0
      || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (unsigned)horizontalOverflowType
{
  v2 = [(OADProperties *)self overrideForSelector:sel_hasHorizontalOverflowType];
  unsigned __int8 v3 = v2[72];

  return v3;
}

- (int)textBodyId
{
  return self->mTextBodyId;
}

- (void)setTextBodyId:(int)a3
{
  self->mTextBodyId = a3;
  *((unsigned char *)self + 73) |= 0x40u;
}

- (BOOL)isWarped
{
  v2 = [(OADTextBodyProperties *)self textWarp];
  unsigned __int8 v3 = +[OADTextWarp nullWarp];
  char v4 = [v2 isEqual:v3] ^ 1;

  return v4;
}

void __55__OADTextBodyProperties_defaultEscherWordArtProperties__block_invoke()
{
  v0 = objc_alloc_init(OADTextBodyProperties);
  v1 = (void *)+[OADTextBodyProperties defaultEscherWordArtProperties]::defaultProperties;
  +[OADTextBodyProperties defaultEscherWordArtProperties]::defaultProperties = (uint64_t)v0;

  [(id)+[OADTextBodyProperties defaultEscherWordArtProperties]::defaultProperties setParent:0];
  [(id)+[OADTextBodyProperties defaultEscherWordArtProperties]::defaultProperties setRespectLastFirstLineSpacing:0];
  [(id)+[OADTextBodyProperties defaultEscherWordArtProperties]::defaultProperties setTopInset:0.0];
  [(id)+[OADTextBodyProperties defaultEscherWordArtProperties]::defaultProperties setLeftInset:0.0];
  [(id)+[OADTextBodyProperties defaultEscherWordArtProperties]::defaultProperties setBottomInset:0.0];
  [(id)+[OADTextBodyProperties defaultEscherWordArtProperties]::defaultProperties setRightInset:0.0];
  [(id)+[OADTextBodyProperties defaultEscherWordArtProperties]::defaultProperties setColumnCount:1];
  LODWORD(v2) = 3.0;
  [(id)+[OADTextBodyProperties defaultEscherWordArtProperties]::defaultProperties setColumnSpacing:v2];
  [(id)+[OADTextBodyProperties defaultEscherWordArtProperties]::defaultProperties setIsLeftToRightColumns:1];
  char v4 = [[OADTextBodyAutoFit alloc] initWithType:1];
  objc_msgSend((id)+[OADTextBodyProperties defaultEscherWordArtProperties]::defaultProperties, "setAutoFit:");
  [(id)+[OADTextBodyProperties defaultEscherWordArtProperties]::defaultProperties setFlowType:0];
  [(id)+[OADTextBodyProperties defaultEscherWordArtProperties]::defaultProperties setWrapType:0];
  [(id)+[OADTextBodyProperties defaultEscherWordArtProperties]::defaultProperties setVerticalOverflowType:0];
  [(id)+[OADTextBodyProperties defaultEscherWordArtProperties]::defaultProperties setHorizontalOverflowType:0];
  unsigned __int8 v3 = objc_alloc_init(OADPresetTextWarp);
  [(OADPresetTextWarp *)v3 setPresetTextWarpType:29];
  [(id)+[OADTextBodyProperties defaultEscherWordArtProperties]::defaultProperties setTextWarp:v3];
  [(id)+[OADTextBodyProperties defaultEscherWordArtProperties]::defaultProperties setIsAnchorCenter:0];
  [(id)+[OADTextBodyProperties defaultEscherWordArtProperties]::defaultProperties setTextAnchorType:1];
  [(id)+[OADTextBodyProperties defaultEscherWordArtProperties]::defaultProperties setIsUpright:0];
  [(id)+[OADTextBodyProperties defaultEscherWordArtProperties]::defaultProperties setRotation:0.0];
}

- (void)fixPropertiesForChangingParentPreservingEffectiveValues:(id)a3
{
  id v4 = a3;
  v69.receiver = self;
  v69.super_class = (Class)OADTextBodyProperties;
  [(OADProperties *)&v69 fixPropertiesForChangingParentPreservingEffectiveValues:v4];
  if ([(OADTextBodyProperties *)self hasAutoFit]
    || ([(OADProperties *)self parent], id v5 = (id)objc_claimAutoreleasedReturnValue(),
                                                 v5,
                                                 v5 != v4))
  {
    double v6 = [(OADProperties *)self possiblyInexistentOverrideForSelector:sel_hasAutoFit];

    if (v6)
    {
      int v7 = [(OADTextBodyProperties *)self autoFit];
    }
    else
    {
      int v7 = 0;
    }
    double v8 = [v4 possiblyInexistentOverrideForSelector:sel_hasAutoFit];

    if (v8)
    {
      float v9 = [v4 autoFit];
    }
    else
    {
      float v9 = 0;
    }
    int v10 = TCObjectEqual(v7, v9);
    mAutoFit = self->mAutoFit;
    if (v10)
    {
      self->mAutoFit = 0;
    }
    else if (!mAutoFit && v6)
    {
      [(OADTextBodyProperties *)self setAutoFit:v7];
    }
  }
  if ([(OADTextBodyProperties *)self hasTextWarp]
    || ([(OADProperties *)self parent],
        id v12 = (id)objc_claimAutoreleasedReturnValue(),
        v12,
        v12 != v4))
  {
    float v13 = [(OADProperties *)self possiblyInexistentOverrideForSelector:sel_hasTextWarp];

    if (v13)
    {
      float v14 = [(OADTextBodyProperties *)self textWarp];
    }
    else
    {
      float v14 = 0;
    }
    float v15 = [v4 possiblyInexistentOverrideForSelector:sel_hasTextWarp];

    if (v15)
    {
      v16 = [v4 textWarp];
    }
    else
    {
      v16 = 0;
    }
    int v17 = TCObjectEqual(v14, v16);
    mTextWarp = self->mTextWarp;
    if (v17)
    {
      self->mTextWarp = 0;
    }
    else if (!mTextWarp && v13)
    {
      [(OADTextBodyProperties *)self setTextWarp:v14];
    }
  }
  if ((*((unsigned char *)self + 75) & 2) != 0
    || ([(OADProperties *)self parent],
        id v19 = (id)objc_claimAutoreleasedReturnValue(),
        v19,
        v19 != v4))
  {
    [(OADTextBodyProperties *)self topInset];
    float v21 = v20;
    [v4 topInset];
    if (v21 == v22)
    {
      *((unsigned char *)self + 75) &= ~2u;
    }
    else if ((*((unsigned char *)self + 75) & 2) == 0)
    {
      [(OADTextBodyProperties *)self topInset];
      -[OADTextBodyProperties setTopInset:](self, "setTopInset:");
    }
  }
  if ((*((unsigned char *)self + 75) & 4) != 0
    || ([(OADProperties *)self parent],
        id v23 = (id)objc_claimAutoreleasedReturnValue(),
        v23,
        v23 != v4))
  {
    [(OADTextBodyProperties *)self leftInset];
    float v25 = v24;
    [v4 leftInset];
    if (v25 == v26)
    {
      *((unsigned char *)self + 75) &= ~4u;
    }
    else if ((*((unsigned char *)self + 75) & 4) == 0)
    {
      [(OADTextBodyProperties *)self leftInset];
      -[OADTextBodyProperties setLeftInset:](self, "setLeftInset:");
    }
  }
  if ((*((unsigned char *)self + 75) & 0x10) != 0
    || ([(OADProperties *)self parent],
        id v27 = (id)objc_claimAutoreleasedReturnValue(),
        v27,
        v27 != v4))
  {
    [(OADTextBodyProperties *)self bottomInset];
    float v29 = v28;
    [v4 bottomInset];
    if (v29 == v30)
    {
      *((unsigned char *)self + 75) &= ~0x10u;
    }
    else if ((*((unsigned char *)self + 75) & 0x10) == 0)
    {
      [(OADTextBodyProperties *)self bottomInset];
      -[OADTextBodyProperties setBottomInset:](self, "setBottomInset:");
    }
  }
  if ((*((unsigned char *)self + 75) & 8) != 0
    || ([(OADProperties *)self parent],
        id v31 = (id)objc_claimAutoreleasedReturnValue(),
        v31,
        v31 != v4))
  {
    [(OADTextBodyProperties *)self rightInset];
    float v33 = v32;
    [v4 rightInset];
    if (v33 == v34)
    {
      *((unsigned char *)self + 75) &= ~8u;
    }
    else if ((*((unsigned char *)self + 75) & 8) == 0)
    {
      [(OADTextBodyProperties *)self rightInset];
      -[OADTextBodyProperties setRightInset:](self, "setRightInset:");
    }
  }
  if ((*((unsigned char *)self + 74) & 0x10) != 0
    || ([(OADProperties *)self parent],
        id v35 = (id)objc_claimAutoreleasedReturnValue(),
        v35,
        v35 != v4))
  {
    [(OADTextBodyProperties *)self rotation];
    float v37 = v36;
    [v4 rotation];
    if (v37 == v38)
    {
      *((unsigned char *)self + 74) &= ~0x10u;
    }
    else if ((*((unsigned char *)self + 74) & 0x10) == 0)
    {
      [(OADTextBodyProperties *)self rotation];
      -[OADTextBodyProperties setRotation:](self, "setRotation:");
    }
  }
  if ((*((unsigned char *)self + 74) & 0x40) != 0
    || ([(OADProperties *)self parent],
        id v39 = (id)objc_claimAutoreleasedReturnValue(),
        v39,
        v39 != v4))
  {
    [(OADTextBodyProperties *)self columnSpacing];
    float v41 = v40;
    [v4 columnSpacing];
    if (v41 == v42)
    {
      *((unsigned char *)self + 74) &= ~0x40u;
    }
    else if ((*((unsigned char *)self + 74) & 0x40) == 0)
    {
      [(OADTextBodyProperties *)self columnSpacing];
      -[OADTextBodyProperties setColumnSpacing:](self, "setColumnSpacing:");
    }
  }
  if ((*((unsigned char *)self + 74) & 0x20) != 0
    || ([(OADProperties *)self parent],
        id v43 = (id)objc_claimAutoreleasedReturnValue(),
        v43,
        v43 != v4))
  {
    int v44 = [(OADTextBodyProperties *)self columnCount];
    if (v44 == [v4 columnCount])
    {
      *((unsigned char *)self + 74) &= ~0x20u;
    }
    else if ((*((unsigned char *)self + 74) & 0x20) == 0)
    {
      [(OADTextBodyProperties *)self setColumnCount:[(OADTextBodyProperties *)self columnCount]];
    }
  }
  if ((*((unsigned char *)self + 73) & 0x40) != 0
    || ([(OADProperties *)self parent],
        id v45 = (id)objc_claimAutoreleasedReturnValue(),
        v45,
        v45 != v4))
  {
    int v46 = [(OADTextBodyProperties *)self textBodyId];
    if (v46 == [v4 textBodyId])
    {
      *((unsigned char *)self + 73) &= ~0x40u;
    }
    else if ((*((unsigned char *)self + 73) & 0x40) == 0)
    {
      [(OADTextBodyProperties *)self setTextBodyId:[(OADTextBodyProperties *)self textBodyId]];
    }
  }
  if ((*((unsigned char *)self + 74) & 2) != 0
    || ([(OADProperties *)self parent],
        id v47 = (id)objc_claimAutoreleasedReturnValue(),
        v47,
        v47 != v4))
  {
    int v48 = [(OADTextBodyProperties *)self textAnchorType];
    if (v48 == [v4 textAnchorType])
    {
      *((unsigned char *)self + 74) &= ~2u;
    }
    else if ((*((unsigned char *)self + 74) & 2) == 0)
    {
      [(OADTextBodyProperties *)self setTextAnchorType:[(OADTextBodyProperties *)self textAnchorType]];
    }
  }
  if (*((char *)self + 73) < 0
    || ([(OADProperties *)self parent],
        id v49 = (id)objc_claimAutoreleasedReturnValue(),
        v49,
        v49 != v4))
  {
    int v50 = [(OADTextBodyProperties *)self flowType];
    int v51 = [v4 flowType];
    int v52 = *((char *)self + 73);
    if (v50 == v51)
    {
      *((unsigned char *)self + 73) = v52 & 0x7F;
    }
    else if ((v52 & 0x80000000) == 0)
    {
      [(OADTextBodyProperties *)self setFlowType:[(OADTextBodyProperties *)self flowType]];
    }
  }
  if ((*((unsigned char *)self + 74) & 1) != 0
    || ([(OADProperties *)self parent],
        id v53 = (id)objc_claimAutoreleasedReturnValue(),
        v53,
        v53 != v4))
  {
    int v54 = [(OADTextBodyProperties *)self wrapType];
    if (v54 == [v4 wrapType])
    {
      *((unsigned char *)self + 74) &= ~1u;
    }
    else if ((*((unsigned char *)self + 74) & 1) == 0)
    {
      [(OADTextBodyProperties *)self setWrapType:[(OADTextBodyProperties *)self wrapType]];
    }
  }
  if ((*((unsigned char *)self + 73) & 0x10) != 0
    || ([(OADProperties *)self parent],
        id v55 = (id)objc_claimAutoreleasedReturnValue(),
        v55,
        v55 != v4))
  {
    int v56 = [(OADTextBodyProperties *)self verticalOverflowType];
    if (v56 == [v4 verticalOverflowType])
    {
      *((unsigned char *)self + 73) &= ~0x10u;
    }
    else if ((*((unsigned char *)self + 73) & 0x10) == 0)
    {
      [(OADTextBodyProperties *)self setVerticalOverflowType:[(OADTextBodyProperties *)self verticalOverflowType]];
    }
  }
  if ((*((unsigned char *)self + 73) & 0x20) != 0
    || ([(OADProperties *)self parent],
        id v57 = (id)objc_claimAutoreleasedReturnValue(),
        v57,
        v57 != v4))
  {
    int v58 = [(OADTextBodyProperties *)self horizontalOverflowType];
    if (v58 == [v4 horizontalOverflowType])
    {
      *((unsigned char *)self + 73) &= ~0x20u;
    }
    else if ((*((unsigned char *)self + 73) & 0x20) == 0)
    {
      [(OADTextBodyProperties *)self setHorizontalOverflowType:[(OADTextBodyProperties *)self horizontalOverflowType]];
    }
  }
  if ((*((unsigned char *)self + 75) & 1) != 0
    || ([(OADProperties *)self parent],
        id v59 = (id)objc_claimAutoreleasedReturnValue(),
        v59,
        v59 != v4))
  {
    int v60 = [(OADTextBodyProperties *)self respectLastFirstLineSpacing];
    if (v60 == [v4 respectLastFirstLineSpacing])
    {
      *((unsigned char *)self + 75) &= ~1u;
    }
    else if ((*((unsigned char *)self + 75) & 1) == 0)
    {
      [(OADTextBodyProperties *)self setRespectLastFirstLineSpacing:[(OADTextBodyProperties *)self respectLastFirstLineSpacing]];
    }
  }
  if ((*((unsigned char *)self + 74) & 8) != 0
    || ([(OADProperties *)self parent],
        id v61 = (id)objc_claimAutoreleasedReturnValue(),
        v61,
        v61 != v4))
  {
    int v62 = [(OADTextBodyProperties *)self isUpright];
    if (v62 == [v4 isUpright])
    {
      *((unsigned char *)self + 74) &= ~8u;
    }
    else if ((*((unsigned char *)self + 74) & 8) == 0)
    {
      [(OADTextBodyProperties *)self setIsUpright:[(OADTextBodyProperties *)self isUpright]];
    }
  }
  if ((*((unsigned char *)self + 74) & 4) != 0
    || ([(OADProperties *)self parent],
        id v63 = (id)objc_claimAutoreleasedReturnValue(),
        v63,
        v63 != v4))
  {
    int v64 = [(OADTextBodyProperties *)self isAnchorCenter];
    if (v64 == [v4 isAnchorCenter])
    {
      *((unsigned char *)self + 74) &= ~4u;
    }
    else if ((*((unsigned char *)self + 74) & 4) == 0)
    {
      [(OADTextBodyProperties *)self setIsAnchorCenter:[(OADTextBodyProperties *)self isAnchorCenter]];
    }
  }
  if (*((char *)self + 74) < 0
    || ([(OADProperties *)self parent],
        id v65 = (id)objc_claimAutoreleasedReturnValue(),
        v65,
        v65 != v4))
  {
    int v66 = [(OADTextBodyProperties *)self isLeftToRightColumns];
    int v67 = [v4 isLeftToRightColumns];
    int v68 = *((char *)self + 74);
    if (v66 == v67)
    {
      *((unsigned char *)self + 74) = v68 & 0x7F;
    }
    else if ((v68 & 0x80000000) == 0)
    {
      [(OADTextBodyProperties *)self setIsLeftToRightColumns:[(OADTextBodyProperties *)self isLeftToRightColumns]];
    }
  }
}

- (unint64_t)hash
{
  unint64_t v15 = [(OADTextBodyAutoFit *)self->mAutoFit hash];
  unint64_t v3 = [(OADTextWarp *)self->mTextWarp hash];
  unint64_t mTopInset = (unint64_t)self->mTopInset;
  unint64_t mLeftInset = (unint64_t)self->mLeftInset;
  unint64_t mBottomInset = (unint64_t)self->mBottomInset;
  unint64_t mRightInset = (unint64_t)self->mRightInset;
  unint64_t mRotation = (unint64_t)self->mRotation;
  unint64_t mColumnSpacing = (unint64_t)self->mColumnSpacing;
  uint64_t mColumnCount = self->mColumnCount;
  uint64_t mTextBodyId = self->mTextBodyId;
  uint64_t v11 = (self->mFlowType ^ self->mTextAnchorType ^ self->mWrapType ^ self->mVerticalOverflowType ^ self->mHorizontalOverflowType);
  uint64_t v12 = ((*((unsigned char *)self + 73) ^ (*((unsigned char *)self + 73) >> 1) ^ (*((unsigned char *)self + 73) >> 2)) ^ (*((unsigned char *)self + 73) >> 3)) & 1;
  v16.receiver = self;
  v16.super_class = (Class)OADTextBodyProperties;
  return v3 ^ v15 ^ mTopInset ^ mLeftInset ^ mBottomInset ^ mRightInset ^ mRotation ^ mColumnSpacing ^ mColumnCount ^ mTextBodyId ^ v11 ^ v12 ^ [(OADProperties *)&v16 hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    id v5 = v4;
    unint64_t v6 = [(OADTextBodyProperties *)self hash];
    if (v6 != [v5 hash]) {
      goto LABEL_60;
    }
    int v7 = [v5 hasRespectLastFirstLineSpacing];
    if (v7 != [(OADTextBodyProperties *)self hasRespectLastFirstLineSpacing]) {
      goto LABEL_60;
    }
    if ([v5 hasRespectLastFirstLineSpacing])
    {
      int v8 = [v5 respectLastFirstLineSpacing];
      if (v8 != [(OADTextBodyProperties *)self respectLastFirstLineSpacing]) {
        goto LABEL_60;
      }
    }
    int v9 = [v5 hasTopInset];
    if (v9 != [(OADTextBodyProperties *)self hasTopInset]) {
      goto LABEL_60;
    }
    if ([v5 hasTopInset])
    {
      [v5 topInset];
      float v11 = v10;
      [(OADTextBodyProperties *)self topInset];
      if (v11 != v12) {
        goto LABEL_60;
      }
    }
    int v13 = [v5 hasLeftInset];
    if (v13 != [(OADTextBodyProperties *)self hasLeftInset]) {
      goto LABEL_60;
    }
    if ([v5 hasLeftInset])
    {
      [v5 leftInset];
      float v15 = v14;
      [(OADTextBodyProperties *)self leftInset];
      if (v15 != v16) {
        goto LABEL_60;
      }
    }
    int v17 = [v5 hasBottomInset];
    if (v17 != [(OADTextBodyProperties *)self hasBottomInset]) {
      goto LABEL_60;
    }
    if ([v5 hasBottomInset])
    {
      [v5 leftInset];
      float v19 = v18;
      [(OADTextBodyProperties *)self leftInset];
      if (v19 != v20) {
        goto LABEL_60;
      }
    }
    int v21 = [v5 hasRightInset];
    if (v21 != [(OADTextBodyProperties *)self hasRightInset]) {
      goto LABEL_60;
    }
    if ([v5 hasRightInset])
    {
      [v5 rightInset];
      float v23 = v22;
      [(OADTextBodyProperties *)self rightInset];
      if (v23 != v24) {
        goto LABEL_60;
      }
    }
    int v25 = [v5 hasColumnCount];
    if (v25 != [(OADTextBodyProperties *)self hasColumnCount]) {
      goto LABEL_60;
    }
    if ([v5 hasColumnCount])
    {
      int v26 = [v5 columnCount];
      if (v26 != [(OADTextBodyProperties *)self columnCount]) {
        goto LABEL_60;
      }
    }
    int v27 = [v5 hasColumnSpacing];
    if (v27 != [(OADTextBodyProperties *)self hasColumnSpacing]) {
      goto LABEL_60;
    }
    if ([v5 hasColumnSpacing])
    {
      [v5 columnSpacing];
      float v29 = v28;
      [(OADTextBodyProperties *)self columnSpacing];
      if (v29 != v30) {
        goto LABEL_60;
      }
    }
    int v31 = [v5 hasIsLeftToRightColumns];
    if (v31 != [(OADTextBodyProperties *)self hasIsLeftToRightColumns]) {
      goto LABEL_60;
    }
    if ([v5 hasIsLeftToRightColumns])
    {
      int v32 = [v5 isLeftToRightColumns];
      if (v32 != [(OADTextBodyProperties *)self isLeftToRightColumns]) {
        goto LABEL_60;
      }
    }
    int v33 = [v5 hasAutoFit];
    if (v33 != [(OADTextBodyProperties *)self hasAutoFit]) {
      goto LABEL_60;
    }
    if ([v5 hasAutoFit])
    {
      float v34 = [v5 autoFit];
      id v35 = [(OADTextBodyProperties *)self autoFit];
      char v36 = [v34 isEqual:v35];

      if ((v36 & 1) == 0) {
        goto LABEL_60;
      }
    }
    int v37 = [v5 hasFlowType];
    if (v37 != [(OADTextBodyProperties *)self hasFlowType]) {
      goto LABEL_60;
    }
    if ([v5 hasFlowType])
    {
      int v38 = [v5 flowType];
      if (v38 != [(OADTextBodyProperties *)self flowType]) {
        goto LABEL_60;
      }
    }
    int v39 = [v5 hasWrapType];
    if (v39 != [(OADTextBodyProperties *)self hasWrapType]) {
      goto LABEL_60;
    }
    if ([v5 hasWrapType])
    {
      int v40 = [v5 wrapType];
      if (v40 != [(OADTextBodyProperties *)self wrapType]) {
        goto LABEL_60;
      }
    }
    int v41 = [v5 hasVerticalOverflowType];
    if (v41 != [(OADTextBodyProperties *)self hasVerticalOverflowType]) {
      goto LABEL_60;
    }
    if ([v5 hasVerticalOverflowType])
    {
      int v42 = [v5 verticalOverflowType];
      if (v42 != [(OADTextBodyProperties *)self verticalOverflowType]) {
        goto LABEL_60;
      }
    }
    int v43 = [v5 hasHorizontalOverflowType];
    if (v43 != [(OADTextBodyProperties *)self hasHorizontalOverflowType]) {
      goto LABEL_60;
    }
    if ([v5 hasHorizontalOverflowType])
    {
      int v44 = [v5 horizontalOverflowType];
      if (v44 != [(OADTextBodyProperties *)self horizontalOverflowType]) {
        goto LABEL_60;
      }
    }
    int v45 = [v5 hasTextBodyId];
    if (v45 != [(OADTextBodyProperties *)self hasTextBodyId]) {
      goto LABEL_60;
    }
    if ([v5 hasTextBodyId])
    {
      int v46 = [v5 textBodyId];
      if (v46 != [(OADTextBodyProperties *)self textBodyId]) {
        goto LABEL_60;
      }
    }
    int v47 = [v5 hasTextWarp];
    if (v47 != [(OADTextBodyProperties *)self hasTextWarp]) {
      goto LABEL_60;
    }
    if ([v5 hasTextWarp])
    {
      int v48 = [v5 textWarp];
      id v49 = [(OADTextBodyProperties *)self textWarp];
      char v50 = [v48 isEqual:v49];

      if ((v50 & 1) == 0) {
        goto LABEL_60;
      }
    }
    int v51 = [v5 hasIsAnchorCenter];
    if (v51 != [(OADTextBodyProperties *)self hasIsAnchorCenter]) {
      goto LABEL_60;
    }
    if ([v5 hasIsAnchorCenter])
    {
      int v52 = [v5 isAnchorCenter];
      if (v52 != [(OADTextBodyProperties *)self isAnchorCenter]) {
        goto LABEL_60;
      }
    }
    int v53 = [v5 hasTextAnchorType];
    if (v53 != [(OADTextBodyProperties *)self hasTextAnchorType]) {
      goto LABEL_60;
    }
    if ([v5 hasTextAnchorType])
    {
      int v54 = [v5 textAnchorType];
      if (v54 != [(OADTextBodyProperties *)self textAnchorType]) {
        goto LABEL_60;
      }
    }
    if ((int v55 = [v5 hasIsUpright], v55 == -[OADTextBodyProperties hasIsUpright](self, "hasIsUpright"))
      && (![v5 hasIsUpright]
       || (int v56 = [v5 isUpright], v56 == -[OADTextBodyProperties isUpright](self, "isUpright")))
      && (int v57 = [v5 hasRotation], v57 == -[OADTextBodyProperties hasRotation](self, "hasRotation"))
      && (![v5 hasRotation]
       || ([v5 rotation], float v59 = v58, -[OADTextBodyProperties rotation](self, "rotation"), v59 == v60)))
    {
      v63.receiver = self;
      v63.super_class = (Class)OADTextBodyProperties;
      BOOL v61 = [(OADProperties *)&v63 isEqual:v5];
    }
    else
    {
LABEL_60:
      BOOL v61 = 0;
    }
  }
  else
  {
    BOOL v61 = 0;
  }

  return v61;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)OADTextBodyProperties;
  double v2 = [(OADProperties *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mTextWarp, 0);
  objc_storeStrong((id *)&self->mAutoFit, 0);
}

@end