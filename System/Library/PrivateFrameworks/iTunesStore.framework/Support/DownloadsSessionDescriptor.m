@interface DownloadsSessionDescriptor
- (DownloadPipeline)pipeline;
- (DownloadPolicyManager)policyManager;
- (ExternalDownloadState)externalState;
- (SSSQLiteDatabase)database;
- (id)copyWithZone:(_NSZone *)a3;
- (void)dealloc;
- (void)setDatabase:(id)a3;
- (void)setExternalState:(id)a3;
- (void)setPipeline:(id)a3;
- (void)setPolicyManager:(id)a3;
@end

@implementation DownloadsSessionDescriptor

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)DownloadsSessionDescriptor;
  [(DownloadsSessionDescriptor *)&v3 dealloc];
}

- (void)setPolicyManager:(id)a3
{
}

- (void)setPipeline:(id)a3
{
}

- (void)setExternalState:(id)a3
{
}

- (void)setDatabase:(id)a3
{
}

- (ExternalDownloadState)externalState
{
  return self->_externalState;
}

- (DownloadPolicyManager)policyManager
{
  return self->_policyManager;
}

- (DownloadPipeline)pipeline
{
  return self->_pipeline;
}

- (SSSQLiteDatabase)database
{
  return self->_database;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v4[1] = self->_database;
  v4[2] = self->_externalState;
  v4[3] = self->_pipeline;
  v4[4] = self->_policyManager;
  return v4;
}

@end