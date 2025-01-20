@interface ICNASubTracker
- (AATracker)aaTracker;
- (ICNASubTracker)initWithName:(id)a3;
- (ICNASubTracker)initWithName:(id)a3 parentAATracker:(id)a4;
- (ICNASubTracker)initWithName:(id)a3 parentTracker:(id)a4;
- (NSString)aaTrackerName;
- (void)setAaTracker:(id)a3;
@end

@implementation ICNASubTracker

- (ICNASubTracker)initWithName:(id)a3
{
  return [(ICNASubTracker *)self initWithName:a3 parentAATracker:0];
}

- (ICNASubTracker)initWithName:(id)a3 parentTracker:(id)a4
{
  id v6 = a3;
  v7 = [a4 aaTracker];
  v8 = [(ICNASubTracker *)self initWithName:v6 parentAATracker:v7];

  return v8;
}

- (ICNASubTracker)initWithName:(id)a3 parentAATracker:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)ICNASubTracker;
  v9 = [(ICNASubTracker *)&v15 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_aaTrackerName, a3);
    v11 = +[ICNAController sharedController];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __47__ICNASubTracker_initWithName_parentAATracker___block_invoke;
    v13[3] = &unk_1E64B90A0;
    v14 = v10;
    [v11 newAATrackerWithName:v7 parentAATracker:v8 completionBlock:v13];
  }
  return v10;
}

uint64_t __47__ICNASubTracker_initWithName_parentAATracker___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setAaTracker:a2];
}

- (AATracker)aaTracker
{
  return (AATracker *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAaTracker:(id)a3
{
}

- (NSString)aaTrackerName
{
  return self->_aaTrackerName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aaTrackerName, 0);
  objc_storeStrong((id *)&self->_aaTracker, 0);
}

@end