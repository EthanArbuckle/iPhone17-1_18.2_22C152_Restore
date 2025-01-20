@interface NPKSettingsPreservingFileDataAccessor
- (NPKCompanionAgentConnection)connection;
- (NSString)objectUniqueID;
- (void)setConnection:(id)a3;
- (void)setObjectUniqueID:(id)a3;
- (void)updateSettings:(unint64_t)a3;
@end

@implementation NPKSettingsPreservingFileDataAccessor

- (void)updateSettings:(unint64_t)a3
{
  connection = self->_connection;
  id v5 = [(NPKSettingsPreservingFileDataAccessor *)self objectUniqueID];
  [(NPKCompanionAgentConnection *)connection updateSettings:a3 forPassWithUniqueID:v5];
}

- (NPKCompanionAgentConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (NSString)objectUniqueID
{
  return self->_objectUniqueID;
}

- (void)setObjectUniqueID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectUniqueID, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end