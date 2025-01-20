@interface _DASNetworkMonitorEvaluationGroup
- (BOOL)isEqual:(id)a3;
- (BOOL)isMonitoringActivityID:(id)a3;
- (BOOL)isMonitoringWithParameters:(id)a3 endpoint:(id)a4;
- (BOOL)isNetworkPathAvailable;
- (BOOL)stopMonitoringForActivityID:(id)a3;
- (NSMutableSet)activityIDs;
- (NWEndpoint)endpoint;
- (NWParameters)parameters;
- (OS_nw_path_evaluator)evaluator;
- (OS_os_log)log;
- (_DASNetworkMonitorEvaluationGroup)initWithEndpoint:(id)a3 parameters:(id)a4 activityID:(id)a5 callback:(id)a6 onQueue:(id)a7;
- (id)debugDescription;
- (id)description;
- (unint64_t)hash;
- (void)startMonitoringForActivityID:(id)a3;
@end

@implementation _DASNetworkMonitorEvaluationGroup

- (_DASNetworkMonitorEvaluationGroup)initWithEndpoint:(id)a3 parameters:(id)a4 activityID:(id)a5 callback:(id)a6 onQueue:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v33.receiver = self;
  v33.super_class = (Class)_DASNetworkMonitorEvaluationGroup;
  v18 = [(_DASNetworkMonitorEvaluationGroup *)&v33 init];
  v19 = v18;
  if (!v18) {
    goto LABEL_4;
  }
  objc_storeStrong((id *)&v18->_endpoint, a3);
  objc_storeStrong((id *)&v19->_parameters, a4);
  id v20 = [v13 copyCEndpoint];
  id v21 = [v14 copyCParameters];
  uint64_t evaluator_for_endpoint = nw_path_create_evaluator_for_endpoint();
  evaluator = v19->_evaluator;
  v19->_evaluator = (OS_nw_path_evaluator *)evaluator_for_endpoint;

  uint64_t v24 = +[NSMutableSet setWithObject:v15];
  activityIDs = v19->_activityIDs;
  v19->_activityIDs = (NSMutableSet *)v24;

  os_log_t v26 = os_log_create("com.apple.duetactivityscheduler", "NetworkMonitorEvaluationGroup");
  log = v19->_log;
  v19->_log = (OS_os_log *)v26;

  id v32 = v16;
  v28 = v19;
  if (nw_path_evaluator_set_update_handler())
  {

LABEL_4:
    v29 = v19;
    goto LABEL_8;
  }
  v30 = v19->_log;
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
    sub_10010061C(v30, v28);
  }

  v29 = 0;
LABEL_8:

  return v29;
}

- (void)startMonitoringForActivityID:(id)a3
{
  id v5 = a3;
  v4 = self->_activityIDs;
  objc_sync_enter(v4);
  [(NSMutableSet *)self->_activityIDs addObject:v5];
  objc_sync_exit(v4);
}

- (BOOL)stopMonitoringForActivityID:(id)a3
{
  id v4 = a3;
  id v5 = self->_activityIDs;
  objc_sync_enter(v5);
  [(NSMutableSet *)self->_activityIDs removeObject:v4];
  id v6 = [(NSMutableSet *)self->_activityIDs count];
  if (!v6) {
    nw_path_evaluator_cancel();
  }
  objc_sync_exit(v5);

  return v6 == 0;
}

- (BOOL)isMonitoringActivityID:(id)a3
{
  id v4 = a3;
  id v5 = self->_activityIDs;
  objc_sync_enter(v5);
  LOBYTE(self) = [(NSMutableSet *)self->_activityIDs containsObject:v4];
  objc_sync_exit(v5);

  return (char)self;
}

- (BOOL)isMonitoringWithParameters:(id)a3 endpoint:(id)a4
{
  id v6 = a4;
  parameters = self->_parameters;
  id v8 = a3;
  id v9 = [(NWParameters *)parameters copyCParameters];
  id v10 = [v8 copyCParameters];

  if (nw_parameters_are_equivalent_for_path_evaluation()) {
    unsigned __int8 v11 = [(NWEndpoint *)self->_endpoint isEqual:v6];
  }
  else {
    unsigned __int8 v11 = 0;
  }

  return v11;
}

- (BOOL)isNetworkPathAvailable
{
  v2 = nw_path_evaluator_copy_path();
  BOOL v3 = nw_path_get_status(v2) != nw_path_status_unsatisfied;

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_DASNetworkMonitorEvaluationGroup *)a3;
  if (v4 == self)
  {
    unsigned __int8 v15 = 1;
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)_DASNetworkMonitorEvaluationGroup;
    if ([(_DASNetworkMonitorEvaluationGroup *)&v17 isEqual:v4])
    {
      id v5 = v4;
      id v6 = self->_activityIDs;
      objc_sync_enter(v6);
      endpoint = self->_endpoint;
      id v8 = [(_DASNetworkMonitorEvaluationGroup *)v5 endpoint];
      if ([(NWEndpoint *)endpoint isEqual:v8])
      {
        parameters = self->_parameters;
        id v10 = [(_DASNetworkMonitorEvaluationGroup *)v5 parameters];
        if ([(NWParameters *)parameters isEqual:v10])
        {
          evaluator = self->_evaluator;
          v12 = [(_DASNetworkMonitorEvaluationGroup *)v5 evaluator];
          if ([(OS_nw_path_evaluator *)evaluator isEqual:v12])
          {
            activityIDs = self->_activityIDs;
            id v14 = [(_DASNetworkMonitorEvaluationGroup *)v5 activityIDs];
            unsigned __int8 v15 = [(NSMutableSet *)activityIDs isEqual:v14];
          }
          else
          {
            unsigned __int8 v15 = 0;
          }
        }
        else
        {
          unsigned __int8 v15 = 0;
        }
      }
      else
      {
        unsigned __int8 v15 = 0;
      }

      objc_sync_exit(v6);
    }
    else
    {
      unsigned __int8 v15 = 0;
    }
  }

  return v15;
}

- (unint64_t)hash
{
  BOOL v3 = self->_activityIDs;
  objc_sync_enter(v3);
  unint64_t v4 = (unint64_t)[(NWEndpoint *)self->_endpoint hash];
  id v5 = [(NWParameters *)self->_parameters hash];
  id v6 = [(OS_nw_path_evaluator *)self->_evaluator hash];
  unint64_t v7 = v4 ^ (2 * (void)v5) ^ (4 * (void)v6) ^ (8 * (void)[(NSMutableSet *)self->_activityIDs hash]);
  objc_sync_exit(v3);

  return v7;
}

- (id)description
{
  BOOL v3 = self->_activityIDs;
  objc_sync_enter(v3);
  unint64_t v4 = +[NSString stringWithFormat:@"<%@: %p> Activity IDs: %@", objc_opt_class(), self, self->_activityIDs];
  objc_sync_exit(v3);

  return v4;
}

- (id)debugDescription
{
  BOOL v3 = self->_activityIDs;
  objc_sync_enter(v3);
  unint64_t v4 = +[NSString stringWithFormat:@"<%@: %p> Endpoint: %@, Parameters: %@, Activity IDs: %@", objc_opt_class(), self, self->_endpoint, self->_parameters, self->_activityIDs];
  objc_sync_exit(v3);

  return v4;
}

- (NWEndpoint)endpoint
{
  return self->_endpoint;
}

- (NWParameters)parameters
{
  return self->_parameters;
}

- (NSMutableSet)activityIDs
{
  return self->_activityIDs;
}

- (OS_nw_path_evaluator)evaluator
{
  return self->_evaluator;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_evaluator, 0);
  objc_storeStrong((id *)&self->_activityIDs, 0);
  objc_storeStrong((id *)&self->_parameters, 0);

  objc_storeStrong((id *)&self->_endpoint, 0);
}

@end