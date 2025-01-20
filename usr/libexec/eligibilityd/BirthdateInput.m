@interface BirthdateInput
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BirthdateInput)initWithCoder:(id)a3;
- (BirthdateInput)initWithDate:(id)a3 status:(unint64_t)a4 process:(id)a5;
- (NSDate)birthdate;
- (NSNumber)age;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setBirthdate:(id)a3;
@end

@implementation BirthdateInput

- (void).cxx_destruct
{
}

- (void)setBirthdate:(id)a3
{
}

- (NSDate)birthdate
{
  return self->_birthdate;
}

- (id)description
{
  v3 = [(BirthdateInput *)self age];
  v7.receiver = self;
  v7.super_class = (Class)BirthdateInput;
  v4 = [(EligibilityInput *)&v7 description];
  v5 = +[NSString stringWithFormat:@"[BirthdateInput age:%@ %@]", v3, v4];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (BirthdateInput *)a3;
  v11.receiver = self;
  v11.super_class = (Class)BirthdateInput;
  if (![(EligibilityInput *)&v11 isEqual:v4]) {
    goto LABEL_9;
  }
  if (v4 == self)
  {
    char v8 = 1;
    goto LABEL_11;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = v4;
    v6 = [(BirthdateInput *)self birthdate];
    objc_super v7 = [(BirthdateInput *)v5 birthdate];
    char v8 = sub_100019BF8(v6, v7);

    if ((v8 & 1) == 0)
    {
      v9 = sub_10000D0EC();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v13 = "-[BirthdateInput isEqual:]";
        __int16 v14 = 2080;
        v15 = "birthdate";
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s: Property %s did not match", buf, 0x16u);
      }
    }
  }
  else
  {
LABEL_9:
    char v8 = 0;
  }
LABEL_11:

  return v8;
}

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)BirthdateInput;
  unint64_t v3 = [(EligibilityInput *)&v7 hash];
  v4 = [(BirthdateInput *)self birthdate];
  unint64_t v5 = (unint64_t)[v4 hash] ^ v3;

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)BirthdateInput;
  id v5 = -[EligibilityInput copyWithZone:](&v9, "copyWithZone:");
  v6 = [(BirthdateInput *)self birthdate];
  id v7 = [v6 copyWithZone:a3];
  [v5 setBirthdate:v7];

  return v5;
}

- (BirthdateInput)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BirthdateInput;
  id v5 = [(EligibilityInput *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"birthdate"];
    birthdate = v5->_birthdate;
    v5->_birthdate = (NSDate *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)BirthdateInput;
  id v4 = a3;
  [(EligibilityInput *)&v6 encodeWithCoder:v4];
  id v5 = [(BirthdateInput *)self birthdate];
  [v4 encodeObject:v5 forKey:@"birthdate"];
}

- (NSNumber)age
{
  v2 = [(BirthdateInput *)self birthdate];
  if (v2)
  {
    unint64_t v3 = +[NSDate date];
    id v4 = +[NSCalendar currentCalendar];
    id v5 = [v4 components:4 fromDate:v2 toDate:v3 options:0];

    objc_super v6 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v5 year]);
  }
  else
  {
    objc_super v6 = 0;
  }

  return (NSNumber *)v6;
}

- (BirthdateInput)initWithDate:(id)a3 status:(unint64_t)a4 process:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v8)
  {
    xpc_type_t type = xpc_get_type(v8);
    if (type != (xpc_type_t)&_xpc_type_date)
    {
      objc_super v11 = type;
      v12 = sub_10000D0EC();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v19 = "-[BirthdateInput initWithDate:status:process:]";
        __int16 v20 = 2080;
        name = xpc_type_get_name(v11);
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s: Birthdate input is wrong data type: %s", buf, 0x16u);
      }
      v13 = 0;
      goto LABEL_11;
    }
    v12 = _CFXPCCreateCFObjectFromXPCObject();
  }
  else
  {
    v12 = 0;
  }
  v17.receiver = self;
  v17.super_class = (Class)BirthdateInput;
  __int16 v14 = [(EligibilityInput *)&v17 initWithInputType:15 status:a4 process:v9];
  v15 = v14;
  if (v14) {
    objc_storeStrong((id *)&v14->_birthdate, v12);
  }
  self = v15;
  v13 = self;
LABEL_11:

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end