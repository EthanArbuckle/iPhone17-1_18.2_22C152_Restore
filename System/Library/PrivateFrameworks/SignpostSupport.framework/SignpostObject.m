@interface SignpostObject
+ (id)serializationTypeNumber;
- (BOOL)isEqual:(id)a3;
- (BOOL)telemetryEnabled;
- (NSDictionary)attributes;
- (NSNumber)number1Value;
- (NSNumber)number2Value;
- (NSString)name;
- (NSString)number1Name;
- (NSString)number2Name;
- (NSString)scopeString;
- (NSString)string1Name;
- (NSString)string1Value;
- (NSString)string2Name;
- (NSString)string2Value;
- (SignpostObject)initWithDictionary:(id)a3;
- (SignpostObject)initWithSubsystem:(id)a3 category:(id)a4 name:(id)a5 signpostId:(unint64_t)a6 scope:(unint64_t)a7 timebaseRatio:(double)a8 attributes:(id)a9;
- (id)_descriptionStringForColumn:(unint64_t)a3 timeFormat:(unint64_t)a4 asBegin:(BOOL)a5;
- (id)_dictionaryRepresentationWithIsHumanReadable:(BOOL)a3 shouldRedact:(BOOL)a4;
- (unint64_t)scope;
- (unint64_t)signpostId;
- (void)setAttributes:(id)a3;
- (void)setName:(id)a3;
- (void)setNumber1Name:(id)a3;
- (void)setNumber1Value:(id)a3;
- (void)setNumber2Name:(id)a3;
- (void)setNumber2Value:(id)a3;
- (void)setScope:(unint64_t)a3;
- (void)setSignpostId:(unint64_t)a3;
- (void)setString1Name:(id)a3;
- (void)setString1Value:(id)a3;
- (void)setString2Name:(id)a3;
- (void)setString2Value:(id)a3;
- (void)setTelemetryEnabled:(BOOL)a3;
@end

@implementation SignpostObject

- (void)setSignpostId:(unint64_t)a3
{
  self->_signpostId = a3;
}

- (void)setScope:(unint64_t)a3
{
  self->_scope = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_number2Value, 0);
  objc_storeStrong((id *)&self->_number2Name, 0);
  objc_storeStrong((id *)&self->_number1Value, 0);
  objc_storeStrong((id *)&self->_number1Name, 0);
  objc_storeStrong((id *)&self->_string2Value, 0);
  objc_storeStrong((id *)&self->_string2Name, 0);
  objc_storeStrong((id *)&self->_string1Value, 0);
  objc_storeStrong((id *)&self->_string1Name, 0);
  objc_storeStrong((id *)&self->_attributes, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (unint64_t)signpostId
{
  return self->_signpostId;
}

- (unint64_t)scope
{
  return self->_scope;
}

- (NSString)name
{
  return self->_name;
}

- (NSDictionary)attributes
{
  return self->_attributes;
}

- (SignpostObject)initWithSubsystem:(id)a3 category:(id)a4 name:(id)a5 signpostId:(unint64_t)a6 scope:(unint64_t)a7 timebaseRatio:(double)a8 attributes:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a9;
  if (!v15) {
    -[SignpostObject initWithSubsystem:category:name:signpostId:scope:timebaseRatio:attributes:]();
  }
  if (!v17) {
    -[SignpostObject initWithSubsystem:category:name:signpostId:scope:timebaseRatio:attributes:]();
  }
  v19 = v18;
  v23.receiver = self;
  v23.super_class = (Class)SignpostObject;
  v20 = [(SignpostSupportObject *)&v23 initWithSubsystem:v15 category:v16 timebaseRatio:a8];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_name, a5);
    v21->_signpostId = a6;
    objc_storeStrong((id *)&v21->_attributes, a9);
  }

  return v21;
}

- (void)setName:(id)a3
{
}

- (void)setTelemetryEnabled:(BOOL)a3
{
  self->_telemetryEnabled = a3;
}

- (NSNumber)number1Value
{
  return self->_number1Value;
}

- (NSString)number1Name
{
  return self->_number1Name;
}

- (void)setString1Value:(id)a3
{
}

- (void)setString1Name:(id)a3
{
}

- (NSString)string1Value
{
  return self->_string1Value;
}

- (NSString)string1Name
{
  return self->_string1Name;
}

- (void)setNumber1Value:(id)a3
{
}

- (void)setNumber1Name:(id)a3
{
}

- (void)setNumber2Value:(id)a3
{
}

- (void)setNumber2Name:(id)a3
{
}

- (NSString)string2Value
{
  return self->_string2Value;
}

- (NSString)string2Name
{
  return self->_string2Name;
}

- (void)setString2Value:(id)a3
{
}

- (void)setString2Name:(id)a3
{
}

- (BOOL)isEqual:(id)a3
{
  id v5 = a3;
  v63.receiver = self;
  v63.super_class = (Class)SignpostObject;
  if ([(SignpostSupportObject *)&v63 isEqual:v5])
  {
    id v6 = v5;
    unint64_t v7 = [(SignpostObject *)self signpostId];
    if (v7 != [v6 signpostId]) {
      goto LABEL_18;
    }
    unint64_t v8 = [(SignpostObject *)self scope];
    if (v8 != [v6 scope]) {
      goto LABEL_18;
    }
    v9 = [(SignpostObject *)self attributes];
    if (v9)
    {
      v3 = [v6 attributes];
      if (!v3) {
        goto LABEL_6;
      }
    }
    v11 = [(SignpostObject *)self attributes];
    if (v11)
    {

      if (v9)
      {
      }
    }
    else
    {
      v12 = [v6 attributes];

      if (v9)
      {
      }
      if (v12) {
        goto LABEL_18;
      }
    }
    v13 = [(SignpostObject *)self attributes];

    if (!v13
      || ([(SignpostObject *)self attributes],
          v14 = objc_claimAutoreleasedReturnValue(),
          [v6 attributes],
          id v15 = objc_claimAutoreleasedReturnValue(),
          int v16 = [v14 isEqualToDictionary:v15],
          v15,
          v14,
          v16))
    {
      id v17 = [(SignpostObject *)self name];
      id v18 = [v6 name];
      int v19 = [v17 isEqual:v18];

      if (v19)
      {
        int v20 = [(SignpostObject *)self telemetryEnabled];
        if (v20 == [v6 telemetryEnabled])
        {
          v9 = [(SignpostObject *)self string1Name];
          if (v9)
          {
            id v18 = [v6 string1Name];
            if (!v18) {
              goto LABEL_6;
            }
          }
          v22 = [(SignpostObject *)self string1Name];
          if (v22)
          {

            if (v9)
            {
            }
          }
          else
          {
            objc_super v23 = [v6 string1Name];

            if (v9)
            {
            }
            if (v23) {
              goto LABEL_18;
            }
          }
          v24 = [(SignpostObject *)self string1Name];

          if (v24)
          {
            v25 = [(SignpostObject *)self string1Name];
            id v18 = [v6 string1Name];
            int v26 = [v25 isEqualToString:v18];

            if (!v26) {
              goto LABEL_18;
            }
          }
          v9 = [(SignpostObject *)self string1Value];
          if (v9)
          {
            id v18 = [v6 string1Value];
            if (!v18) {
              goto LABEL_6;
            }
          }
          v27 = [(SignpostObject *)self string1Value];
          if (v27)
          {

            if (v9)
            {
            }
          }
          else
          {
            v28 = [v6 string1Value];

            if (v9)
            {
            }
            if (v28) {
              goto LABEL_18;
            }
          }
          v29 = [(SignpostObject *)self string1Value];

          if (v29)
          {
            v30 = [(SignpostObject *)self string1Value];
            id v18 = [v6 string1Value];
            int v31 = [v30 isEqualToString:v18];

            if (!v31) {
              goto LABEL_18;
            }
          }
          v9 = [(SignpostObject *)self string2Name];
          if (v9)
          {
            id v18 = [v6 string2Name];
            if (!v18) {
              goto LABEL_6;
            }
          }
          v32 = [(SignpostObject *)self string2Name];
          if (v32)
          {

            if (v9)
            {
            }
          }
          else
          {
            v33 = [v6 string2Name];

            if (v9)
            {
            }
            if (v33) {
              goto LABEL_18;
            }
          }
          v34 = [(SignpostObject *)self string2Name];

          if (v34)
          {
            v35 = [(SignpostObject *)self string2Name];
            id v18 = [v6 string2Name];
            int v36 = [v35 isEqualToString:v18];

            if (!v36) {
              goto LABEL_18;
            }
          }
          v9 = [(SignpostObject *)self string2Value];
          if (v9)
          {
            id v18 = [v6 string2Value];
            if (!v18) {
              goto LABEL_6;
            }
          }
          v37 = [(SignpostObject *)self string2Value];
          if (v37)
          {

            if (v9)
            {
            }
          }
          else
          {
            v38 = [v6 string2Value];

            if (v9)
            {
            }
            if (v38) {
              goto LABEL_18;
            }
          }
          v39 = [(SignpostObject *)self string2Value];

          if (v39)
          {
            v40 = [(SignpostObject *)self string2Value];
            id v18 = [v6 string2Value];
            int v41 = [v40 isEqualToString:v18];

            if (!v41) {
              goto LABEL_18;
            }
          }
          v9 = [(SignpostObject *)self number1Name];
          if (v9)
          {
            id v18 = [v6 number1Name];
            if (!v18) {
              goto LABEL_6;
            }
          }
          v42 = [(SignpostObject *)self number1Name];
          if (v42)
          {

            if (v9)
            {
            }
          }
          else
          {
            v43 = [v6 number1Name];

            if (v9)
            {
            }
            if (v43) {
              goto LABEL_18;
            }
          }
          v44 = [(SignpostObject *)self number1Name];

          if (v44)
          {
            v45 = [(SignpostObject *)self number1Name];
            id v18 = [v6 number1Name];
            int v46 = [v45 isEqualToString:v18];

            if (!v46) {
              goto LABEL_18;
            }
          }
          v9 = [(SignpostObject *)self number1Value];
          if (v9)
          {
            id v18 = [v6 number1Value];
            if (!v18) {
              goto LABEL_6;
            }
          }
          v47 = [(SignpostObject *)self number1Value];
          if (v47)
          {

            if (v9)
            {
            }
          }
          else
          {
            v48 = [v6 number1Value];

            if (v9)
            {
            }
            if (v48) {
              goto LABEL_18;
            }
          }
          v49 = [(SignpostObject *)self number1Value];

          if (v49)
          {
            v50 = [(SignpostObject *)self number1Value];
            id v18 = [v6 number1Value];
            int v51 = [v50 isEqualToNumber:v18];

            if (!v51) {
              goto LABEL_18;
            }
          }
          v9 = [(SignpostObject *)self number2Name];
          if (v9)
          {
            id v18 = [v6 number2Name];
            if (!v18) {
              goto LABEL_6;
            }
          }
          v52 = [(SignpostObject *)self number2Name];
          if (v52)
          {

            if (v9)
            {
            }
          }
          else
          {
            v53 = [v6 number2Name];

            if (v9)
            {
            }
            if (v53) {
              goto LABEL_18;
            }
          }
          v54 = [(SignpostObject *)self number2Name];

          if (v54)
          {
            v55 = [(SignpostObject *)self number2Name];
            id v18 = [v6 number2Name];
            int v56 = [v55 isEqualToString:v18];

            if (!v56) {
              goto LABEL_18;
            }
          }
          v9 = [(SignpostObject *)self number2Value];
          if (v9)
          {
            id v18 = [v6 number2Value];
            if (!v18)
            {
LABEL_6:

              goto LABEL_18;
            }
          }
          v57 = [(SignpostObject *)self number2Value];
          if (v57)
          {

            if (v9)
            {
            }
          }
          else
          {
            v58 = [v6 number2Value];

            if (v9)
            {
            }
            if (v58) {
              goto LABEL_18;
            }
          }
          v59 = [(SignpostObject *)self number2Value];

          if (!v59
            || ([(SignpostObject *)self number2Value],
                v60 = objc_claimAutoreleasedReturnValue(),
                [v6 number2Value],
                v61 = objc_claimAutoreleasedReturnValue(),
                int v62 = [v60 isEqualToNumber:v61],
                v61,
                v60,
                v62))
          {
            BOOL v10 = 1;
            goto LABEL_19;
          }
        }
      }
    }
LABEL_18:
    BOOL v10 = 0;
LABEL_19:

    goto LABEL_20;
  }
  BOOL v10 = 0;
LABEL_20:

  return v10;
}

+ (id)serializationTypeNumber
{
}

- (id)_dictionaryRepresentationWithIsHumanReadable:(BOOL)a3 shouldRedact:(BOOL)a4
{
  BOOL v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)SignpostObject;
  id v6 = [(SignpostSupportObject *)&v40 _dictionaryRepresentationWithIsHumanReadable:a3 shouldRedact:a4];
  unint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[SignpostObject signpostId](self, "signpostId"));
  if (v4) {
    unint64_t v8 = @"SignpostID";
  }
  else {
    unint64_t v8 = @"ID";
  }
  [v6 setObject:v7 forKeyedSubscript:v8];

  if (v4)
  {
    v9 = [(SignpostObject *)self scopeString];
    [v6 setObject:v9 forKeyedSubscript:@"SignpostScope"];
    BOOL v10 = @"TelemetryEnabled";
  }
  else
  {
    v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SignpostObject scope](self, "scope"));
    [v6 setObject:v9 forKeyedSubscript:@"Scope"];
    BOOL v10 = @"TelEn";
  }

  v11 = [(SignpostObject *)self name];
  [v6 setObject:v11 forKeyedSubscript:@"Name"];

  v12 = objc_msgSend(NSNumber, "numberWithBool:", -[SignpostObject telemetryEnabled](self, "telemetryEnabled"));
  [v6 setObject:v12 forKeyedSubscript:v10];

  uint64_t v13 = [(SignpostObject *)self attributes];
  if (v13)
  {
    v14 = (void *)v13;
    id v15 = [(SignpostObject *)self attributes];
    uint64_t v16 = [v15 count];

    if (v16)
    {
      id v17 = [(SignpostObject *)self attributes];
      if (v4) {
        id v18 = @"AttributeDictionary";
      }
      else {
        id v18 = @"AttDict";
      }
      [v6 setObject:v17 forKeyedSubscript:v18];
    }
  }
  int v19 = [(SignpostObject *)self string1Name];

  if (v19)
  {
    int v20 = [(SignpostObject *)self string1Name];
    if (v4) {
      v21 = @"String1Name";
    }
    else {
      v21 = @"Str1Name";
    }
    if (v4) {
      v22 = @"String1Value";
    }
    else {
      v22 = @"Str1Val";
    }
    [v6 setObject:v20 forKeyedSubscript:v21];

    objc_super v23 = [(SignpostObject *)self string1Value];
    [v6 setObject:v23 forKeyedSubscript:v22];
  }
  v24 = [(SignpostObject *)self string2Name];

  if (v24)
  {
    v25 = [(SignpostObject *)self string2Name];
    if (v4) {
      int v26 = @"String2Name";
    }
    else {
      int v26 = @"Str2Name";
    }
    if (v4) {
      v27 = @"String2Value";
    }
    else {
      v27 = @"Str2Val";
    }
    [v6 setObject:v25 forKeyedSubscript:v26];

    v28 = [(SignpostObject *)self string2Value];
    [v6 setObject:v28 forKeyedSubscript:v27];
  }
  v29 = [(SignpostObject *)self number1Name];

  if (v29)
  {
    v30 = [(SignpostObject *)self number1Name];
    if (v4) {
      int v31 = @"Number1Name";
    }
    else {
      int v31 = @"Hist1Name";
    }
    if (v4) {
      v32 = @"Number1Value";
    }
    else {
      v32 = @"Hist1Val";
    }
    [v6 setObject:v30 forKeyedSubscript:v31];

    v33 = [(SignpostObject *)self number1Value];
    [v6 setObject:v33 forKeyedSubscript:v32];
  }
  v34 = [(SignpostObject *)self number2Name];

  if (v34)
  {
    v35 = [(SignpostObject *)self number2Name];
    if (v4) {
      int v36 = @"Number2Name";
    }
    else {
      int v36 = @"Hist2Name";
    }
    if (v4) {
      v37 = @"Number2Value";
    }
    else {
      v37 = @"Hist2Val";
    }
    [v6 setObject:v35 forKeyedSubscript:v36];

    v38 = [(SignpostObject *)self number2Value];
    [v6 setObject:v38 forKeyedSubscript:v37];
  }

  return v6;
}

- (SignpostObject)initWithDictionary:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_11;
  }
  v23.receiver = self;
  v23.super_class = (Class)SignpostObject;
  self = [(SignpostSupportObject *)&v23 initWithDictionary:v4];
  if (!self)
  {
LABEL_9:
    self = self;
    id v6 = self;
    goto LABEL_12;
  }
  id v5 = [v4 objectForKeyedSubscript:@"ID"];
  id v6 = v5;
  if (v5)
  {
    [(SignpostObject *)self setSignpostId:[(SignpostObject *)v5 unsignedLongLongValue]];
    unint64_t v7 = [v4 objectForKeyedSubscript:@"Scope"];
    unint64_t v8 = v7;
    if (v7)
    {
      -[SignpostObject setScope:](self, "setScope:", [v7 unsignedIntegerValue]);
      v9 = [v4 objectForKeyedSubscript:@"Name"];
      [(SignpostObject *)self setName:v9];

      BOOL v10 = [(SignpostObject *)self name];

      if (v10)
      {
        v11 = [v4 objectForKeyedSubscript:@"TelEn"];
        v12 = v11;
        if (v11) {
          -[SignpostObject setTelemetryEnabled:](self, "setTelemetryEnabled:", [v11 BOOLValue]);
        }
        uint64_t v13 = [v4 objectForKeyedSubscript:@"AttDict"];
        [(SignpostObject *)self setAttributes:v13];

        v14 = [v4 objectForKeyedSubscript:@"Str1Name"];
        [(SignpostObject *)self setString1Name:v14];

        id v15 = [v4 objectForKeyedSubscript:@"Str1Val"];
        [(SignpostObject *)self setString1Value:v15];

        uint64_t v16 = [v4 objectForKeyedSubscript:@"Str2Name"];
        [(SignpostObject *)self setString2Name:v16];

        id v17 = [v4 objectForKeyedSubscript:@"Str2Val"];
        [(SignpostObject *)self setString2Value:v17];

        id v18 = [v4 objectForKeyedSubscript:@"Hist1Name"];
        [(SignpostObject *)self setNumber1Name:v18];

        int v19 = [v4 objectForKeyedSubscript:@"Hist1Val"];
        [(SignpostObject *)self setNumber1Value:v19];

        int v20 = [v4 objectForKeyedSubscript:@"Hist2Name"];
        [(SignpostObject *)self setNumber2Name:v20];

        v21 = [v4 objectForKeyedSubscript:@"Hist2Val"];
        [(SignpostObject *)self setNumber2Value:v21];

        goto LABEL_9;
      }
    }

LABEL_11:
    id v6 = 0;
  }
LABEL_12:

  return v6;
}

- (id)_descriptionStringForColumn:(unint64_t)a3 timeFormat:(unint64_t)a4 asBegin:(BOOL)a5
{
  v20.receiver = self;
  v20.super_class = (Class)SignpostObject;
  unint64_t v7 = [(SignpostSupportObject *)&v20 _descriptionStringForColumn:a3 timeFormat:a4 asBegin:a5];
  unint64_t v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    BOOL v10 = 0;
    switch(a3)
    {
      case 6uLL:
        v9 = [(SignpostObject *)self name];
        break;
      case 0xBuLL:
        if ([(SignpostObject *)self signpostId] == 0xEEEEB0B5B2B2EEEELL
          || [(SignpostObject *)self signpostId] == 0xCABA71571CC0FFEELL)
        {
          BOOL v10 = @"ID_EXCLUSIVE";
          goto LABEL_4;
        }
        objc_msgSend(NSString, "stringWithFormat:", @"%#llx", -[SignpostObject signpostId](self, "signpostId"));
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
        break;
      case 0xCuLL:
        unint64_t v16 = [(SignpostObject *)self scope];
        if (v16 > 2) {
          BOOL v10 = @"UNKNOWN";
        }
        else {
          BOOL v10 = off_1E5B40758[v16];
        }
        goto LABEL_4;
      case 0xDuLL:
        BOOL v17 = [(SignpostObject *)self telemetryEnabled];
        id v18 = @"Disabled";
        if (v17) {
          id v18 = @"Enabled";
        }
        v9 = v18;
        break;
      case 0xEuLL:
        v12 = [(SignpostObject *)self string1Name];
        if (!v12) {
          goto LABEL_26;
        }
        uint64_t v13 = NSString;
        v14 = [(SignpostObject *)self string1Name];
        uint64_t v15 = [(SignpostObject *)self string1Value];
        goto LABEL_25;
      case 0xFuLL:
        v12 = [(SignpostObject *)self string2Name];
        if (!v12) {
          goto LABEL_26;
        }
        uint64_t v13 = NSString;
        v14 = [(SignpostObject *)self string2Name];
        uint64_t v15 = [(SignpostObject *)self string2Value];
        goto LABEL_25;
      case 0x10uLL:
        v12 = [(SignpostObject *)self number1Name];
        if (!v12) {
          goto LABEL_26;
        }
        uint64_t v13 = NSString;
        v14 = [(SignpostObject *)self number1Name];
        uint64_t v15 = [(SignpostObject *)self number1Value];
        goto LABEL_25;
      case 0x11uLL:
        v12 = [(SignpostObject *)self number2Name];
        if (v12)
        {
          uint64_t v13 = NSString;
          v14 = [(SignpostObject *)self number2Name];
          uint64_t v15 = [(SignpostObject *)self number2Value];
LABEL_25:
          int v19 = (void *)v15;
          [v13 stringWithFormat:@"%@ = %@", v14, v15];
          BOOL v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
LABEL_26:
          BOOL v10 = 0;
        }

        goto LABEL_4;
      default:
        goto LABEL_4;
    }
  }
  BOOL v10 = v9;
LABEL_4:

  return v10;
}

- (NSString)scopeString
{
  unint64_t v2 = [(SignpostObject *)self scope];
  if (v2 > 2) {
    return (NSString *)@"UNKNOWN";
  }
  else {
    return &off_1E5B40758[v2]->isa;
  }
}

- (BOOL)telemetryEnabled
{
  return self->_telemetryEnabled;
}

- (void)setAttributes:(id)a3
{
}

- (NSString)number2Name
{
  return self->_number2Name;
}

- (NSNumber)number2Value
{
  return self->_number2Value;
}

- (void)initWithSubsystem:category:name:signpostId:scope:timebaseRatio:attributes:.cold.1()
{
}

- (void)initWithSubsystem:category:name:signpostId:scope:timebaseRatio:attributes:.cold.2()
{
}

@end