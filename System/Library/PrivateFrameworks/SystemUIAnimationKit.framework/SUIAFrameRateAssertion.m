@interface SUIAFrameRateAssertion
- (SUIAFrameRateAssertion)initWithFrameRateRange:(CAFrameRateRange)a3 highFrameRateReason:(unsigned int)a4;
- (void)invalidate;
@end

@implementation SUIAFrameRateAssertion

- (SUIAFrameRateAssertion)initWithFrameRateRange:(CAFrameRateRange)a3 highFrameRateReason:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  float preferred = a3.preferred;
  float maximum = a3.maximum;
  float minimum = a3.minimum;
  v19.receiver = self;
  v19.super_class = (Class)SUIAFrameRateAssertion;
  v8 = [(SUIAFrameRateAssertion *)&v19 init];
  v9 = v8;
  if (v8)
  {
    v8->_updateRequest.flags = 0;
    v8->_updateRequest.minRate = minimum;
    v8->_updateRequest.preferredRate = preferred;
    v8->_updateRequest.maxRate = maximum;
    _UIUpdateRequestActivate();
    id v10 = objc_alloc(MEMORY[0x263F29CD8]);
    v11 = objc_msgSend(NSString, "stringWithFormat:", @"SBFFrameRateReason-%d", v4);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __69__SUIAFrameRateAssertion_initWithFrameRateRange_highFrameRateReason___block_invoke;
    v16[3] = &unk_26552D2A0;
    v12 = v9;
    v17 = v12;
    int v18 = v4;
    uint64_t v13 = [v10 initWithIdentifier:@"SUIAFrameRateAssertion" forReason:v11 invalidationBlock:v16];
    assertion = v12->_assertion;
    v12->_assertion = (BSSimpleAssertion *)v13;
  }
  return v9;
}

uint64_t __69__SUIAFrameRateAssertion_initWithFrameRateRange_highFrameRateReason___block_invoke(uint64_t a1)
{
  return MEMORY[0x270F83028](*(void *)(a1 + 32) + 16, *(unsigned int *)(a1 + 40));
}

- (void)invalidate
{
}

- (void).cxx_destruct
{
}

@end