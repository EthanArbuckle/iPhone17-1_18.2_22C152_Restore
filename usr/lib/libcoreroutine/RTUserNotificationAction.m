@interface RTUserNotificationAction
- (NSString)actionIdentifier;
- (NSString)iconWithSystemImageName;
- (NSString)title;
- (NSURL)url;
- (RTUserNotificationAction)init;
- (RTUserNotificationAction)initWithActionIdentifier:(id)a3 title:(id)a4 iconWithSystemImageName:(id)a5 handler:(id)a6;
- (id)description;
- (id)handler;
@end

@implementation RTUserNotificationAction

- (RTUserNotificationAction)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithActionIdentifier_title_iconWithSystemImageName_handler_);
}

- (RTUserNotificationAction)initWithActionIdentifier:(id)a3 title:(id)a4 iconWithSystemImageName:(id)a5 handler:(id)a6
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (v11)
  {
    if (v12) {
      goto LABEL_10;
    }
    goto LABEL_7;
  }
  v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v24 = "-[RTUserNotificationAction initWithActionIdentifier:title:iconWithSystemImageName:handler:]";
    __int16 v25 = 1024;
    int v26 = 29;
    _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: actionIdentifier (in %s:%d)", buf, 0x12u);
  }

  if (!v12)
  {
LABEL_7:
    v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v24 = "-[RTUserNotificationAction initWithActionIdentifier:title:iconWithSystemImageName:handler:]";
      __int16 v25 = 1024;
      int v26 = 30;
      _os_log_error_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: title (in %s:%d)", buf, 0x12u);
    }
  }
LABEL_10:
  v22.receiver = self;
  v22.super_class = (Class)RTUserNotificationAction;
  v17 = [(RTUserNotificationAction *)&v22 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_actionIdentifier, a3);
    objc_storeStrong((id *)&v18->_title, a4);
    objc_storeStrong((id *)&v18->_iconWithSystemImageName, a5);
    uint64_t v19 = MEMORY[0x1E016DB00](v14);
    id handler = v18->_handler;
    v18->_id handler = (id)v19;
  }
  return v18;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"action identifier, %@, title, %@, iconWithSystemImageName, %@", self->_actionIdentifier, self->_title, self->_iconWithSystemImageName];
}

- (NSString)actionIdentifier
{
  return self->_actionIdentifier;
}

- (NSString)title
{
  return self->_title;
}

- (NSURL)url
{
  return self->_url;
}

- (NSString)iconWithSystemImageName
{
  return self->_iconWithSystemImageName;
}

- (id)handler
{
  return self->_handler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_iconWithSystemImageName, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_actionIdentifier, 0);
}

@end