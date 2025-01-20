@interface _UIEventDeferringRecord
- (BOOL)needsRecreation;
- (NSString)debugDescription;
- (_UIEventDeferringRecord)init;
- (id)_initWithDescriptor:(void *)a3 invalidationToken:(void *)a4 deferringToken:(uint64_t)a5 recordingManagerPointer:(void *)a6 recreationReasons:;
- (id)debugDescriptionWithMultilinePrefix:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (uint64_t)addRecreationReason:(uint64_t)result;
- (void)recreationReasons;
@end

@implementation _UIEventDeferringRecord

- (id)_initWithDescriptor:(void *)a3 invalidationToken:(void *)a4 deferringToken:(uint64_t)a5 recordingManagerPointer:(void *)a6 recreationReasons:
{
  if (!a1) {
    return 0;
  }
  v17.receiver = a1;
  v17.super_class = (Class)_UIEventDeferringRecord;
  id v11 = objc_msgSendSuper2(&v17, sel_init);
  if (v11)
  {
    uint64_t v12 = [a2 copy];
    v13 = (void *)*((void *)v11 + 2);
    *((void *)v11 + 2) = v12;

    objc_storeStrong((id *)v11 + 3, a3);
    objc_storeWeak((id *)v11 + 4, a4);
    *((void *)v11 + 5) = a5;
    uint64_t v14 = [a6 mutableCopy];
    v15 = (void *)*((void *)v11 + 1);
    *((void *)v11 + 1) = v14;
  }
  return v11;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_deferringToken);
  objc_storeStrong((id *)&self->_invalidationToken, 0);
  objc_storeStrong((id *)&self->_descriptor, 0);
  objc_storeStrong((id *)&self->_recreationReasons, 0);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(_UIEventDeferringRecord *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v5 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  [v5 setActiveMultilinePrefix:a3];
  id v6 = (id)[v5 appendBool:-[_UIEventDeferringRecord needsRecreation](self) withName:@"needsRecreation"];
  id v7 = (id)objc_msgSend(v5, "appendUnsignedInteger:withName:", -[NSMutableSet count](self->_recreationReasons, "count"), @"recreationReasons.count");
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __65___UIEventDeferringRecord_descriptionBuilderWithMultilinePrefix___block_invoke;
  v12[3] = &unk_1E52D9F98;
  id v8 = v5;
  id v13 = v8;
  uint64_t v14 = self;
  id v9 = (id)[v8 modifyBody:v12];
  id v10 = v8;

  return v10;
}

- (BOOL)needsRecreation
{
  if (!a1 || !a1[1]) {
    return 0;
  }
  v1 = -[_UIEventDeferringRecord recreationReasons](a1);
  BOOL v2 = [v1 count] != 0;

  return v2;
}

- (_UIEventDeferringRecord)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"_UIEventDeferringRecord.m", 56, @"%s: init is not allowed on _UIEventDeferringRecord", "-[_UIEventDeferringRecord init]");

  return 0;
}

- (uint64_t)addRecreationReason:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    v4 = *(void **)(result + 8);
    if (!v4)
    {
      uint64_t v5 = objc_opt_new();
      id v6 = *(void **)(v3 + 8);
      *(void *)(v3 + 8) = v5;

      v4 = *(void **)(v3 + 8);
    }
    if ([v4 containsObject:a2])
    {
      id v8 = [MEMORY[0x1E4F28B00] currentHandler];
      [v8 handleFailureInMethod:sel_addRecreationReason_, v3, @"_UIEventDeferringRecord.m", 84, @"%s: Invalid to mark a record as needing recreation for the same reason twice: %@", "-[_UIEventDeferringRecord addRecreationReason:]", v3 object file lineNumber description];
    }
    id v7 = *(void **)(v3 + 8);
    return [v7 addObject:a2];
  }
  return result;
}

- (void)recreationReasons
{
  if (a1)
  {
    BOOL v2 = (void *)a1[1];
    if (v2) {
      a1 = (void *)[v2 copy];
    }
    else {
      a1 = objc_opt_new();
    }
    uint64_t v1 = vars8;
  }
  return a1;
}

- (NSString)debugDescription
{
  return (NSString *)[(_UIEventDeferringRecord *)self debugDescriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  BOOL v2 = [(_UIEventDeferringRecord *)self succinctDescriptionBuilder];
  uint64_t v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  uint64_t v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)[v3 appendBool:-[_UIEventDeferringRecord needsRecreation](self) withName:@"needsRecreation"];
  id v5 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", -[NSMutableSet count](self->_recreationReasons, "count"), @"recreationReasons.count");
  id v6 = [(_UIEventDeferringDescriptor *)self->_descriptor succinctDescription];
  id v7 = (id)[v3 appendObject:v6 withName:@"descriptor"];

  id v8 = (id)[v3 appendObject:self->_invalidationToken withName:@"invalidationToken"];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_deferringToken);
  id v10 = [WeakRetained succinctDescription];
  id v11 = (id)[v3 appendObject:v10 withName:@"deferringToken"];

  id v12 = (id)[v3 appendPointer:self->_recordingManagerPointer withName:@"recordingManagerPointer"];
  return v3;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  uint64_t v3 = [(_UIEventDeferringRecord *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

@end