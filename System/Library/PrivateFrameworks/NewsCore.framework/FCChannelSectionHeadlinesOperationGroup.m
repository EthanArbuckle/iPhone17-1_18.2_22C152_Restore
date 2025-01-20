@interface FCChannelSectionHeadlinesOperationGroup
- (FCChannelSectionHeadlinesOperationGroup)init;
- (FCChannelSectionHeadlinesOperationGroup)initWithSection:(id)a3 headlines:(id)a4;
- (FCSectionProviding)section;
- (NSArray)headlines;
- (id)description;
- (void)setHeadlines:(id)a3;
- (void)setSection:(id)a3;
@end

@implementation FCChannelSectionHeadlinesOperationGroup

- (FCChannelSectionHeadlinesOperationGroup)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCChannelSectionHeadlinesOperationGroup init]";
    __int16 v9 = 2080;
    v10 = "FCChannelSectionHeadlinesFetchOperation.m";
    __int16 v11 = 1024;
    int v12 = 31;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCChannelSectionHeadlinesOperationGroup init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (FCChannelSectionHeadlinesOperationGroup)initWithSection:(id)a3 headlines:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)FCChannelSectionHeadlinesOperationGroup;
  v8 = [(FCChannelSectionHeadlinesOperationGroup *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    section = v8->_section;
    v8->_section = (FCSectionProviding *)v9;

    uint64_t v11 = [v7 copy];
    headlines = v8->_headlines;
    v8->_headlines = (NSArray *)v11;
  }
  return v8;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"%@: section = %@, headlines = %@", objc_opt_class(), self->_section, self->_headlines];
}

- (FCSectionProviding)section
{
  return self->_section;
}

- (void)setSection:(id)a3
{
}

- (NSArray)headlines
{
  return self->_headlines;
}

- (void)setHeadlines:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headlines, 0);
  objc_storeStrong((id *)&self->_section, 0);
}

@end