@interface WFWorkflowConflict
- (BOOL)isEqual:(id)a3;
- (NSString)localWorkflowID;
- (NSString)remoteWorkflowID;
- (WFWorkflowRecord)localWorkflowRecord;
- (WFWorkflowRecord)remoteWorkflowRecord;
- (id)description;
- (id)resolutionKeepingLocal:(BOOL)a3 keepingRemote:(BOOL)a4;
- (void)setLocalWorkflowID:(id)a3;
- (void)setLocalWorkflowRecord:(id)a3;
- (void)setRemoteWorkflowID:(id)a3;
- (void)setRemoteWorkflowRecord:(id)a3;
@end

@implementation WFWorkflowConflict

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteWorkflowRecord, 0);
  objc_storeStrong((id *)&self->_remoteWorkflowID, 0);
  objc_storeStrong((id *)&self->_localWorkflowRecord, 0);
  objc_storeStrong((id *)&self->_localWorkflowID, 0);
}

- (void)setRemoteWorkflowRecord:(id)a3
{
}

- (WFWorkflowRecord)remoteWorkflowRecord
{
  return self->_remoteWorkflowRecord;
}

- (void)setRemoteWorkflowID:(id)a3
{
}

- (NSString)remoteWorkflowID
{
  return self->_remoteWorkflowID;
}

- (void)setLocalWorkflowRecord:(id)a3
{
}

- (WFWorkflowRecord)localWorkflowRecord
{
  return self->_localWorkflowRecord;
}

- (void)setLocalWorkflowID:(id)a3
{
}

- (NSString)localWorkflowID
{
  return self->_localWorkflowID;
}

- (id)resolutionKeepingLocal:(BOOL)a3 keepingRemote:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v7 = objc_opt_new();
  v8 = [(WFWorkflowConflict *)self localWorkflowID];
  [v7 setLocalWorkflowID:v8];

  v9 = [(WFWorkflowConflict *)self remoteWorkflowID];
  [v7 setRemoteWorkflowID:v9];

  [v7 setKeepLocal:v5];
  [v7 setKeepRemote:v4];
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  BOOL v4 = (WFWorkflowConflict *)a3;
  if (self == v4)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v5 = v4;
      v6 = [(WFWorkflowConflict *)self localWorkflowID];
      v7 = [(WFWorkflowConflict *)v5 localWorkflowID];
      if ([v6 isEqual:v7])
      {
        v8 = [(WFWorkflowConflict *)self remoteWorkflowID];
        v9 = [(WFWorkflowConflict *)v5 remoteWorkflowID];
        char v10 = [v8 isEqual:v9];
      }
      else
      {
        char v10 = 0;
      }
    }
    else
    {
      char v10 = 0;
    }
  }

  return v10;
}

- (id)description
{
  v3 = NSString;
  BOOL v4 = (objc_class *)objc_opt_class();
  BOOL v5 = NSStringFromClass(v4);
  v6 = [(WFWorkflowConflict *)self localWorkflowID];
  v7 = [(WFWorkflowConflict *)self remoteWorkflowID];
  v8 = [v3 stringWithFormat:@"<%@ %p local: (%@) remote: (%@)>", v5, self, v6, v7];

  return v8;
}

@end