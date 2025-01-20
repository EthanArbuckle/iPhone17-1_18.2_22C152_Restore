@interface SBHWidgetDisplayConfiguration
- (BOOL)isEqual:(id)a3;
- (CHSWidgetRenderScheme)renderScheme;
- (CHSWidgetTintParameters)tintParameters;
- (NSString)description;
- (SBHWidgetDisplayConfiguration)init;
- (SBHWidgetDisplayConfiguration)initWithRenderScheme:(id)a3 colorScheme:(unint64_t)a4;
- (SBHWidgetDisplayConfiguration)initWithRenderScheme:(id)a3 colorScheme:(unint64_t)a4 tintParameters:(id)a5;
- (unint64_t)colorScheme;
- (unint64_t)hash;
- (void)appendDescriptionToFormatter:(id)a3;
@end

@implementation SBHWidgetDisplayConfiguration

- (SBHWidgetDisplayConfiguration)initWithRenderScheme:(id)a3 colorScheme:(unint64_t)a4
{
  return [(SBHWidgetDisplayConfiguration *)self initWithRenderScheme:a3 colorScheme:a4 tintParameters:0];
}

- (SBHWidgetDisplayConfiguration)initWithRenderScheme:(id)a3 colorScheme:(unint64_t)a4 tintParameters:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)SBHWidgetDisplayConfiguration;
  v10 = [(SBHWidgetDisplayConfiguration *)&v16 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    renderScheme = v10->_renderScheme;
    v10->_renderScheme = (CHSWidgetRenderScheme *)v11;

    v10->_colorScheme = a4;
    uint64_t v13 = [v9 copy];
    tintParameters = v10->_tintParameters;
    v10->_tintParameters = (CHSWidgetTintParameters *)v13;
  }
  return v10;
}

- (SBHWidgetDisplayConfiguration)init
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F58EE0]);
  v4 = [(SBHWidgetDisplayConfiguration *)self initWithRenderScheme:v3 colorScheme:0 tintParameters:0];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SBHWidgetDisplayConfiguration *)a3;
  if (self == v4)
  {
    char v8 = 1;
  }
  else
  {
    v5 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v7 = v4;
      if (BSEqualObjects() && self->_colorScheme == v7->_colorScheme) {
        char v8 = BSEqualObjects();
      }
      else {
        char v8 = 0;
      }
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  id v3 = [(SBHWidgetDisplayConfiguration *)self renderScheme];
  uint64_t v4 = [v3 hash];
  unint64_t v5 = [(SBHWidgetDisplayConfiguration *)self colorScheme] ^ v4;
  v6 = [(SBHWidgetDisplayConfiguration *)self tintParameters];
  unint64_t v7 = v5 ^ [v6 hash];

  return v7;
}

- (NSString)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F4F720]);
  [(SBHWidgetDisplayConfiguration *)self appendDescriptionToFormatter:v3];
  uint64_t v4 = [v3 description];

  return (NSString *)v4;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __62__SBHWidgetDisplayConfiguration_appendDescriptionToFormatter___block_invoke;
  v6[3] = &unk_1E6AACA90;
  id v7 = v4;
  char v8 = self;
  id v5 = v4;
  [v5 appendProem:self block:v6];
}

void __62__SBHWidgetDisplayConfiguration_appendDescriptionToFormatter___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) renderScheme];
  id v4 = (id)[v2 appendObject:v3 withName:@"renderScheme"];

  id v5 = *(void **)(a1 + 32);
  v6 = MEMORY[0x1D9483C80]([*(id *)(a1 + 40) colorScheme]);
  [v5 appendString:v6 withName:@"colorScheme" skipIfEmpty:0];

  id v7 = *(void **)(a1 + 32);
  id v9 = [*(id *)(a1 + 40) tintParameters];
  id v8 = (id)[v7 appendObject:v9 withName:@"tintParameters"];
}

- (CHSWidgetRenderScheme)renderScheme
{
  return self->_renderScheme;
}

- (unint64_t)colorScheme
{
  return self->_colorScheme;
}

- (CHSWidgetTintParameters)tintParameters
{
  return self->_tintParameters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tintParameters, 0);
  objc_storeStrong((id *)&self->_renderScheme, 0);
}

@end