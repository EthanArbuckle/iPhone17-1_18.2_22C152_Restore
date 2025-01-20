@interface WBSPrivateRelayFailClosedExceptionManager
+ (WBSPrivateRelayFailClosedExceptionManager)sharedManager;
- (BOOL)shouldPrivateRelayFailClosedExceptionApplyForURL:(id)a3;
- (BOOL)wasExceptionClearedForCurrentBrowsingSession:(id)a3;
- (WBSPrivateRelayFailClosedExceptionManager)init;
- (void)clearPrivateRelayFailClosedExceptionIfNecessaryForURL:(id)a3;
- (void)rememberPrivateRelayFailClosedExceptionForURL:(id)a3;
@end

@implementation WBSPrivateRelayFailClosedExceptionManager

+ (WBSPrivateRelayFailClosedExceptionManager)sharedManager
{
  if (+[WBSPrivateRelayFailClosedExceptionManager sharedManager]::onceToken != -1) {
    dispatch_once(&+[WBSPrivateRelayFailClosedExceptionManager sharedManager]::onceToken, &__block_literal_global_92);
  }
  v2 = (void *)+[WBSPrivateRelayFailClosedExceptionManager sharedManager]::manager;
  return (WBSPrivateRelayFailClosedExceptionManager *)v2;
}

void __58__WBSPrivateRelayFailClosedExceptionManager_sharedManager__block_invoke()
{
  v0 = objc_alloc_init(WBSPrivateRelayFailClosedExceptionManager);
  v1 = (void *)+[WBSPrivateRelayFailClosedExceptionManager sharedManager]::manager;
  +[WBSPrivateRelayFailClosedExceptionManager sharedManager]::manager = (uint64_t)v0;
}

- (WBSPrivateRelayFailClosedExceptionManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)WBSPrivateRelayFailClosedExceptionManager;
  v2 = [(WBSPrivateRelayFailClosedExceptionManager *)&v9 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA80] set];
    privateRelayFailClosedExceptions = v2->_privateRelayFailClosedExceptions;
    v2->_privateRelayFailClosedExceptions = (NSMutableSet *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA80] set];
    clearedExceptionsForBrowsingSession = v2->_clearedExceptionsForBrowsingSession;
    v2->_clearedExceptionsForBrowsingSession = (NSMutableSet *)v5;

    v7 = v2;
  }

  return v2;
}

- (void)rememberPrivateRelayFailClosedExceptionForURL:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    [(NSMutableSet *)self->_clearedExceptionsForBrowsingSession removeObject:v4];
    [(NSMutableSet *)self->_privateRelayFailClosedExceptions addObject:v4];
  }
}

- (BOOL)shouldPrivateRelayFailClosedExceptionApplyForURL:(id)a3
{
  return [(NSMutableSet *)self->_privateRelayFailClosedExceptions containsObject:a3];
}

- (void)clearPrivateRelayFailClosedExceptionIfNecessaryForURL:(id)a3
{
  id v4 = a3;
  if (v4 && ([(NSMutableSet *)self->_privateRelayFailClosedExceptions containsObject:v4] & 1) != 0)
  {
    [(NSMutableSet *)self->_privateRelayFailClosedExceptions removeObject:v4];
    [(NSMutableSet *)self->_clearedExceptionsForBrowsingSession addObject:v4];
  }
}

- (BOOL)wasExceptionClearedForCurrentBrowsingSession:(id)a3
{
  return [(NSMutableSet *)self->_clearedExceptionsForBrowsingSession containsObject:a3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clearedExceptionsForBrowsingSession, 0);
  objc_storeStrong((id *)&self->_privateRelayFailClosedExceptions, 0);
}

@end