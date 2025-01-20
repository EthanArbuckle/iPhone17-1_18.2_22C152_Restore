@interface DebugSwitchCell
+ (id)preferenceSwitchWithTitle:(id)a3 preference:(unint64_t)a4;
+ (id)preferenceSwitchWithTitle:(id)a3 preference:(unint64_t)a4 didChangeHandler:(id)a5;
- (DebugSwitchCell)initWithTitle:(id)a3 defaultsKey:(id)a4 defaultKeyValue:(BOOL)a5 completion:(id)a6;
- (DebugSwitchCell)initWithTitle:(id)a3 userDefaults:(id)a4 defaultsKey:(id)a5 defaultKeyValue:(BOOL)a6 completion:(id)a7;
- (EFCancelable)featureObservation;
- (NSString)defaultsKey;
- (NSUserDefaults)userDefaults;
- (UISwitch)selectionSwitch;
- (id)completionHandler;
- (void)_handleSwitchValueChange:(id)a3 event:(id)a4;
- (void)setCompletionHandler:(id)a3;
- (void)setDefaultsKey:(id)a3;
- (void)setFeatureObservation:(id)a3;
- (void)setSelectionSwitch:(id)a3;
- (void)setUserDefaults:(id)a3;
@end

@implementation DebugSwitchCell

+ (id)preferenceSwitchWithTitle:(id)a3 preference:(unint64_t)a4
{
  v4 = [a1 preferenceSwitchWithTitle:a3 preference:a4 didChangeHandler:0];

  return v4;
}

+ (id)preferenceSwitchWithTitle:(id)a3 preference:(unint64_t)a4 didChangeHandler:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  v9 = +[EMInternalPreferences defaultForPreference:a4];
  v10 = [DebugSwitchCell alloc];
  v11 = +[NSUserDefaults em_userDefaults];
  v12 = [(DebugSwitchCell *)v10 initWithTitle:v7 userDefaults:v11 defaultsKey:v9 defaultKeyValue:0 completion:v8];

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000A90F8;
  v16[3] = &unk_1006064A8;
  v13 = v12;
  v17 = v13;
  v14 = +[EMInternalPreferences observeChangesForPreference:a4 usingBlock:v16];
  [(DebugSwitchCell *)v13 setFeatureObservation:v14];

  return v13;
}

- (DebugSwitchCell)initWithTitle:(id)a3 defaultsKey:(id)a4 defaultKeyValue:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v13 = +[NSUserDefaults standardUserDefaults];
  v14 = [(DebugSwitchCell *)self initWithTitle:v10 userDefaults:v13 defaultsKey:v11 defaultKeyValue:v7 completion:v12];

  return v14;
}

- (DebugSwitchCell)initWithTitle:(id)a3 userDefaults:(id)a4 defaultsKey:(id)a5 defaultKeyValue:(BOOL)a6 completion:(id)a7
{
  id v8 = (id)a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  v26.receiver = self;
  v26.super_class = (Class)DebugSwitchCell;
  v16 = [(DebugSwitchCell *)&v26 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_userDefaults, a4);
    id v18 = objc_retainBlock(v15);
    id completionHandler = v17->_completionHandler;
    v17->_id completionHandler = v18;

    v20 = (UISwitch *)objc_alloc_init((Class)UISwitch);
    selectionSwitch = v17->_selectionSwitch;
    v17->_selectionSwitch = v20;

    objc_storeStrong((id *)&v17->_defaultsKey, a5);
    [(UISwitch *)v17->_selectionSwitch addTarget:v17 action:"_handleSwitchValueChange:event:" forControlEvents:4096];
    v22 = [(NSUserDefaults *)v17->_userDefaults valueForKey:v14];
    v23 = v22;
    if (v22) {
      id v8 = [v22 BOOLValue];
    }
    [(UISwitch *)v17->_selectionSwitch setOn:v8];
    v24 = [(DebugSwitchCell *)v17 textLabel];
    [v24 setText:v12];

    [(DebugSwitchCell *)v17 setAccessoryView:v17->_selectionSwitch];
    [(DebugSwitchCell *)v17 setSelectionStyle:0];
  }
  return v17;
}

- (void)_handleSwitchValueChange:(id)a3 event:(id)a4
{
  [(NSUserDefaults *)self->_userDefaults setBool:[(UISwitch *)self->_selectionSwitch isOn] forKey:self->_defaultsKey];
  [(NSUserDefaults *)self->_userDefaults synchronize];
  v5 = [(DebugSwitchCell *)self completionHandler];

  if (v5)
  {
    v6 = [(DebugSwitchCell *)self completionHandler];
    v6[2]();
  }
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void)setUserDefaults:(id)a3
{
}

- (UISwitch)selectionSwitch
{
  return self->_selectionSwitch;
}

- (void)setSelectionSwitch:(id)a3
{
}

- (NSString)defaultsKey
{
  return self->_defaultsKey;
}

- (void)setDefaultsKey:(id)a3
{
}

- (EFCancelable)featureObservation
{
  return self->_featureObservation;
}

- (void)setFeatureObservation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureObservation, 0);
  objc_storeStrong((id *)&self->_defaultsKey, 0);
  objc_storeStrong((id *)&self->_selectionSwitch, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);

  objc_storeStrong(&self->_completionHandler, 0);
}

@end