@interface EligibilityInput
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (EligibilityInput)initWithCoder:(id)a3;
- (EligibilityInput)initWithInputType:(unint64_t)a3 status:(unint64_t)a4 process:(id)a5;
- (NSDate)setTime;
- (NSString)settingProccessName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (unint64_t)status;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setSetTime:(id)a3;
- (void)setSettingProccessName:(id)a3;
- (void)setStatus:(unint64_t)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation EligibilityInput

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settingProccessName, 0);

  objc_storeStrong((id *)&self->_setTime, 0);
}

- (void)setSettingProccessName:(id)a3
{
}

- (NSString)settingProccessName
{
  return self->_settingProccessName;
}

- (void)setSetTime:(id)a3
{
}

- (NSDate)setTime
{
  return self->_setTime;
}

- (void)setStatus:(unint64_t)a3
{
  self->_status = a3;
}

- (unint64_t)status
{
  return self->_status;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (unint64_t)type
{
  return self->_type;
}

- (id)description
{
  v3 = sub_10000D080([(EligibilityInput *)self type]);
  unint64_t v4 = [(EligibilityInput *)self status];
  if (v4 >= 8)
  {
    v6 = sub_10000D0EC();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "eligibility_input_status_to_str";
      __int16 v15 = 2048;
      unint64_t v16 = v4;
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%s: Unsupported input status: %llu", buf, 0x16u);
    }

    uint64_t v5 = +[NSString stringWithFormat:@"<Unknown: %llu>", v4];
  }
  else
  {
    uint64_t v5 = +[NSString stringWithUTF8String:(&off_100038B08)[v4]];
  }
  v7 = (void *)v5;
  uint64_t v8 = [(EligibilityInput *)self settingProccessName];
  if (v8) {
    v9 = (__CFString *)v8;
  }
  else {
    v9 = @"<NULL>";
  }
  v10 = [(EligibilityInput *)self setTime];
  v11 = +[NSString stringWithFormat:@"[EligibilityInput type:%@ status:%@ setTime:%@ settingProcess:%@]", v3, v7, v10, v9];

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (EligibilityInput *)a3;
  v17.receiver = self;
  v17.super_class = (Class)EligibilityInput;
  if ([(EligibilityInput *)&v17 isEqual:v4])
  {
    if (v4 == self)
    {
      BOOL v14 = 1;
      goto LABEL_22;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      id v6 = [(EligibilityInput *)self type];
      if (v6 == (id)[(EligibilityInput *)v5 type])
      {
        id v7 = [(EligibilityInput *)self status];
        if (v7 == (id)[(EligibilityInput *)v5 status])
        {
          uint64_t v8 = [(EligibilityInput *)self setTime];
          v9 = [(EligibilityInput *)v5 setTime];
          char v10 = sub_100019BF8(v8, v9);

          if (v10)
          {
            v11 = [(EligibilityInput *)self settingProccessName];
            v12 = [(EligibilityInput *)v5 settingProccessName];
            char v13 = sub_100019BF8(v11, v12);

            if (v13)
            {
              BOOL v14 = 1;
LABEL_21:

              goto LABEL_22;
            }
            __int16 v15 = sub_10000D0EC();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315394;
              v19 = "-[EligibilityInput isEqual:]";
              __int16 v20 = 2080;
              v21 = "settingProccessName";
              goto LABEL_19;
            }
LABEL_20:

            BOOL v14 = 0;
            goto LABEL_21;
          }
          __int16 v15 = sub_10000D0EC();
          if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_20;
          }
          *(_DWORD *)buf = 136315394;
          v19 = "-[EligibilityInput isEqual:]";
          __int16 v20 = 2080;
          v21 = "setTime";
        }
        else
        {
          __int16 v15 = sub_10000D0EC();
          if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_20;
          }
          *(_DWORD *)buf = 136315394;
          v19 = "-[EligibilityInput isEqual:]";
          __int16 v20 = 2080;
          v21 = "status";
        }
      }
      else
      {
        __int16 v15 = sub_10000D0EC();
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_20;
        }
        *(_DWORD *)buf = 136315394;
        v19 = "-[EligibilityInput isEqual:]";
        __int16 v20 = 2080;
        v21 = "type";
      }
LABEL_19:
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s: Property %s did not match", buf, 0x16u);
      goto LABEL_20;
    }
  }
  BOOL v14 = 0;
LABEL_22:

  return v14;
}

- (unint64_t)hash
{
  unint64_t v3 = [(EligibilityInput *)self type];
  unint64_t v4 = [(EligibilityInput *)self status] ^ v3;
  uint64_t v5 = [(EligibilityInput *)self setTime];
  unint64_t v6 = v4 ^ (unint64_t)[v5 hash];
  id v7 = [(EligibilityInput *)self settingProccessName];
  unint64_t v8 = v6 ^ (unint64_t)[v7 hash];

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [(id)objc_opt_class() allocWithZone:a3];
  unint64_t v5 = [(EligibilityInput *)self type];
  unint64_t v6 = [(EligibilityInput *)self status];
  id v7 = [(EligibilityInput *)self settingProccessName];
  id v8 = [v4 initWithInputType:v5 status:v6 process:v7];

  v9 = [(EligibilityInput *)self setTime];
  [v8 setSetTime:v9];

  return v8;
}

- (EligibilityInput)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)EligibilityInput;
  unint64_t v5 = [(EligibilityInput *)&v14 init];
  if (v5)
  {
    unint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"type"];
    v5->_type = (unint64_t)[v6 unsignedIntegerValue];

    id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"status"];
    v5->_status = (unint64_t)[v7 unsignedIntegerValue];

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"setTime"];
    if (!v8)
    {
      v9 = sub_10000D0EC();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        unint64_t v16 = "-[EligibilityInput initWithCoder:]";
        _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s: Failed to deserialize setTime, setting to default value", buf, 0xCu);
      }

      uint64_t v8 = +[NSDate now];
    }
    setTime = v5->_setTime;
    v5->_setTime = (NSDate *)v8;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"settingProccessName"];
    settingProccessName = v5->_settingProccessName;
    v5->_settingProccessName = (NSString *)v11;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = +[NSNumber numberWithUnsignedLongLong:[(EligibilityInput *)self type]];
  [v4 encodeObject:v5 forKey:@"type"];

  unint64_t v6 = +[NSNumber numberWithUnsignedLongLong:[(EligibilityInput *)self status]];
  [v4 encodeObject:v6 forKey:@"status"];

  id v7 = [(EligibilityInput *)self setTime];
  [v4 encodeObject:v7 forKey:@"setTime"];

  id v8 = [(EligibilityInput *)self settingProccessName];
  [v4 encodeObject:v8 forKey:@"settingProccessName"];
}

- (EligibilityInput)initWithInputType:(unint64_t)a3 status:(unint64_t)a4 process:(id)a5
{
  id v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)EligibilityInput;
  char v10 = [(EligibilityInput *)&v15 init];
  uint64_t v11 = v10;
  if (v10)
  {
    v10->_type = a3;
    v10->_status = a4;
    uint64_t v12 = +[NSDate now];
    setTime = v11->_setTime;
    v11->_setTime = (NSDate *)v12;

    objc_storeStrong((id *)&v11->_settingProccessName, a5);
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end