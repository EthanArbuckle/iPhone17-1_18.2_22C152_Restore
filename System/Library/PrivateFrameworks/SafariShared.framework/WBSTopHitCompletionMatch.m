@interface WBSTopHitCompletionMatch
- (BOOL)isTopHit;
- (BOOL)shouldPreload;
- (WBSTopHitCompletionMatch)initWithBookmarkAndHistoryCompletionMatch:(void *)a3 userInput:(id)a4 forQueryID:(int64_t)a5 shouldPreload:(BOOL)a6;
- (id)parsecDomainIdentifier;
@end

@implementation WBSTopHitCompletionMatch

- (WBSTopHitCompletionMatch)initWithBookmarkAndHistoryCompletionMatch:(void *)a3 userInput:(id)a4 forQueryID:(int64_t)a5 shouldPreload:(BOOL)a6
{
  v11.receiver = self;
  v11.super_class = (Class)WBSTopHitCompletionMatch;
  v7 = [(WBSBookmarkAndHistoryCompletionMatch *)&v11 initWithBookmarkAndHistoryCompletionMatch:a3 userInput:a4 forQueryID:a5];
  v8 = v7;
  if (v7)
  {
    v7->_shouldPreload = a6;
    v9 = v7;
  }

  return v8;
}

- (BOOL)isTopHit
{
  return 1;
}

- (id)parsecDomainIdentifier
{
  return @"tophit";
}

- (BOOL)shouldPreload
{
  return self->_shouldPreload;
}

@end