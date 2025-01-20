@interface PLJournalChecksumContext
- (PLJournalChecksumContext)init;
- (id)finalizedChecksum;
- (void)update:(id)a3;
@end

@implementation PLJournalChecksumContext

- (void).cxx_destruct
{
}

- (id)finalizedChecksum
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  finalizedChecksum = self->_finalizedChecksum;
  if (!finalizedChecksum)
  {
    CC_SHA256_Final(md, &self->_context);
    v4 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:64];
    for (uint64_t i = 0; i != 32; ++i)
      objc_msgSend(v4, "appendFormat:", @"%02x", md[i]);
    v6 = [NSString stringWithString:v4];
    v7 = self->_finalizedChecksum;
    self->_finalizedChecksum = v6;

    finalizedChecksum = self->_finalizedChecksum;
  }
  return finalizedChecksum;
}

- (void)update:(id)a3
{
  p_context = &self->_context;
  id v4 = a3;
  v5 = (const void *)[v4 bytes];
  CC_LONG v6 = [v4 length];

  CC_SHA256_Update(p_context, v5, v6);
}

- (PLJournalChecksumContext)init
{
  v5.receiver = self;
  v5.super_class = (Class)PLJournalChecksumContext;
  v2 = [(PLJournalChecksumContext *)&v5 init];
  v3 = v2;
  if (v2) {
    CC_SHA256_Init(&v2->_context);
  }
  return v3;
}

@end