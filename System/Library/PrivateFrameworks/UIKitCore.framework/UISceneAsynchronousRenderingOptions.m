@interface UISceneAsynchronousRenderingOptions
- (BOOL)isEqual:(id)a3;
- (BOOL)opaque;
- (NSArray)renderTimes;
- (NSString)debugDescription;
- (UISceneAsynchronousRenderingOptions)init;
- (UISceneAsynchronousRenderingOptions)initWithOptions:(id)a3;
- (double)renderPeriod;
- (float)renderMaxAPL;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)hash;
@end

@implementation UISceneAsynchronousRenderingOptions

- (void).cxx_destruct
{
}

- (NSArray)renderTimes
{
  return self->_renderTimes;
}

- (double)renderPeriod
{
  return self->_renderPeriod;
}

- (float)renderMaxAPL
{
  return self->_renderMaxAPL;
}

- (BOOL)opaque
{
  return self->_opaque;
}

- (UISceneAsynchronousRenderingOptions)init
{
  v6.receiver = self;
  v6.super_class = (Class)UISceneAsynchronousRenderingOptions;
  v2 = [(UISceneAsynchronousRenderingOptions *)&v6 init];
  v3 = v2;
  if (v2)
  {
    renderTimes = v2->_renderTimes;
    v2->_renderTimes = 0;

    v3->_renderPeriod = 0.0;
    v3->_renderMaxAPL = INFINITY;
    v3->_opaque = 0;
  }
  return v3;
}

- (UISceneAsynchronousRenderingOptions)initWithOptions:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)UISceneAsynchronousRenderingOptions;
  v5 = [(UISceneAsynchronousRenderingOptions *)&v12 init];
  if (v5)
  {
    objc_super v6 = [v4 renderTimes];
    uint64_t v7 = [v6 copy];
    renderTimes = v5->_renderTimes;
    v5->_renderTimes = (NSArray *)v7;

    [v4 renderPeriod];
    v5->_renderPeriod = v9;
    [v4 renderMaxAPL];
    v5->_renderMaxAPL = v10;
    v5->_opaque = [v4 opaque];
  }

  return v5;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [UIMutableSceneAsynchronousRenderingOptions alloc];
  return [(UISceneAsynchronousRenderingOptions *)v4 initWithOptions:self];
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = [(UISceneAsynchronousRenderingOptions *)self renderTimes];
  id v5 = (id)[v3 appendObject:v4];

  [(UISceneAsynchronousRenderingOptions *)self renderPeriod];
  id v6 = (id)objc_msgSend(v3, "appendDouble:");
  [(UISceneAsynchronousRenderingOptions *)self renderMaxAPL];
  id v7 = (id)objc_msgSend(v3, "appendFloat:");
  id v8 = (id)objc_msgSend(v3, "appendBool:", -[UISceneAsynchronousRenderingOptions opaque](self, "opaque"));
  unint64_t v9 = [v3 hash];

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (UISceneAsynchronousRenderingOptions *)a3;
  id v5 = v4;
  if (v4 == self)
  {
    char v18 = 1;
  }
  else
  {
    id v6 = v4;
    id v7 = [MEMORY[0x1E4F4F738] builderWithObject:v6 ofExpectedClass:objc_opt_class()];
    [(UISceneAsynchronousRenderingOptions *)self renderPeriod];
    double v9 = v8;
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __47__UISceneAsynchronousRenderingOptions_isEqual___block_invoke;
    v35[3] = &unk_1E52DCFA8;
    float v10 = v6;
    v36 = v10;
    id v11 = (id)[v7 appendDouble:v35 counterpart:v9];
    [(UISceneAsynchronousRenderingOptions *)self renderMaxAPL];
    if (fabsf(v12) == INFINITY)
    {
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __47__UISceneAsynchronousRenderingOptions_isEqual___block_invoke_2;
      v33[3] = &unk_1E52DA6B0;
      v15 = (id *)&v34;
      v34 = v10;
      id v19 = (id)[v7 appendBool:1 counterpart:v33];
    }
    else
    {
      [(UISceneAsynchronousRenderingOptions *)self renderMaxAPL];
      int v14 = v13;
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __47__UISceneAsynchronousRenderingOptions_isEqual___block_invoke_3;
      v31[3] = &unk_1E52DCFD0;
      v15 = (id *)&v32;
      v32 = v10;
      LODWORD(v16) = v14;
      id v17 = (id)[v7 appendFloat:v31 counterpart:v16];
    }

    v20 = [(UISceneAsynchronousRenderingOptions *)self renderTimes];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __47__UISceneAsynchronousRenderingOptions_isEqual___block_invoke_4;
    v29[3] = &unk_1E52DCFF8;
    v21 = v10;
    v30 = v21;
    id v22 = (id)[v7 appendObject:v20 counterpart:v29];

    BOOL v23 = [(UISceneAsynchronousRenderingOptions *)self opaque];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __47__UISceneAsynchronousRenderingOptions_isEqual___block_invoke_5;
    v27[3] = &unk_1E52DA6B0;
    v28 = v21;
    v24 = v21;
    id v25 = (id)[v7 appendBool:v23 counterpart:v27];
    char v18 = [v7 isEqual];
  }
  return v18;
}

uint64_t __47__UISceneAsynchronousRenderingOptions_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) renderPeriod];
}

BOOL __47__UISceneAsynchronousRenderingOptions_isEqual___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) renderMaxAPL];
  return fabsf(v1) == INFINITY;
}

uint64_t __47__UISceneAsynchronousRenderingOptions_isEqual___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) renderMaxAPL];
}

uint64_t __47__UISceneAsynchronousRenderingOptions_isEqual___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) renderTimes];
}

uint64_t __47__UISceneAsynchronousRenderingOptions_isEqual___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) opaque];
}

- (NSString)debugDescription
{
  return (NSString *)[(UISceneAsynchronousRenderingOptions *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  [(UISceneAsynchronousRenderingOptions *)self renderPeriod];
  id v4 = (id)objc_msgSend(v3, "appendDouble:withName:decimalPrecision:", @"renderPeriod", 3);
  [(UISceneAsynchronousRenderingOptions *)self renderMaxAPL];
  id v6 = (id)[v3 appendFloat:@"renderMaxAPL" withName:3 decimalPrecision:v5];
  id v7 = [(UISceneAsynchronousRenderingOptions *)self renderTimes];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    double v9 = [(UISceneAsynchronousRenderingOptions *)self renderTimes];
    id v10 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", objc_msgSend(v9, "count"), @"renderTimes.count");
  }
  id v11 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", -[UISceneAsynchronousRenderingOptions opaque](self, "opaque"), @"opaque", 1);
  return v3;
}

- (id)succinctDescription
{
  v2 = [(UISceneAsynchronousRenderingOptions *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  float v5 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  [(UISceneAsynchronousRenderingOptions *)self renderPeriod];
  id v6 = (id)objc_msgSend(v5, "appendDouble:withName:decimalPrecision:", @"renderPeriod", 3);
  [(UISceneAsynchronousRenderingOptions *)self renderMaxAPL];
  id v8 = (id)[v5 appendFloat:@"renderMaxAPL" withName:3 decimalPrecision:v7];
  double v9 = [(UISceneAsynchronousRenderingOptions *)self renderTimes];

  if (v9)
  {
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    int v14 = __77__UISceneAsynchronousRenderingOptions_descriptionBuilderWithMultilinePrefix___block_invoke;
    v15 = &unk_1E52D9F98;
    id v16 = v5;
    id v17 = self;
    [v16 appendBodySectionWithName:0 multilinePrefix:v4 block:&v12];
  }
  id v10 = (id)objc_msgSend(v5, "appendBool:withName:", -[UISceneAsynchronousRenderingOptions opaque](self, "opaque", v12, v13, v14, v15), @"opaque");

  return v5;
}

void __77__UISceneAsynchronousRenderingOptions_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) renderTimes];
  v3 = [*(id *)(a1 + 32) activeMultilinePrefix];
  [v2 appendArraySection:v4 withName:@"renderTimes" multilinePrefix:v3 skipIfEmpty:0];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(UISceneAsynchronousRenderingOptions *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

@end