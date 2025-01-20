@interface WFWorkflowConflictResolution
- (BOOL)keepLocal;
- (BOOL)keepRemote;
- (NSString)localWorkflowID;
- (NSString)remoteWorkflowID;
- (id)description;
- (void)setKeepLocal:(BOOL)a3;
- (void)setKeepRemote:(BOOL)a3;
- (void)setLocalWorkflowID:(id)a3;
- (void)setRemoteWorkflowID:(id)a3;
@end

@implementation WFWorkflowConflictResolution

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteWorkflowID, 0);
  objc_storeStrong((id *)&self->_localWorkflowID, 0);
}

- (void)setKeepRemote:(BOOL)a3
{
  self->_keepRemote = a3;
}

- (BOOL)keepRemote
{
  return self->_keepRemote;
}

- (void)setKeepLocal:(BOOL)a3
{
  self->_keepLocal = a3;
}

- (BOOL)keepLocal
{
  return self->_keepLocal;
}

- (void)setRemoteWorkflowID:(id)a3
{
}

- (NSString)remoteWorkflowID
{
  return self->_remoteWorkflowID;
}

- (void)setLocalWorkflowID:(id)a3
{
}

- (NSString)localWorkflowID
{
  return self->_localWorkflowID;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  BOOL v6 = [(WFWorkflowConflictResolution *)self keepLocal];
  v7 = [(WFWorkflowConflictResolution *)self localWorkflowID];
  BOOL v8 = [(WFWorkflowConflictResolution *)self keepRemote];
  v9 = [(WFWorkflowConflictResolution *)self remoteWorkflowID];
  v10 = [v3 stringWithFormat:@"<%@ %p keepLocal=%d (%@) keepRemote=%d (%@)>", v5, self, v6, v7, v8, v9];

  return v10;
}

@end