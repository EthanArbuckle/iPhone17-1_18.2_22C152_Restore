@interface OOSRecoveryMetricOOSStartState
- (NSString)registrationState;
- (OOSRecoveryMetricCellInfo)cellInfo;
- (OOSRecoveryMetricOOSStartState)initWithTimestamp:(unint64_t)a3 registrationState:(id)a4 cellInfo:(id)a5;
- (id)description;
- (unint64_t)timestamp;
@end

@implementation OOSRecoveryMetricOOSStartState

- (OOSRecoveryMetricOOSStartState)initWithTimestamp:(unint64_t)a3 registrationState:(id)a4 cellInfo:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)OOSRecoveryMetricOOSStartState;
  v11 = [(OOSRecoveryMetricOOSStartState *)&v15 init];
  v12 = v11;
  if (v11)
  {
    v11->_timestamp = a3;
    objc_storeStrong((id *)&v11->_registrationState, a4);
    objc_storeStrong((id *)&v12->_cellInfo, a5);
    v13 = v12;
  }

  return v12;
}

- (id)description
{
  unint64_t v3 = [(OOSRecoveryMetricOOSStartState *)self timestamp];
  v4 = [(OOSRecoveryMetricOOSStartState *)self registrationState];
  v5 = [(OOSRecoveryMetricOOSStartState *)self cellInfo];
  v6 = +[NSString stringWithFormat:@"timestamp %llu, registrationState %@, cellInfo %@", v3, v4, v5];

  return v6;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)registrationState
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (OOSRecoveryMetricCellInfo)cellInfo
{
  return (OOSRecoveryMetricCellInfo *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellInfo, 0);

  objc_storeStrong((id *)&self->_registrationState, 0);
}

@end