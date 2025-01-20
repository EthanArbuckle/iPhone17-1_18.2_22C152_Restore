@interface FMFAutomationHelperFactory
+ (id)sharedFactory;
- (BOOL)hasAttemptedLoad;
- (Class)automationHelperClassWithName:(id)a3;
- (NSBundle)automationHelperBundle;
- (void)setAutomationHelperBundle:(id)a3;
- (void)setHasAttemptedLoad:(BOOL)a3;
@end

@implementation FMFAutomationHelperFactory

+ (id)sharedFactory
{
  if (qword_10006D620 != -1) {
    dispatch_once(&qword_10006D620, &stru_10005A568);
  }
  v2 = (void *)qword_10006D618;

  return v2;
}

- (Class)automationHelperClassWithName:(id)a3
{
  id v4 = a3;
  v5 = sub_10001B6D4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412290;
    id v16 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Loading automation class %@", (uint8_t *)&v15, 0xCu);
  }

  if (![(FMFAutomationHelperFactory *)self hasAttemptedLoad])
  {
    v6 = +[NSBundle bundleWithPath:@"/System/Library/PrivateFrameworks/FindMyDevice.framework"];
    v7 = [v6 pathForResource:@"FMDAutomationHelpers" ofType:@"bundle"];
    v8 = +[NSBundle bundleWithPath:v7];
    [(FMFAutomationHelperFactory *)self setAutomationHelperBundle:v8];

    [(FMFAutomationHelperFactory *)self setHasAttemptedLoad:1];
  }
  if ([(FMFAutomationHelperFactory *)self hasAttemptedLoad]
    && ([(FMFAutomationHelperFactory *)self automationHelperBundle],
        v9 = objc_claimAutoreleasedReturnValue(),
        v9,
        !v9))
  {
    id v13 = 0;
  }
  else
  {
    v10 = [(FMFAutomationHelperFactory *)self automationHelperBundle];
    id v11 = [v10 classNamed:v4];

    if (!v11)
    {
      v12 = sub_10001B6D4();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_100038C54((uint64_t)v4, v12);
      }
    }
    id v13 = v11;
  }

  return (Class)v13;
}

- (BOOL)hasAttemptedLoad
{
  return self->_hasAttemptedLoad;
}

- (void)setHasAttemptedLoad:(BOOL)a3
{
  self->_hasAttemptedLoad = a3;
}

- (NSBundle)automationHelperBundle
{
  return self->_automationHelperBundle;
}

- (void)setAutomationHelperBundle:(id)a3
{
}

- (void).cxx_destruct
{
}

@end