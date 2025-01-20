@interface _EDMigrationBackgroundTask
- (BGSystemTask)systemTask;
- (NSString)ef_publicDescription;
- (_EDMigrationBackgroundTask)initWithSystemTask:(id)a3 migrator:(id)a4 cancelable:(id)a5;
- (void)cancel;
- (void)setSystemTask:(id)a3;
@end

@implementation _EDMigrationBackgroundTask

- (_EDMigrationBackgroundTask)initWithSystemTask:(id)a3 migrator:(id)a4 cancelable:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)_EDMigrationBackgroundTask;
  v12 = [(_EDMigrationBackgroundTask *)&v20 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_systemTask, a3);
    objc_storeStrong(&v13->_migrator, a4);
    id v14 = objc_alloc_init(MEMORY[0x1E4F60D28]);
    [v14 addCancelable:v11];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __69___EDMigrationBackgroundTask_initWithSystemTask_migrator_cancelable___block_invoke;
    v18[3] = &unk_1E5D3B5C0;
    id v19 = v9;
    [v14 addCancelationBlock:v18];
    cancelationToken = v13->_cancelationToken;
    v13->_cancelationToken = (EFCancelationToken *)v14;
    id v16 = v14;
  }
  return v13;
}

- (void)cancel
{
}

- (NSString)ef_publicDescription
{
  id v3 = [NSString alloc];
  if ([(EFCancelationToken *)self->_cancelationToken isCanceled]) {
    v4 = @" (canceled)";
  }
  else {
    v4 = &stru_1EFF11268;
  }
  v5 = [(_EDMigrationBackgroundTask *)self systemTask];
  v6 = (void *)[v3 initWithFormat:@"%p%@: %@", self, v4, v5];

  return (NSString *)v6;
}

- (BGSystemTask)systemTask
{
  return self->_systemTask;
}

- (void)setSystemTask:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemTask, 0);
  objc_storeStrong((id *)&self->_cancelationToken, 0);
  objc_storeStrong(&self->_migrator, 0);
}

@end