@interface BMXPCSyncChangeReporter
- (BMXPCSyncChangeReporter)init;
- (BOOL)streamUpdatedForStreamName:(id)a3 deviceIdentifier:(id)a4 error:(id *)a5;
- (BOOL)userDeletesForStreamName:(id)a3 deviceIdentifier:(id)a4 error:(id *)a5;
- (id)streamRemoteIdentifierForStreamName:(id)a3 deviceIdentifier:(id)a4;
@end

@implementation BMXPCSyncChangeReporter

- (BMXPCSyncChangeReporter)init
{
  v6.receiver = self;
  v6.super_class = (Class)BMXPCSyncChangeReporter;
  v2 = [(BMXPCSyncChangeReporter *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    coordinationService = v2->_coordinationService;
    v2->_coordinationService = (GDXPCCoordinationService *)v3;
  }
  return v2;
}

- (id)streamRemoteIdentifierForStreamName:(id)a3 deviceIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [objc_alloc((Class)NSString) initWithFormat:@"%@:remotes:%@", v6, v5];

  return v7;
}

- (BOOL)streamUpdatedForStreamName:(id)a3 deviceIdentifier:(id)a4 error:(id *)a5
{
  id v7 = [(BMXPCSyncChangeReporter *)self streamRemoteIdentifierForStreamName:a3 deviceIdentifier:a4];
  coordinationService = self->_coordinationService;
  id v14 = 0;
  unsigned __int8 v9 = [(GDXPCCoordinationService *)coordinationService streamUpdatedWithStreamName:v7 isDelete:0 error:&v14];
  id v10 = v14;
  v11 = v10;
  if ((v9 & 1) == 0)
  {
    if (a5) {
      *a5 = v10;
    }
    v12 = __biome_log_for_category();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100044320();
    }
  }
  return v9;
}

- (BOOL)userDeletesForStreamName:(id)a3 deviceIdentifier:(id)a4 error:(id *)a5
{
  id v7 = [(BMXPCSyncChangeReporter *)self streamRemoteIdentifierForStreamName:a3 deviceIdentifier:a4];
  coordinationService = self->_coordinationService;
  id v14 = 0;
  unsigned __int8 v9 = [(GDXPCCoordinationService *)coordinationService streamUpdatedWithStreamName:v7 isDelete:1 error:&v14];
  id v10 = v14;
  v11 = v10;
  if ((v9 & 1) == 0)
  {
    if (a5) {
      *a5 = v10;
    }
    v12 = __biome_log_for_category();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100044388();
    }
  }
  return v9;
}

- (void).cxx_destruct
{
}

@end