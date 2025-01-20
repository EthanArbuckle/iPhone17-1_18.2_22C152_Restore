@interface MTRadioGroupDescription
+ (id)radioGroupWithInitialValue:(unint64_t)a3 changeHandler:(id)a4;
- (MTRadioGroupDescription)init;
- (__CFArray)radioSettings;
- (id)changeHandler;
- (id)settings;
- (unint64_t)value;
- (void)addRadioSetting:(id)a3;
- (void)setChangeHandler:(id)a3;
- (void)setRadioSettings:(__CFArray *)a3;
- (void)setValue:(unint64_t)a3;
@end

@implementation MTRadioGroupDescription

- (MTRadioGroupDescription)init
{
  v4.receiver = self;
  v4.super_class = (Class)MTRadioGroupDescription;
  v2 = [(MTRadioGroupDescription *)&v4 init];
  if (v2) {
    v2->_radioSettings = CFArrayCreateMutable(0, 0, 0);
  }
  return v2;
}

+ (id)radioGroupWithInitialValue:(unint64_t)a3 changeHandler:(id)a4
{
  id v6 = a4;
  id v7 = objc_alloc_init((Class)a1);
  [v7 setValue:a3];
  [v7 setChangeHandler:v6];

  return v7;
}

- (void)addRadioSetting:(id)a3
{
}

- (id)settings
{
  CFIndex Count = CFArrayGetCount(self->_radioSettings);
  objc_super v4 = +[NSMutableArray array];
  if (Count)
  {
    for (CFIndex i = 0; i != Count; ++i)
    {
      id v6 = CFArrayGetValueAtIndex(self->_radioSettings, i);
      [v4 addObject:v6];
    }
  }

  return v4;
}

- (__CFArray)radioSettings
{
  return self->_radioSettings;
}

- (void)setRadioSettings:(__CFArray *)a3
{
}

- (id)changeHandler
{
  return self->_changeHandler;
}

- (void)setChangeHandler:(id)a3
{
}

- (unint64_t)value
{
  return self->_value;
}

- (void)setValue:(unint64_t)a3
{
  self->_value = a3;
}

- (void).cxx_destruct
{
}

@end