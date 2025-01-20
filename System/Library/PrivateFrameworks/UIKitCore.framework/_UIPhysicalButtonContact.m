@interface _UIPhysicalButtonContact
- (BOOL)isTouching;
- (CGPoint)position;
- (CGPoint)positionDelta;
- (NSString)debugDescription;
- (NSString)description;
- (_UIPhysicalButtonContact)init;
- (double)touchMajorRadius;
- (double)touchMinorRadius;
- (id)_init;
- (id)debugDescriptionWithMultilinePrefix:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (uint64_t)_appendProemDescriptionSansSelfToFormatter:(uint64_t)result;
- (unint64_t)touchPositionHints;
- (void)_appendDebugBodyDescriptionToFormatter:(uint64_t)a1;
- (void)appendDescriptionToFormatter:(id)a3;
@end

@implementation _UIPhysicalButtonContact

- (_UIPhysicalButtonContact)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"_UIPhysicalButtonContact.m", 29, @"%s: init is not allowed on %@", "-[_UIPhysicalButtonContact init]", objc_opt_class() object file lineNumber description];

  return 0;
}

- (id)_init
{
  if (result)
  {
    v1.receiver = result;
    v1.super_class = (Class)_UIPhysicalButtonContact;
    return objc_msgSendSuper2(&v1, sel_init);
  }
  return result;
}

- (uint64_t)_appendProemDescriptionSansSelfToFormatter:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    id v4 = (id)[a2 appendBool:*(unsigned __int8 *)(result + 8) withName:@"isTouching"];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __71___UIPhysicalButtonContact__appendProemDescriptionSansSelfToFormatter___block_invoke;
    v6[3] = &unk_1E52E0750;
    v6[4] = v3;
    [a2 appendCustomFormatWithName:@"position" block:v6];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __71___UIPhysicalButtonContact__appendProemDescriptionSansSelfToFormatter___block_invoke_2;
    v5[3] = &unk_1E52E0750;
    v5[4] = v3;
    return [a2 appendCustomFormatWithName:@"positionDelta" block:v5];
  }
  return result;
}

- (void)_appendDebugBodyDescriptionToFormatter:(uint64_t)a1
{
  if (a1)
  {
    id v4 = (id)[a2 appendBool:*(unsigned __int8 *)(a1 + 8) withName:@"isTouching"];
    id v5 = (id)[a2 appendFloat:@"touchMajorRadius" withName:1 decimalPrecision:*(double *)(a1 + 16)];
    id v6 = (id)[a2 appendFloat:@"touchMinorRadius" withName:1 decimalPrecision:*(double *)(a1 + 24)];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __67___UIPhysicalButtonContact__appendDebugBodyDescriptionToFormatter___block_invoke;
    v10[3] = &unk_1E52E0750;
    v10[4] = a1;
    [a2 appendCustomFormatWithName:@"position" block:v10];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __67___UIPhysicalButtonContact__appendDebugBodyDescriptionToFormatter___block_invoke_2;
    v9[3] = &unk_1E52E0750;
    v9[4] = a1;
    [a2 appendCustomFormatWithName:@"positionDelta" block:v9];
    v7 = _NSStringFromUITouchSenstiveButtonPositionHint(*(void *)(a1 + 32));
    id v8 = (id)[a2 appendObject:v7 withName:@"touchPositionHints"];
  }
}

- (void)appendDescriptionToFormatter:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __57___UIPhysicalButtonContact_appendDescriptionToFormatter___block_invoke;
  v3[3] = &unk_1E52D9F98;
  v3[4] = self;
  v3[5] = a3;
  [a3 appendProem:self block:v3];
}

- (id)succinctDescription
{
  v2 = [(_UIPhysicalButtonContact *)self succinctDescriptionBuilder];
  uint64_t v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  uint64_t v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  -[_UIPhysicalButtonContact _appendProemDescriptionSansSelfToFormatter:]((uint64_t)self, v3);
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  uint64_t v3 = [(_UIPhysicalButtonContact *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  uint64_t v3 = [(_UIPhysicalButtonContact *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v5 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  [v5 setActiveMultilinePrefix:a3];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __66___UIPhysicalButtonContact_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_1E52D9F98;
  id v6 = v5;
  id v11 = v6;
  v12 = self;
  id v7 = (id)[v6 modifyBody:v10];
  id v8 = v6;

  return v8;
}

- (NSString)description
{
  uint64_t v3 = objc_opt_new();
  [(_UIPhysicalButtonContact *)self appendDescriptionToFormatter:v3];
  id v4 = [v3 description];

  return (NSString *)v4;
}

- (NSString)debugDescription
{
  uint64_t v3 = objc_opt_new();
  id v4 = v3;
  if (self)
  {
    [v3 appendProem:self block:&__block_literal_global_224];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __60___UIPhysicalButtonContact__appendDebugDescriptionToStream___block_invoke_2;
    v7[3] = &unk_1E52D9F98;
    v7[4] = self;
    v7[5] = v4;
    [v4 appendBodySectionWithName:0 block:v7];
  }
  id v5 = [v4 description];

  return (NSString *)v5;
}

- (BOOL)isTouching
{
  return self->_touching;
}

- (double)touchMajorRadius
{
  return self->_touchMajorRadius;
}

- (double)touchMinorRadius
{
  return self->_touchMinorRadius;
}

- (CGPoint)position
{
  double x = self->_position.x;
  double y = self->_position.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGPoint)positionDelta
{
  double x = self->_positionDelta.x;
  double y = self->_positionDelta.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (unint64_t)touchPositionHints
{
  return self->_touchPositionHints;
}

@end