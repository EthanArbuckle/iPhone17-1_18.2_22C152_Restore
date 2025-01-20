@interface FCFeedTransformationComposite
- (BOOL)shouldLogTransformationResults;
- (FCFeedTransformationComposite)init;
- (FCFeedTransformationComposite)initWithFeedTransformations:(id)a3;
- (FCFeedTransformationComposite)initWithFeedTransformations:(id)a3 logTransformationResults:(BOOL)a4;
- (NSArray)feedTransformations;
- (NSMutableArray)transformationLogs;
- (id)transformFeedItems:(id)a3;
- (void)setFeedTransformations:(id)a3;
@end

@implementation FCFeedTransformationComposite

- (FCFeedTransformationComposite)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCFeedTransformationComposite init]";
    __int16 v9 = 2080;
    v10 = "FCFeedTransformationComposite.m";
    __int16 v11 = 1024;
    int v12 = 27;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCFeedTransformationComposite init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (FCFeedTransformationComposite)initWithFeedTransformations:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    __int16 v9 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "feedTransformations");
    *(_DWORD *)buf = 136315906;
    int v12 = "-[FCFeedTransformationComposite initWithFeedTransformations:]";
    __int16 v13 = 2080;
    v14 = "FCFeedTransformationComposite.m";
    __int16 v15 = 1024;
    int v16 = 32;
    __int16 v17 = 2114;
    v18 = v9;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v10.receiver = self;
  v10.super_class = (Class)FCFeedTransformationComposite;
  v5 = [(FCFeedTransformationComposite *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    feedTransformations = v5->_feedTransformations;
    v5->_feedTransformations = (NSArray *)v6;
  }
  return v5;
}

- (FCFeedTransformationComposite)initWithFeedTransformations:(id)a3 logTransformationResults:(BOOL)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    objc_super v10 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "feedTransformations");
    *(_DWORD *)buf = 136315906;
    int v12 = "-[FCFeedTransformationComposite initWithFeedTransformations:logTransformationResults:]";
    __int16 v13 = 2080;
    v14 = "FCFeedTransformationComposite.m";
    __int16 v15 = 1024;
    int v16 = 43;
    __int16 v17 = 2114;
    v18 = v10;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v7 = [(FCFeedTransformationComposite *)self initWithFeedTransformations:v6];
  v8 = v7;
  if (v7) {
    v7->_shouldLogTransformationResults = a4;
  }

  return v8;
}

- (id)transformFeedItems:(id)a3
{
  id v4 = a3;
  v5 = [(FCFeedTransformationComposite *)self feedTransformations];
  int v6 = [(FCFeedTransformationComposite *)self shouldLogTransformationResults];
  v7 = [(FCFeedTransformationComposite *)self transformationLogs];
  v8 = FCApplyFeedTransformationsAndLog(v4, v5, v6);

  return v8;
}

- (BOOL)shouldLogTransformationResults
{
  return self->_shouldLogTransformationResults;
}

- (NSMutableArray)transformationLogs
{
  return self->_transformationLogs;
}

- (NSArray)feedTransformations
{
  return self->_feedTransformations;
}

- (void)setFeedTransformations:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedTransformations, 0);
  objc_storeStrong((id *)&self->_transformationLogs, 0);
}

@end