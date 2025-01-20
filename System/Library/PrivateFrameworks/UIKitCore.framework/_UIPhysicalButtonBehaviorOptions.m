@interface _UIPhysicalButtonBehaviorOptions
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
+ (id)behaviorOptions;
- (BOOL)isEqual:(id)a3;
- (NSString)debugDescription;
- (_UIPhysicalButtonBehaviorOptions)init;
- (_UIPhysicalButtonBehaviorOptions)initWithBSXPCCoder:(id)a3;
- (_UIPhysicalButtonBehaviorOptions)initWithCoder:(id)a3;
- (_UIPhysicalButtonBehaviorOptions)initWithXPCDictionary:(id)a3;
- (id)_initWithBehavior:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescriptionWithMultilinePrefix:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)_behavior;
- (unint64_t)hash;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithXPCDictionary:(id)a3;
@end

@implementation _UIPhysicalButtonBehaviorOptions

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (unint64_t)_behavior
{
  return self->_behavior;
}

- (id)_initWithBehavior:(unint64_t)a3
{
  if (a3 >= 3)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"_UIPhysicalButton.m", 303, @"Invalid behavior: %lu", a3);
  }
  v6 = (objc_class *)objc_opt_class();
  if (v6 != _UIPhysicalButtonBehaviorOptionsClassForBehavior(a3))
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v10 = NSStringFromClass(v6);
    v11 = (void *)v10;
    if (a3 > 2) {
      v12 = &stru_1ED0E84C0;
    }
    else {
      v12 = off_1E52DB198[a3];
    }
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"_UIPhysicalButton.m", 307, @"Invalid behavior options class for button behavior: class: %@; behavior: %@",
      v10,
      v12);
  }
  v13.receiver = self;
  v13.super_class = (Class)_UIPhysicalButtonBehaviorOptions;
  id result = [(_UIPhysicalButtonBehaviorOptions *)&v13 init];
  if (result) {
    *((void *)result + 1) = a3;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  if (!a3 || !_NSIsNSObject()) {
    return 0;
  }
  v5 = a3;
  uint64_t v6 = objc_opt_class();
  BOOL v8 = v6 == objc_opt_class()
    && (unint64_t v7 = -[_UIPhysicalButtonBehaviorOptions hash](self, "hash"), v7 == [v5 hash])
    && self->_behavior == v5[1];

  return v8;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (id)[v3 appendUnsignedInteger:self->_behavior];
  unint64_t v5 = [v3 hash];

  return v5;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4 = [NSNumber numberWithUnsignedInteger:self->_behavior];
  [a3 encodeObject:v4 forKey:@"behavior"];
}

- (_UIPhysicalButtonBehaviorOptions)initWithBSXPCCoder:(id)a3
{
  uint64_t v6 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"behavior"];
  if (v6)
  {
    v11.receiver = self;
    v11.super_class = (Class)_UIPhysicalButtonBehaviorOptions;
    unint64_t v7 = [(_UIPhysicalButtonBehaviorOptions *)&v11 init];
    if (v7) {
      v7->_behavior = [v6 unsignedIntegerValue];
    }
    self = v7;
    BOOL v8 = self;
  }
  else
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"_UIPhysicalButton.m", 438, @"Invalid encoded behavior options: %@", a3 object file lineNumber description];

    BOOL v8 = 0;
  }

  return v8;
}

+ (id)behaviorOptions
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2, a1, @"_UIPhysicalButton.m", 292, @"%s: behaviorOptions is not allowed on %@", "+[_UIPhysicalButtonBehaviorOptions behaviorOptions]", objc_opt_class() object file lineNumber description];

  return 0;
}

- (_UIPhysicalButtonBehaviorOptions)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"_UIPhysicalButton.m", 297, @"%s: init is not allowed on %@", "-[_UIPhysicalButtonBehaviorOptions init]", objc_opt_class() object file lineNumber description];

  return 0;
}

- (NSString)debugDescription
{
  return (NSString *)[(_UIPhysicalButtonBehaviorOptions *)self debugDescriptionWithMultilinePrefix:&stru_1ED0E84C0];
}

- (id)succinctDescription
{
  v2 = [(_UIPhysicalButtonBehaviorOptions *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = v3;
  unint64_t behavior = self->_behavior;
  if (behavior > 2) {
    uint64_t v6 = &stru_1ED0E84C0;
  }
  else {
    uint64_t v6 = off_1E52DB198[behavior];
  }
  [v3 appendString:v6 withName:@"behavior"];
  return v4;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(_UIPhysicalButtonBehaviorOptions *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  v3 = [(_UIPhysicalButtonBehaviorOptions *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  unint64_t v5 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  [v5 setActiveMultilinePrefix:a3];
  unint64_t behavior = self->_behavior;
  if (behavior > 2) {
    unint64_t v7 = &stru_1ED0E84C0;
  }
  else {
    unint64_t v7 = off_1E52DB198[behavior];
  }
  [v5 appendString:v7 withName:@"behavior"];
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [_UIPhysicalButtonBehaviorOptions alloc];
  unint64_t behavior = self->_behavior;
  return [(_UIPhysicalButtonBehaviorOptions *)v4 _initWithBehavior:behavior];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = [NSNumber numberWithUnsignedInteger:self->_behavior];
  [a3 encodeObject:v4 forKey:@"behavior"];
}

- (_UIPhysicalButtonBehaviorOptions)initWithCoder:(id)a3
{
  uint64_t v6 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"behavior"];
  if (v6)
  {
    v11.receiver = self;
    v11.super_class = (Class)_UIPhysicalButtonBehaviorOptions;
    unint64_t v7 = [(_UIPhysicalButtonBehaviorOptions *)&v11 init];
    if (v7) {
      v7->_unint64_t behavior = [v6 unsignedIntegerValue];
    }
    self = v7;
    BOOL v8 = self;
  }
  else
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"_UIPhysicalButton.m", 395, @"Invalid encoded behavior options: %@", a3 object file lineNumber description];

    BOOL v8 = 0;
  }

  return v8;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  unint64_t v5 = (const char *)[@"behavior" UTF8String];
  uint64_t behavior = self->_behavior;
  xpc_dictionary_set_uint64(a3, v5, behavior);
}

- (_UIPhysicalButtonBehaviorOptions)initWithXPCDictionary:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UIPhysicalButtonBehaviorOptions;
  id v4 = [(_UIPhysicalButtonBehaviorOptions *)&v6 init];
  if (v4) {
    v4->_uint64_t behavior = xpc_dictionary_get_uint64(a3, (const char *)[@"behavior" UTF8String]);
  }
  return v4;
}

@end