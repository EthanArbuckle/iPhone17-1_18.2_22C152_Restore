@interface SBPBDisplayItemLayoutAttributes
- (BOOL)isEqual:(id)a3;
- (BOOL)positionIsSystemManaged;
- (BOOL)readFrom:(id)a3;
- (__CFString)semanticSizeTypeForSizeAsString:(__CFString *)a1;
- (double)centerX;
- (double)centerY;
- (double)copyTo:(uint64_t)a1;
- (double)mergeFrom:(uint64_t)a1;
- (double)referenceBoundsHeightBeforeOverlapping;
- (double)referenceBoundsHeightForSize;
- (double)referenceBoundsWidthBeforeOverlapping;
- (double)referenceBoundsWidthForSize;
- (double)sizeHeight;
- (double)sizeWidth;
- (double)userSizeBeforeOverlappingInBoundsHeight;
- (double)userSizeBeforeOverlappingInBoundsWidth;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (uint64_t)StringAsSemanticSizeTypeForSize:(uint64_t)a1;
- (uint64_t)contentOrientation;
- (uint64_t)lastInteractionTime;
- (uint64_t)semanticSizeTypeBeforeOverlapping;
- (uint64_t)semanticSizeTypeForSize;
- (uint64_t)setCenterX:(uint64_t)result;
- (uint64_t)setCenterY:(uint64_t)result;
- (uint64_t)setContentOrientation:(uint64_t)result;
- (uint64_t)setLastInteractionTime:(uint64_t)result;
- (uint64_t)setPositionIsSystemManaged:(uint64_t)result;
- (uint64_t)setReferenceBoundsHeightBeforeOverlapping:(uint64_t)result;
- (uint64_t)setReferenceBoundsHeightForSize:(uint64_t)result;
- (uint64_t)setReferenceBoundsWidthBeforeOverlapping:(uint64_t)result;
- (uint64_t)setReferenceBoundsWidthForSize:(uint64_t)result;
- (uint64_t)setSemanticSizeTypeBeforeOverlapping:(uint64_t)result;
- (uint64_t)setSemanticSizeTypeForSize:(uint64_t)result;
- (uint64_t)setSizeHeight:(uint64_t)result;
- (uint64_t)setSizeWidth:(uint64_t)result;
- (uint64_t)setSizingPolicy:(uint64_t)result;
- (uint64_t)setUserSizeBeforeOverlappingInBoundsHeight:(uint64_t)result;
- (uint64_t)setUserSizeBeforeOverlappingInBoundsWidth:(uint64_t)result;
- (uint64_t)sizingPolicy;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation SBPBDisplayItemLayoutAttributes

- (__CFString)semanticSizeTypeForSizeAsString:(__CFString *)a1
{
  if (a1)
  {
    if (a2 >= 0xA)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a2);
      a1 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      a1 = off_1E6B07610[(int)a2];
    }
    uint64_t v2 = vars8;
  }
  return a1;
}

- (uint64_t)StringAsSemanticSizeTypeForSize:(uint64_t)a1
{
  id v3 = a2;
  v4 = v3;
  if (a1)
  {
    id v5 = v3;
    if ([v5 isEqualToString:@"None"])
    {
      uint64_t v6 = 0;
    }
    else if ([v5 isEqualToString:@"FullWidth"])
    {
      uint64_t v6 = 1;
    }
    else if ([v5 isEqualToString:@"FullHeight"])
    {
      uint64_t v6 = 2;
    }
    else if ([v5 isEqualToString:@"FullWidthAndHeight"])
    {
      uint64_t v6 = 3;
    }
    else if ([v5 isEqualToString:@"DefaultWidth"])
    {
      uint64_t v6 = 4;
    }
    else if ([v5 isEqualToString:@"DefaultHeight"])
    {
      uint64_t v6 = 5;
    }
    else if ([v5 isEqualToString:@"DefaulWidthAndHeight"])
    {
      uint64_t v6 = 6;
    }
    else if ([v5 isEqualToString:@"ScreenEdgePaddingWidth"])
    {
      uint64_t v6 = 7;
    }
    else if ([v5 isEqualToString:@"ScreenEdgePaddingHeight"])
    {
      uint64_t v6 = 8;
    }
    else if ([v5 isEqualToString:@"ScreenEdgePaddingWidthAndHeight"])
    {
      uint64_t v6 = 9;
    }
    else
    {
      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SBPBDisplayItemLayoutAttributes;
  v4 = [(SBPBDisplayItemLayoutAttributes *)&v8 description];
  id v5 = [(SBPBDisplayItemLayoutAttributes *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [NSNumber numberWithDouble:self->_sizeWidth];
  [v3 setObject:v4 forKey:@"sizeWidth"];

  id v5 = [NSNumber numberWithDouble:self->_sizeHeight];
  [v3 setObject:v5 forKey:@"sizeHeight"];

  uint64_t v6 = [NSNumber numberWithDouble:self->_centerX];
  [v3 setObject:v6 forKey:@"centerX"];

  v7 = [NSNumber numberWithDouble:self->_centerY];
  [v3 setObject:v7 forKey:@"centerY"];

  objc_super v8 = [NSNumber numberWithLongLong:self->_lastInteractionTime];
  [v3 setObject:v8 forKey:@"lastInteractionTime"];

  v9 = [NSNumber numberWithLongLong:self->_sizingPolicy];
  [v3 setObject:v9 forKey:@"sizingPolicy"];

  v10 = [NSNumber numberWithDouble:self->_userSizeBeforeOverlappingInBoundsWidth];
  [v3 setObject:v10 forKey:@"userSizeBeforeOverlappingInBoundsWidth"];

  v11 = [NSNumber numberWithDouble:self->_userSizeBeforeOverlappingInBoundsHeight];
  [v3 setObject:v11 forKey:@"userSizeBeforeOverlappingInBoundsHeight"];

  v12 = [NSNumber numberWithLongLong:self->_contentOrientation];
  [v3 setObject:v12 forKey:@"contentOrientation"];

  v13 = [NSNumber numberWithDouble:self->_referenceBoundsWidthForSize];
  [v3 setObject:v13 forKey:@"referenceBoundsWidthForSize"];

  v14 = [NSNumber numberWithDouble:self->_referenceBoundsHeightForSize];
  [v3 setObject:v14 forKey:@"referenceBoundsHeightForSize"];

  uint64_t semanticSizeTypeForSize = self->_semanticSizeTypeForSize;
  if (semanticSizeTypeForSize >= 0xA)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_semanticSizeTypeForSize);
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = off_1E6B07610[semanticSizeTypeForSize];
  }
  [v3 setObject:v16 forKey:@"semanticSizeTypeForSize"];

  v17 = [NSNumber numberWithDouble:self->_referenceBoundsWidthBeforeOverlapping];
  [v3 setObject:v17 forKey:@"referenceBoundsWidthBeforeOverlapping"];

  v18 = [NSNumber numberWithDouble:self->_referenceBoundsHeightBeforeOverlapping];
  [v3 setObject:v18 forKey:@"referenceBoundsHeightBeforeOverlapping"];

  uint64_t semanticSizeTypeBeforeOverlapping = self->_semanticSizeTypeBeforeOverlapping;
  if (semanticSizeTypeBeforeOverlapping >= 0xA)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_semanticSizeTypeBeforeOverlapping);
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = off_1E6B07610[semanticSizeTypeBeforeOverlapping];
  }
  [v3 setObject:v20 forKey:@"semanticSizeTypeBeforeOverlapping"];

  v21 = [NSNumber numberWithBool:self->_positionIsSystemManaged];
  [v3 setObject:v21 forKey:@"positionIsSystemManaged"];

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SBPBDisplayItemLayoutAttributesReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v3 = a3;
  PBDataWriterWriteDoubleField();
  PBDataWriterWriteDoubleField();
  PBDataWriterWriteDoubleField();
  PBDataWriterWriteDoubleField();
  PBDataWriterWriteInt64Field();
  PBDataWriterWriteInt64Field();
  PBDataWriterWriteDoubleField();
  PBDataWriterWriteDoubleField();
  PBDataWriterWriteInt64Field();
  PBDataWriterWriteDoubleField();
  PBDataWriterWriteDoubleField();
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteDoubleField();
  PBDataWriterWriteDoubleField();
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteBOOLField();
}

- (double)copyTo:(uint64_t)a1
{
  if (a1)
  {
    *(void *)(a2 + 80) = *(void *)(a1 + 80);
    *(void *)(a2 + 72) = *(void *)(a1 + 72);
    *(void *)(a2 + 8) = *(void *)(a1 + 8);
    *(void *)(a2 + 16) = *(void *)(a1 + 16);
    *(void *)(a2 + 32) = *(void *)(a1 + 32);
    *(void *)(a2 + 88) = *(void *)(a1 + 88);
    *(void *)(a2 + 104) = *(void *)(a1 + 104);
    *(void *)(a2 + 96) = *(void *)(a1 + 96);
    *(void *)(a2 + 24) = *(void *)(a1 + 24);
    *(void *)(a2 + 64) = *(void *)(a1 + 64);
    *(void *)(a2 + 48) = *(void *)(a1 + 48);
    *(_DWORD *)(a2 + 116) = *(_DWORD *)(a1 + 116);
    *(void *)(a2 + 56) = *(void *)(a1 + 56);
    double result = *(double *)(a1 + 40);
    *(double *)(a2 + 40) = result;
    *(_DWORD *)(a2 + 112) = *(_DWORD *)(a1 + 112);
    *(unsigned char *)(a2 + 120) = *(unsigned char *)(a1 + 120);
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((void *)result + 10) = *(void *)&self->_sizeWidth;
  *((void *)result + 9) = *(void *)&self->_sizeHeight;
  *((void *)result + 1) = *(void *)&self->_centerX;
  *((void *)result + 2) = *(void *)&self->_centerY;
  *((void *)result + 4) = self->_lastInteractionTime;
  *((void *)result + 11) = self->_sizingPolicy;
  *((void *)result + 13) = *(void *)&self->_userSizeBeforeOverlappingInBoundsWidth;
  *((void *)result + 12) = *(void *)&self->_userSizeBeforeOverlappingInBoundsHeight;
  *((void *)result + 3) = self->_contentOrientation;
  *((void *)result + 8) = *(void *)&self->_referenceBoundsWidthForSize;
  *((void *)result + 6) = *(void *)&self->_referenceBoundsHeightForSize;
  *((_DWORD *)result + 29) = self->_semanticSizeTypeForSize;
  *((void *)result + 7) = *(void *)&self->_referenceBoundsWidthBeforeOverlapping;
  *((void *)result + 5) = *(void *)&self->_referenceBoundsHeightBeforeOverlapping;
  *((_DWORD *)result + 28) = self->_semanticSizeTypeBeforeOverlapping;
  *((unsigned char *)result + 120) = self->_positionIsSystemManaged;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (unsigned __int8 *)a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && self->_sizeWidth == *((double *)v4 + 10)
    && self->_sizeHeight == *((double *)v4 + 9)
    && self->_centerX == *((double *)v4 + 1)
    && self->_centerY == *((double *)v4 + 2)
    && self->_lastInteractionTime == *((void *)v4 + 4)
    && self->_sizingPolicy == *((void *)v4 + 11)
    && self->_userSizeBeforeOverlappingInBoundsWidth == *((double *)v4 + 13)
    && self->_userSizeBeforeOverlappingInBoundsHeight == *((double *)v4 + 12)
    && self->_contentOrientation == *((void *)v4 + 3)
    && self->_referenceBoundsWidthForSize == *((double *)v4 + 8)
    && self->_referenceBoundsHeightForSize == *((double *)v4 + 6)
    && self->_semanticSizeTypeForSize == *((_DWORD *)v4 + 29)
    && self->_referenceBoundsWidthBeforeOverlapping == *((double *)v4 + 7)
    && self->_referenceBoundsHeightBeforeOverlapping == *((double *)v4 + 5)
    && self->_semanticSizeTypeBeforeOverlapping == *((_DWORD *)v4 + 28))
  {
    int v5 = v4[120];
    if (self->_positionIsSystemManaged) {
      BOOL v6 = v5 != 0;
    }
    else {
      BOOL v6 = v5 == 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  double sizeWidth = self->_sizeWidth;
  double v4 = -sizeWidth;
  if (sizeWidth >= 0.0) {
    double v4 = self->_sizeWidth;
  }
  long double v5 = floor(v4 + 0.5);
  double v6 = (v4 - v5) * 1.84467441e19;
  double v7 = fmod(v5, 1.84467441e19);
  unint64_t v8 = 2654435761u * (unint64_t)v7;
  unint64_t v9 = v8 + (unint64_t)v6;
  if (v6 <= 0.0) {
    unint64_t v9 = 2654435761u * (unint64_t)v7;
  }
  unint64_t v10 = v8 - (unint64_t)fabs(v6);
  if (v6 >= 0.0) {
    unint64_t v10 = v9;
  }
  unint64_t v96 = v10;
  double sizeHeight = self->_sizeHeight;
  double v12 = -sizeHeight;
  if (sizeHeight >= 0.0) {
    double v12 = self->_sizeHeight;
  }
  long double v13 = floor(v12 + 0.5);
  double v14 = (v12 - v13) * 1.84467441e19;
  double v15 = fmod(v13, 1.84467441e19);
  unint64_t v16 = 2654435761u * (unint64_t)v15;
  unint64_t v17 = v16 + (unint64_t)v14;
  if (v14 <= 0.0) {
    unint64_t v17 = 2654435761u * (unint64_t)v15;
  }
  unint64_t v18 = v16 - (unint64_t)fabs(v14);
  if (v14 >= 0.0) {
    unint64_t v18 = v17;
  }
  unint64_t v95 = v18;
  double centerX = self->_centerX;
  double v20 = -centerX;
  if (centerX >= 0.0) {
    double v20 = self->_centerX;
  }
  long double v21 = floor(v20 + 0.5);
  double v22 = (v20 - v21) * 1.84467441e19;
  double v23 = fmod(v21, 1.84467441e19);
  unint64_t v24 = 2654435761u * (unint64_t)v23;
  unint64_t v25 = v24 + (unint64_t)v22;
  if (v22 <= 0.0) {
    unint64_t v25 = 2654435761u * (unint64_t)v23;
  }
  unint64_t v26 = v24 - (unint64_t)fabs(v22);
  if (v22 >= 0.0) {
    unint64_t v26 = v25;
  }
  unint64_t v94 = v26;
  double centerY = self->_centerY;
  double v28 = -centerY;
  if (centerY >= 0.0) {
    double v28 = self->_centerY;
  }
  long double v29 = floor(v28 + 0.5);
  double v30 = (v28 - v29) * 1.84467441e19;
  double v31 = fmod(v29, 1.84467441e19);
  unint64_t v32 = 2654435761u * (unint64_t)v31;
  unint64_t v33 = v32 + (unint64_t)v30;
  if (v30 <= 0.0) {
    unint64_t v33 = 2654435761u * (unint64_t)v31;
  }
  unint64_t v34 = v32 - (unint64_t)fabs(v30);
  if (v30 < 0.0) {
    unint64_t v35 = v34;
  }
  else {
    unint64_t v35 = v33;
  }
  int64_t sizingPolicy = self->_sizingPolicy;
  int64_t lastInteractionTime = self->_lastInteractionTime;
  double userSizeBeforeOverlappingInBoundsWidth = self->_userSizeBeforeOverlappingInBoundsWidth;
  double v37 = -userSizeBeforeOverlappingInBoundsWidth;
  if (userSizeBeforeOverlappingInBoundsWidth >= 0.0) {
    double v37 = self->_userSizeBeforeOverlappingInBoundsWidth;
  }
  long double v38 = floor(v37 + 0.5);
  double v39 = (v37 - v38) * 1.84467441e19;
  double v40 = fmod(v38, 1.84467441e19);
  unint64_t v41 = 2654435761u * (unint64_t)v40;
  unint64_t v42 = v41 + (unint64_t)v39;
  if (v39 <= 0.0) {
    unint64_t v42 = 2654435761u * (unint64_t)v40;
  }
  unint64_t v43 = v41 - (unint64_t)fabs(v39);
  if (v39 < 0.0) {
    unint64_t v44 = v43;
  }
  else {
    unint64_t v44 = v42;
  }
  double userSizeBeforeOverlappingInBoundsHeight = self->_userSizeBeforeOverlappingInBoundsHeight;
  double v46 = -userSizeBeforeOverlappingInBoundsHeight;
  if (userSizeBeforeOverlappingInBoundsHeight >= 0.0) {
    double v46 = self->_userSizeBeforeOverlappingInBoundsHeight;
  }
  long double v47 = floor(v46 + 0.5);
  double v48 = (v46 - v47) * 1.84467441e19;
  double v49 = fmod(v47, 1.84467441e19);
  unint64_t v50 = 2654435761u * (unint64_t)v49;
  unint64_t v51 = v50 + (unint64_t)v48;
  if (v48 <= 0.0) {
    unint64_t v51 = 2654435761u * (unint64_t)v49;
  }
  unint64_t v52 = v50 - (unint64_t)fabs(v48);
  if (v48 < 0.0) {
    unint64_t v53 = v52;
  }
  else {
    unint64_t v53 = v51;
  }
  int64_t contentOrientation = self->_contentOrientation;
  double referenceBoundsWidthForSize = self->_referenceBoundsWidthForSize;
  double v56 = -referenceBoundsWidthForSize;
  if (referenceBoundsWidthForSize >= 0.0) {
    double v56 = self->_referenceBoundsWidthForSize;
  }
  long double v57 = floor(v56 + 0.5);
  double v58 = (v56 - v57) * 1.84467441e19;
  double v59 = fmod(v57, 1.84467441e19);
  unint64_t v60 = 2654435761u * (unint64_t)v59;
  unint64_t v61 = v60 + (unint64_t)v58;
  if (v58 <= 0.0) {
    unint64_t v61 = 2654435761u * (unint64_t)v59;
  }
  unint64_t v62 = v60 - (unint64_t)fabs(v58);
  if (v58 < 0.0) {
    unint64_t v63 = v62;
  }
  else {
    unint64_t v63 = v61;
  }
  double referenceBoundsHeightForSize = self->_referenceBoundsHeightForSize;
  double v65 = -referenceBoundsHeightForSize;
  if (referenceBoundsHeightForSize >= 0.0) {
    double v65 = self->_referenceBoundsHeightForSize;
  }
  long double v66 = floor(v65 + 0.5);
  double v67 = (v65 - v66) * 1.84467441e19;
  double v68 = fmod(v66, 1.84467441e19);
  unint64_t v69 = 2654435761u * (unint64_t)v68;
  unint64_t v70 = v69 + (unint64_t)v67;
  if (v67 <= 0.0) {
    unint64_t v70 = 2654435761u * (unint64_t)v68;
  }
  unint64_t v71 = v69 - (unint64_t)fabs(v67);
  if (v67 < 0.0) {
    unint64_t v72 = v71;
  }
  else {
    unint64_t v72 = v70;
  }
  uint64_t semanticSizeTypeForSize = self->_semanticSizeTypeForSize;
  double referenceBoundsWidthBeforeOverlapping = self->_referenceBoundsWidthBeforeOverlapping;
  double v75 = -referenceBoundsWidthBeforeOverlapping;
  if (referenceBoundsWidthBeforeOverlapping >= 0.0) {
    double v75 = self->_referenceBoundsWidthBeforeOverlapping;
  }
  long double v76 = floor(v75 + 0.5);
  double v77 = (v75 - v76) * 1.84467441e19;
  double v78 = fmod(v76, 1.84467441e19);
  unint64_t v79 = 2654435761u * (unint64_t)v78;
  unint64_t v80 = v79 + (unint64_t)v77;
  if (v77 <= 0.0) {
    unint64_t v80 = 2654435761u * (unint64_t)v78;
  }
  unint64_t v81 = v79 - (unint64_t)fabs(v77);
  if (v77 < 0.0) {
    unint64_t v82 = v81;
  }
  else {
    unint64_t v82 = v80;
  }
  double referenceBoundsHeightBeforeOverlapping = self->_referenceBoundsHeightBeforeOverlapping;
  double v84 = -referenceBoundsHeightBeforeOverlapping;
  if (referenceBoundsHeightBeforeOverlapping >= 0.0) {
    double v84 = self->_referenceBoundsHeightBeforeOverlapping;
  }
  long double v85 = floor(v84 + 0.5);
  double v86 = (v84 - v85) * 1.84467441e19;
  double v87 = fmod(v85, 1.84467441e19);
  unint64_t v88 = 2654435761u * (unint64_t)v87;
  unint64_t v89 = v88 + (unint64_t)v86;
  if (v86 <= 0.0) {
    unint64_t v89 = 2654435761u * (unint64_t)v87;
  }
  unint64_t v90 = v88 - (unint64_t)fabs(v86);
  if (v86 >= 0.0) {
    unint64_t v90 = v89;
  }
  return v95 ^ v96 ^ v94 ^ v35 ^ (2654435761 * lastInteractionTime) ^ (2654435761 * sizingPolicy) ^ v44 ^ v53 ^ (2654435761 * contentOrientation) ^ v63 ^ v72 ^ (2654435761 * semanticSizeTypeForSize) ^ v82 ^ v90 ^ (2654435761 * self->_semanticSizeTypeBeforeOverlapping) ^ (2654435761 * self->_positionIsSystemManaged);
}

- (double)mergeFrom:(uint64_t)a1
{
  if (a1)
  {
    *(void *)(a1 + 80) = *(void *)(a2 + 80);
    *(void *)(a1 + 72) = *(void *)(a2 + 72);
    *(void *)(a1 + 8) = *(void *)(a2 + 8);
    *(void *)(a1 + 16) = *(void *)(a2 + 16);
    *(void *)(a1 + 32) = *(void *)(a2 + 32);
    *(void *)(a1 + 88) = *(void *)(a2 + 88);
    *(void *)(a1 + 104) = *(void *)(a2 + 104);
    *(void *)(a1 + 96) = *(void *)(a2 + 96);
    *(void *)(a1 + 24) = *(void *)(a2 + 24);
    *(void *)(a1 + 64) = *(void *)(a2 + 64);
    *(void *)(a1 + 48) = *(void *)(a2 + 48);
    *(_DWORD *)(a1 + 116) = *(_DWORD *)(a2 + 116);
    *(void *)(a1 + 56) = *(void *)(a2 + 56);
    double result = *(double *)(a2 + 40);
    *(double *)(a1 + 40) = result;
    *(_DWORD *)(a1 + 112) = *(_DWORD *)(a2 + 112);
    *(unsigned char *)(a1 + 120) = *(unsigned char *)(a2 + 120);
  }
  return result;
}

- (double)sizeWidth
{
  if (a1) {
    return *(double *)(a1 + 80);
  }
  else {
    return 0.0;
  }
}

- (uint64_t)setSizeWidth:(uint64_t)result
{
  if (result) {
    *(double *)(result + 80) = a2;
  }
  return result;
}

- (double)sizeHeight
{
  if (a1) {
    return *(double *)(a1 + 72);
  }
  else {
    return 0.0;
  }
}

- (uint64_t)setSizeHeight:(uint64_t)result
{
  if (result) {
    *(double *)(result + 72) = a2;
  }
  return result;
}

- (double)centerX
{
  if (a1) {
    return *(double *)(a1 + 8);
  }
  else {
    return 0.0;
  }
}

- (uint64_t)setCenterX:(uint64_t)result
{
  if (result) {
    *(double *)(result + 8) = a2;
  }
  return result;
}

- (double)centerY
{
  if (a1) {
    return *(double *)(a1 + 16);
  }
  else {
    return 0.0;
  }
}

- (uint64_t)setCenterY:(uint64_t)result
{
  if (result) {
    *(double *)(result + 16) = a2;
  }
  return result;
}

- (uint64_t)lastInteractionTime
{
  if (result) {
    return *(void *)(result + 32);
  }
  return result;
}

- (uint64_t)setLastInteractionTime:(uint64_t)result
{
  if (result) {
    *(void *)(result + 32) = a2;
  }
  return result;
}

- (uint64_t)sizingPolicy
{
  if (result) {
    return *(void *)(result + 88);
  }
  return result;
}

- (uint64_t)setSizingPolicy:(uint64_t)result
{
  if (result) {
    *(void *)(result + 88) = a2;
  }
  return result;
}

- (double)userSizeBeforeOverlappingInBoundsWidth
{
  if (a1) {
    return *(double *)(a1 + 104);
  }
  else {
    return 0.0;
  }
}

- (uint64_t)setUserSizeBeforeOverlappingInBoundsWidth:(uint64_t)result
{
  if (result) {
    *(double *)(result + 104) = a2;
  }
  return result;
}

- (double)userSizeBeforeOverlappingInBoundsHeight
{
  if (a1) {
    return *(double *)(a1 + 96);
  }
  else {
    return 0.0;
  }
}

- (uint64_t)setUserSizeBeforeOverlappingInBoundsHeight:(uint64_t)result
{
  if (result) {
    *(double *)(result + 96) = a2;
  }
  return result;
}

- (uint64_t)contentOrientation
{
  if (result) {
    return *(void *)(result + 24);
  }
  return result;
}

- (uint64_t)setContentOrientation:(uint64_t)result
{
  if (result) {
    *(void *)(result + 24) = a2;
  }
  return result;
}

- (double)referenceBoundsWidthForSize
{
  if (a1) {
    return *(double *)(a1 + 64);
  }
  else {
    return 0.0;
  }
}

- (uint64_t)setReferenceBoundsWidthForSize:(uint64_t)result
{
  if (result) {
    *(double *)(result + 64) = a2;
  }
  return result;
}

- (double)referenceBoundsHeightForSize
{
  if (a1) {
    return *(double *)(a1 + 48);
  }
  else {
    return 0.0;
  }
}

- (uint64_t)setReferenceBoundsHeightForSize:(uint64_t)result
{
  if (result) {
    *(double *)(result + 48) = a2;
  }
  return result;
}

- (uint64_t)semanticSizeTypeForSize
{
  if (result) {
    return *(unsigned int *)(result + 116);
  }
  return result;
}

- (uint64_t)setSemanticSizeTypeForSize:(uint64_t)result
{
  if (result) {
    *(_DWORD *)(result + 116) = a2;
  }
  return result;
}

- (double)referenceBoundsWidthBeforeOverlapping
{
  if (a1) {
    return *(double *)(a1 + 56);
  }
  else {
    return 0.0;
  }
}

- (uint64_t)setReferenceBoundsWidthBeforeOverlapping:(uint64_t)result
{
  if (result) {
    *(double *)(result + 56) = a2;
  }
  return result;
}

- (double)referenceBoundsHeightBeforeOverlapping
{
  if (a1) {
    return *(double *)(a1 + 40);
  }
  else {
    return 0.0;
  }
}

- (uint64_t)setReferenceBoundsHeightBeforeOverlapping:(uint64_t)result
{
  if (result) {
    *(double *)(result + 40) = a2;
  }
  return result;
}

- (uint64_t)semanticSizeTypeBeforeOverlapping
{
  if (result) {
    return *(unsigned int *)(result + 112);
  }
  return result;
}

- (uint64_t)setSemanticSizeTypeBeforeOverlapping:(uint64_t)result
{
  if (result) {
    *(_DWORD *)(result + 112) = a2;
  }
  return result;
}

- (BOOL)positionIsSystemManaged
{
  if (result) {
    return *(unsigned char *)(result + 120) != 0;
  }
  return result;
}

- (uint64_t)setPositionIsSystemManaged:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 120) = a2;
  }
  return result;
}

@end