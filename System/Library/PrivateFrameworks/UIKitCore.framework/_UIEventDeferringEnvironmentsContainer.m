@interface _UIEventDeferringEnvironmentsContainer
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)debugDescription;
- (_UIEventDeferringEnvironmentsContainer)init;
- (_UIEventDeferringEnvironmentsContainer)initWithCoder:(id)a3;
- (_UIEventDeferringEnvironmentsContainer)initWithXPCDictionary:(id)a3;
- (id)debugDescriptionWithMultilinePrefix:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)hash;
- (void)_initWithEnvironments:(void *)a1;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithXPCDictionary:(id)a3;
- (void)environments;
@end

@implementation _UIEventDeferringEnvironmentsContainer

- (void).cxx_destruct
{
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  v4 = a3;
  v5 = objc_opt_class();
  if ([v5 isEqual:objc_opt_class()]
    && (unint64_t v6 = -[_UIEventDeferringEnvironmentsContainer hash](self, "hash"), v6 == [v4 hash]))
  {
    environments = self->_environments;
    if (environments == (NSSet *)v4[1]) {
      char v8 = 1;
    }
    else {
      char v8 = -[NSSet isEqual:](environments, "isEqual:");
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  uint64_t v5 = [@"_UIEventDeferringEnvironmentsContainerKey_Environments" UTF8String];
  environments = self->_environments;
  MEMORY[0x1F410C5C0](environments, a3, v5, &__block_literal_global_534);
}

- (_UIEventDeferringEnvironmentsContainer)initWithXPCDictionary:(id)a3
{
  [@"_UIEventDeferringEnvironmentsContainerKey_Environments" UTF8String];
  v4 = BSDeserializeSetOfBSXPCEncodableObjectsFromXPCDictionaryWithKey();
  uint64_t v5 = (_UIEventDeferringEnvironmentsContainer *)-[_UIEventDeferringEnvironmentsContainer _initWithEnvironments:](self, v4);

  return v5;
}

- (void)_initWithEnvironments:(void *)a1
{
  v2 = a1;
  if (a1)
  {
    if (!a2)
    {
      v7 = [MEMORY[0x1E4F28B00] currentHandler];
      [v7 handleFailureInMethod:sel__initWithEnvironments_, v2, @"_UIEventDeferringEnvironmentsContainer.m", 59, @"Invalid parameter not satisfying: %@", @"environments" object file lineNumber description];
    }
    v8.receiver = v2;
    v8.super_class = (Class)_UIEventDeferringEnvironmentsContainer;
    v2 = objc_msgSendSuper2(&v8, sel_init);
    if (v2)
    {
      uint64_t v4 = [a2 copy];
      uint64_t v5 = (void *)v2[1];
      v2[1] = v4;
    }
  }
  return v2;
}

- (_UIEventDeferringEnvironmentsContainer)init
{
  uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"_UIEventDeferringEnvironmentsContainer.m", 54, @"%s: init is not allowed on %@", "-[_UIEventDeferringEnvironmentsContainer init]", objc_opt_class() object file lineNumber description];

  return 0;
}

- (void)environments
{
  if (a1)
  {
    v2 = (void *)a1[1];
    if (v2) {
      a1 = v2;
    }
    else {
      a1 = objc_opt_new();
    }
    uint64_t v1 = vars8;
  }
  return a1;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (id)[v3 appendObject:self->_environments];
  unint64_t v5 = [v3 hash];

  return v5;
}

- (NSString)debugDescription
{
  return (NSString *)[(_UIEventDeferringEnvironmentsContainer *)self debugDescriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(_UIEventDeferringEnvironmentsContainer *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = _UIEventDeferringEnvironmentsContainerSetDescription(self->_environments);
  id v5 = (id)[v3 appendObject:v4 withName:@"environments"];

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(_UIEventDeferringEnvironmentsContainer *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  v3 = [(_UIEventDeferringEnvironmentsContainer *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v5 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  [v5 setActiveMultilinePrefix:a3];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __80___UIEventDeferringEnvironmentsContainer_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_1E52D9F98;
  id v6 = v5;
  id v11 = v6;
  v12 = self;
  id v7 = (id)[v6 modifyBody:v10];
  id v8 = v6;

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (_UIEventDeferringEnvironmentsContainer)initWithCoder:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)_UIEventDeferringEnvironmentsContainer;
  id v4 = [(_UIEventDeferringEnvironmentsContainer *)&v14 init];
  if (v4)
  {
    id v5 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v6 = objc_opt_class();
    id v7 = objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
    id v8 = [a3 decodeObjectOfClasses:v7 forKey:@"_UIEventDeferringEnvironmentsContainerKey_Environments"];

    v9 = (void *)[v8 copy];
    v10 = v9;
    if (v9) {
      id v11 = v9;
    }
    else {
      id v11 = (NSSet *)objc_opt_new();
    }
    environments = v4->_environments;
    v4->_environments = v11;
  }
  return v4;
}

@end