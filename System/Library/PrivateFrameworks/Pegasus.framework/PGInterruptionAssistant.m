@interface PGInterruptionAssistant
- (BOOL)_lock_calculateIsInterrupted;
- (BOOL)allowsResumingAfterInterruptionEnds;
- (BOOL)hasInterruptionReason:(int64_t)a3;
- (BOOL)isExemptFromUILockInterruptionsWhenActive;
- (BOOL)isInterrupted;
- (BOOL)isProxyActive;
- (BOOL)shouldNotifyProxyOfInterruptionBegan;
- (BOOL)shouldNotifyProxyOfInterruptionEnded;
- (PGInterruptionAssistant)init;
- (id)_interruptionsDescription;
- (id)cameraInterruptionAttributions;
- (id)copyWithExemptAttribution:(id)a3;
- (id)description;
- (id)exemptAttribution;
- (void)addReason:(int64_t)a3 attribution:(id)a4;
- (void)dealloc;
- (void)noteDidNotifyProxyOfInterruptionBegan;
- (void)noteDidNotifyProxyOfInterruptionEnded;
- (void)removeReason:(int64_t)a3 attribution:(id)a4;
- (void)setExemptAttribution:(id)a3;
- (void)setExemptFromUILockInterruptionsWhenActive:(BOOL)a3;
- (void)setProxyActive:(BOOL)a3;
@end

@implementation PGInterruptionAssistant

- (void)addReason:(int64_t)a3 attribution:(id)a4
{
  p_lock = &self->_lock;
  id v7 = a4;
  os_unfair_lock_lock(p_lock);
  if (self->_lock_isInterrupted)
  {
    if (a3 == 1) {
      self->_lock_allowsResumingAfterInterruptionEnds = 0;
    }
  }
  else
  {
    self->_lock_allowsResumingAfterInterruptionEnds = a3 != 1;
  }
  v14 = [[_PGInterruption alloc] initWithReason:a3 attribution:v7];

  lock_interruptions = self->_lock_interruptions;
  if (!lock_interruptions)
  {
    v9 = [MEMORY[0x1E4F1CA60] dictionary];
    v10 = self->_lock_interruptions;
    self->_lock_interruptions = v9;

    lock_interruptions = self->_lock_interruptions;
  }
  v11 = [(NSMutableDictionary *)lock_interruptions objectForKeyedSubscript:v14];
  uint64_t v12 = [v11 integerValue];

  v13 = [NSNumber numberWithInteger:v12 + 1];
  [(NSMutableDictionary *)self->_lock_interruptions setObject:v13 forKeyedSubscript:v14];

  self->_lock_isInterrupted = [(PGInterruptionAssistant *)self _lock_calculateIsInterrupted];
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)_lock_calculateIsInterrupted
{
  v2 = self;
  v3 = [(NSMutableDictionary *)self->_lock_interruptions allKeys];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55__PGInterruptionAssistant__lock_calculateIsInterrupted__block_invoke;
  v5[3] = &unk_1E610C390;
  v5[4] = v2;
  LOBYTE(v2) = objc_msgSend(v3, "bs_containsObjectPassingTest:", v5);

  return (char)v2;
}

uint64_t __55__PGInterruptionAssistant__lock_calculateIsInterrupted__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 reason];
  if (v4 == 2)
  {
    id v7 = [v3 attribution];
    uint64_t v6 = [v7 isEqualToString:*(void *)(*(void *)(a1 + 32) + 16)] ^ 1;
  }
  else
  {
    v6 = v4 != 1 || (uint64_t v5 = *(void *)(a1 + 32), !*(unsigned char *)(v5 + 27)) || *(unsigned __int8 *)(v5 + 28) == 0;
  }

  return v6;
}

- (PGInterruptionAssistant)init
{
  v11.receiver = self;
  v11.super_class = (Class)PGInterruptionAssistant;
  v2 = [(PGInterruptionAssistant *)&v11 init];
  id v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    objc_initWeak(&location, v2);
    id v4 = MEMORY[0x1E4F14428];
    uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"PictureInPicture - PGInterruptionAssistant - %p", v3);
    objc_copyWeak(&v9, &location);
    uint64_t v6 = BSLogAddStateCaptureBlockWithTitle();
    stateDumpInvalidatable = v3->_stateDumpInvalidatable;
    v3->_stateDumpInvalidatable = (BSInvalidatable *)v6;

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  return v3;
}

__CFString *__31__PGInterruptionAssistant_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = [WeakRetained description];
  }
  else
  {
    id v3 = &stru_1F0E4F210;
  }

  return v3;
}

- (id)description
{
  id v3 = NSString;
  if (self->_lock_isInterrupted) {
    id v4 = @"YES";
  }
  else {
    id v4 = @"NO";
  }
  uint64_t v5 = [(PGInterruptionAssistant *)self _interruptionsDescription];
  objc_msgSend(v3, "stringWithFormat:", @"isInterrupted:%@; interruptions: %@; exempt attribution:%@;",
    v4,
    v5,
  uint64_t v6 = self->_lock_exemptAttribution);

  return v6;
}

- (void)dealloc
{
  [(BSInvalidatable *)self->_stateDumpInvalidatable invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PGInterruptionAssistant;
  [(PGInterruptionAssistant *)&v3 dealloc];
}

- (id)copyWithExemptAttribution:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_alloc_init((Class)objc_opt_class());
  os_unfair_lock_lock(&self->_lock);
  uint64_t v6 = [(NSMutableDictionary *)self->_lock_interruptions mutableCopy];
  id v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [v4 copy];
  id v9 = (void *)v5[2];
  v5[2] = v8;

  *((unsigned char *)v5 + 24) = self->_lock_allowsResumingAfterInterruptionEnds;
  *((unsigned char *)v5 + 25) = objc_msgSend(v5, "_lock_calculateIsInterrupted");
  os_unfair_lock_unlock(&self->_lock);
  return v5;
}

- (id)exemptAttribution
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_lock_exemptAttribution;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setExemptAttribution:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  uint64_t v6 = (NSString *)[v5 copy];

  lock_exemptAttribution = self->_lock_exemptAttribution;
  self->_lock_exemptAttribution = v6;

  LODWORD(v5) = self->_lock_isInterrupted;
  BOOL v8 = [(PGInterruptionAssistant *)self _lock_calculateIsInterrupted];
  self->_lock_isInterrupted = v8;
  if (!v5 && v8) {
    self->_lock_allowsResumingAfterInterruptionEnds = 1;
  }

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isProxyActive
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_isProxyActive;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setProxyActive:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_lock_isProxyActive = a3;
  self->_lock_isInterrupted = [(PGInterruptionAssistant *)self _lock_calculateIsInterrupted];

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isExemptFromUILockInterruptionsWhenActive
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_exemptFromUILockInterruptionsWhenActive;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setExemptFromUILockInterruptionsWhenActive:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_lock_exemptFromUILockInterruptionsWhenActive = a3;
  self->_lock_isInterrupted = [(PGInterruptionAssistant *)self _lock_calculateIsInterrupted];

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isInterrupted
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_isInterrupted;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (id)_interruptionsDescription
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(NSMutableDictionary *)self->_lock_interruptions allKeys];
  id v5 = objc_msgSend(v4, "bs_map:", &__block_literal_global_2);

  os_unfair_lock_unlock(p_lock);
  uint64_t v6 = [v5 componentsJoinedByString:@","];

  return v6;
}

uint64_t __52__PGInterruptionAssistant__interruptionsDescription__block_invoke(uint64_t a1, void *a2)
{
  return [a2 description];
}

- (BOOL)shouldNotifyProxyOfInterruptionBegan
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  BOOL v4 = self->_lock_isInterrupted && self->_lock_isProxyActive && !self->_lock_isInterruptedAccordingToProxy;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)noteDidNotifyProxyOfInterruptionBegan
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_lock_isInterruptedAccordingToProxy = 1;

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)shouldNotifyProxyOfInterruptionEnded
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  BOOL v4 = (!self->_lock_isInterrupted || !self->_lock_isProxyActive) && self->_lock_isInterruptedAccordingToProxy;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)noteDidNotifyProxyOfInterruptionEnded
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_lock_isInterruptedAccordingToProxy = 0;

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)allowsResumingAfterInterruptionEnds
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_allowsResumingAfterInterruptionEnds;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)removeReason:(int64_t)a3 attribution:(id)a4
{
  p_lock = &self->_lock;
  id v7 = a4;
  os_unfair_lock_lock(p_lock);
  uint64_t v12 = [[_PGInterruption alloc] initWithReason:a3 attribution:v7];

  BOOL v8 = [(NSMutableDictionary *)self->_lock_interruptions objectForKeyedSubscript:v12];
  uint64_t v9 = [v8 integerValue];

  if (v9 <= 1)
  {
    [(NSMutableDictionary *)self->_lock_interruptions setObject:0 forKeyedSubscript:v12];
  }
  else
  {
    v10 = [NSNumber numberWithInteger:v9 - 1];
    [(NSMutableDictionary *)self->_lock_interruptions setObject:v10 forKeyedSubscript:v12];
  }
  if (![(NSMutableDictionary *)self->_lock_interruptions count])
  {
    lock_interruptions = self->_lock_interruptions;
    self->_lock_interruptions = 0;
  }
  self->_lock_isInterrupted = [(PGInterruptionAssistant *)self _lock_calculateIsInterrupted];
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)hasInterruptionReason:(int64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v6 = [(NSMutableDictionary *)self->_lock_interruptions allKeys];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __49__PGInterruptionAssistant_hasInterruptionReason___block_invoke;
  v8[3] = &unk_1E610C368;
  v8[4] = self;
  v8[5] = a3;
  LOBYTE(a3) = objc_msgSend(v6, "bs_containsObjectPassingTest:", v8);

  os_unfair_lock_unlock(p_lock);
  return a3;
}

uint64_t __49__PGInterruptionAssistant_hasInterruptionReason___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 reason] == *(void *)(a1 + 40))
  {
    BOOL v4 = [v3 attribution];
    uint64_t v5 = [v4 isEqualToString:*(void *)(*(void *)(a1 + 32) + 16)] ^ 1;
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)cameraInterruptionAttributions
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  BOOL v4 = [(NSMutableDictionary *)self->_lock_interruptions allKeys];
  uint64_t v5 = objc_msgSend(v4, "bs_map:", &__block_literal_global_59);

  os_unfair_lock_unlock(p_lock);
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v7 = [MEMORY[0x1E4F1CAD0] setWithArray:v6];

  return v7;
}

id __57__PGInterruptionAssistant_cameraInterruptionAttributions__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 reason] == 2)
  {
    id v3 = [v2 attribution];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateDumpInvalidatable, 0);
  objc_storeStrong((id *)&self->_lock_exemptAttribution, 0);

  objc_storeStrong((id *)&self->_lock_interruptions, 0);
}

@end