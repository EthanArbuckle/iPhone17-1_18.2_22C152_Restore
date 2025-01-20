@interface SBIconListViewIconVisibilityInfo
- (BOOL)isEqual:(id)a3;
- (BOOL)isNormalized;
- (CGRect)visibleRectForIcon:(id)a3;
- (NSMapTable)visibleIconRects;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)hash;
- (void)addValuesFromIconVisibilityInfo:(id)a3;
- (void)enumerateVisibleIconsUsingBlock:(id)a3;
- (void)setNormalized:(BOOL)a3;
- (void)setVisibleRect:(CGRect)a3 forIcon:(id)a4;
@end

@implementation SBIconListViewIconVisibilityInfo

- (CGRect)visibleRectForIcon:(id)a3
{
  v3 = [(NSMapTable *)self->_visibleRects objectForKey:a3];
  v4 = v3;
  if (v3)
  {
    [v3 CGRectValue];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
  }
  else
  {
    double v6 = *MEMORY[0x1E4F1DB28];
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (void)setVisibleRect:(CGRect)a3 forIcon:(id)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v9 = a4;
  v15.origin.CGFloat x = x;
  v15.origin.CGFloat y = y;
  v15.size.CGFloat width = width;
  v15.size.CGFloat height = height;
  if (!CGRectIsEmpty(v15))
  {
    v16.origin.CGFloat x = x;
    v16.origin.CGFloat y = y;
    v16.size.CGFloat width = width;
    v16.size.CGFloat height = height;
    if (!CGRectIsNull(v16))
    {
      visibleRects = self->_visibleRects;
      if (!visibleRects)
      {
        double v11 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
        double v12 = self->_visibleRects;
        self->_visibleRects = v11;

        visibleRects = self->_visibleRects;
      }
      *(CGFloat *)double v14 = x;
      *(CGFloat *)&v14[1] = y;
      *(CGFloat *)&v14[2] = width;
      *(CGFloat *)&v14[3] = height;
      double v13 = [MEMORY[0x1E4F29238] valueWithBytes:v14 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
      [(NSMapTable *)visibleRects setObject:v13 forKey:v9];
    }
  }
}

- (void)addValuesFromIconVisibilityInfo:(id)a3
{
  id v4 = a3;
  int v5 = [(SBIconListViewIconVisibilityInfo *)self isNormalized];
  if (v5 != [v4 isNormalized])
  {
    id v6 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], @"Invalid argument to addValuesFromIconVisibilityInfo:, mismatched normalization!", 0 reason userInfo];
    objc_exception_throw(v6);
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__SBIconListViewIconVisibilityInfo_addValuesFromIconVisibilityInfo___block_invoke;
  v7[3] = &unk_1E6AB3380;
  v7[4] = self;
  [v4 enumerateVisibleIconsUsingBlock:v7];
}

uint64_t __68__SBIconListViewIconVisibilityInfo_addValuesFromIconVisibilityInfo___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setVisibleRect:forIcon:", a2);
}

- (NSMapTable)visibleIconRects
{
  v2 = (void *)[(NSMapTable *)self->_visibleRects copy];
  return (NSMapTable *)v2;
}

- (void)enumerateVisibleIconsUsingBlock:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, uint64_t, char *, double, double, double, double))a3;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  int v5 = self->_visibleRects;
  uint64_t v6 = [(NSMapTable *)v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v22;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v22 != v8) {
        objc_enumerationMutation(v5);
      }
      uint64_t v10 = *(void *)(*((void *)&v21 + 1) + 8 * v9);
      double v11 = [(NSMapTable *)self->_visibleRects objectForKey:v10];
      [v11 CGRectValue];
      double v13 = v12;
      double v15 = v14;
      double v17 = v16;
      double v19 = v18;

      char v20 = 0;
      v4[2](v4, v10, &v20, v13, v15, v17, v19);
      if (v20) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [(NSMapTable *)v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SBIconListViewIconVisibilityInfo *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    int v5 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0 && self->_normalized == v4->_normalized) {
      char v7 = BSEqualObjects();
    }
    else {
      char v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  BOOL normalized = self->_normalized;
  return [(NSMapTable *)self->_visibleRects hash] + normalized;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = (void *)v5;
  if (v5)
  {
    *(unsigned char *)(v5 + 16) = self->_normalized;
    uint64_t v7 = [(NSMapTable *)self->_visibleRects copyWithZone:a3];
    uint64_t v8 = (void *)v6[1];
    v6[1] = v7;

    uint64_t v9 = v6;
  }

  return v6;
}

- (NSString)description
{
  return (NSString *)[(SBIconListViewIconVisibilityInfo *)self descriptionWithMultilinePrefix:@"\t"];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(SBIconListViewIconVisibilityInfo *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v5 = (id)objc_msgSend(v4, "appendBool:withName:", -[SBIconListViewIconVisibilityInfo isNormalized](self, "isNormalized"), @"isNormalized");
  id v6 = (id)[v4 appendObject:self->_visibleRects withName:@"visibleRects"];
  return v4;
}

- (id)succinctDescription
{
  v2 = [(SBIconListViewIconVisibilityInfo *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (BOOL)isNormalized
{
  return self->_normalized;
}

- (void)setNormalized:(BOOL)a3
{
  self->_BOOL normalized = a3;
}

- (void).cxx_destruct
{
}

@end