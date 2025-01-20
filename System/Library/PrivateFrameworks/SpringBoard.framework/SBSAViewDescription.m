@interface SBSAViewDescription
+ (Class)mutatorClass;
+ (id)instanceWithBlock:(id)a3;
- (BOOL)isEqual:(id)a3;
- (CGPoint)center;
- (CGRect)bounds;
- (CGRect)boundsVelocity;
- (CGSize)scale;
- (NSString)description;
- (NSUUID)interfaceElementIdentifier;
- (SBSAViewDescription)initWithViewDescription:(id)a3;
- (double)alpha;
- (double)cornerRadius;
- (id)copyByPixelAligningGeometryWithScale:(double)a3;
- (id)copyWithBlock:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)_setAlpha:(double)a3;
- (void)_setBounds:(CGRect)a3;
- (void)_setBoundsVelocity:(CGRect)a3;
- (void)_setCenter:(CGPoint)a3;
- (void)_setCornerRadius:(double)a3;
- (void)_setInterfaceElementIdentifier:(id)a3;
- (void)_setScale:(CGSize)a3;
@end

@implementation SBSAViewDescription

- (void).cxx_destruct
{
}

+ (id)instanceWithBlock:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = (void *)[v4 copyWithBlock:v3];

  return v5;
}

- (id)copyWithBlock:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  v5 = (void *)[(SBSAViewDescription *)self copy];
  if (v4)
  {
    v6 = objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "mutatorClass")), "initWithViewDescription:", v5);
    v4[2](v4, v6);
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  return (id)[v4 initWithViewDescription:self];
}

- (SBSAViewDescription)initWithViewDescription:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)SBSAViewDescription;
  v5 = [(SBSAViewDescription *)&v23 init];
  if (v5)
  {
    uint64_t v6 = [v4 interfaceElementIdentifier];
    interfaceElementIdentifier = v5->_interfaceElementIdentifier;
    v5->_interfaceElementIdentifier = (NSUUID *)v6;

    [v4 center];
    v5->_center.x = v8;
    v5->_center.y = v9;
    [v4 bounds];
    v5->_bounds.origin.x = v10;
    v5->_bounds.origin.y = v11;
    v5->_bounds.size.width = v12;
    v5->_bounds.size.height = v13;
    [v4 cornerRadius];
    v5->_cornerRadius = v14;
    [v4 alpha];
    v5->_alpha = v15;
    [v4 scale];
    v5->_scale.width = v16;
    v5->_scale.height = v17;
    [v4 boundsVelocity];
    v5->_boundsVelocity.origin.x = v18;
    v5->_boundsVelocity.origin.y = v19;
    v5->_boundsVelocity.size.width = v20;
    v5->_boundsVelocity.size.height = v21;
  }

  return v5;
}

- (NSUUID)interfaceElementIdentifier
{
  return self->_interfaceElementIdentifier;
}

- (CGRect)bounds
{
  double x = self->_bounds.origin.x;
  double y = self->_bounds.origin.y;
  double width = self->_bounds.size.width;
  double height = self->_bounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGPoint)center
{
  double x = self->_center.x;
  double y = self->_center.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (CGSize)scale
{
  double width = self->_scale.width;
  double height = self->_scale.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)alpha
{
  return self->_alpha;
}

- (CGRect)boundsVelocity
{
  double x = self->_boundsVelocity.origin.x;
  double y = self->_boundsVelocity.origin.y;
  double width = self->_boundsVelocity.size.width;
  double height = self->_boundsVelocity.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

+ (Class)mutatorClass
{
  return (Class)objc_opt_class();
}

- (void)_setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (void)_setAlpha:(double)a3
{
  self->_alpha = a3;
}

- (void)_setInterfaceElementIdentifier:(id)a3
{
}

void __60__SBSAViewDescription_copyByPixelAligningGeometryWithScale___block_invoke(uint64_t a1, void *a2)
{
  id v13 = a2;
  if (v13)
  {
    id v3 = self;
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
    Class v10 = NSClassFromString(&cfstr_Sbsaviewdescri.isa);
    CGFloat v11 = (objc_class *)objc_opt_class();
    CGFloat v12 = NSStringFromClass(v11);
    [v7 handleFailureInMethod:v8, v9, @"SBSAViewDescription.m", 64, @"Unexpected class – expected '%@', got '%@'", v10, v12 object file lineNumber description];
  }
  id v6 = 0;
LABEL_10:

  [*(id *)(a1 + 32) bounds];
  [*(id *)(a1 + 32) center];
  SBUnintegralizedRectCenteredAboutPoint();
  UIRectRoundToScale();
  BSRectWithSize();
  objc_msgSend(v6, "setBounds:");
  UIRectGetCenter();
  objc_msgSend(v6, "setCenter:");
}

- (void)_setCenter:(CGPoint)a3
{
  self->_center = a3;
}

- (void)_setBounds:(CGRect)a3
{
  self->_bounds = a3;
}

- (void)_setScale:(CGSize)a3
{
  self->_scale = a3;
}

- (void)_setBoundsVelocity:(CGRect)a3
{
  self->_boundsVelocitdouble y = a3;
}

- (id)copyByPixelAligningGeometryWithScale:(double)a3
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __60__SBSAViewDescription_copyByPixelAligningGeometryWithScale___block_invoke;
  v4[3] = &unk_1E6AF8AB0;
  v4[4] = self;
  v4[5] = a2;
  *(double *)&v4[6] = a3;
  return [(SBSAViewDescription *)self copyWithBlock:v4];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  interfaceElementIdentifier = self->_interfaceElementIdentifier;
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __31__SBSAViewDescription_isEqual___block_invoke;
  v43[3] = &unk_1E6AF9E90;
  id v7 = v4;
  id v44 = v7;
  uint64_t v8 = [v5 appendObject:interfaceElementIdentifier counterpart:v43];
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __31__SBSAViewDescription_isEqual___block_invoke_2;
  v41[3] = &unk_1E6AF5448;
  id v9 = v7;
  id v42 = v9;
  Class v10 = objc_msgSend(v8, "appendCGPoint:counterpart:", v41, self->_center.x, self->_center.y);
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __31__SBSAViewDescription_isEqual___block_invoke_3;
  v39[3] = &unk_1E6AFBC10;
  id v11 = v9;
  id v40 = v11;
  CGFloat v12 = objc_msgSend(v10, "appendCGRect:counterpart:", v39, self->_bounds.origin.x, self->_bounds.origin.y, self->_bounds.size.width, self->_bounds.size.height);
  double cornerRadius = self->_cornerRadius;
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __31__SBSAViewDescription_isEqual___block_invoke_4;
  v37[3] = &unk_1E6AFD028;
  id v14 = v11;
  id v38 = v14;
  double v15 = [v12 appendCGFloat:v37 counterpart:cornerRadius];
  double alpha = self->_alpha;
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __31__SBSAViewDescription_isEqual___block_invoke_5;
  v35[3] = &unk_1E6AFD028;
  id v17 = v14;
  id v36 = v17;
  CGFloat v18 = [v15 appendCGFloat:v35 counterpart:alpha];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __31__SBSAViewDescription_isEqual___block_invoke_6;
  v33[3] = &unk_1E6B07480;
  id v19 = v17;
  id v34 = v19;
  CGFloat v20 = objc_msgSend(v18, "appendCGSize:counterpart:", v33, self->_scale.width, self->_scale.height);
  uint64_t v28 = MEMORY[0x1E4F143A8];
  uint64_t v29 = 3221225472;
  v30 = __31__SBSAViewDescription_isEqual___block_invoke_7;
  v31 = &unk_1E6AFBC10;
  id v32 = v19;
  double x = self->_boundsVelocity.origin.x;
  double y = self->_boundsVelocity.origin.y;
  double width = self->_boundsVelocity.size.width;
  double height = self->_boundsVelocity.size.height;
  id v25 = v19;
  v26 = objc_msgSend(v20, "appendCGRect:counterpart:", &v28, x, y, width, height);
  LOBYTE(v19) = objc_msgSend(v26, "isEqual", v28, v29, v30, v31);

  return (char)v19;
}

uint64_t __31__SBSAViewDescription_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) interfaceElementIdentifier];
}

uint64_t __31__SBSAViewDescription_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) center];
}

uint64_t __31__SBSAViewDescription_isEqual___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) bounds];
}

uint64_t __31__SBSAViewDescription_isEqual___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) cornerRadius];
}

uint64_t __31__SBSAViewDescription_isEqual___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) alpha];
}

uint64_t __31__SBSAViewDescription_isEqual___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) scale];
}

uint64_t __31__SBSAViewDescription_isEqual___block_invoke_7(uint64_t a1)
{
  return [*(id *)(a1 + 32) boundsVelocity];
}

- (unint64_t)hash
{
  id v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = [v3 appendObject:self->_interfaceElementIdentifier];
  v5 = objc_msgSend(v4, "appendCGPoint:", self->_center.x, self->_center.y);
  id v6 = objc_msgSend(v5, "appendCGRect:", self->_bounds.origin.x, self->_bounds.origin.y, self->_bounds.size.width, self->_bounds.size.height);
  id v7 = [v6 appendCGFloat:self->_cornerRadius];
  uint64_t v8 = objc_msgSend(v7, "appendCGSize:", self->_scale.width, self->_scale.height);
  id v9 = objc_msgSend(v8, "appendCGRect:", self->_boundsVelocity.origin.x, self->_boundsVelocity.origin.y, self->_boundsVelocity.size.width, self->_boundsVelocity.size.height);
  unint64_t v10 = [v9 hash];

  return v10;
}

- (NSString)description
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  interfaceElementIdentifier = self->_interfaceElementIdentifier;
  id v6 = NSStringFromCGPoint(self->_center);
  id v7 = NSStringFromCGRect(self->_bounds);
  double cornerRadius = self->_cornerRadius;
  double alpha = self->_alpha;
  unint64_t v10 = NSStringFromCGSize(self->_scale);
  id v11 = NSStringFromCGRect(self->_boundsVelocity);
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; interfaceElementIdentifier: %@; center: %@; bounds: %@; cornerRadius: %f; alpha: %f; scale: %@; boundsVelocity: %@>",
    v4,
    self,
    interfaceElementIdentifier,
    v6,
    v7,
    *(void *)&cornerRadius,
    *(void *)&alpha,
    v10,
  CGFloat v12 = v11);

  return (NSString *)v12;
}

@end