@interface SBIdleTimerProxy
+ (id)disabledIdleTimerProxy;
- (BOOL)isActivated;
- (BOOL)isDisabled;
- (SBIdleTimer)sourceTimer;
- (SBIdleTimerProxy)initWithIdleTimerSource:(id)a3;
- (void)_logExpirationTimeout:(double)a3;
- (void)idleTimerDidExpire:(id)a3;
- (void)idleTimerDidRefresh:(id)a3;
- (void)idleTimerDidResetForUserAttention:(id)a3;
- (void)idleTimerDidWarn:(id)a3;
- (void)reset;
- (void)setActivated:(BOOL)a3;
- (void)setSourceTimer:(id)a3;
@end

@implementation SBIdleTimerProxy

- (void)setSourceTimer:(id)a3
{
  v4 = (SBIdleTimer *)a3;
  sourceTimer = self->_sourceTimer;
  if (sourceTimer) {
    [(SBIdleTimer *)sourceTimer removeIdleTimerObserver:self];
  }
  v6 = self->_sourceTimer;
  self->_sourceTimer = v4;
  v7 = v4;

  [(SBIdleTimer *)v7 addIdleTimerObserver:self];
}

- (void)reset
{
  v4.receiver = self;
  v4.super_class = (Class)SBIdleTimerProxy;
  [(SBIdleTimerBase *)&v4 reset];
  v3 = [(SBIdleTimerProxy *)self sourceTimer];
  [v3 reset];
}

- (SBIdleTimer)sourceTimer
{
  return self->_sourceTimer;
}

+ (id)disabledIdleTimerProxy
{
  id v2 = objc_alloc((Class)a1);
  v3 = objc_alloc_init(SBDisabledIdleTimer);
  objc_super v4 = (void *)[v2 initWithIdleTimerSource:v3];

  return v4;
}

- (SBIdleTimerProxy)initWithIdleTimerSource:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBIdleTimerProxy;
  v6 = [(SBIdleTimerProxy *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_sourceTimer, a3);
    [v5 addIdleTimerObserver:v7];
  }

  return v7;
}

- (BOOL)isDisabled
{
  return [(SBIdleTimer *)self->_sourceTimer isDisabled];
}

- (void)idleTimerDidRefresh:(id)a3
{
}

- (void)idleTimerDidExpire:(id)a3
{
}

- (void)idleTimerDidWarn:(id)a3
{
}

- (void)idleTimerDidResetForUserAttention:(id)a3
{
}

- (BOOL)isActivated
{
  return 0;
}

- (void)setActivated:(BOOL)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 handleFailureInMethod:a2 object:self file:@"SBIdleTimerProxy.m" lineNumber:85 description:@"SBIdleTimerProxy should never be activated."];
}

- (void)_logExpirationTimeout:(double)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 handleFailureInMethod:a2 object:self file:@"SBIdleTimerProxy.m" lineNumber:91 description:@"SBIdleTimerProxy should never log expiration timeout"];
}

- (void).cxx_destruct
{
}

@end