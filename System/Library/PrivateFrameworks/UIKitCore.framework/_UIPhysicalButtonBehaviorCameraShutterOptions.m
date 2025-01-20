@interface _UIPhysicalButtonBehaviorCameraShutterOptions
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
+ (id)behaviorOptions;
- (BOOL)isEqual:(id)a3;
- (_UIPhysicalButtonBehaviorCameraShutterOptions)init;
- (_UIPhysicalButtonBehaviorCameraShutterOptions)initWithBSXPCCoder:(id)a3;
- (_UIPhysicalButtonBehaviorCameraShutterOptions)initWithCoder:(id)a3;
- (_UIPhysicalButtonBehaviorCameraShutterOptions)initWithXPCDictionary:(id)a3;
- (id)_initWithBehavior:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)debugDescriptionWithMultilinePrefix:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)hash;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithXPCDictionary:(id)a3;
@end

@implementation _UIPhysicalButtonBehaviorCameraShutterOptions

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

+ (id)behaviorOptions
{
  id v2 = [[_UIPhysicalButtonBehaviorCameraShutterOptions alloc] _initWithBehavior:0];
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [_UIPhysicalButtonBehaviorCameraShutterOptions alloc];
  unint64_t v5 = [(_UIPhysicalButtonBehaviorOptions *)self _behavior];
  return [(_UIPhysicalButtonBehaviorCameraShutterOptions *)v4 _initWithBehavior:v5];
}

- (id)_initWithBehavior:(unint64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UIPhysicalButtonBehaviorCameraShutterOptions;
  return [(_UIPhysicalButtonBehaviorOptions *)&v4 _initWithBehavior:a3];
}

- (BOOL)isEqual:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UIPhysicalButtonBehaviorCameraShutterOptions;
  return [(_UIPhysicalButtonBehaviorOptions *)&v4 isEqual:a3];
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  v7.receiver = self;
  v7.super_class = (Class)_UIPhysicalButtonBehaviorCameraShutterOptions;
  id v4 = (id)objc_msgSend(v3, "appendUnsignedInteger:", -[_UIPhysicalButtonBehaviorOptions hash](&v7, sel_hash));
  unint64_t v5 = [v3 hash];

  return v5;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)_UIPhysicalButtonBehaviorCameraShutterOptions;
  [(_UIPhysicalButtonBehaviorOptions *)&v3 encodeWithBSXPCCoder:a3];
}

- (_UIPhysicalButtonBehaviorCameraShutterOptions)initWithBSXPCCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UIPhysicalButtonBehaviorCameraShutterOptions;
  return [(_UIPhysicalButtonBehaviorOptions *)&v4 initWithBSXPCCoder:a3];
}

- (_UIPhysicalButtonBehaviorCameraShutterOptions)init
{
  objc_super v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"_UIPhysicalButton.m", 469, @"%s: init is not allowed on %@", "-[_UIPhysicalButtonBehaviorCameraShutterOptions init]", objc_opt_class() object file lineNumber description];

  return 0;
}

- (id)debugDescription
{
  return [(_UIPhysicalButtonBehaviorCameraShutterOptions *)self debugDescriptionWithMultilinePrefix:&stru_1ED0E84C0];
}

- (id)succinctDescription
{
  id v2 = [(_UIPhysicalButtonBehaviorCameraShutterOptions *)self succinctDescriptionBuilder];
  objc_super v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v4.receiver = self;
  v4.super_class = (Class)_UIPhysicalButtonBehaviorCameraShutterOptions;
  id v2 = [(_UIPhysicalButtonBehaviorOptions *)&v4 succinctDescriptionBuilder];
  return v2;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  objc_super v3 = [(_UIPhysicalButtonBehaviorCameraShutterOptions *)self descriptionBuilderWithMultilinePrefix:a3];
  objc_super v4 = [v3 build];

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  objc_super v3 = [(_UIPhysicalButtonBehaviorCameraShutterOptions *)self descriptionBuilderWithMultilinePrefix:a3];
  objc_super v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UIPhysicalButtonBehaviorCameraShutterOptions;
  objc_super v3 = [(_UIPhysicalButtonBehaviorOptions *)&v5 descriptionBuilderWithMultilinePrefix:a3];
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)_UIPhysicalButtonBehaviorCameraShutterOptions;
  [(_UIPhysicalButtonBehaviorOptions *)&v3 encodeWithCoder:a3];
}

- (_UIPhysicalButtonBehaviorCameraShutterOptions)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UIPhysicalButtonBehaviorCameraShutterOptions;
  return [(_UIPhysicalButtonBehaviorOptions *)&v4 initWithCoder:a3];
}

- (void)encodeWithXPCDictionary:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)_UIPhysicalButtonBehaviorCameraShutterOptions;
  [(_UIPhysicalButtonBehaviorOptions *)&v3 encodeWithXPCDictionary:a3];
}

- (_UIPhysicalButtonBehaviorCameraShutterOptions)initWithXPCDictionary:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UIPhysicalButtonBehaviorCameraShutterOptions;
  return [(_UIPhysicalButtonBehaviorOptions *)&v4 initWithXPCDictionary:a3];
}

@end