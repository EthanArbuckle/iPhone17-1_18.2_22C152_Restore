@interface OOSRecoveryMetricState
- (BOOL)isDataContext;
- (BOOL)knownOosGcisSizeLimited;
- (BOOL)knownOosTacsSizeLimited;
- (NSMutableOrderedSet)knownOosGcis;
- (NSMutableOrderedSet)knownOosTacs;
- (NSString)registrationState;
- (OOSRecoveryMetricCellInfo)cellInfo;
- (OOSRecoveryMetricOOSStartState)oosStart;
- (OOSRecoveryMetricState)initWithIsDataContext:(BOOL)a3 registrationState:(id)a4 cellInfo:(id)a5;
- (id)description;
- (void)setCellInfo:(id)a3;
- (void)setIsDataContext:(BOOL)a3;
- (void)setKnownOosGcis:(id)a3;
- (void)setKnownOosGcisSizeLimited:(BOOL)a3;
- (void)setKnownOosTacs:(id)a3;
- (void)setKnownOosTacsSizeLimited:(BOOL)a3;
- (void)setOosStart:(id)a3;
- (void)setRegistrationState:(id)a3;
@end

@implementation OOSRecoveryMetricState

- (void)setCellInfo:(id)a3
{
}

- (OOSRecoveryMetricOOSStartState)oosStart
{
  return (OOSRecoveryMetricOOSStartState *)objc_getProperty(self, a2, 16, 1);
}

- (OOSRecoveryMetricState)initWithIsDataContext:(BOOL)a3 registrationState:(id)a4 cellInfo:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)OOSRecoveryMetricState;
  v10 = [(OOSRecoveryMetricState *)&v16 init];
  v11 = v10;
  if (v10)
  {
    [(OOSRecoveryMetricState *)v10 setOosStart:0];
    [(OOSRecoveryMetricState *)v11 setIsDataContext:v6];
    [(OOSRecoveryMetricState *)v11 setRegistrationState:v8];
    [(OOSRecoveryMetricState *)v11 setCellInfo:v9];
    id v12 = objc_alloc_init((Class)NSMutableOrderedSet);
    [(OOSRecoveryMetricState *)v11 setKnownOosTacs:v12];

    [(OOSRecoveryMetricState *)v11 setKnownOosTacsSizeLimited:0];
    id v13 = objc_alloc_init((Class)NSMutableOrderedSet);
    [(OOSRecoveryMetricState *)v11 setKnownOosGcis:v13];

    [(OOSRecoveryMetricState *)v11 setKnownOosGcisSizeLimited:0];
    v14 = v11;
  }

  return v11;
}

- (id)description
{
  if ([(OOSRecoveryMetricState *)self isDataContext]) {
    CFStringRef v3 = @"YES";
  }
  else {
    CFStringRef v3 = @"NO";
  }
  v4 = [(OOSRecoveryMetricState *)self registrationState];
  v5 = [(OOSRecoveryMetricState *)self cellInfo];
  BOOL v6 = [(OOSRecoveryMetricState *)self oosStart];
  if ([(OOSRecoveryMetricState *)self knownOosTacsSizeLimited]) {
    CFStringRef v7 = @"YES";
  }
  else {
    CFStringRef v7 = @"NO";
  }
  if ([(OOSRecoveryMetricState *)self knownOosGcisSizeLimited]) {
    CFStringRef v8 = @"YES";
  }
  else {
    CFStringRef v8 = @"NO";
  }
  id v9 = [(OOSRecoveryMetricState *)self knownOosTacs];
  id v10 = [v9 count];
  v11 = [(OOSRecoveryMetricState *)self knownOosGcis];
  id v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"isDataContext %@, registrationState %@, cellInfo %@, oosStart %@, knownOosTacsSizeLimited %@, knownGcisSizeLimited %@, knownOosTacs %lu, knownOosGcis %lu", v3, v4, v5, v6, v7, v8, v10, [v11 count]);

  return v12;
}

- (void)setOosStart:(id)a3
{
}

- (BOOL)isDataContext
{
  return self->_isDataContext;
}

- (void)setIsDataContext:(BOOL)a3
{
  self->_isDataContext = a3;
}

- (NSString)registrationState
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setRegistrationState:(id)a3
{
}

- (OOSRecoveryMetricCellInfo)cellInfo
{
  return (OOSRecoveryMetricCellInfo *)objc_getProperty(self, a2, 32, 1);
}

- (NSMutableOrderedSet)knownOosTacs
{
  return (NSMutableOrderedSet *)objc_getProperty(self, a2, 40, 1);
}

- (void)setKnownOosTacs:(id)a3
{
}

- (BOOL)knownOosTacsSizeLimited
{
  return self->_knownOosTacsSizeLimited;
}

- (void)setKnownOosTacsSizeLimited:(BOOL)a3
{
  self->_knownOosTacsSizeLimited = a3;
}

- (NSMutableOrderedSet)knownOosGcis
{
  return (NSMutableOrderedSet *)objc_getProperty(self, a2, 48, 1);
}

- (void)setKnownOosGcis:(id)a3
{
}

- (BOOL)knownOosGcisSizeLimited
{
  return self->_knownOosGcisSizeLimited;
}

- (void)setKnownOosGcisSizeLimited:(BOOL)a3
{
  self->_knownOosGcisSizeLimited = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_knownOosGcis, 0);
  objc_storeStrong((id *)&self->_knownOosTacs, 0);
  objc_storeStrong((id *)&self->_cellInfo, 0);
  objc_storeStrong((id *)&self->_registrationState, 0);

  objc_storeStrong((id *)&self->_oosStart, 0);
}

@end