@interface PRSFTETask
- (BOOL)allowLocation;
- (BOOL)needsBag;
- (PRSFTETask)initWithReply:(id)a3;
- (id)reply;
- (void)setReply:(id)a3;
- (void)triggerQuery:(BOOL)a3;
@end

@implementation PRSFTETask

- (BOOL)needsBag
{
  return 1;
}

- (PRSFTETask)initWithReply:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PRSFTETask;
  v5 = [(PRSFTETask *)&v9 init];
  if (v5)
  {
    uint64_t v6 = MEMORY[0x1C1885400](v4);
    id reply = v5->_reply;
    v5->_id reply = (id)v6;
  }
  return v5;
}

- (void)triggerQuery:(BOOL)a3
{
  id v4 = +[PRSBagHandler sharedHandler];
  if ([v4 status] == 4)
  {
    v5 = PRSLogCategoryDefault();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[PRSFTETask triggerQuery:](v5);
    }

    (*((void (**)(void))self->_reply + 2))();
  }
  else
  {
    id reply = (void (**)(id, void *, void *, void *, void *, void))self->_reply;
    v7 = [v4 fteLocString];
    v8 = [v4 fteLearnMoreString];
    objc_super v9 = [v4 fteContinueString];
    v10 = [v4 enabledDomains];
    reply[2](reply, v7, v8, v9, v10, 0);
  }
}

- (BOOL)allowLocation
{
  return 1;
}

- (id)reply
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setReply:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)triggerQuery:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1BDB2A000, log, OS_LOG_TYPE_DEBUG, "[FTE] returning nil in trigger query", v1, 2u);
}

@end