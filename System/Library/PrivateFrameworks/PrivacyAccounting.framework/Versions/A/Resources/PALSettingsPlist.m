@interface PALSettingsPlist
+ (BOOL)supportsSecureCoding;
+ (id)settingsFromFile:(id)a3 withError:(id *)a4;
- (BOOL)loggingEnabled;
- (PALSettingsPlist)init;
- (PALSettingsPlist)initWithCoder:(id)a3;
- (double)lastPreflightCheck;
- (void)encodeWithCoder:(id)a3;
- (void)setLastPreflightCheck:(double)a3;
- (void)setLoggingEnabled:(BOOL)a3;
@end

@implementation PALSettingsPlist

+ (id)settingsFromFile:(id)a3 withError:(id *)a4
{
  id v11 = 0;
  v5 = +[NSData dataWithContentsOfFile:a3 options:0 error:&v11];
  id v6 = v11;
  if (v5)
  {
    +[NSKeyedUnarchiver setClass:objc_opt_class() forClassName:@"PALSettings"];
    id v10 = v6;
    v7 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v5 error:&v10];
    id v8 = v10;

    id v6 = v8;
    if (!a4) {
      goto LABEL_7;
    }
  }
  else
  {
    v7 = 0;
    if (!a4) {
      goto LABEL_7;
    }
  }
  if (v6) {
    *a4 = v6;
  }
LABEL_7:

  return v7;
}

- (PALSettingsPlist)init
{
  v3.receiver = self;
  v3.super_class = (Class)PALSettingsPlist;
  result = [(PALSettingsPlist *)&v3 init];
  if (result)
  {
    result->_loggingEnabled = 0;
    result->_lastPreflightCheck = 0.0;
  }
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL loggingEnabled = self->_loggingEnabled;
  id v5 = a3;
  [v5 encodeBool:loggingEnabled forKey:@"loggingEnabled"];
  [v5 encodeDouble:@"lastPreflightCheck" forKey:self->_lastPreflightCheck];
}

- (PALSettingsPlist)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PALSettingsPlist;
  id v5 = [(PALSettingsPlist *)&v8 init];
  if (v5)
  {
    v5->_BOOL loggingEnabled = [v4 decodeBoolForKey:@"loggingEnabled"];
    [v4 decodeDoubleForKey:@"lastPreflightCheck"];
    v5->_lastPreflightCheck = v6;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)loggingEnabled
{
  return self->_loggingEnabled;
}

- (void)setLoggingEnabled:(BOOL)a3
{
  self->_BOOL loggingEnabled = a3;
}

- (double)lastPreflightCheck
{
  return self->_lastPreflightCheck;
}

- (void)setLastPreflightCheck:(double)a3
{
  self->_lastPreflightCheck = a3;
}

@end