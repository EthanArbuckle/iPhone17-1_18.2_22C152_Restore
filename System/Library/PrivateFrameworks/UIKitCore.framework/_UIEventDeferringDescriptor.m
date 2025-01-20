@interface _UIEventDeferringDescriptor
- (BOOL)isEqual:(id)a3;
- (NSString)debugDescription;
- (_UIEventDeferringDescriptor)init;
- (id)_initWithScope:(char)a3 compatibility:(void *)a4 environment:(void *)a5 displayHardwareIdentifier:(void *)a6 predicateSceneIdentityString:(void *)a7 predicateWindowPointer:(int)a8 predicateContextID:(int)a9 targetPID:(void *)a10 targetSceneIdentityString:(void *)a11 targetWindowPointer:(int)a12 targetContextID:;
- (id)debugDescriptionWithMultilinePrefix:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)hash;
@end

@implementation _UIEventDeferringDescriptor

- (id)_initWithScope:(char)a3 compatibility:(void *)a4 environment:(void *)a5 displayHardwareIdentifier:(void *)a6 predicateSceneIdentityString:(void *)a7 predicateWindowPointer:(int)a8 predicateContextID:(int)a9 targetPID:(void *)a10 targetSceneIdentityString:(void *)a11 targetWindowPointer:(int)a12 targetContextID:
{
  if (!a1) {
    return 0;
  }
  v22.receiver = a1;
  v22.super_class = (Class)_UIEventDeferringDescriptor;
  v19 = (id *)objc_msgSendSuper2(&v22, sel_init);
  v20 = v19;
  if (v19)
  {
    v19[3] = a2;
    *((unsigned char *)v19 + 8) = a3;
    objc_storeStrong(v19 + 4, a4);
    objc_storeStrong(v20 + 5, a5);
    objc_storeStrong(v20 + 6, a6);
    v20[7] = a7;
    *((_DWORD *)v20 + 3) = a8;
    *((_DWORD *)v20 + 4) = a9;
    objc_storeStrong(v20 + 8, a10);
    v20[9] = a11;
    *((_DWORD *)v20 + 5) = a12;
  }
  return v20;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetSceneIdentityString, 0);
  objc_storeStrong((id *)&self->_predicateSceneIdentityString, 0);
  objc_storeStrong((id *)&self->_displayHardwareIdentifier, 0);
  objc_storeStrong((id *)&self->_environment, 0);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(_UIEventDeferringDescriptor *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v5 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  [v5 setActiveMultilinePrefix:a3];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __69___UIEventDeferringDescriptor_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_1E52D9F98;
  id v6 = v5;
  id v11 = v6;
  v12 = self;
  id v7 = (id)[v6 modifyBody:v10];
  id v8 = v6;

  return v8;
}

- (_UIEventDeferringDescriptor)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"_UIEventDeferringDescriptor.m" lineNumber:41 description:@"init is not allowed on _UIEventDeferringDescriptor"];

  return 0;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 != self)
  {
    v4 = (void **)a3;
    v5 = objc_opt_class();
    if (![v5 isEqual:objc_opt_class()]) {
      goto LABEL_26;
    }
    unint64_t v6 = [(_UIEventDeferringDescriptor *)self hash];
    if (v6 != [v4 hash]
      || (void *)self->_scope != v4[3]
      || self->_compatibility != *((unsigned __int8 *)v4 + 8))
    {
      goto LABEL_26;
    }
    id v7 = v4[4];
    id v8 = self->_environment;
    v9 = v7;
    if (v8 == v9)
    {
    }
    else
    {
      v10 = v9;
      if (!v8 || !v9) {
        goto LABEL_18;
      }
      int v11 = [(BKSHIDEventDeferringEnvironment *)v8 isEqual:v9];

      if (!v11) {
        goto LABEL_26;
      }
    }
    v13 = v4[5];
    id v8 = self->_displayHardwareIdentifier;
    v14 = v13;
    if (v8 == v14)
    {

LABEL_20:
      if (UIEqual(self->_predicateSceneIdentityString, v4[6])
        && self->_predicateContextID == *((_DWORD *)v4 + 3)
        && self->_predicateWindowPointer == v4[7]
        && self->_targetPID == *((_DWORD *)v4 + 4)
        && UIEqual(self->_targetSceneIdentityString, v4[8])
        && self->_targetWindowPointer == v4[9])
      {
        BOOL v12 = self->_targetContextID == *((_DWORD *)v4 + 5);
        goto LABEL_27;
      }
LABEL_26:
      BOOL v12 = 0;
LABEL_27:

      return v12;
    }
    v10 = v14;
    if (v8 && v14)
    {
      int v15 = [(BKSHIDEventDeferringEnvironment *)v8 isEqual:v14];

      if (!v15) {
        goto LABEL_26;
      }
      goto LABEL_20;
    }
LABEL_18:

    goto LABEL_26;
  }
  return 1;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (id)[v3 appendUnsignedInteger:self->_scope];
  id v5 = (id)[v3 appendBool:self->_compatibility];
  id v6 = (id)[v3 appendObject:self->_environment];
  id v7 = (id)[v3 appendString:self->_displayHardwareIdentifier];
  id v8 = (id)[v3 appendString:self->_predicateSceneIdentityString];
  id v9 = (id)[v3 appendPointer:self->_predicateWindowPointer];
  id v10 = (id)[v3 appendUnsignedInteger:self->_predicateContextID];
  id v11 = (id)[v3 appendUnsignedInteger:self->_targetPID];
  id v12 = (id)[v3 appendPointer:self->_targetWindowPointer];
  id v13 = (id)[v3 appendString:self->_targetSceneIdentityString];
  id v14 = (id)[v3 appendUnsignedInteger:self->_targetContextID];
  unint64_t v15 = [v3 hash];

  return v15;
}

- (NSString)debugDescription
{
  return (NSString *)[(_UIEventDeferringDescriptor *)self debugDescriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(_UIEventDeferringDescriptor *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)[v3 appendBool:self->_compatibility withName:@"compatibility"];
  id v5 = (id)[v3 appendObject:self->_environment withName:@"environment"];
  [v3 appendString:self->_displayHardwareIdentifier withName:@"displayIdentifier"];
  id v6 = (id)[v3 appendUnsignedInteger:self->_targetContextID withName:@"targetContextID" format:1];
  return v3;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  v3 = [(_UIEventDeferringDescriptor *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

@end