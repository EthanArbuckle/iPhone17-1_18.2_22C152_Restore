@interface ChromeMapSettingsApplication
- (ChromeMapSettingsApplication)initWithSettingsDictionary:(id)a3;
- (NSArray)completionHandlers;
- (NSDictionary)settingsDictionary;
- (void)addCompletionHandler:(id)a3;
@end

@implementation ChromeMapSettingsApplication

- (ChromeMapSettingsApplication)initWithSettingsDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ChromeMapSettingsApplication;
  v5 = [(ChromeMapSettingsApplication *)&v11 init];
  if (v5)
  {
    v6 = (NSDictionary *)[v4 copy];
    settingsDictionary = v5->_settingsDictionary;
    v5->_settingsDictionary = v6;

    uint64_t v8 = +[NSMutableArray array];
    completionHandlers = v5->_completionHandlers;
    v5->_completionHandlers = (NSMutableArray *)v8;
  }
  return v5;
}

- (NSArray)completionHandlers
{
  id v2 = [(NSMutableArray *)self->_completionHandlers copy];

  return (NSArray *)v2;
}

- (void)addCompletionHandler:(id)a3
{
  if (a3)
  {
    completionHandlers = self->_completionHandlers;
    id v4 = [a3 copy];
    [(NSMutableArray *)completionHandlers addObject:v4];
  }
}

- (NSDictionary)settingsDictionary
{
  return self->_settingsDictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionHandlers, 0);

  objc_storeStrong((id *)&self->_settingsDictionary, 0);
}

@end