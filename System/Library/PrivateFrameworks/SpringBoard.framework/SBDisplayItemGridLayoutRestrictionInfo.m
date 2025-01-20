@interface SBDisplayItemGridLayoutRestrictionInfo
+ (id)layoutRestrictionInfoWithLayoutRestrictions:(unint64_t)a3 restrictedSize:(CGSize)a4;
- (BOOL)isEqual:(id)a3;
- (CGSize)restrictedSize;
- (id)_initWithLayoutRestrictions:(unint64_t)a3 restrictedSize:(CGSize)a4;
- (id)description;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)hash;
- (unint64_t)layoutRestrictions;
@end

@implementation SBDisplayItemGridLayoutRestrictionInfo

+ (id)layoutRestrictionInfoWithLayoutRestrictions:(unint64_t)a3 restrictedSize:(CGSize)a4
{
  if (a3)
  {
    id v5 = (id)objc_msgSend(objc_alloc((Class)a1), "_initWithLayoutRestrictions:restrictedSize:", a3, a4.width, a4.height);
  }
  else
  {
    if (a4.width != -1.0 || a4.height != -1.0)
    {
      v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:a2 object:a1 file:@"SBDisplayItemGridLayoutRestrictionInfo.m" lineNumber:48 description:@"invalid layout restriction initialization"];
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __101__SBDisplayItemGridLayoutRestrictionInfo_layoutRestrictionInfoWithLayoutRestrictions_restrictedSize___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    if (layoutRestrictionInfoWithLayoutRestrictions_restrictedSize__onceToken != -1) {
      dispatch_once(&layoutRestrictionInfoWithLayoutRestrictions_restrictedSize__onceToken, block);
    }
    id v5 = (id)layoutRestrictionInfoWithLayoutRestrictions_restrictedSize__sSharedUnrestrictedInfo;
  }
  return v5;
}

void __101__SBDisplayItemGridLayoutRestrictionInfo_layoutRestrictionInfoWithLayoutRestrictions_restrictedSize___block_invoke(uint64_t a1)
{
  uint64_t v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "_initWithLayoutRestrictions:restrictedSize:", 0, -1.0, -1.0);
  v2 = (void *)layoutRestrictionInfoWithLayoutRestrictions_restrictedSize__sSharedUnrestrictedInfo;
  layoutRestrictionInfoWithLayoutRestrictions_restrictedSize__sSharedUnrestrictedInfo = v1;
}

- (id)_initWithLayoutRestrictions:(unint64_t)a3 restrictedSize:(CGSize)a4
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  v13.receiver = self;
  v13.super_class = (Class)SBDisplayItemGridLayoutRestrictionInfo;
  v7 = [(SBDisplayItemGridLayoutRestrictionInfo *)&v13 init];
  v8 = v7;
  if (v7)
  {
    v7->_layoutRestrictions = a3;
    v7->_restrictedSize.CGFloat width = width;
    v7->_restrictedSize.CGFloat height = height;
    v9 = [MEMORY[0x1E4F4F758] builder];
    id v10 = (id)[v9 appendUnsignedInteger:v8->_layoutRestrictions];
    id v11 = (id)objc_msgSend(v9, "appendCGSize:", v8->_restrictedSize.width, v8->_restrictedSize.height);
    v8->_cachedHash = [v9 hash];
  }
  return v8;
}

- (unint64_t)hash
{
  return self->_cachedHash;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (double *)a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && self->_layoutRestrictions == *((void *)v4 + 2)
    && self->_restrictedSize.height == v4[4]
    && self->_restrictedSize.width == v4[3];

  return v5;
}

- (id)description
{
  return [(SBDisplayItemGridLayoutRestrictionInfo *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(SBDisplayItemGridLayoutRestrictionInfo *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  CGFloat width = self->_restrictedSize.width;
  double height = self->_restrictedSize.height;
  if (width != -1.0 || height != -1.0)
  {
    v7 = NSStringFromCGSize(*(CGSize *)&width);
    [v3 appendString:v7 withName:@"restrictedSize"];
  }
  v8 = SBDisplayItemGridLayoutRestrictionsDescription(self->_layoutRestrictions);
  [v3 appendString:v8 withName:@"restrictions"];

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(SBDisplayItemGridLayoutRestrictionInfo *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (unint64_t)layoutRestrictions
{
  return self->_layoutRestrictions;
}

- (CGSize)restrictedSize
{
  double width = self->_restrictedSize.width;
  double height = self->_restrictedSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

@end