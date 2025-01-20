@interface SBLockScreenElementOverride
+ (id)overrideForElement:(int64_t)a3;
+ (id)overrideForHiddenElement:(int64_t)a3;
- (BOOL)isHidden;
- (NSString)text;
- (id)description;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)element;
- (void)setElement:(int64_t)a3;
- (void)setHidden:(BOOL)a3;
- (void)setText:(id)a3;
@end

@implementation SBLockScreenElementOverride

+ (id)overrideForElement:(int64_t)a3
{
  v4 = objc_alloc_init(SBLockScreenElementOverride);
  [(SBLockScreenElementOverride *)v4 setElement:a3];

  return v4;
}

+ (id)overrideForHiddenElement:(int64_t)a3
{
  v3 = [a1 overrideForElement:a3];
  [v3 setHidden:1];

  return v3;
}

- (id)description
{
  return [(SBLockScreenElementOverride *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(SBLockScreenElementOverride *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  v4 = NSStringFromLockScreenElement(self->_element);
  id v5 = (id)[v3 appendObject:v4 withName:@"element"];

  id v6 = (id)[v3 appendBool:self->_hidden withName:@"hidden"];
  [v3 appendString:self->_text withName:@"text" skipIfEmpty:1];

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(SBLockScreenElementOverride *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (int64_t)element
{
  return self->_element;
}

- (void)setElement:(int64_t)a3
{
  self->_element = a3;
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (void)setHidden:(BOOL)a3
{
  self->_hidden = a3;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (void).cxx_destruct
{
}

@end