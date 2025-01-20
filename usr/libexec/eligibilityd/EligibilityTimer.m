@interface EligibilityTimer
+ (BOOL)supportsSecureCoding;
- (BOOL)enabled;
- (BOOL)hasExpired;
- (BOOL)isActive;
- (BOOL)isEqual:(id)a3;
- (EligibilityTimer)initWithCoder:(id)a3;
- (EligibilityTimer)initWithSeconds:(unint64_t)a3;
- (NSDate)timeStart;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (unint64_t)loadedTimeInSeconds;
- (void)enable;
- (void)encodeWithCoder:(id)a3;
- (void)reset;
- (void)resume;
- (void)setDurationWithSeconds:(unint64_t)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setLoadedTimeInSeconds:(unint64_t)a3;
- (void)setTimeStart:(id)a3;
@end

@implementation EligibilityTimer

- (void).cxx_destruct
{
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setTimeStart:(id)a3
{
}

- (NSDate)timeStart
{
  return self->_timeStart;
}

- (void)setLoadedTimeInSeconds:(unint64_t)a3
{
  self->_loadedTimeInSeconds = a3;
}

- (unint64_t)loadedTimeInSeconds
{
  return self->_loadedTimeInSeconds;
}

- (id)description
{
  unint64_t v3 = [(EligibilityTimer *)self loadedTimeInSeconds];
  v4 = [(EligibilityTimer *)self timeStart];
  unsigned int v5 = [(EligibilityTimer *)self enabled];
  CFStringRef v6 = @"N";
  if (v5) {
    CFStringRef v6 = @"Y";
  }
  v7 = +[NSString stringWithFormat:@"<Timer loadedTime: %lu(seconds), timeStart: %@, enabled: %@>", v3, v4, v6];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (EligibilityTimer *)a3;
  v14.receiver = self;
  v14.super_class = (Class)EligibilityTimer;
  if ([(EligibilityTimer *)&v14 isEqual:v4])
  {
    if (v4 == self)
    {
      BOOL v12 = 1;
      goto LABEL_18;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unsigned int v5 = v4;
      id v6 = [(EligibilityTimer *)self loadedTimeInSeconds];
      if (v6 == (id)[(EligibilityTimer *)v5 loadedTimeInSeconds])
      {
        v7 = [(EligibilityTimer *)self timeStart];
        v8 = [(EligibilityTimer *)v5 timeStart];
        char v9 = sub_100019BF8(v7, v8);

        if (v9)
        {
          unsigned int v10 = [(EligibilityTimer *)self enabled];
          if (v10 == [(EligibilityTimer *)v5 enabled])
          {
            BOOL v12 = 1;
            goto LABEL_17;
          }
          v11 = sub_10000D0EC();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            v16 = "-[EligibilityTimer isEqual:]";
            __int16 v17 = 2080;
            v18 = "enabled";
LABEL_15:
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s: Property %s did not match", buf, 0x16u);
          }
        }
        else
        {
          v11 = sub_10000D0EC();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            v16 = "-[EligibilityTimer isEqual:]";
            __int16 v17 = 2080;
            v18 = "timeStart";
            goto LABEL_15;
          }
        }
      }
      else
      {
        v11 = sub_10000D0EC();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v16 = "-[EligibilityTimer isEqual:]";
          __int16 v17 = 2080;
          v18 = "loadedTimeInSeconds";
          goto LABEL_15;
        }
      }

      BOOL v12 = 0;
LABEL_17:

      goto LABEL_18;
    }
  }
  BOOL v12 = 0;
LABEL_18:

  return v12;
}

- (unint64_t)hash
{
  unint64_t v3 = [(EligibilityTimer *)self loadedTimeInSeconds];
  v4 = [(EligibilityTimer *)self timeStart];
  unint64_t v5 = (unint64_t)[v4 hash] ^ v3;

  return v5 ^ [(EligibilityTimer *)self enabled];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[objc_opt_class() allocWithZone:a3] init];
  [v5 setLoadedTimeInSeconds:-[EligibilityTimer loadedTimeInSeconds](self, "loadedTimeInSeconds")];
  id v6 = [(EligibilityTimer *)self timeStart];
  id v7 = [v6 copyWithZone:a3];
  [v5 setTimeStart:v7];

  [v5 setEnabled:-[EligibilityTimer enabled](self, "enabled")];
  return v5;
}

- (EligibilityTimer)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)EligibilityTimer;
  id v5 = [(EligibilityTimer *)&v10 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"loadedTimeInSeconds"];
    v5->_loadedTimeInSeconds = (unint64_t)[v6 unsignedIntegerValue];

    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timeStart"];
    timeStart = v5->_timeStart;
    v5->_timeStart = (NSDate *)v7;

    v5->_enabled = [v4 decodeBoolForKey:@"enabled"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  id v4 = +[NSNumber numberWithUnsignedInteger:[(EligibilityTimer *)self loadedTimeInSeconds]];
  [v6 encodeObject:v4 forKey:@"loadedTimeInSeconds"];

  id v5 = [(EligibilityTimer *)self timeStart];
  [v6 encodeObject:v5 forKey:@"timeStart"];

  [v6 encodeBool:-[EligibilityTimer enabled](self, "enabled") forKey:@"enabled"];
}

- (BOOL)isActive
{
  if ([(EligibilityTimer *)self enabled])
  {
    unint64_t v3 = [(EligibilityTimer *)self timeStart];
    if (v3) {
      unsigned int v4 = ![(EligibilityTimer *)self hasExpired];
    }
    else {
      LOBYTE(v4) = 0;
    }
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (BOOL)hasExpired
{
  if (![(EligibilityTimer *)self enabled]) {
    return 1;
  }
  unint64_t v3 = [(EligibilityTimer *)self timeStart];
  unsigned int v4 = v3;
  if (v3)
  {
    [v3 timeIntervalSinceNow];
    BOOL v6 = -v5 >= (double)[(EligibilityTimer *)self loadedTimeInSeconds];
  }
  else
  {
    BOOL v6 = 1;
  }

  return v6;
}

- (void)reset
{
  [(EligibilityTimer *)self setTimeStart:0];

  [(EligibilityTimer *)self setEnabled:0];
}

- (void)resume
{
  if ([(EligibilityTimer *)self enabled])
  {
    unint64_t v3 = [(EligibilityTimer *)self timeStart];

    if (!v3)
    {
      id v4 = +[NSDate now];
      [(EligibilityTimer *)self setTimeStart:v4];
    }
  }
}

- (void)enable
{
}

- (void)setDurationWithSeconds:(unint64_t)a3
{
  self->_loadedTimeInSeconds = a3;
}

- (EligibilityTimer)initWithSeconds:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)EligibilityTimer;
  id v4 = [(EligibilityTimer *)&v8 init];
  double v5 = v4;
  if (v4)
  {
    timeStart = v4->_timeStart;
    v4->_loadedTimeInSeconds = a3;
    v4->_timeStart = 0;

    v5->_enabled = 0;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end