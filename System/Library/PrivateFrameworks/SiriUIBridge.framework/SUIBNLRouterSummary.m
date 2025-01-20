@interface SUIBNLRouterSummary
+ (BOOL)supportsSecureCoding;
- (NSString)rewrittenUtterance;
- (SUIBNLRouterSummary)init;
- (SUIBNLRouterSummary)initWithBuilder:(id)a3;
- (SUIBNLRouterSummary)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SUIBNLRouterSummary

- (SUIBNLRouterSummary)initWithBuilder:(id)a3
{
  v4 = (void (**)(id, SUIBNLRouterSummaryMutation *))a3;
  v12.receiver = self;
  v12.super_class = (Class)SUIBNLRouterSummary;
  v5 = [(SUIBNLRouterSummary *)&v12 init];
  v6 = v5;
  if (v4 && v5)
  {
    v7 = objc_alloc_init(SUIBNLRouterSummaryMutation);
    v4[2](v4, v7);
    v8 = [(SUIBNLRouterSummaryMutation *)v7 rewrittenUtterance];
    uint64_t v9 = [v8 copy];
    rewrittenUtterance = v6->_rewrittenUtterance;
    v6->_rewrittenUtterance = (NSString *)v9;
  }
  return v6;
}

- (SUIBNLRouterSummary)init
{
  return [(SUIBNLRouterSummary *)self initWithBuilder:&__block_literal_global_2];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SUIBNLRouterSummary)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SUIBNLRouterSummary::rewrittenUtterance"];

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __37__SUIBNLRouterSummary_initWithCoder___block_invoke;
  v9[3] = &unk_265517E90;
  id v10 = v5;
  id v6 = v5;
  v7 = [(SUIBNLRouterSummary *)self initWithBuilder:v9];

  return v7;
}

uint64_t __37__SUIBNLRouterSummary_initWithCoder___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setRewrittenUtterance:*(void *)(a1 + 32)];
}

- (void)encodeWithCoder:(id)a3
{
}

- (NSString)rewrittenUtterance
{
  return self->_rewrittenUtterance;
}

- (void).cxx_destruct
{
}

@end