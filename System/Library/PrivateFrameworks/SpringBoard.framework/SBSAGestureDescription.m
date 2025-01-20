@interface SBSAGestureDescription
+ (Class)mutatorClass;
+ (id)instanceWithBlock:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSUUID)associatedInterfaceElementIdentifier;
- (NSUUID)gestureIdentifier;
- (SBSAGestureDescription)initWithGestureDescription:(id)a3;
- (id)copyWithBlock:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)gestureRecognizerState;
- (unint64_t)hash;
- (void)_setAssociatedInterfaceElementIdentifier:(id)a3;
- (void)_setGestureIdentifier:(id)a3;
- (void)_setGestureRecognizerState:(int64_t)a3;
@end

@implementation SBSAGestureDescription

- (SBSAGestureDescription)initWithGestureDescription:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBSAGestureDescription;
  v5 = [(SBSAGestureDescription *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 gestureIdentifier];
    gestureIdentifier = v5->_gestureIdentifier;
    v5->_gestureIdentifier = (NSUUID *)v6;

    uint64_t v8 = [v4 associatedInterfaceElementIdentifier];
    associatedInterfaceElementIdentifier = v5->_associatedInterfaceElementIdentifier;
    v5->_associatedInterfaceElementIdentifier = (NSUUID *)v8;

    v5->_gestureRecognizerState = [v4 gestureRecognizerState];
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  gestureIdentifier = self->_gestureIdentifier;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __34__SBSAGestureDescription_isEqual___block_invoke;
  v21[3] = &unk_1E6AF9E90;
  id v7 = v4;
  id v22 = v7;
  uint64_t v8 = [v5 appendObject:gestureIdentifier counterpart:v21];
  associatedInterfaceElementIdentifier = self->_associatedInterfaceElementIdentifier;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __34__SBSAGestureDescription_isEqual___block_invoke_2;
  v19[3] = &unk_1E6AF9E90;
  id v10 = v7;
  id v20 = v10;
  objc_super v11 = [v8 appendObject:associatedInterfaceElementIdentifier counterpart:v19];
  int64_t gestureRecognizerState = self->_gestureRecognizerState;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __34__SBSAGestureDescription_isEqual___block_invoke_3;
  v17[3] = &unk_1E6AF9660;
  id v18 = v10;
  id v13 = v10;
  v14 = [v11 appendInteger:gestureRecognizerState counterpart:v17];
  char v15 = [v14 isEqual];

  return v15;
}

uint64_t __34__SBSAGestureDescription_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) gestureIdentifier];
}

uint64_t __34__SBSAGestureDescription_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) associatedInterfaceElementIdentifier];
}

uint64_t __34__SBSAGestureDescription_isEqual___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) gestureRecognizerState];
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = [v3 appendObject:self->_gestureIdentifier];
  v5 = [v4 appendObject:self->_associatedInterfaceElementIdentifier];
  uint64_t v6 = [v5 appendInteger:self->_gestureRecognizerState];
  unint64_t v7 = [v6 hash];

  return v7;
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  unint64_t gestureRecognizerState = self->_gestureRecognizerState;
  if (gestureRecognizerState > 5) {
    uint64_t v6 = @"[Invalid]";
  }
  else {
    uint64_t v6 = off_1E6B04BA0[gestureRecognizerState];
  }
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; gestureIdentifier: %@; associatedInterfaceElementIdentifier: %@; gestureRecognizerState: %@>",
                       v4,
                       self,
                       self->_gestureIdentifier,
                       self->_associatedInterfaceElementIdentifier,
                       v6);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  return (id)[v4 initWithGestureDescription:self];
}

+ (id)instanceWithBlock:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = (void *)[v4 copyWithBlock:v3];

  return v5;
}

+ (Class)mutatorClass
{
  return (Class)objc_opt_class();
}

- (id)copyWithBlock:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  v5 = (void *)[(SBSAGestureDescription *)self copy];
  if (v4)
  {
    uint64_t v6 = objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "mutatorClass")), "initWithGestureDescription:", v5);
    v4[2](v4, v6);
  }
  return v5;
}

- (NSUUID)gestureIdentifier
{
  return self->_gestureIdentifier;
}

- (void)_setGestureIdentifier:(id)a3
{
}

- (NSUUID)associatedInterfaceElementIdentifier
{
  return self->_associatedInterfaceElementIdentifier;
}

- (void)_setAssociatedInterfaceElementIdentifier:(id)a3
{
}

- (int64_t)gestureRecognizerState
{
  return self->_gestureRecognizerState;
}

- (void)_setGestureRecognizerState:(int64_t)a3
{
  self->_unint64_t gestureRecognizerState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associatedInterfaceElementIdentifier, 0);
  objc_storeStrong((id *)&self->_gestureIdentifier, 0);
}

@end