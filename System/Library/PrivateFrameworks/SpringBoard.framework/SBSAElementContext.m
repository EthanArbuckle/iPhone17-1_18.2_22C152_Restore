@interface SBSAElementContext
+ (Class)mutatorClass;
+ (id)instanceWithBlock:(id)a3;
- (BOOL)isEqual:(id)a3;
- (CGRect)preferredLeadingBounds;
- (CGRect)preferredMinimalBounds;
- (CGRect)preferredTrailingBounds;
- (NSDirectionalEdgeInsets)preferredEdgeOutsets;
- (NSString)clientIdentifier;
- (NSString)description;
- (NSString)elementIdentifier;
- (SBSAElementContext)initWithSystemApertureElementContext:(id)a3;
- (UIColor)keyColor;
- (id)copyWithBlock:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)activeDynamicAnimation;
- (int64_t)interfaceOrientation;
- (int64_t)layoutMode;
- (int64_t)systemApertureCustomLayout;
- (int64_t)systemApertureCustomLayoutCustomAnimationStyle;
- (int64_t)systemApertureLayoutCustomizingOptions;
- (unint64_t)hash;
- (void)_setActiveDynamicAnimation:(int64_t)a3;
- (void)_setClientIdentifier:(id)a3;
- (void)_setElementIdentifier:(id)a3;
- (void)_setInterfaceOrientation:(int64_t)a3;
- (void)_setKeyColor:(id)a3;
- (void)_setLayoutMode:(int64_t)a3;
- (void)_setPreferredEdgeOutsets:(NSDirectionalEdgeInsets)a3;
- (void)_setPreferredLeadingBounds:(CGRect)a3;
- (void)_setPreferredMinimalBounds:(CGRect)a3;
- (void)_setPreferredTrailingBounds:(CGRect)a3;
- (void)_setSystemApertureCustomLayout:(int64_t)a3;
- (void)_setSystemApertureCustomLayoutCustomAnimationStyle:(int64_t)a3;
- (void)_setSystemApertureLayoutCustomizingOptions:(int64_t)a3;
@end

@implementation SBSAElementContext

- (int64_t)layoutMode
{
  return self->_layoutMode;
}

- (int64_t)interfaceOrientation
{
  return self->_interfaceOrientation;
}

- (SBSAElementContext)initWithSystemApertureElementContext:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)SBSAElementContext;
  v5 = [(SBSAElementContext *)&v31 init];
  if (v5)
  {
    v6 = [v4 clientIdentifier];
    uint64_t v7 = [v6 copy];
    clientIdentifier = v5->_clientIdentifier;
    v5->_clientIdentifier = (NSString *)v7;

    v9 = [v4 elementIdentifier];
    uint64_t v10 = [v9 copy];
    elementIdentifier = v5->_elementIdentifier;
    v5->_elementIdentifier = (NSString *)v10;

    v5->_layoutMode = [v4 layoutMode];
    [v4 preferredEdgeOutsets];
    v5->_preferredEdgeOutsets.top = v12;
    v5->_preferredEdgeOutsets.leading = v13;
    v5->_preferredEdgeOutsets.bottom = v14;
    v5->_preferredEdgeOutsets.trailing = v15;
    v5->_interfaceOrientation = [v4 interfaceOrientation];
    v5->_systemApertureCustomLayout = [v4 systemApertureCustomLayout];
    v5->_systemApertureCustomLayoutCustomAnimationStyle = [v4 systemApertureCustomLayoutCustomAnimationStyle];
    v5->_systemApertureLayoutCustomizingOptions = [v4 systemApertureLayoutCustomizingOptions];
    v5->_activeDynamicAnimation = [v4 activeDynamicAnimation];
    uint64_t v16 = [v4 keyColor];
    keyColor = v5->_keyColor;
    v5->_keyColor = (UIColor *)v16;

    [v4 preferredLeadingBounds];
    v5->_preferredLeadingBounds.origin.x = v18;
    v5->_preferredLeadingBounds.origin.y = v19;
    v5->_preferredLeadingBounds.size.width = v20;
    v5->_preferredLeadingBounds.size.height = v21;
    [v4 preferredTrailingBounds];
    v5->_preferredTrailingBounds.origin.x = v22;
    v5->_preferredTrailingBounds.origin.y = v23;
    v5->_preferredTrailingBounds.size.width = v24;
    v5->_preferredTrailingBounds.size.height = v25;
    [v4 preferredMinimalBounds];
    v5->_preferredMinimalBounds.origin.x = v26;
    v5->_preferredMinimalBounds.origin.y = v27;
    v5->_preferredMinimalBounds.size.width = v28;
    v5->_preferredMinimalBounds.size.height = v29;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v45 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  clientIdentifier = self->_clientIdentifier;
  v70[0] = MEMORY[0x1E4F143A8];
  v70[1] = 3221225472;
  v70[2] = __30__SBSAElementContext_isEqual___block_invoke;
  v70[3] = &unk_1E6AF9E90;
  id v6 = v4;
  id v71 = v6;
  v44 = [v45 appendObject:clientIdentifier counterpart:v70];
  elementIdentifier = self->_elementIdentifier;
  v68[0] = MEMORY[0x1E4F143A8];
  v68[1] = 3221225472;
  v68[2] = __30__SBSAElementContext_isEqual___block_invoke_2;
  v68[3] = &unk_1E6AF9E90;
  id v8 = v6;
  id v69 = v8;
  v43 = [v44 appendObject:elementIdentifier counterpart:v68];
  int64_t layoutMode = self->_layoutMode;
  v66[0] = MEMORY[0x1E4F143A8];
  v66[1] = 3221225472;
  v66[2] = __30__SBSAElementContext_isEqual___block_invoke_3;
  v66[3] = &unk_1E6AF9660;
  id v10 = v8;
  id v67 = v10;
  v42 = [v43 appendInteger:layoutMode counterpart:v66];
  v64[0] = MEMORY[0x1E4F143A8];
  v64[1] = 3221225472;
  v64[2] = __30__SBSAElementContext_isEqual___block_invoke_4;
  v64[3] = &unk_1E6AF5420;
  v64[4] = self;
  id v11 = v10;
  id v65 = v11;
  v41 = objc_msgSend(v42, "appendEqualsBlocks:", v64, 0);
  int64_t interfaceOrientation = self->_interfaceOrientation;
  v62[0] = MEMORY[0x1E4F143A8];
  v62[1] = 3221225472;
  v62[2] = __30__SBSAElementContext_isEqual___block_invoke_5;
  v62[3] = &unk_1E6AF9660;
  id v13 = v11;
  id v63 = v13;
  v40 = [v41 appendInteger:interfaceOrientation counterpart:v62];
  int64_t systemApertureCustomLayout = self->_systemApertureCustomLayout;
  v60[0] = MEMORY[0x1E4F143A8];
  v60[1] = 3221225472;
  v60[2] = __30__SBSAElementContext_isEqual___block_invoke_6;
  v60[3] = &unk_1E6AF9660;
  id v15 = v13;
  id v61 = v15;
  uint64_t v16 = [v40 appendInteger:systemApertureCustomLayout counterpart:v60];
  int64_t systemApertureCustomLayoutCustomAnimationStyle = self->_systemApertureCustomLayoutCustomAnimationStyle;
  v58[0] = MEMORY[0x1E4F143A8];
  v58[1] = 3221225472;
  v58[2] = __30__SBSAElementContext_isEqual___block_invoke_7;
  v58[3] = &unk_1E6AF9660;
  id v18 = v15;
  id v59 = v18;
  CGFloat v19 = [v16 appendInteger:systemApertureCustomLayoutCustomAnimationStyle counterpart:v58];
  int64_t systemApertureLayoutCustomizingOptions = self->_systemApertureLayoutCustomizingOptions;
  v56[0] = MEMORY[0x1E4F143A8];
  v56[1] = 3221225472;
  v56[2] = __30__SBSAElementContext_isEqual___block_invoke_8;
  v56[3] = &unk_1E6AF9660;
  id v21 = v18;
  id v57 = v21;
  CGFloat v22 = [v19 appendInteger:systemApertureLayoutCustomizingOptions counterpart:v56];
  int64_t activeDynamicAnimation = self->_activeDynamicAnimation;
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __30__SBSAElementContext_isEqual___block_invoke_9;
  v54[3] = &unk_1E6AF9660;
  id v24 = v21;
  id v55 = v24;
  CGFloat v25 = [v22 appendInteger:activeDynamicAnimation counterpart:v54];
  keyColor = self->_keyColor;
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __30__SBSAElementContext_isEqual___block_invoke_10;
  v52[3] = &unk_1E6AF9E90;
  id v27 = v24;
  id v53 = v27;
  CGFloat v28 = [v25 appendObject:keyColor counterpart:v52];
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __30__SBSAElementContext_isEqual___block_invoke_11;
  v50[3] = &unk_1E6AFBC10;
  id v29 = v27;
  id v51 = v29;
  v30 = objc_msgSend(v28, "appendCGRect:counterpart:", v50, self->_preferredLeadingBounds.origin.x, self->_preferredLeadingBounds.origin.y, self->_preferredLeadingBounds.size.width, self->_preferredLeadingBounds.size.height);
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __30__SBSAElementContext_isEqual___block_invoke_12;
  v48[3] = &unk_1E6AFBC10;
  id v31 = v29;
  id v49 = v31;
  v32 = objc_msgSend(v30, "appendCGRect:counterpart:", v48, self->_preferredTrailingBounds.origin.x, self->_preferredTrailingBounds.origin.y, self->_preferredTrailingBounds.size.width, self->_preferredTrailingBounds.size.height);
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __30__SBSAElementContext_isEqual___block_invoke_13;
  v46[3] = &unk_1E6AFBC10;
  id v47 = v31;
  double x = self->_preferredMinimalBounds.origin.x;
  double y = self->_preferredMinimalBounds.origin.y;
  double width = self->_preferredMinimalBounds.size.width;
  double height = self->_preferredMinimalBounds.size.height;
  id v37 = v31;
  v38 = objc_msgSend(v32, "appendCGRect:counterpart:", v46, x, y, width, height);
  LOBYTE(v31) = [v38 isEqual];

  return (char)v31;
}

uint64_t __30__SBSAElementContext_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) clientIdentifier];
}

uint64_t __30__SBSAElementContext_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) elementIdentifier];
}

uint64_t __30__SBSAElementContext_isEqual___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutMode];
}

BOOL __30__SBSAElementContext_isEqual___block_invoke_4(uint64_t a1)
{
  v1 = *(double **)(a1 + 32);
  [*(id *)(a1 + 40) preferredEdgeOutsets];
  BOOL v5 = v1[11] == v4;
  if (v1[10] != v6) {
    BOOL v5 = 0;
  }
  if (v1[13] != v3) {
    BOOL v5 = 0;
  }
  return v1[12] == v2 && v5;
}

uint64_t __30__SBSAElementContext_isEqual___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) interfaceOrientation];
}

uint64_t __30__SBSAElementContext_isEqual___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) systemApertureCustomLayout];
}

uint64_t __30__SBSAElementContext_isEqual___block_invoke_7(uint64_t a1)
{
  return [*(id *)(a1 + 32) systemApertureCustomLayoutCustomAnimationStyle];
}

uint64_t __30__SBSAElementContext_isEqual___block_invoke_8(uint64_t a1)
{
  return [*(id *)(a1 + 32) systemApertureLayoutCustomizingOptions];
}

uint64_t __30__SBSAElementContext_isEqual___block_invoke_9(uint64_t a1)
{
  return [*(id *)(a1 + 32) activeDynamicAnimation];
}

uint64_t __30__SBSAElementContext_isEqual___block_invoke_10(uint64_t a1)
{
  return [*(id *)(a1 + 32) keyColor];
}

uint64_t __30__SBSAElementContext_isEqual___block_invoke_11(uint64_t a1)
{
  return [*(id *)(a1 + 32) preferredLeadingBounds];
}

uint64_t __30__SBSAElementContext_isEqual___block_invoke_12(uint64_t a1)
{
  return [*(id *)(a1 + 32) preferredTrailingBounds];
}

uint64_t __30__SBSAElementContext_isEqual___block_invoke_13(uint64_t a1)
{
  return [*(id *)(a1 + 32) preferredMinimalBounds];
}

- (unint64_t)hash
{
  id v21 = [MEMORY[0x1E4F4F758] builder];
  CGFloat v20 = [v21 appendObject:self->_clientIdentifier];
  CGFloat v19 = [v20 appendObject:self->_elementIdentifier];
  id v18 = [v19 appendInteger:self->_layoutMode];
  v17 = [v18 appendCGFloat:self->_preferredEdgeOutsets.top];
  uint64_t v16 = [v17 appendCGFloat:self->_preferredEdgeOutsets.leading];
  id v15 = [v16 appendCGFloat:self->_preferredEdgeOutsets.bottom];
  CGFloat v14 = [v15 appendCGFloat:self->_preferredEdgeOutsets.trailing];
  double v3 = [v14 appendInteger:self->_interfaceOrientation];
  double v4 = [v3 appendInteger:self->_systemApertureCustomLayout];
  BOOL v5 = [v4 appendInteger:self->_systemApertureCustomLayoutCustomAnimationStyle];
  double v6 = [v5 appendInteger:self->_systemApertureLayoutCustomizingOptions];
  uint64_t v7 = [v6 appendInteger:self->_activeDynamicAnimation];
  id v8 = [v7 appendObject:self->_keyColor];
  v9 = objc_msgSend(v8, "appendCGRect:", self->_preferredLeadingBounds.origin.x, self->_preferredLeadingBounds.origin.y, self->_preferredLeadingBounds.size.width, self->_preferredLeadingBounds.size.height);
  id v10 = objc_msgSend(v9, "appendCGRect:", self->_preferredTrailingBounds.origin.x, self->_preferredTrailingBounds.origin.y, self->_preferredTrailingBounds.size.width, self->_preferredTrailingBounds.size.height);
  id v11 = objc_msgSend(v10, "appendCGRect:", self->_preferredMinimalBounds.origin.x, self->_preferredMinimalBounds.origin.y, self->_preferredMinimalBounds.size.width, self->_preferredMinimalBounds.size.height);
  unint64_t v12 = [v11 hash];

  return v12;
}

- (NSString)description
{
  CGFloat v20 = NSString;
  uint64_t v3 = objc_opt_class();
  clientIdentifier = self->_clientIdentifier;
  uint64_t v19 = v3;
  elementIdentifier = self->_elementIdentifier;
  uint64_t v16 = SAUIStringFromElementViewLayoutMode();
  id v15 = NSStringFromDirectionalEdgeInsets(self->_preferredEdgeOutsets);
  CGFloat v14 = SBSAStringFromUIInterfaceOrientation(self->_interfaceOrientation);
  double v4 = SBStringFromSystemApertureCustomLayout(self->_systemApertureCustomLayout);
  BOOL v5 = SBStringFromSystemApertureCustomLayout(self->_systemApertureCustomLayoutCustomAnimationStyle);
  double v6 = SBStringFromSystemApertureLayoutCustomizingOptions(self->_systemApertureLayoutCustomizingOptions);
  uint64_t v7 = SBStringFromSBSADynamicPersistentAnimation(self->_activeDynamicAnimation);
  keyColor = self->_keyColor;
  v9 = NSStringFromCGRect(self->_preferredLeadingBounds);
  id v10 = NSStringFromCGRect(self->_preferredTrailingBounds);
  id v11 = NSStringFromCGRect(self->_preferredMinimalBounds);
  objc_msgSend(v20, "stringWithFormat:", @"<%@: %p; clientIdentifier: %@; elementIdentifier: %@; layoutMode: %@; preferredEdgeOutsets: %@; interfaceOrientation: %@; systemApertureCustomLayout: %@; systemApertureCustomLayoutCustomAnimationStyle: %@; systemApertureLayoutCustomizingOptions: %@; activeDynamicAnimation: %@; keyColor: %@; preferredLeadingBounds: %@; preferredTrailingBounds: %@; preferredMinimalBounds: %@>",
    v19,
    self,
    clientIdentifier,
    elementIdentifier,
    v16,
    v15,
    v14,
    v4,
    v5,
    v6,
    v7,
    keyColor,
    v9,
    v10,
  unint64_t v12 = v11);

  return (NSString *)v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  return (id)[v4 initWithSystemApertureElementContext:self];
}

+ (id)instanceWithBlock:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)objc_opt_class());
  BOOL v5 = (void *)[v4 copyWithBlock:v3];

  return v5;
}

+ (Class)mutatorClass
{
  return (Class)objc_opt_class();
}

- (id)copyWithBlock:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  BOOL v5 = (void *)[(SBSAElementContext *)self copy];
  if (v4)
  {
    double v6 = objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "mutatorClass")), "initWithSystemApertureElementContext:", v5);
    v4[2](v4, v6);
  }
  return v5;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void)_setClientIdentifier:(id)a3
{
}

- (NSString)elementIdentifier
{
  return self->_elementIdentifier;
}

- (void)_setElementIdentifier:(id)a3
{
}

- (void)_setLayoutMode:(int64_t)a3
{
  self->_int64_t layoutMode = a3;
}

- (NSDirectionalEdgeInsets)preferredEdgeOutsets
{
  double top = self->_preferredEdgeOutsets.top;
  double leading = self->_preferredEdgeOutsets.leading;
  double bottom = self->_preferredEdgeOutsets.bottom;
  double trailing = self->_preferredEdgeOutsets.trailing;
  result.double trailing = trailing;
  result.double bottom = bottom;
  result.double leading = leading;
  result.double top = top;
  return result;
}

- (void)_setPreferredEdgeOutsets:(NSDirectionalEdgeInsets)a3
{
  self->_preferredEdgeOutsets = a3;
}

- (void)_setInterfaceOrientation:(int64_t)a3
{
  self->_int64_t interfaceOrientation = a3;
}

- (int64_t)systemApertureCustomLayout
{
  return self->_systemApertureCustomLayout;
}

- (void)_setSystemApertureCustomLayout:(int64_t)a3
{
  self->_int64_t systemApertureCustomLayout = a3;
}

- (int64_t)systemApertureCustomLayoutCustomAnimationStyle
{
  return self->_systemApertureCustomLayoutCustomAnimationStyle;
}

- (void)_setSystemApertureCustomLayoutCustomAnimationStyle:(int64_t)a3
{
  self->_int64_t systemApertureCustomLayoutCustomAnimationStyle = a3;
}

- (int64_t)systemApertureLayoutCustomizingOptions
{
  return self->_systemApertureLayoutCustomizingOptions;
}

- (void)_setSystemApertureLayoutCustomizingOptions:(int64_t)a3
{
  self->_int64_t systemApertureLayoutCustomizingOptions = a3;
}

- (int64_t)activeDynamicAnimation
{
  return self->_activeDynamicAnimation;
}

- (void)_setActiveDynamicAnimation:(int64_t)a3
{
  self->_int64_t activeDynamicAnimation = a3;
}

- (UIColor)keyColor
{
  return self->_keyColor;
}

- (void)_setKeyColor:(id)a3
{
}

- (CGRect)preferredLeadingBounds
{
  double x = self->_preferredLeadingBounds.origin.x;
  double y = self->_preferredLeadingBounds.origin.y;
  double width = self->_preferredLeadingBounds.size.width;
  double height = self->_preferredLeadingBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)_setPreferredLeadingBounds:(CGRect)a3
{
  self->_preferredLeadingBounds = a3;
}

- (CGRect)preferredTrailingBounds
{
  double x = self->_preferredTrailingBounds.origin.x;
  double y = self->_preferredTrailingBounds.origin.y;
  double width = self->_preferredTrailingBounds.size.width;
  double height = self->_preferredTrailingBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)_setPreferredTrailingBounds:(CGRect)a3
{
  self->_preferredTrailingBounds = a3;
}

- (CGRect)preferredMinimalBounds
{
  double x = self->_preferredMinimalBounds.origin.x;
  double y = self->_preferredMinimalBounds.origin.y;
  double width = self->_preferredMinimalBounds.size.width;
  double height = self->_preferredMinimalBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)_setPreferredMinimalBounds:(CGRect)a3
{
  self->_preferredMinimalBounds = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyColor, 0);
  objc_storeStrong((id *)&self->_elementIdentifier, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
}

@end