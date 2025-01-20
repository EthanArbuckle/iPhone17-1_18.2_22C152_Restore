@interface SBSABackgroundBlurDescription
+ (Class)mutatorClass;
+ (id)instanceWithBlock:(id)a3;
- (BOOL)isBlurHidden;
- (BOOL)isEqual:(id)a3;
- (CGRect)blurFrame;
- (NSString)description;
- (NSUUID)interfaceElementIdentifier;
- (id)copyBySettingBlurFrame:(CGRect)a3;
- (id)copyBySettingBlurHidden:(BOOL)a3;
- (id)copyWithBlock:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)_setBlurFrame:(CGRect)a3;
- (void)_setBlurHidden:(BOOL)a3;
@end

@implementation SBSABackgroundBlurDescription

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_alloc_init((Class)objc_opt_class());
  *((unsigned char *)result + 8) = self->_blurHidden;
  CGSize size = self->_blurFrame.size;
  *((_OWORD *)result + 1) = self->_blurFrame.origin;
  *((CGSize *)result + 2) = size;
  return result;
}

- (NSUUID)interfaceElementIdentifier
{
  if (interfaceElementIdentifier___onceToken != -1) {
    dispatch_once(&interfaceElementIdentifier___onceToken, &__block_literal_global_420);
  }
  v2 = (void *)interfaceElementIdentifier___backgroundBlurInterfaceElementUUID;
  return (NSUUID *)v2;
}

- (BOOL)isBlurHidden
{
  return self->_blurHidden;
}

- (CGRect)blurFrame
{
  double x = self->_blurFrame.origin.x;
  double y = self->_blurFrame.origin.y;
  double width = self->_blurFrame.size.width;
  double height = self->_blurFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (id)copyBySettingBlurFrame:(CGRect)a3
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __56__SBSABackgroundBlurDescription_copyBySettingBlurFrame___block_invoke;
  v4[3] = &__block_descriptor_64_e46_v16__0__SBSABackgroundBlurDescriptionMutator_8l;
  CGRect v5 = a3;
  return [(SBSABackgroundBlurDescription *)self copyWithBlock:v4];
}

- (id)copyBySettingBlurHidden:(BOOL)a3
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __57__SBSABackgroundBlurDescription_copyBySettingBlurHidden___block_invoke;
  v4[3] = &__block_descriptor_33_e46_v16__0__SBSABackgroundBlurDescriptionMutator_8l;
  BOOL v5 = a3;
  return [(SBSABackgroundBlurDescription *)self copyWithBlock:v4];
}

- (id)copyWithBlock:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  BOOL v5 = (void *)[(SBSABackgroundBlurDescription *)self copy];
  if (v4)
  {
    v6 = objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "mutatorClass")), "initWithBackgroundBlurDescription:", v5);
    v4[2](v4, v6);
  }
  return v5;
}

+ (Class)mutatorClass
{
  return (Class)objc_opt_class();
}

uint64_t __57__SBSABackgroundBlurDescription_copyBySettingBlurHidden___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setBlurHidden:*(unsigned __int8 *)(a1 + 32)];
}

uint64_t __56__SBSABackgroundBlurDescription_copyBySettingBlurFrame___block_invoke(double *a1, void *a2)
{
  return objc_msgSend(a2, "setBlurFrame:", a1[4], a1[5], a1[6], a1[7]);
}

- (void)_setBlurHidden:(BOOL)a3
{
  self->_blurHidden = a3;
}

- (void)_setBlurFrame:(CGRect)a3
{
  self->_blurFrame = a3;
}

void __59__SBSABackgroundBlurDescription_interfaceElementIdentifier__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F29128] UUID];
  v1 = (void *)interfaceElementIdentifier___backgroundBlurInterfaceElementUUID;
  interfaceElementIdentifier___backgroundBlurInterfaceElementUUID = v0;
}

+ (id)instanceWithBlock:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)objc_opt_class());
  BOOL v5 = (void *)[v4 copyWithBlock:v3];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  BOOL blurHidden = self->_blurHidden;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __41__SBSABackgroundBlurDescription_isEqual___block_invoke;
  v22[3] = &unk_1E6AF99E8;
  id v7 = v4;
  id v23 = v7;
  v8 = [v5 appendBool:blurHidden counterpart:v22];
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  v19 = __41__SBSABackgroundBlurDescription_isEqual___block_invoke_2;
  v20 = &unk_1E6AFBC10;
  id v21 = v7;
  double x = self->_blurFrame.origin.x;
  double y = self->_blurFrame.origin.y;
  double width = self->_blurFrame.size.width;
  double height = self->_blurFrame.size.height;
  id v13 = v7;
  v14 = objc_msgSend(v8, "appendCGRect:counterpart:", &v17, x, y, width, height);
  char v15 = objc_msgSend(v14, "isEqual", v17, v18, v19, v20);

  return v15;
}

uint64_t __41__SBSABackgroundBlurDescription_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) isBlurHidden];
}

uint64_t __41__SBSABackgroundBlurDescription_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) blurFrame];
}

- (unint64_t)hash
{
  id v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = [v3 appendBool:self->_blurHidden];
  BOOL v5 = objc_msgSend(v4, "appendCGRect:", self->_blurFrame.origin.x, self->_blurFrame.origin.y, self->_blurFrame.size.width, self->_blurFrame.size.height);
  unint64_t v6 = [v5 hash];

  return v6;
}

- (NSString)description
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  BOOL v5 = NSStringFromBOOL();
  unint64_t v6 = NSStringFromCGRect(self->_blurFrame);
  id v7 = [v3 stringWithFormat:@"<%@: %p; blurHidden: %@; blurFrame: %@>", v4, self, v5, v6];

  return (NSString *)v7;
}

@end