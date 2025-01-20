@interface InitialSetupLocationInput
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (InitialSetupLocationInput)initWithCoder:(id)a3;
- (InitialSetupLocationInput)initWithLocations:(id)a3 status:(unint64_t)a4 process:(id)a5;
- (NSSet)countryCodes;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCountryCodes:(id)a3;
@end

@implementation InitialSetupLocationInput

- (void).cxx_destruct
{
}

- (void)setCountryCodes:(id)a3
{
}

- (NSSet)countryCodes
{
  return self->_countryCodes;
}

- (id)description
{
  v3 = [(InitialSetupLocationInput *)self countryCodes];
  v7.receiver = self;
  v7.super_class = (Class)InitialSetupLocationInput;
  v4 = [(EligibilityInput *)&v7 description];
  v5 = +[NSString stringWithFormat:@"[InitialSetupLocationInput countryCodes:%@ %@]", v3, v4];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (InitialSetupLocationInput *)a3;
  v11.receiver = self;
  v11.super_class = (Class)InitialSetupLocationInput;
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
    v6 = [(InitialSetupLocationInput *)self countryCodes];
    objc_super v7 = [(InitialSetupLocationInput *)v5 countryCodes];
    char v8 = sub_100019BF8(v6, v7);

    if ((v8 & 1) == 0)
    {
      v9 = sub_10000D0EC();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v13 = "-[InitialSetupLocationInput isEqual:]";
        __int16 v14 = 2080;
        v15 = "countryCodes";
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
  v7.super_class = (Class)InitialSetupLocationInput;
  unint64_t v3 = [(EligibilityInput *)&v7 hash];
  v4 = [(InitialSetupLocationInput *)self countryCodes];
  unint64_t v5 = (unint64_t)[v4 hash] ^ v3;

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)InitialSetupLocationInput;
  id v5 = -[EligibilityInput copyWithZone:](&v9, "copyWithZone:");
  v6 = [(InitialSetupLocationInput *)self countryCodes];
  id v7 = [v6 copyWithZone:a3];
  [v5 setCountryCodes:v7];

  return v5;
}

- (InitialSetupLocationInput)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)InitialSetupLocationInput;
  id v5 = [(EligibilityInput *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    id v7 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v6, objc_opt_class(), 0);
    uint64_t v8 = [v4 decodeObjectOfClasses:v7 forKey:@"countryCodes"];
    countryCodes = v5->_countryCodes;
    v5->_countryCodes = (NSSet *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)InitialSetupLocationInput;
  id v4 = a3;
  [(EligibilityInput *)&v6 encodeWithCoder:v4];
  id v5 = [(InitialSetupLocationInput *)self countryCodes];
  [v4 encodeObject:v5 forKey:@"countryCodes"];
}

- (InitialSetupLocationInput)initWithLocations:(id)a3 status:(unint64_t)a4 process:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v8)
  {
    xpc_type_t type = xpc_get_type(v8);
    if (type != (xpc_type_t)&_xpc_type_array)
    {
      objc_super v11 = type;
      v12 = sub_10000D0EC();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v21 = "-[InitialSetupLocationInput initWithLocations:status:process:]";
        __int16 v22 = 2080;
        name = xpc_type_get_name(v11);
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s: Initial setup location input is wrong data type: %s", buf, 0x16u);
      }
LABEL_14:
      v16 = 0;
      goto LABEL_15;
    }
    v12 = _CFXPCCreateCFObjectFromXPCObject();
    objc_opt_class();
    if ((sub_100019C7C(v12) & 1) == 0)
    {
      v17 = sub_10000D0EC();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v21 = "-[InitialSetupLocationInput initWithLocations:status:process:]";
        _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s: Initial setup location input contains non-String entries", buf, 0xCu);
      }

      goto LABEL_14;
    }
    uint64_t v13 = +[NSSet setWithArray:v12];

    v12 = v13;
  }
  else
  {
    v12 = 0;
  }
  v19.receiver = self;
  v19.super_class = (Class)InitialSetupLocationInput;
  __int16 v14 = [(EligibilityInput *)&v19 initWithInputType:14 status:a4 process:v9];
  v15 = v14;
  if (v14) {
    objc_storeStrong((id *)&v14->_countryCodes, v12);
  }
  self = v15;
  v16 = self;
LABEL_15:

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end