@interface STUIStatusBarStyleRequest
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (STUIStatusBarStyleRequest)initWithResolvedStyle:(int64_t)a3 foregroundColor:(id)a4;
- (id)_descriptionBuilderWithMultilinePrefix:(id)a3 forDebug:(BOOL)a4;
- (id)debugDescriptionWithMultilinePrefix:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)resolvedStyle;
- (unint64_t)hash;
@end

@implementation STUIStatusBarStyleRequest

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)STUIStatusBarStyleRequest;
  if ([(STUIStatusBarStyleRequest *)&v8 isEqual:v4])
  {
    int64_t resolvedStyle = self->_resolvedStyle;
    BOOL v6 = resolvedStyle == [v4 resolvedStyle];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (int64_t)resolvedStyle
{
  return self->_resolvedStyle;
}

- (STUIStatusBarStyleRequest)initWithResolvedStyle:(int64_t)a3 foregroundColor:(id)a4
{
  id v6 = a4;
  uint64_t v7 = _UIStatusBarStyleFromResolvedStyle();
  v10.receiver = self;
  v10.super_class = (Class)STUIStatusBarStyleRequest;
  objc_super v8 = [(STUIStatusBarStyleRequest *)&v10 initWithStyle:v7 legibilityStyle:0 foregroundColor:v6];

  if (v8) {
    v8->_int64_t resolvedStyle = a3;
  }
  return v8;
}

- (unint64_t)hash
{
  v5.receiver = self;
  v5.super_class = (Class)STUIStatusBarStyleRequest;
  unint64_t v3 = [(STUIStatusBarStyleRequest *)&v5 hash];
  return 1000 * self->_resolvedStyle - v3 + 32 * v3;
}

- (NSString)description
{
  return (NSString *)[(STUIStatusBarStyleRequest *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(STUIStatusBarStyleRequest *)self succinctDescriptionBuilder];
  unint64_t v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  unint64_t v3 = [(STUIStatusBarStyleRequest *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  unint64_t v3 = [(STUIStatusBarStyleRequest *)self _descriptionBuilderWithMultilinePrefix:a3 forDebug:1];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  return [(STUIStatusBarStyleRequest *)self _descriptionBuilderWithMultilinePrefix:a3 forDebug:0];
}

- (id)_descriptionBuilderWithMultilinePrefix:(id)a3 forDebug:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [(STUIStatusBarStyleRequest *)self succinctDescriptionBuilder];
  [v7 setUseDebugDescription:v4];
  [v7 setActiveMultilinePrefix:v6];

  objc_super v8 = [v7 activeMultilinePrefix];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __77__STUIStatusBarStyleRequest__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke;
  v12[3] = &unk_1E6AA39F0;
  id v9 = v7;
  id v13 = v9;
  v14 = self;
  [v9 appendBodySectionWithName:0 multilinePrefix:v8 block:v12];

  id v10 = v9;
  return v10;
}

id __77__STUIStatusBarStyleRequest__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  unint64_t v3 = +[STUIStatusBar stringForStatusBarStyle:](STUIStatusBar, "stringForStatusBarStyle:", [*(id *)(a1 + 40) resolvedStyle]);
  [v2 appendString:v3 withName:@"resolvedStyle" skipIfEmpty:1];

  [*(id *)(a1 + 40) style];
  uint64_t v4 = _UIStatusBarResolvedStyleFromStyle();
  if (v4 != [*(id *)(a1 + 40) resolvedStyle])
  {
    objc_super v5 = *(void **)(a1 + 32);
    id v6 = _STUIStringFromStatusBarLegacyStyle([*(id *)(a1 + 40) style]);
    [v5 appendString:v6 withName:@"style"];
  }
  if ([*(id *)(a1 + 40) legibilityStyle])
  {
    uint64_t v7 = *(void **)(a1 + 32);
    objc_super v8 = _STUIStringFromUILegibilityStyle([*(id *)(a1 + 40) legibilityStyle]);
    [v7 appendString:v8 withName:@"legibilityStyle"];
  }
  id v9 = *(void **)(a1 + 32);
  id v10 = [*(id *)(a1 + 40) foregroundColor];
  id v11 = (id)[v9 appendObject:v10 withName:@"foregroundColor" skipIfNil:1];

  [*(id *)(a1 + 40) foregroundAlpha];
  if (v12 != 1.0)
  {
    id v13 = *(void **)(a1 + 32);
    [*(id *)(a1 + 40) foregroundAlpha];
    id v14 = (id)objc_msgSend(v13, "appendDouble:withName:decimalPrecision:", @"foregroundAlpha", 1);
  }
  id v15 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:ifEqualTo:", objc_msgSend(*(id *)(a1 + 40), "isDoubleHeight"), @"isDoubleHeight", 1);
  id v16 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:ifEqualTo:", objc_msgSend(*(id *)(a1 + 40), "isTranslucent"), @"isTranslucent", 0);
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:ifEqualTo:", objc_msgSend(*(id *)(a1 + 40), "isLegacy"), @"isLegacy", 1);
}

@end