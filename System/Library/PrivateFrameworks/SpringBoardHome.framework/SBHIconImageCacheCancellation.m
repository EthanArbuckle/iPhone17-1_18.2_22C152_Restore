@interface SBHIconImageCacheCancellation
- (BOOL)isCancelled;
- (NSArray)requestedImageIdentities;
- (NSString)description;
- (NSUUID)identifier;
- (SBHIconImageCacheCancellation)init;
- (id)succinctDescription;
- (void)appendDescriptionToStream:(id)a3;
- (void)cancel;
- (void)setCancelled:(BOOL)a3;
- (void)setRequestedImageIdentities:(id)a3;
@end

@implementation SBHIconImageCacheCancellation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestedImageIdentities, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (SBHIconImageCacheCancellation)init
{
  v6.receiver = self;
  v6.super_class = (Class)SBHIconImageCacheCancellation;
  v2 = [(SBHIconImageCacheCancellation *)&v6 init];
  if (v2)
  {
    v3 = (NSUUID *)objc_alloc_init(MEMORY[0x1E4F29128]);
    identifier = v2->_identifier;
    v2->_identifier = v3;
  }
  return v2;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)cancel
{
}

- (NSString)description
{
  return (NSString *)[MEMORY[0x1E4F4F720] descriptionForRootObject:self];
}

- (id)succinctDescription
{
  v3 = (void *)MEMORY[0x1E4F4F720];
  v4 = [MEMORY[0x1E4F4F728] succinctStyle];
  v5 = [v3 descriptionForRootObject:self withStyle:v4];

  return v5;
}

- (void)appendDescriptionToStream:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59__SBHIconImageCacheCancellation_appendDescriptionToStream___block_invoke;
  v6[3] = &unk_1E6AACA90;
  id v7 = v4;
  v8 = self;
  id v5 = v4;
  [v5 appendProem:self block:v6];
}

id __59__SBHIconImageCacheCancellation_appendDescriptionToStream___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [*(id *)(a1 + 40) identifier];
  id v4 = (id)[v2 appendObject:v3 withName:@"identifier"];

  id v5 = *(void **)(a1 + 32);
  objc_super v6 = [*(id *)(a1 + 40) requestedImageIdentities];
  id v7 = (id)[v5 appendObject:v6 withName:@"requestedImageIdentities"];

  return (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isCancelled"), @"cancelled");
}

- (NSArray)requestedImageIdentities
{
  return self->_requestedImageIdentities;
}

- (void)setRequestedImageIdentities:(id)a3
{
}

- (BOOL)isCancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

@end