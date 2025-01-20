@interface _UISystemBaselineConstraint
+ (id)constraintWithAnchor:(id)a3 relatedBy:(int64_t)a4 toAnchor:(id)a5 withSystemSpacingMultipliedBy:(double)a6;
- (_UISystemBaselineConstraint)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _UISystemBaselineConstraint

+ (id)constraintWithAnchor:(id)a3 relatedBy:(int64_t)a4 toAnchor:(id)a5 withSystemSpacingMultipliedBy:(double)a6
{
  if ([a3 _anchorType] != 2 || objc_msgSend(a5, "_anchorType") != 2) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"NSLayoutConstraint_UIKitAdditions.m", 6174, @"_UISystemBaselineConstraint may only be created with proxied anchors.");
  }
  uint64_t v12 = [a3 _proxiedItem];
  uint64_t v13 = [a3 _proxiedAttribute];
  uint64_t v14 = [a5 _proxiedItem];
  uint64_t v15 = [a5 _proxiedAttribute];
  uint64_t v16 = *MEMORY[0x1E4F5B228];
  return +[_UISystemBaselineConstraint constraintWithItem:v12 attribute:v13 relatedBy:a4 toItem:v14 attribute:v15 multiplier:v16 symbolicConstant:1.0 symbolicConstantMultiplier:a6];
}

- (_UISystemBaselineConstraint)initWithCoder:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)_UISystemBaselineConstraint;
  v5 = -[_UISystemBaselineConstraint initWithCoder:](&v11, sel_initWithCoder_);
  v6 = v5;
  if (v5)
  {
    if (![(_UISystemBaselineConstraint *)v5 symbolicConstant]) {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, @"NSLayoutConstraint_UIKitAdditions.m", 6180, @"Creating a _UISystemBaselineConstraint without a symbolic constant is not allowed.");
    }
    v7 = (void *)[(_UISystemBaselineConstraint *)v6 symbolicConstant];
    if (([v7 isEqualToString:*MEMORY[0x1E4F5B230]] & 1) != 0
      || ([v7 isEqualToString:*MEMORY[0x1E4F5B228]] & 1) == 0)
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, @"NSLayoutConstraint_UIKitAdditions.m", 6182, @"_UISystemBaselineConstraint symbolic constant %@ does not support a spacingMultiplier.", -[_UISystemBaselineConstraint symbolicConstant](v6, "symbolicConstant"));
    }
    v8 = (void *)[a3 decodeObjectForKey:@"UISpacingMultiplier"];
    if (v8)
    {
      [v8 floatValue];
      [(_UISystemBaselineConstraint *)v6 setSymbolicConstantMultiplier:v9];
    }
  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UISystemBaselineConstraint;
  -[_UISystemBaselineConstraint encodeWithCoder:](&v6, sel_encodeWithCoder_);
  v5 = NSNumber;
  [(_UISystemBaselineConstraint *)self symbolicConstantMultiplier];
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(v5, "numberWithDouble:"), @"UISpacingMultiplier");
}

@end