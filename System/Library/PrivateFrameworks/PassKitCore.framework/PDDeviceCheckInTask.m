@interface PDDeviceCheckInTask
- (BOOL)canPromptForAuth;
- (BOOL)cancelled;
- (BOOL)isEqual:(id)a3;
- (NSMutableArray)completionHandlers;
- (NSUUID)identifier;
- (PDDeviceCheckInTask)init;
- (void)setCanPromptForAuth:(BOOL)a3;
- (void)setCancelled:(BOOL)a3;
- (void)setCompletionHandlers:(id)a3;
- (void)setIdentifier:(id)a3;
@end

@implementation PDDeviceCheckInTask

- (PDDeviceCheckInTask)init
{
  v8.receiver = self;
  v8.super_class = (Class)PDDeviceCheckInTask;
  v2 = [(PDDeviceCheckInTask *)&v8 init];
  if (v2)
  {
    uint64_t v3 = +[NSUUID UUID];
    identifier = v2->_identifier;
    v2->_identifier = (NSUUID *)v3;

    v5 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    completionHandlers = v2->_completionHandlers;
    v2->_completionHandlers = v5;
  }
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v4 = PKEqualObjects();
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (void)setIdentifier:(id)a3
{
}

- (BOOL)canPromptForAuth
{
  return self->_canPromptForAuth;
}

- (void)setCanPromptForAuth:(BOOL)a3
{
  self->_canPromptForAuth = a3;
}

- (NSMutableArray)completionHandlers
{
  return (NSMutableArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCompletionHandlers:(id)a3
{
}

- (BOOL)cancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionHandlers, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end