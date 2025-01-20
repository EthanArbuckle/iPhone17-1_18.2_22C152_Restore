@interface SBHIconImageCacheResult
- (BOOL)isFinished;
- (NSString)description;
- (NSUUID)requestIdentifier;
- (SBHIconImageCacheResult)init;
- (SBHIconImageCacheResult)initWithRequestIdentifier:(id)a3;
- (double)elapsedTime;
- (id)succinctDescription;
- (void)appendDescriptionToStream:(id)a3;
- (void)calculateElapsedTime;
- (void)setFinished:(BOOL)a3;
@end

@implementation SBHIconImageCacheResult

- (void).cxx_destruct
{
}

- (void)setFinished:(BOOL)a3
{
  self->_finished = a3;
}

- (SBHIconImageCacheResult)initWithRequestIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBHIconImageCacheResult;
  v5 = [(SBHIconImageCacheResult *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    requestIdentifier = v5->_requestIdentifier;
    v5->_requestIdentifier = (NSUUID *)v6;

    v5->_startTime = mach_continuous_time();
  }

  return v5;
}

- (void)calculateElapsedTime
{
  mach_continuous_time();
  BSTimeDifferenceFromMachTimeToMachTime();
  self->_elapsedTime = v3;
}

- (SBHIconImageCacheResult)init
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F29128]);
  id v4 = [(SBHIconImageCacheResult *)self initWithRequestIdentifier:v3];

  return v4;
}

- (NSString)description
{
  return (NSString *)[MEMORY[0x1E4F4F720] descriptionForRootObject:self];
}

- (id)succinctDescription
{
  id v3 = (void *)MEMORY[0x1E4F4F720];
  id v4 = [MEMORY[0x1E4F4F728] succinctStyle];
  v5 = [v3 descriptionForRootObject:self withStyle:v4];

  return v5;
}

- (void)appendDescriptionToStream:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__SBHIconImageCacheResult_appendDescriptionToStream___block_invoke;
  v6[3] = &unk_1E6AACA90;
  id v7 = v4;
  v8 = self;
  id v5 = v4;
  [v5 appendProem:self block:v6];
}

id __53__SBHIconImageCacheResult_appendDescriptionToStream___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) requestIdentifier];
  id v4 = (id)[v2 appendObject:v3 withName:@"requestIdentifier"];

  id v5 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isFinished"), @"isFinished");
  uint64_t v6 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) elapsedTime];
  return (id)objc_msgSend(v6, "appendFloat:withName:", @"elapsedTime");
}

- (NSUUID)requestIdentifier
{
  return self->_requestIdentifier;
}

- (double)elapsedTime
{
  return self->_elapsedTime;
}

- (BOOL)isFinished
{
  return self->_finished;
}

@end