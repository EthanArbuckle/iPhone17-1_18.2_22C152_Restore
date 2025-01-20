@interface SBIdleTimerRequestConfiguration
+ (id)configurationWithIdleEventHandler:(id)a3;
+ (id)configurationWithMaximumExpirationTimeout:(double)a3;
+ (id)configurationWithMinimumExpirationTimeout:(double)a3;
+ (id)configurationWithMinimumExpirationTimeout:(double)a3 maximumExpirationTimeout:(double)a4;
- (BOOL)hasMaxExpirationTimeout;
- (BOOL)hasMinExpirationTimeout;
- (NSNumber)_boxed_maxExpirationTimeout;
- (NSNumber)_boxed_minExpirationTimeout;
- (SBIdleTimerRequestConfiguration)init;
- (SBIdleTimerRequestConfiguration)initWithBSXPCCoder:(id)a3;
- (SBIdleTimerRequestConfiguration)initWithConfiguration:(id)a3;
- (double)maxExpirationTimeout;
- (double)minExpirationTimeout;
- (id)description;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)precedence;
- (void)_setBoxed_maxExpirationTimeout:(id)a3;
- (void)_setBoxed_minExpirationTimeout:(id)a3;
- (void)_setIdleEventHandler:(id)a3;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)setMaxExpirationTimeout:(double)a3;
- (void)setMinExpirationTimeout:(double)a3;
- (void)setPrecedence:(unint64_t)a3;
@end

@implementation SBIdleTimerRequestConfiguration

- (SBIdleTimerRequestConfiguration)init
{
  v3.receiver = self;
  v3.super_class = (Class)SBIdleTimerRequestConfiguration;
  result = [(SBIdleTimerRequestConfiguration *)&v3 init];
  if (result) {
    result->_precedence = 0;
  }
  return result;
}

- (SBIdleTimerRequestConfiguration)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBIdleTimerRequestConfiguration;
  v5 = [(ITIdleTimerConfiguration *)&v11 initWithConfiguration:v4];
  if (v5)
  {
    uint64_t v6 = [v4 _boxed_minExpirationTimeout];
    boxed_minExpirationTimeout = v5->_boxed_minExpirationTimeout;
    v5->_boxed_minExpirationTimeout = (NSNumber *)v6;

    uint64_t v8 = [v4 _boxed_maxExpirationTimeout];
    boxed_maxExpirationTimeout = v5->_boxed_maxExpirationTimeout;
    v5->_boxed_maxExpirationTimeout = (NSNumber *)v8;

    v5->_precedence = [v4 precedence];
  }

  return v5;
}

+ (id)configurationWithMinimumExpirationTimeout:(double)a3
{
  if ((BSFloatGreaterThanFloat() & 1) == 0)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:a1 file:@"SBIdleTimerRequestConfiguration.m" lineNumber:45 description:@"Min timeout: %g must be nonnegative", *(void *)&a3];
  }
  id v6 = objc_alloc_init((Class)a1);
  [v6 setMinExpirationTimeout:a3];
  return v6;
}

+ (id)configurationWithMaximumExpirationTimeout:(double)a3
{
  if ((BSFloatGreaterThanFloat() & 1) == 0)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:a1 file:@"SBIdleTimerRequestConfiguration.m" lineNumber:54 description:@"Max timeout: %g must be nonnegative", *(void *)&a3];
  }
  id v6 = objc_alloc_init((Class)a1);
  [v6 setMaxExpirationTimeout:a3];
  return v6;
}

+ (id)configurationWithMinimumExpirationTimeout:(double)a3 maximumExpirationTimeout:(double)a4
{
  if ((BSFloatGreaterThanFloat() & 1) == 0 && (BSFloatGreaterThanFloat() & 1) == 0)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:a1 file:@"SBIdleTimerRequestConfiguration.m" lineNumber:63 description:@"At least either min timeout: %g or max timeout: %g must be nonzero" arguments:a3, a4];
  }
  id v8 = objc_alloc_init((Class)a1);
  if (BSFloatGreaterThanFloat()) {
    [v8 setMinExpirationTimeout:a3];
  }
  if (BSFloatGreaterThanFloat()) {
    [v8 setMaxExpirationTimeout:a4];
  }
  return v8;
}

+ (id)configurationWithIdleEventHandler:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)a1);
  [v5 _setIdleEventHandler:v4];

  return v5;
}

- (BOOL)hasMinExpirationTimeout
{
  return self->_boxed_minExpirationTimeout != 0;
}

- (double)minExpirationTimeout
{
  [(NSNumber *)self->_boxed_minExpirationTimeout doubleValue];
  return result;
}

- (void)setMinExpirationTimeout:(double)a3
{
  if (BSFloatGreaterThanFloat())
  {
    self->_boxed_minExpirationTimeout = [MEMORY[0x1E4F28ED0] numberWithDouble:a3];
  }
  else if (BSFloatIsZero())
  {
    self->_boxed_minExpirationTimeout = 0;
  }
  else
  {
    [MEMORY[0x1E4F28B00] currentHandler];
    [objc_claimAutoreleasedReturnValue() handleFailureInMethod:a2 object:self file:@"SBIdleTimerRequestConfiguration.m" lineNumber:100 description:@"Min timeout: %g must be nonnegative", *(void *)&a3];
  }
  MEMORY[0x1F41817F8]();
}

- (BOOL)hasMaxExpirationTimeout
{
  return self->_boxed_maxExpirationTimeout != 0;
}

- (double)maxExpirationTimeout
{
  [(NSNumber *)self->_boxed_maxExpirationTimeout doubleValue];
  return result;
}

- (void)setMaxExpirationTimeout:(double)a3
{
  if (BSFloatGreaterThanFloat())
  {
    self->_boxed_maxExpirationTimeout = [MEMORY[0x1E4F28ED0] numberWithDouble:a3];
  }
  else if (BSFloatIsZero())
  {
    self->_boxed_maxExpirationTimeout = 0;
  }
  else
  {
    [MEMORY[0x1E4F28B00] currentHandler];
    [objc_claimAutoreleasedReturnValue() handleFailureInMethod:a2 object:self file:@"SBIdleTimerRequestConfiguration.m" lineNumber:118 description:@"Max timeout: %g must be nonnegative" argument:a3];
  }
  MEMORY[0x1F41817F8]();
}

- (void)_setIdleEventHandler:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    char v6 = objc_opt_respondsToSelector();
    if (objc_opt_respondsToSelector()) {
      uint64_t v7 = v6 & 1 | 2;
    }
    else {
      uint64_t v7 = v6 & 1;
    }
    if (objc_opt_respondsToSelector()) {
      v7 |= 4uLL;
    }
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __56__SBIdleTimerRequestConfiguration__setIdleEventHandler___block_invoke;
    v9[3] = &unk_1E566BAE0;
    objc_super v11 = self;
    SEL v12 = a2;
    id v10 = v5;
    id v8 = (void *)MEMORY[0x192FC0DF0](v9);
    [(ITIdleTimerConfiguration *)self _setIdleEventMask:v7];
    [(ITIdleTimerConfiguration *)self _setIdleEventHandlerBlock:v8];
  }
  else
  {
    [(ITIdleTimerConfiguration *)self _setIdleEventMask:0];
    [(ITIdleTimerConfiguration *)self _setIdleEventHandlerBlock:0];
  }
}

uint64_t __56__SBIdleTimerRequestConfiguration__setIdleEventHandler___block_invoke(void *a1, uint64_t a2)
{
  switch(a2)
  {
    case 4:
      char v6 = (void *)a1[4];
      return [v6 handleIdleTimerUserAttentionDidReset];
    case 2:
      uint64_t v7 = (void *)a1[4];
      return [v7 handleIdleTimerDidExpire];
    case 1:
      id v4 = (void *)a1[4];
      return [v4 handleIdleTimerDidWarn];
    default:
      id v8 = [MEMORY[0x1E4F28B00] currentHandler];
      [v8 handleFailureInMethod:a1[6] object:a1[5] file:@"SBIdleTimerRequestConfiguration.m" lineNumber:144 description:@"We received an idle eventType: <%lu> which doesn't match any known idle event."];

      return 1;
  }
}

- (id)description
{
  return [(SBIdleTimerRequestConfiguration *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(SBIdleTimerRequestConfiguration *)self succinctDescriptionBuilder];
  objc_super v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v11.receiver = self;
  v11.super_class = (Class)SBIdleTimerRequestConfiguration;
  objc_super v3 = [(ITIdleTimerConfiguration *)&v11 succinctDescriptionBuilder];
  id v4 = v3;
  unint64_t precedence = self->_precedence;
  char v6 = @"Normal";
  if (precedence == 1) {
    char v6 = @"High";
  }
  if (precedence == 2) {
    uint64_t v7 = @"Critical";
  }
  else {
    uint64_t v7 = v6;
  }
  [v3 appendString:v7 withName:@"precedence"];
  if ([(SBIdleTimerRequestConfiguration *)self hasMinExpirationTimeout])
  {
    [(SBIdleTimerRequestConfiguration *)self minExpirationTimeout];
    id v8 = [v4 appendTimeInterval:@"minExpirationTimeout" withName:0 decomposeUnits:0];
  }
  if ([(SBIdleTimerRequestConfiguration *)self hasMaxExpirationTimeout])
  {
    [(SBIdleTimerRequestConfiguration *)self maxExpirationTimeout];
    id v9 = [v4 appendTimeInterval:@"maxExpirationTimeout" withName:nil decomposeUnits:0];
  }
  return v4;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  objc_super v3 = [(SBIdleTimerRequestConfiguration *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (SBIdleTimerRequestConfiguration)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBIdleTimerRequestConfiguration;
  id v5 = [(ITIdleTimerConfiguration *)&v11 initWithBSXPCCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"minExpirationTimeout"];
    boxed_minExpirationTimeout = v5->_boxed_minExpirationTimeout;
    v5->_boxed_minExpirationTimeout = (NSNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"maxExpirationTimeout"];
    boxed_maxExpirationTimeout = v5->_boxed_maxExpirationTimeout;
    v5->_boxed_maxExpirationTimeout = (NSNumber *)v8;

    v5->_unint64_t precedence = [v4 decodeUInt64ForKey:@"precedence"];
  }

  return v5;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  if (a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)SBIdleTimerRequestConfiguration;
    id v4 = a3;
    [(ITIdleTimerConfiguration *)&v5 encodeWithBSXPCCoder:v4];
    [v4 encodeObject:self->_boxed_minExpirationTimeout forKey:@"minExpirationTimeout" in:v5.receiver super_class:v5.super_class];
    [v4 encodeObject:self->_boxed_maxExpirationTimeout forKey:@"maxExpirationTimeout"];
    [v4 encodeUInt64:self->_precedence forKey:@"precedence"];
  }
}

- (NSNumber)_boxed_minExpirationTimeout
{
  return self->_boxed_minExpirationTimeout;
}

- (void)_setBoxed_minExpirationTimeout:(id)a3
{
}

- (NSNumber)_boxed_maxExpirationTimeout
{
  return self->_boxed_maxExpirationTimeout;
}

- (void)_setBoxed_maxExpirationTimeout:(id)a3
{
}

- (unint64_t)precedence
{
  return self->_precedence;
}

- (void)setPrecedence:(unint64_t)a3
{
  self->_unint64_t precedence = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_boxed_maxExpirationTimeout, 0);
  objc_storeStrong((id *)&self->_boxed_minExpirationTimeout, 0);
}

@end