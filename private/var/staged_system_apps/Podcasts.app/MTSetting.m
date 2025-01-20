@interface MTSetting
+ (id)appThemeButtonSettingWithTitle:(id)a3 identifier:(id)a4 changeHandler:(id)a5;
+ (id)buttonSettingWithTitle:(id)a3 detailText:(id)a4 identifier:(id)a5 changeHandler:(id)a6;
+ (id)buttonSettingWithTitle:(id)a3 identifier:(id)a4 changeHandler:(id)a5;
+ (id)drilldownSettingWithTitle:(id)a3 valueLabel:(id)a4 identifier:(id)a5 viewControllerGenerator:(id)a6;
+ (id)informativeSettingWithText:(id)a3 identifier:(id)a4;
+ (id)loadingSettingWithIdentifier:(id)a3;
+ (id)optionSettingWithTitle:(id)a3 footerText:(id)a4 initialValue:(unint64_t)a5 optionDescription:(id)a6 identifier:(id)a7 changeHandler:(id)a8;
+ (id)optionSettingWithTitle:(id)a3 headerTitle:(id)a4 footerText:(id)a5 initialValue:(unint64_t)a6 optionDescription:(id)a7 identifier:(id)a8 changeHandler:(id)a9;
+ (id)radioOptionWithTitle:(id)a3 radioGroup:(id)a4 value:(unint64_t)a5 identifier:(id)a6;
+ (id)switchSettingWithTitle:(id)a3 initialValue:(BOOL)a4 identifier:(id)a5 changeHandler:(id)a6;
+ (id)textSettingWithInitialValue:(id)a3 placeholder:(id)a4 identifier:(id)a5 changeHandler:(id)a6;
- (BOOL)enabled;
- (MTSetting)init;
- (MTSettingsGroup)group;
- (NSDictionary)userInfo;
- (NSString)identifier;
- (NSString)title;
- (id)changeHandler;
- (id)generator;
- (id)value;
- (int64_t)type;
- (void)setChangeHandler:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setGenerator:(id)a3;
- (void)setGroup:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setTitle:(id)a3;
- (void)setType:(int64_t)a3;
- (void)setUserInfo:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation MTSetting

+ (id)radioOptionWithTitle:(id)a3 radioGroup:(id)a4 value:(unint64_t)a5 identifier:(id)a6
{
  id v9 = a6;
  id v10 = a4;
  id v11 = a3;
  v12 = objc_alloc_init(MTRadioButtonSetting);
  [(MTSetting *)v12 setType:7];
  [(MTSetting *)v12 setTitle:v11];

  [(MTRadioButtonSetting *)v12 setRadioGroup:v10];
  v13 = +[NSNumber numberWithUnsignedInteger:a5];
  [(MTSetting *)v12 setValue:v13];

  [(MTSetting *)v12 setIdentifier:v9];
  [v10 addRadioSetting:v12];

  return v12;
}

+ (id)switchSettingWithTitle:(id)a3 initialValue:(BOOL)a4 identifier:(id)a5 changeHandler:(id)a6
{
  BOOL v7 = a4;
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  id v13 = objc_alloc_init((Class)a1);
  [v13 setType:0];
  [v13 setTitle:v12];

  v14 = +[NSNumber numberWithBool:v7];
  [v13 setValue:v14];

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100128080;
  v17[3] = &unk_100552598;
  id v18 = v10;
  id v15 = v10;
  [v13 setChangeHandler:v17];
  [v13 setIdentifier:v11];

  return v13;
}

+ (id)buttonSettingWithTitle:(id)a3 detailText:(id)a4 identifier:(id)a5 changeHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = objc_alloc_init((Class)a1);
  [v14 setType:2];
  [v14 setTitle:v13];

  id v15 = [v12 copy];
  [v14 setValue:v15];

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1001281FC;
  v18[3] = &unk_100552598;
  id v19 = v10;
  id v16 = v10;
  [v14 setChangeHandler:v18];
  [v14 setIdentifier:v11];

  return v14;
}

+ (id)buttonSettingWithTitle:(id)a3 identifier:(id)a4 changeHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc_init((Class)a1);
  [v11 setType:1];
  [v11 setTitle:v10];

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100128314;
  v14[3] = &unk_100552598;
  id v15 = v8;
  id v12 = v8;
  [v11 setChangeHandler:v14];
  [v11 setIdentifier:v9];

  return v11;
}

+ (id)appThemeButtonSettingWithTitle:(id)a3 identifier:(id)a4 changeHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc_init((Class)a1);
  [v11 setType:3];
  [v11 setTitle:v10];

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10012842C;
  v14[3] = &unk_100552598;
  id v15 = v8;
  id v12 = v8;
  [v11 setChangeHandler:v14];
  [v11 setIdentifier:v9];

  return v11;
}

+ (id)textSettingWithInitialValue:(id)a3 placeholder:(id)a4 identifier:(id)a5 changeHandler:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = objc_alloc_init(MTTextSetting);
  [(MTSetting *)v13 setType:6];
  [(MTSetting *)v13 setValue:v12];

  [(MTTextSetting *)v13 setPlaceholder:v11];
  [(MTSetting *)v13 setChangeHandler:v9];

  [(MTSetting *)v13 setIdentifier:v10];

  return v13;
}

+ (id)drilldownSettingWithTitle:(id)a3 valueLabel:(id)a4 identifier:(id)a5 viewControllerGenerator:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = objc_alloc_init((Class)a1);
  [v14 setType:4];
  [v14 setTitle:v13];

  [v14 setGenerator:v10];
  [v14 setIdentifier:v11];

  [v14 setValue:v12];

  return v14;
}

+ (id)loadingSettingWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)a1);
  [v5 setType:8];
  [v5 setIdentifier:v4];

  return v5;
}

+ (id)informativeSettingWithText:(id)a3 identifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init((Class)a1);
  [v8 setType:9];
  [v8 setIdentifier:v6];

  [v8 setEnabled:0];
  [v8 setValue:v7];

  return v8;
}

+ (id)optionSettingWithTitle:(id)a3 headerTitle:(id)a4 footerText:(id)a5 initialValue:(unint64_t)a6 optionDescription:(id)a7 identifier:(id)a8 changeHandler:(id)a9
{
  id v15 = a9;
  id v16 = a8;
  id v17 = a7;
  id v18 = a5;
  id v19 = a4;
  id v20 = a3;
  v21 = objc_alloc_init(MTOptionSetting);
  [(MTSetting *)v21 setType:5];
  [(MTSetting *)v21 setTitle:v20];

  [(MTOptionSetting *)v21 setHeaderTitle:v19];
  [(MTOptionSetting *)v21 setFooterText:v18];

  v22 = +[NSNumber numberWithUnsignedInteger:a6];
  [(MTSetting *)v21 setValue:v22];

  [(MTOptionSetting *)v21 setOptions:v17];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100128858;
  v25[3] = &unk_100552598;
  id v26 = v15;
  id v23 = v15;
  [(MTSetting *)v21 setChangeHandler:v25];
  [(MTSetting *)v21 setIdentifier:v16];

  return v21;
}

+ (id)optionSettingWithTitle:(id)a3 footerText:(id)a4 initialValue:(unint64_t)a5 optionDescription:(id)a6 identifier:(id)a7 changeHandler:(id)a8
{
  return [a1 optionSettingWithTitle:a3 headerTitle:a3 footerText:a4 initialValue:a5 optionDescription:a6 identifier:a7 changeHandler:a8];
}

- (MTSetting)init
{
  v5.receiver = self;
  v5.super_class = (Class)MTSetting;
  v2 = [(MTSetting *)&v5 init];
  v3 = v2;
  if (v2) {
    [(MTSetting *)v2 setEnabled:1];
  }
  return v3;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (id)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (id)changeHandler
{
  return self->_changeHandler;
}

- (void)setChangeHandler:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (id)generator
{
  return self->_generator;
}

- (void)setGenerator:(id)a3
{
}

- (MTSettingsGroup)group
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_group);

  return (MTSettingsGroup *)WeakRetained;
}

- (void)setGroup:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_group);
  objc_storeStrong(&self->_generator, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong(&self->_changeHandler, 0);
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_userInfo, 0);
}

@end