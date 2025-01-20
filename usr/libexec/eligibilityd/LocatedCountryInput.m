@interface LocatedCountryInput
+ (BOOL)supportsSecureCoding;
+ (unint64_t)_parseConfidenceFromInputDict:(id)a3;
- (BOOL)isEqual:(id)a3;
- (LocatedCountryInput)initWithCoder:(id)a3;
- (LocatedCountryInput)initWithCountryCodes:(id)a3 status:(unint64_t)a4 process:(id)a5;
- (NSSet)countryCodes;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)_deviceMinimiumRequiredConfidence;
- (unint64_t)confidence;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setConfidence:(unint64_t)a3;
- (void)setCountryCodes:(id)a3;
@end

@implementation LocatedCountryInput

- (void).cxx_destruct
{
}

- (void)setConfidence:(unint64_t)a3
{
  self->_confidence = a3;
}

- (unint64_t)confidence
{
  return self->_confidence;
}

- (void)setCountryCodes:(id)a3
{
}

- (id)description
{
  v3 = [(LocatedCountryInput *)self countryCodes];
  unint64_t v4 = [(LocatedCountryInput *)self confidence];
  v8.receiver = self;
  v8.super_class = (Class)LocatedCountryInput;
  v5 = [(EligibilityInput *)&v8 description];
  v6 = +[NSString stringWithFormat:@"[LocatedCountryInput countryCodes:%@ confidence:%lu %@]", v3, v4, v5];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (LocatedCountryInput *)a3;
  v13.receiver = self;
  v13.super_class = (Class)LocatedCountryInput;
  if ([(EligibilityInput *)&v13 isEqual:v4])
  {
    if (v4 == self)
    {
      BOOL v10 = 1;
      goto LABEL_16;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(LocatedCountryInput *)self countryCodes];
      v7 = [(LocatedCountryInput *)v5 countryCodes];
      char v8 = sub_100019BF8(v6, v7);

      if (v8)
      {
        id v9 = [(LocatedCountryInput *)self confidence];
        if (v9 == (id)[(LocatedCountryInput *)v5 confidence])
        {
          BOOL v10 = 1;
LABEL_15:

          goto LABEL_16;
        }
        v11 = sub_10000D0EC();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v15 = "-[LocatedCountryInput isEqual:]";
          __int16 v16 = 2080;
          v17 = "confidence";
          goto LABEL_13;
        }
      }
      else
      {
        v11 = sub_10000D0EC();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v15 = "-[LocatedCountryInput isEqual:]";
          __int16 v16 = 2080;
          v17 = "countryCodes";
LABEL_13:
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s: Property %s did not match", buf, 0x16u);
        }
      }

      BOOL v10 = 0;
      goto LABEL_15;
    }
  }
  BOOL v10 = 0;
LABEL_16:

  return v10;
}

- (unint64_t)hash
{
  v8.receiver = self;
  v8.super_class = (Class)LocatedCountryInput;
  unint64_t v3 = [(EligibilityInput *)&v8 hash];
  unint64_t v4 = [(LocatedCountryInput *)self countryCodes];
  unint64_t v5 = (unint64_t)[v4 hash];
  unint64_t v6 = v5 ^ [(LocatedCountryInput *)self confidence] ^ v3;

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)LocatedCountryInput;
  id v5 = -[EligibilityInput copyWithZone:](&v9, "copyWithZone:");
  unint64_t v6 = [(LocatedCountryInput *)self countryCodes];
  id v7 = [v6 copyWithZone:a3];
  [v5 setCountryCodes:v7];

  [v5 setConfidence:-[LocatedCountryInput confidence](self, "confidence")];
  return v5;
}

- (LocatedCountryInput)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)LocatedCountryInput;
  id v5 = [(EligibilityInput *)&v12 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    id v7 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v6, objc_opt_class(), 0);
    uint64_t v8 = [v4 decodeObjectOfClasses:v7 forKey:@"countryCodes"];
    countryCodes = v5->_countryCodes;
    v5->_countryCodes = (NSSet *)v8;

    BOOL v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"confidence"];
    v5->_confidence = (unint64_t)[v10 unsignedIntegerValue];

    if (!v5->_confidence)
    {
      if (v5->_countryCodes) {
        v5->_confidence = 4;
      }
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)LocatedCountryInput;
  id v4 = a3;
  [(EligibilityInput *)&v6 encodeWithCoder:v4];
  id v5 = [(LocatedCountryInput *)self countryCodes];
  [v4 encodeObject:v5 forKey:@"countryCodes"];
}

- (NSSet)countryCodes
{
  unint64_t v3 = [(LocatedCountryInput *)self confidence];
  if (v3 >= [(LocatedCountryInput *)self _deviceMinimiumRequiredConfidence]) {
    id v4 = self->_countryCodes;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (unint64_t)_deviceMinimiumRequiredConfidence
{
  if (MGGetBoolAnswer()) {
    return 2;
  }
  else {
    return 1;
  }
}

- (LocatedCountryInput)initWithCountryCodes:(id)a3 status:(unint64_t)a4 process:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v8)
  {
    xpc_type_t type = xpc_get_type(v8);
    if (type == (xpc_type_t)&_xpc_type_array)
    {
      objc_super v12 = v8;
      uint64_t v16 = 4;
    }
    else
    {
      v11 = type;
      if (type != (xpc_type_t)&_xpc_type_dictionary)
      {
        objc_super v12 = sub_10000D0EC();
        if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
LABEL_25:
          v21 = 0;
          goto LABEL_26;
        }
        *(_DWORD *)buf = 136315394;
        v29 = "-[LocatedCountryInput initWithCountryCodes:status:process:]";
        __int16 v30 = 2080;
        name = xpc_type_get_name(v11);
        objc_super v13 = "%s: Located country codes input is wrong data type: %s";
        v14 = v12;
        uint32_t v15 = 22;
LABEL_6:
        _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, v13, buf, v15);
        goto LABEL_25;
      }
      uint64_t v22 = xpc_dictionary_get_array(v8, "OS_ELIGIBILITY_INPUT_COUNTRY_LOCATION_KEY_COUNTRY_CODE_LIST");
      if (!v22)
      {
        objc_super v12 = sub_10000D0EC();
        if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          goto LABEL_25;
        }
        *(_DWORD *)buf = 136315138;
        v29 = "-[LocatedCountryInput initWithCountryCodes:status:process:]";
        objc_super v13 = "%s: Located country codes input missing country code array";
        v14 = v12;
        uint32_t v15 = 12;
        goto LABEL_6;
      }
      objc_super v12 = v22;
      unint64_t v23 = +[LocatedCountryInput _parseConfidenceFromInputDict:v8];
      if (!v23)
      {
        v25 = sub_10000D0EC();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v29 = "-[LocatedCountryInput initWithCountryCodes:status:process:]";
          _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%s: Located country codes input missing confidence values", buf, 0xCu);
        }

        goto LABEL_25;
      }
      uint64_t v16 = v23;
    }
    v17 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    objc_opt_class();
    if ((sub_100019C7C(v17) & 1) == 0)
    {
      v24 = sub_10000D0EC();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v29 = "-[LocatedCountryInput initWithCountryCodes:status:process:]";
        _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%s: Located country codes input contains non-String entries", buf, 0xCu);
      }

      goto LABEL_25;
    }
    uint64_t v18 = +[NSSet setWithArray:v17];

    objc_super v12 = v18;
  }
  else
  {
    uint64_t v16 = 0;
    objc_super v12 = 0;
  }
  v27.receiver = self;
  v27.super_class = (Class)LocatedCountryInput;
  v19 = [(EligibilityInput *)&v27 initWithInputType:1 status:a4 process:v9];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_countryCodes, v12);
    v20->_confidence = v16;
  }
  self = v20;
  v21 = self;
LABEL_26:

  return v21;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (unint64_t)_parseConfidenceFromInputDict:(id)a3
{
  id v3 = a3;
  if (xpc_dictionary_get_BOOL(v3, "OS_ELIGIBILITY_INPUT_COUNTRY_LOCATION_KEY_HAS_SINGLE_LOCATION"))
  {
    unint64_t v4 = 4;
  }
  else if (xpc_dictionary_get_BOOL(v3, "OS_ELIGIBILITY_INPUT_COUNTRY_LOCATION_KEY_HAS_NEARBY_CELLS_MCC"))
  {
    unint64_t v4 = 3;
  }
  else if (xpc_dictionary_get_BOOL(v3, "OS_ELIGIBILITY_INPUT_COUNTRY_LOCATION_KEY_HAS_SERVING_CELL_MCC"))
  {
    unint64_t v4 = 2;
  }
  else
  {
    unint64_t v4 = xpc_dictionary_get_BOOL(v3, "OS_ELIGIBILITY_INPUT_COUNTRY_LOCATION_KEY_HAS_WIFIAP");
  }

  return v4;
}

@end