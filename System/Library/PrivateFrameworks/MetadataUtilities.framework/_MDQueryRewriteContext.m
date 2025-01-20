@interface _MDQueryRewriteContext
- (NSArray)tokenRewrites;
- (_MDQueryRewriteContext)initWithRewrittenTokens:(id)a3;
- (void)dealloc;
- (void)setTokenRewrites:(id)a3;
@end

@implementation _MDQueryRewriteContext

- (_MDQueryRewriteContext)initWithRewrittenTokens:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)_MDQueryRewriteContext;
  v4 = [(_MDQueryRewriteContext *)&v6 init];
  if (v4) {
    v4->_tokenRewrites = (NSArray *)[a3 copy];
  }
  return v4;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)_MDQueryRewriteContext;
  [(_MDQueryRewriteContext *)&v3 dealloc];
}

- (NSArray)tokenRewrites
{
  return self->_tokenRewrites;
}

- (void)setTokenRewrites:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

@end