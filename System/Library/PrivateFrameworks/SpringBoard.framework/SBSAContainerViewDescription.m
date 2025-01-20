@interface SBSAContainerViewDescription
+ (Class)mutatorClass;
- (BOOL)isEqual:(id)a3;
- (CGPoint)contentCenter;
- (CGRect)contentBounds;
- (CGSize)contentScale;
- (NSString)description;
- (SAElementIdentifying)associatedSystemApertureElementIdentity;
- (SBSystemApertureContainerRenderingConfiguration)renderingConfiguration;
- (UIColor)keyLineTintColor;
- (id)copyByPixelAligningGeometryWithScale:(double)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)keyLineMode;
- (int64_t)sampledBackgroundLuminanceLevel;
- (int64_t)shadowStyle;
- (unint64_t)hash;
- (void)_setAssociatedSystemApertureElementIdentity:(id)a3;
- (void)_setContentBounds:(CGRect)a3;
- (void)_setContentCenter:(CGPoint)a3;
- (void)_setContentScale:(CGSize)a3;
- (void)_setKeyLineMode:(int64_t)a3;
- (void)_setKeyLineTintColor:(id)a3;
- (void)_setRenderingConfiguration:(SBSystemApertureContainerRenderingConfiguration *)a3;
- (void)_setSampledBackgroundLuminanceLevel:(int64_t)a3;
- (void)_setShadowStyle:(int64_t)a3;
@end

@implementation SBSAContainerViewDescription

- (id)copyWithZone:(_NSZone *)a3
{
  v15.receiver = self;
  v15.super_class = (Class)SBSAContainerViewDescription;
  v4 = [(SBSAViewDescription *)&v15 copyWithZone:a3];
  if (self->_associatedSystemApertureElementIdentity)
  {
    v5 = [SBSAElementIdentification alloc];
    v6 = [(SAElementIdentifying *)self->_associatedSystemApertureElementIdentity clientIdentifier];
    v7 = [(SAElementIdentifying *)self->_associatedSystemApertureElementIdentity elementIdentifier];
    uint64_t v8 = [(SBSAElementIdentification *)v5 initWithClientIdentifier:v6 elementIdentifier:v7];
    v9 = (void *)*((void *)v4 + 16);
    *((void *)v4 + 16) = v8;
  }
  *(CGSize *)(v4 + 168) = self->_contentScale;
  CGSize size = self->_contentBounds.size;
  *((_OWORD *)v4 + 14) = self->_contentBounds.origin;
  *((CGSize *)v4 + 15) = size;
  *(CGPoint *)(v4 + 184) = self->_contentCenter;
  *((void *)v4 + 17) = self->_keyLineMode;
  uint64_t v11 = [(UIColor *)self->_keyLineTintColor copy];
  v12 = (void *)*((void *)v4 + 18);
  *((void *)v4 + 18) = v11;

  *((void *)v4 + 19) = self->_sampledBackgroundLuminanceLevel;
  *((void *)v4 + 20) = self->_shadowStyle;
  uint64_t v13 = *(void *)&self->_renderingConfiguration.alwaysRenderInSnapshots;
  *(_OWORD *)(v4 + 200) = *(_OWORD *)&self->_renderingConfiguration.renderingStyle;
  *((void *)v4 + 27) = v13;
  return v4;
}

+ (Class)mutatorClass
{
  return (Class)objc_opt_class();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyLineTintColor, 0);
  objc_storeStrong((id *)&self->_associatedSystemApertureElementIdentity, 0);
}

- (void)_setShadowStyle:(int64_t)a3
{
  self->_shadowStyle = a3;
}

void __69__SBSAContainerViewDescription_copyByPixelAligningGeometryWithScale___block_invoke(uint64_t a1, void *a2)
{
  id v13 = a2;
  if (v13)
  {
    v3 = self;
    id v4 = v13;
    if (v3)
    {
      if (objc_opt_isKindOfClass()) {
        v5 = v4;
      }
      else {
        v5 = 0;
      }
    }
    else
    {
      v5 = 0;
    }
    id v6 = v5;

    if (v6) {
      goto LABEL_10;
    }
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    Class v10 = NSClassFromString(&cfstr_Sbsacontainerv.isa);
    uint64_t v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    [v7 handleFailureInMethod:v8, v9, @"SBSAContainerViewDescription.m", 41, @"Unexpected class – expected '%@', got '%@'", v10, v12 object file lineNumber description];
  }
  id v6 = 0;
LABEL_10:

  [*(id *)(a1 + 32) contentBounds];
  [*(id *)(a1 + 32) contentCenter];
  SBUnintegralizedRectCenteredAboutPoint();
  UIRectRoundToScale();
  BSRectWithSize();
  objc_msgSend(v6, "setContentBounds:");
  UIRectGetCenter();
  objc_msgSend(v6, "setContentCenter:");
}

- (void)_setContentCenter:(CGPoint)a3
{
  self->_contentCenter = a3;
}

- (void)_setContentBounds:(CGRect)a3
{
  self->_contentBounds = a3;
}

- (void)_setKeyLineMode:(int64_t)a3
{
  self->_keyLineMode = a3;
}

- (UIColor)keyLineTintColor
{
  return self->_keyLineTintColor;
}

- (void)_setRenderingConfiguration:(SBSystemApertureContainerRenderingConfiguration *)a3
{
  uint64_t v3 = *(void *)&a3->alwaysRenderInSnapshots;
  *(_OWORD *)&self->_renderingConfiguration.renderingStyle = *(_OWORD *)&a3->renderingStyle;
  *(void *)&self->_renderingConfiguration.alwaysRenderInSnapshots = v3;
}

- (CGPoint)contentCenter
{
  double x = self->_contentCenter.x;
  double y = self->_contentCenter.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGRect)contentBounds
{
  double x = self->_contentBounds.origin.x;
  double y = self->_contentBounds.origin.y;
  double width = self->_contentBounds.size.width;
  double height = self->_contentBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)_setSampledBackgroundLuminanceLevel:(int64_t)a3
{
  self->_sampledBackgroundLuminanceLevel = a3;
}

- (void)_setKeyLineTintColor:(id)a3
{
}

- (int64_t)shadowStyle
{
  return self->_shadowStyle;
}

- (int64_t)keyLineMode
{
  return self->_keyLineMode;
}

- (CGSize)contentScale
{
  double width = self->_contentScale.width;
  double height = self->_contentScale.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (SBSystemApertureContainerRenderingConfiguration)renderingConfiguration
{
  *retstr = *(SBSystemApertureContainerRenderingConfiguration *)((char *)self + 200);
  return self;
}

- (void)_setContentScale:(CGSize)a3
{
  self->_contentScale = a3;
}

- (SAElementIdentifying)associatedSystemApertureElementIdentity
{
  return self->_associatedSystemApertureElementIdentity;
}

- (int64_t)sampledBackgroundLuminanceLevel
{
  return self->_sampledBackgroundLuminanceLevel;
}

- (id)copyByPixelAligningGeometryWithScale:(double)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SBSAContainerViewDescription;
  id v6 = -[SBSAViewDescription copyByPixelAligningGeometryWithScale:](&v10, sel_copyByPixelAligningGeometryWithScale_);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __69__SBSAContainerViewDescription_copyByPixelAligningGeometryWithScale___block_invoke;
  v9[3] = &unk_1E6AF8AB0;
  v9[4] = self;
  v9[5] = a2;
  *(double *)&v9[6] = a3;
  v7 = (void *)[v6 copyWithBlock:v9];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v30 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __40__SBSAContainerViewDescription_isEqual___block_invoke;
  v49[3] = &unk_1E6AF5420;
  id v50 = v4;
  v51 = self;
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __40__SBSAContainerViewDescription_isEqual___block_invoke_2;
  v47[3] = &unk_1E6AF5420;
  v47[4] = self;
  id v5 = v50;
  id v48 = v5;
  v29 = (void *)MEMORY[0x1D948C7A0](v47);
  v28 = objc_msgSend(v30, "appendEqualsBlocks:", v49, v29, 0);
  associatedSystemApertureElementIdentitdouble y = self->_associatedSystemApertureElementIdentity;
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __40__SBSAContainerViewDescription_isEqual___block_invoke_3;
  v45[3] = &unk_1E6AF9E90;
  id v7 = v5;
  id v46 = v7;
  v27 = [v28 appendObject:associatedSystemApertureElementIdentity counterpart:v45];
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __40__SBSAContainerViewDescription_isEqual___block_invoke_4;
  v43[3] = &unk_1E6B07480;
  id v8 = v7;
  id v44 = v8;
  uint64_t v9 = objc_msgSend(v27, "appendCGSize:counterpart:", v43, self->_contentScale.width, self->_contentScale.height);
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __40__SBSAContainerViewDescription_isEqual___block_invoke_5;
  v41[3] = &unk_1E6AFBC10;
  id v10 = v8;
  id v42 = v10;
  uint64_t v11 = objc_msgSend(v9, "appendCGRect:counterpart:", v41, self->_contentBounds.origin.x, self->_contentBounds.origin.y, self->_contentBounds.size.width, self->_contentBounds.size.height);
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __40__SBSAContainerViewDescription_isEqual___block_invoke_6;
  v39[3] = &unk_1E6AF5448;
  id v12 = v10;
  id v40 = v12;
  id v13 = objc_msgSend(v11, "appendCGPoint:counterpart:", v39, self->_contentCenter.x, self->_contentCenter.y);
  int64_t keyLineMode = self->_keyLineMode;
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __40__SBSAContainerViewDescription_isEqual___block_invoke_7;
  v37[3] = &unk_1E6AF9660;
  id v15 = v12;
  id v38 = v15;
  v16 = [v13 appendInteger:keyLineMode counterpart:v37];
  keyLineTintColor = self->_keyLineTintColor;
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __40__SBSAContainerViewDescription_isEqual___block_invoke_8;
  v35[3] = &unk_1E6AF9E90;
  id v18 = v15;
  id v36 = v18;
  v19 = [v16 appendObject:keyLineTintColor counterpart:v35];
  int64_t sampledBackgroundLuminanceLevel = self->_sampledBackgroundLuminanceLevel;
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __40__SBSAContainerViewDescription_isEqual___block_invoke_9;
  v33[3] = &unk_1E6AF9660;
  id v21 = v18;
  id v34 = v21;
  v22 = [v19 appendInteger:sampledBackgroundLuminanceLevel counterpart:v33];
  int64_t shadowStyle = self->_shadowStyle;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __40__SBSAContainerViewDescription_isEqual___block_invoke_10;
  v31[3] = &unk_1E6AF9660;
  id v32 = v21;
  id v24 = v21;
  v25 = [v22 appendInteger:shadowStyle counterpart:v31];
  LOBYTE(shadowStyle) = [v25 isEqual];

  return shadowStyle;
}

id __40__SBSAContainerViewDescription_isEqual___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v3.receiver = *(id *)(a1 + 40);
  v3.super_class = (Class)SBSAContainerViewDescription;
  return objc_msgSendSuper2(&v3, sel_isEqual_, v1);
}

BOOL __40__SBSAContainerViewDescription_isEqual___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v1 = *(void **)(a1 + 40);
  if (v1) {
    [v1 renderingConfiguration];
  }
  else {
    memset(v7, 0, sizeof(v7));
  }
  long long v3 = *(_OWORD *)(v2 + 200);
  uint64_t v6 = *(void *)(v2 + 216);
  long long v5 = v3;
  return SBSystemApertureContainerRenderingConfigurationEqualToConfiguration((uint64_t)&v5, (uint64_t)v7);
}

uint64_t __40__SBSAContainerViewDescription_isEqual___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) associatedSystemApertureElementIdentity];
}

uint64_t __40__SBSAContainerViewDescription_isEqual___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) contentScale];
}

uint64_t __40__SBSAContainerViewDescription_isEqual___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) contentBounds];
}

uint64_t __40__SBSAContainerViewDescription_isEqual___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) contentCenter];
}

uint64_t __40__SBSAContainerViewDescription_isEqual___block_invoke_7(uint64_t a1)
{
  return [*(id *)(a1 + 32) keyLineMode];
}

uint64_t __40__SBSAContainerViewDescription_isEqual___block_invoke_8(uint64_t a1)
{
  return [*(id *)(a1 + 32) keyLineTintColor];
}

uint64_t __40__SBSAContainerViewDescription_isEqual___block_invoke_9(uint64_t a1)
{
  return [*(id *)(a1 + 32) sampledBackgroundLuminanceLevel];
}

uint64_t __40__SBSAContainerViewDescription_isEqual___block_invoke_10(uint64_t a1)
{
  return [*(id *)(a1 + 32) shadowStyle];
}

- (unint64_t)hash
{
  v17 = [MEMORY[0x1E4F4F758] builder];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __36__SBSAContainerViewDescription_hash__block_invoke;
  v18[3] = &unk_1E6AF5470;
  v18[4] = self;
  v16 = objc_msgSend(v17, "appendHashingBlocks:", v18, 0);
  id v15 = [v16 appendObject:self->_associatedSystemApertureElementIdentity];
  long long v3 = objc_msgSend(v15, "appendCGSize:", self->_contentScale.width, self->_contentScale.height);
  id v4 = objc_msgSend(v3, "appendCGRect:", self->_contentBounds.origin.x, self->_contentBounds.origin.y, self->_contentBounds.size.width, self->_contentBounds.size.height);
  long long v5 = objc_msgSend(v4, "appendCGPoint:", self->_contentCenter.x, self->_contentCenter.y);
  uint64_t v6 = [v5 appendInteger:self->_keyLineMode];
  id v7 = [v6 appendObject:self->_keyLineTintColor];
  id v8 = [v7 appendInteger:self->_sampledBackgroundLuminanceLevel];
  uint64_t v9 = [v8 appendInteger:self->_shadowStyle];
  p_renderingConfiguration = &self->_renderingConfiguration;
  uint64_t v11 = [v9 appendInteger:self->_renderingConfiguration.renderingStyle];
  id v12 = [v11 appendInteger:p_renderingConfiguration->cloningStyle];
  unint64_t v13 = [v12 hash];

  return v13;
}

id __36__SBSAContainerViewDescription_hash__block_invoke(uint64_t a1)
{
  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)SBSAContainerViewDescription;
  return objc_msgSendSuper2(&v2, sel_hash);
}

- (NSString)description
{
  v18.receiver = self;
  v18.super_class = (Class)SBSAContainerViewDescription;
  long long v3 = [(SBSAViewDescription *)&v18 description];
  id v4 = (void *)[v3 mutableCopy];

  v16 = NSString;
  id v15 = SAElementIdentityDescription();
  long long v5 = NSStringFromCGSize(self->_contentScale);
  uint64_t v6 = NSStringFromCGRect(self->_contentBounds);
  id v7 = NSStringFromCGPoint(self->_contentCenter);
  id v8 = SBStringFromSystemApertureKeyLineMode(self->_keyLineMode);
  uint64_t v9 = [(UIColor *)self->_keyLineTintColor description];
  id v10 = SBStringFromSystemApertureBackgroundLuminanceLevel(self->_sampledBackgroundLuminanceLevel);
  uint64_t v11 = SBStringFromSystemApertureShadowStyle(self->_shadowStyle);
  SBSystemApertureContainerRenderingConfiguration renderingConfiguration = self->_renderingConfiguration;
  id v12 = SBStringFromSystemApertureContainerRenderingConfiguration(&renderingConfiguration);
  objc_msgSend(v16, "stringWithFormat:", @"; associatedSystemApertureElementID: %@; contentScale: %@; contentBounds: %@; contentCenter: %@; keyLineMode: %@; keyLineTintColor: %@; sampledBackgroundLuminanceLevel: %@; shadowStyle: %@, renderingConfiguration: %@",
    v15,
    v5,
    v6,
    v7,
    v8,
    v9,
    v10,
    v11,
  unint64_t v13 = v12);
  objc_msgSend(v4, "insertString:atIndex:", v13, objc_msgSend(v4, "rangeOfString:options:", @">", 4));

  return (NSString *)v4;
}

- (void)_setAssociatedSystemApertureElementIdentity:(id)a3
{
}

@end