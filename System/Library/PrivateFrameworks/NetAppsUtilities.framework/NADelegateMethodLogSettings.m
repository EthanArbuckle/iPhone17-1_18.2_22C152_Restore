@interface NADelegateMethodLogSettings
- (NADelegateMethodLogSettings)init;
- (NADelegateMethodLogSettings)initWithLog:(id)a3 logType:(unsigned __int8)a4 argumentFormatter:(id)a5;
- (OS_os_log)log;
- (id)argumentFormatter;
- (id)formattedDescriptionForArgument:(id)a3;
- (id)logger;
- (unsigned)logType;
- (void)setLogger:(id)a3;
@end

@implementation NADelegateMethodLogSettings

- (id)logger
{
  return self->_logger;
}

- (OS_os_log)log
{
  return self->_log;
}

- (unsigned)logType
{
  return self->_logType;
}

- (id)formattedDescriptionForArgument:(id)a3
{
  argumentFormatter = (void (**)(id, id))self->_argumentFormatter;
  if (argumentFormatter) {
    argumentFormatter[2](argumentFormatter, a3);
  }
  else {
  v4 = [a3 description];
  }
  return v4;
}

- (NADelegateMethodLogSettings)initWithLog:(id)a3 logType:(unsigned __int8)a4 argumentFormatter:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)NADelegateMethodLogSettings;
  v11 = [(NADelegateMethodLogSettings *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_log, a3);
    v12->_logType = a4;
    uint64_t v13 = [v10 copy];
    id argumentFormatter = v12->_argumentFormatter;
    v12->_id argumentFormatter = (id)v13;
  }
  return v12;
}

- (NADelegateMethodLogSettings)init
{
  return 0;
}

- (id)argumentFormatter
{
  return self->_argumentFormatter;
}

- (void)setLogger:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_logger, 0);
  objc_storeStrong(&self->_argumentFormatter, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

@end