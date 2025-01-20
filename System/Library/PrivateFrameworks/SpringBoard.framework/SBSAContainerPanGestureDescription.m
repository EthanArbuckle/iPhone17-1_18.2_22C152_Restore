@interface SBSAContainerPanGestureDescription
+ (Class)mutatorClass;
- (BOOL)isEqual:(id)a3;
- (CGPoint)initialLocation;
- (CGPoint)translation;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)_setInitialLocation:(CGPoint)a3;
- (void)_setTranslation:(CGPoint)a3;
@end

@implementation SBSAContainerPanGestureDescription

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __46__SBSAContainerPanGestureDescription_isEqual___block_invoke;
  v20[3] = &unk_1E6AF5420;
  id v6 = v4;
  id v21 = v6;
  v22 = self;
  v7 = objc_msgSend(v5, "appendEqualsBlocks:", v20, 0);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __46__SBSAContainerPanGestureDescription_isEqual___block_invoke_2;
  v18[3] = &unk_1E6AF5448;
  id v8 = v6;
  id v19 = v8;
  v9 = objc_msgSend(v7, "appendCGPoint:counterpart:", v18, self->_initialLocation.x, self->_initialLocation.y);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __46__SBSAContainerPanGestureDescription_isEqual___block_invoke_3;
  v16[3] = &unk_1E6AF5448;
  id v17 = v8;
  double x = self->_translation.x;
  double y = self->_translation.y;
  id v12 = v8;
  v13 = objc_msgSend(v9, "appendCGPoint:counterpart:", v16, x, y);
  char v14 = [v13 isEqual];

  return v14;
}

id __46__SBSAContainerPanGestureDescription_isEqual___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v3.receiver = *(id *)(a1 + 40);
  v3.super_class = (Class)SBSAContainerPanGestureDescription;
  return objc_msgSendSuper2(&v3, sel_isEqual_, v1);
}

uint64_t __46__SBSAContainerPanGestureDescription_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) initialLocation];
}

uint64_t __46__SBSAContainerPanGestureDescription_isEqual___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) translation];
}

- (unint64_t)hash
{
  objc_super v3 = [MEMORY[0x1E4F4F758] builder];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __42__SBSAContainerPanGestureDescription_hash__block_invoke;
  v9[3] = &unk_1E6AF5470;
  v9[4] = self;
  id v4 = objc_msgSend(v3, "appendHashingBlocks:", v9, 0);
  v5 = objc_msgSend(v4, "appendCGPoint:", self->_initialLocation.x, self->_initialLocation.y);
  id v6 = objc_msgSend(v5, "appendCGPoint:", self->_translation.x, self->_translation.y);
  unint64_t v7 = [v6 hash];

  return v7;
}

id __42__SBSAContainerPanGestureDescription_hash__block_invoke(uint64_t a1)
{
  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)SBSAContainerPanGestureDescription;
  return objc_msgSendSuper2(&v2, sel_hash);
}

- (id)description
{
  v10.receiver = self;
  v10.super_class = (Class)SBSAContainerPanGestureDescription;
  objc_super v3 = [(SBSAGestureDescription *)&v10 description];
  id v4 = (void *)[v3 mutableCopy];

  v5 = NSString;
  id v6 = NSStringFromCGPoint(self->_initialLocation);
  unint64_t v7 = NSStringFromCGPoint(self->_translation);
  id v8 = [v5 stringWithFormat:@"; initialLocation: %@; translation: %@; ", v6, v7];

  objc_msgSend(v4, "insertString:atIndex:", v8, objc_msgSend(v4, "rangeOfString:options:", @">", 4));
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBSAContainerPanGestureDescription;
  id result = [(SBSAGestureDescription *)&v5 copyWithZone:a3];
  *((_OWORD *)result + 2) = self->_initialLocation;
  *((_OWORD *)result + 3) = self->_translation;
  return result;
}

+ (Class)mutatorClass
{
  return (Class)objc_opt_class();
}

- (CGPoint)initialLocation
{
  double x = self->_initialLocation.x;
  double y = self->_initialLocation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)_setInitialLocation:(CGPoint)a3
{
  self->_initialLocation = a3;
}

- (CGPoint)translation
{
  double x = self->_translation.x;
  double y = self->_translation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)_setTranslation:(CGPoint)a3
{
  self->_translation = a3;
}

@end