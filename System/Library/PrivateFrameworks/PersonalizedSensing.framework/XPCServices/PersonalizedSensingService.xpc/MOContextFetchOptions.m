@interface MOContextFetchOptions
+ (BOOL)supportsSecureCoding;
- (MOContextFetchOptions)init;
- (MOContextFetchOptions)initWithCoder:(id)a3;
- (MOContextFetchOptions)initWithContextFormat:(unint64_t)a3 contextRetrieval:(unint64_t)a4 contextCount:(unint64_t)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)contextCount;
- (unint64_t)contextFormat;
- (unint64_t)contextRetrieval;
- (void)encodeWithCoder:(id)a3;
- (void)setContextCount:(unint64_t)a3;
- (void)setContextFormat:(unint64_t)a3;
- (void)setContextRetrieval:(unint64_t)a3;
@end

@implementation MOContextFetchOptions

- (MOContextFetchOptions)init
{
  v3.receiver = self;
  v3.super_class = (Class)MOContextFetchOptions;
  return [(MOContextFetchOptions *)&v3 init];
}

- (MOContextFetchOptions)initWithContextFormat:(unint64_t)a3 contextRetrieval:(unint64_t)a4 contextCount:(unint64_t)a5
{
  v12.receiver = self;
  v12.super_class = (Class)MOContextFetchOptions;
  v8 = [(MOContextFetchOptions *)&v12 init];
  v9 = v8;
  if (v8)
  {
    v8->_contextFormat = a3;
    v8->_contextRetrieval = a4;
    v8->_contextCount = a5;
    v10 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218496;
      unint64_t v14 = a3;
      __int16 v15 = 2048;
      unint64_t v16 = a4;
      __int16 v17 = 2048;
      unint64_t v18 = a5;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "ContextFetchOptions contextFormat,%lu,contextRetrieval,%lu,contextCount,%lu", buf, 0x20u);
    }
  }
  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [MOContextFetchOptions alloc];
  unint64_t v5 = [(MOContextFetchOptions *)self contextFormat];
  unint64_t v6 = [(MOContextFetchOptions *)self contextRetrieval];
  unint64_t v7 = [(MOContextFetchOptions *)self contextCount];
  return [(MOContextFetchOptions *)v4 initWithContextFormat:v5 contextRetrieval:v6 contextCount:v7];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t contextFormat = self->_contextFormat;
  id v5 = a3;
  [v5 encodeInteger:contextFormat forKey:@"contextFormat"];
  [v5 encodeInteger:self->_contextRetrieval forKey:@"contextRetrieval"];
  [v5 encodeInteger:self->_contextCount forKey:@"contextCount"];
}

- (MOContextFetchOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeIntegerForKey:@"contextFormat"];
  id v6 = [v4 decodeIntegerForKey:@"contextRetrieval"];
  id v7 = [v4 decodeIntegerForKey:@"contextCount"];

  return [(MOContextFetchOptions *)self initWithContextFormat:v5 contextRetrieval:v6 contextCount:v7];
}

- (unint64_t)contextFormat
{
  return self->_contextFormat;
}

- (void)setContextFormat:(unint64_t)a3
{
  self->_unint64_t contextFormat = a3;
}

- (unint64_t)contextRetrieval
{
  return self->_contextRetrieval;
}

- (void)setContextRetrieval:(unint64_t)a3
{
  self->_contextRetrieval = a3;
}

- (unint64_t)contextCount
{
  return self->_contextCount;
}

- (void)setContextCount:(unint64_t)a3
{
  self->_contextCount = a3;
}

@end