@interface VUIDebugViewDefaults
- (BOOL)defaultBoolValue;
- (BOOL)integerValueType;
- (NSString)defaultName;
- (NSString)domain;
- (NSString)subtitle;
- (NSString)title;
- (VUIDebugViewDefaults)initWithTitle:(id)a3 subtitle:(id)a4 domain:(id)a5 defaultName:(id)a6 BOOLType:(BOOL)a7;
- (unint64_t)defaultIntegerValue;
- (void)setDefaultBoolValue:(BOOL)a3;
- (void)setDefaultIntegerValue:(unint64_t)a3;
- (void)setIntegerValueType:(BOOL)a3;
- (void)toggleDefaultBoolValue;
@end

@implementation VUIDebugViewDefaults

- (VUIDebugViewDefaults)initWithTitle:(id)a3 subtitle:(id)a4 domain:(id)a5 defaultName:(id)a6 BOOLType:(BOOL)a7
{
  BOOL v7 = a7;
  id v13 = a3;
  id v14 = a4;
  v15 = (__CFString *)a5;
  v16 = (__CFString *)a6;
  v20.receiver = self;
  v20.super_class = (Class)VUIDebugViewDefaults;
  v17 = [(VUIDebugViewDefaults *)&v20 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_title, a3);
    objc_storeStrong((id *)&v18->_subtitle, a4);
    objc_storeStrong((id *)&v18->_domain, a5);
    objc_storeStrong((id *)&v18->_defaultName, a6);
    v18->_integerValueType = !v7;
    if (!v7) {
      v18->_defaultIntegerValue = CFPreferencesGetAppIntegerValue(v16, v15, 0);
    }
    else {
      v18->_defaultBoolValue = CFPreferencesGetAppBooleanValue(v16, v15, 0) != 0;
    }
  }

  return v18;
}

- (void)toggleDefaultBoolValue
{
  BOOL defaultBoolValue = self->_defaultBoolValue;
  v4 = (CFPropertyListRef *)MEMORY[0x1E4F1CFD0];
  v5 = (CFPropertyListRef *)MEMORY[0x1E4F1CFC8];
  self->_BOOL defaultBoolValue = !defaultBoolValue;
  if (defaultBoolValue) {
    v6 = v5;
  }
  else {
    v6 = v4;
  }
  CFPreferencesSetAppValue((CFStringRef)self->_defaultName, *v6, (CFStringRef)self->_domain);
  CFStringRef domain = (const __CFString *)self->_domain;
  CFPreferencesAppSynchronize(domain);
}

- (void)setDefaultIntegerValue:(unint64_t)a3
{
  self->_defaultIntegerValue = a3;
  CFPreferencesSetAppValue((CFStringRef)self->_defaultName, (CFPropertyListRef)objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:"), (CFStringRef)self->_domain);
  CFStringRef domain = (const __CFString *)self->_domain;
  CFPreferencesAppSynchronize(domain);
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)domain
{
  return self->_domain;
}

- (NSString)defaultName
{
  return self->_defaultName;
}

- (BOOL)defaultBoolValue
{
  return self->_defaultBoolValue;
}

- (void)setDefaultBoolValue:(BOOL)a3
{
  self->_BOOL defaultBoolValue = a3;
}

- (BOOL)integerValueType
{
  return self->_integerValueType;
}

- (void)setIntegerValueType:(BOOL)a3
{
  self->_integerValueType = a3;
}

- (unint64_t)defaultIntegerValue
{
  return self->_defaultIntegerValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultName, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end