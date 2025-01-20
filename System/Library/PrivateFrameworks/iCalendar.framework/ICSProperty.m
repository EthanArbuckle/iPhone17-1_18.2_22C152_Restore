@interface ICSProperty
+ (BOOL)supportsSecureCoding;
+ (id)valueAndParameterClasses;
- (BOOL)alwaysHasParametersToSerialize;
- (BOOL)isMultiValued;
- (BOOL)shouldObscureParameter:(id)a3;
- (BOOL)shouldObscureValue;
- (ICSProperty)initWithCoder:(id)a3;
- (ICSProperty)initWithValue:(id)a3 type:(unint64_t)a4;
- (NSSet)propertiesToExcludeForChecksum;
- (id)allParameters;
- (id)description;
- (id)parameterValueForName:(id)a3;
- (id)parameters;
- (id)propertiesToHide;
- (id)propertiesToObscure;
- (id)stringValue;
- (id)value;
- (unint64_t)type;
- (void)_ICSStringWithOptions:(unint64_t)a3 appendingToString:(id)a4;
- (void)_ICSStringWithOptions:(unint64_t)a3 appendingToString:(id)a4 additionalParameters:(id)a5;
- (void)_appendDateTimeInDate:(id)a3 asUTCToResult:(id)a4;
- (void)_setParsedValues:(id)a3 type:(unint64_t)a4;
- (void)addParameter:(id)a3 withRawValue:(id)a4 options:(unint64_t)a5;
- (void)addParametersFromDictionary:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)removeParameterValueForName:(id)a3;
- (void)setParameterValue:(id)a3 forName:(id)a4;
- (void)setParameters:(id)a3;
- (void)setValue:(id)a3 type:(unint64_t)a4;
- (void)setValueAsProperty:(id)a3 withRawValue:(const char *)a4 options:(unint64_t)a5;
@end

@implementation ICSProperty

- (void)_ICSStringWithOptions:(unint64_t)a3 appendingToString:(id)a4 additionalParameters:(id)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v32 = a4;
  id v8 = a5;
  v9 = (void *)MEMORY[0x1E4F1CA60];
  v29 = self;
  v10 = [(ICSProperty *)self parameters];
  v11 = [v9 dictionaryWithDictionary:v10];

  if (v8) {
    [v11 addEntriesFromDictionary:v8];
  }
  v28 = v8;
  v12 = [v11 allKeys];
  v13 = [v12 sortedArrayUsingSelector:sel_compare_];

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = v13;
  uint64_t v14 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
  v15 = v11;
  if (v14)
  {
    uint64_t v16 = v14;
    uint64_t v17 = *(void *)v34;
    v31 = v15;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v34 != v17) {
          objc_enumerationMutation(obj);
        }
        v19 = *(void **)(*((void *)&v33 + 1) + 8 * v18);
        unint64_t v20 = a3;
        if ((a3 & 0x10) != 0)
        {
          if ([(ICSProperty *)v29 shouldObscureParameter:*(void *)(*((void *)&v33 + 1) + 8 * v18)])
          {
            unint64_t v20 = a3 | 0x20;
          }
          else
          {
            unint64_t v20 = a3;
          }
        }
        v21 = [v15 objectForKey:v19];
        id v22 = v32;
        id v23 = v19;
        [v22 appendString:@";"];
        [v22 appendString:v23];

        [v22 appendString:@"="];
        if ([v23 isEqualToString:@"ALTREP"])
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [v21 absoluteString];
          }
          else
          {
            NSLog(&cfstr_ParameterBridi.isa, v21);
            [v21 description];
          v25 = };
          v24 = [v25 _ICSStringForParameterQuotedValue];

LABEL_29:
          [v22 appendString:@"\""];
          [v24 _ICSStringWithOptions:v20 appendingToString:v22];
          [v22 appendString:@"\""];
LABEL_30:

          goto LABEL_31;
        }
        if ([v23 isEqualToString:@"RSVP"])
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [v21 _ICSBoolAppendingToString:v22];
            goto LABEL_32;
          }
        }
        if (([v23 isEqualToString:@"CN"] & 1) != 0
          || ([v23 isEqualToString:@"DIR"] & 1) != 0
          || ([v23 isEqualToString:@"SENT-BY"] & 1) != 0
          || ([v23 isEqualToString:@"X-CALENDARSERVER-ATTENDEE-REF"] & 1) != 0
          || ([v23 isEqualToString:@"X-CALENDARSERVER-EMAIL"] & 1) != 0
          || ([v23 isEqualToString:@"EMAIL"] & 1) != 0
          || ([v23 isEqualToString:@"X-APPLE-TELEPHONE"] & 1) != 0
          || [v23 isEqualToString:@"TITLE"])
        {
          v24 = [v21 _ICSStringForParameterQuotedValue];
          goto LABEL_29;
        }
        if ([v23 isEqualToString:@"FBTYPE"])
        {
          [v21 _ICSFBTypeAppendingToString:v22];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [v21 _ICSParametersAppendingToString:v22];
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              if (_ICSStringWithOptions_appendingToString_additionalParameters__onceToken != -1) {
                dispatch_once(&_ICSStringWithOptions_appendingToString_additionalParameters__onceToken, &__block_literal_global_260);
              }
              if ([v21 rangeOfCharacterFromSet:_ICSStringWithOptions_appendingToString_additionalParameters__sQuoteCharacters] == 0x7FFFFFFFFFFFFFFFLL)
              {
                v24 = [v21 _ICSStringForParameterValue];
                [v24 _ICSStringWithOptions:v20 appendingToString:v22];
                goto LABEL_30;
              }
              [v22 appendString:@"\""];
              v26 = [v21 _ICSStringForParameterQuotedValue];
              [v26 _ICSStringWithOptions:v20 appendingToString:v22];

              [v22 appendString:@"\""];
LABEL_31:
              v15 = v31;
              goto LABEL_32;
            }
            [v21 _ICSStringWithOptions:v20 appendingToString:v22];
          }
        }
LABEL_32:

        ++v18;
      }
      while (v16 != v18);
      uint64_t v27 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
      uint64_t v16 = v27;
    }
    while (v27);
  }
}

uint64_t __87__ICSProperty_ICSWriter___ICSStringWithOptions_appendingToString_additionalParameters___block_invoke()
{
  _ICSStringWithOptions_appendingToString_additionalParameters__sQuoteCharacters = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@";:,"];
  return MEMORY[0x1F41817F8]();
}

- (void)_appendDateTimeInDate:(id)a3 asUTCToResult:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v12 = objc_alloc_init(ICSCalendar);
  v7 = [(ICSCalendar *)v12 systemDateForDate:v6 options:0];

  id v8 = objc_alloc(MEMORY[0x1E4F1C9A8]);
  v9 = (void *)[v8 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
  v10 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:@"UTC"];
  [v9 setTimeZone:v10];

  v11 = [v9 components:766 fromDate:v7];
  objc_msgSend(v5, "appendFormat:", @"%.4d%.2d%.2dT%.2d%.2d%.2dZ", objc_msgSend(v11, "year"), objc_msgSend(v11, "month"), objc_msgSend(v11, "day"), objc_msgSend(v11, "hour"), objc_msgSend(v11, "minute"), objc_msgSend(v11, "second"));
}

- (void)_ICSStringWithOptions:(unint64_t)a3 appendingToString:(id)a4
{
  id v57 = a4;
  id v6 = [(ICSProperty *)self parameters];
  if (v6)
  {

LABEL_4:
    [(ICSProperty *)self _ICSStringWithOptions:a3 appendingToString:v57 additionalParameters:0];
    goto LABEL_5;
  }
  if ([(ICSProperty *)self alwaysHasParametersToSerialize]) {
    goto LABEL_4;
  }
LABEL_5:
  if ((a3 & 0x10) != 0 && [(ICSProperty *)self shouldObscureValue]) {
    a3 |= 0x20uLL;
  }
  switch([(ICSProperty *)self type])
  {
    case 5003uLL:
      uint64_t v14 = [(ICSProperty *)self value];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass) {
        goto LABEL_49;
      }
      uint64_t v16 = [(ICSProperty *)self value];
      NSLog(&cfstr_PropertyvalueB_9.isa, v16);
      break;
    case 5004uLL:
      uint64_t v17 = [(ICSProperty *)self value];
      objc_opt_class();
      char v18 = objc_opt_isKindOfClass();

      if (v18) {
        goto LABEL_49;
      }
      uint64_t v16 = [(ICSProperty *)self value];
      NSLog(&cfstr_PropertyvalueB_7.isa, v16);
      break;
    case 5005uLL:
      v19 = [(ICSProperty *)self value];
      objc_opt_class();
      char v20 = objc_opt_isKindOfClass();

      if (v20) {
        goto LABEL_49;
      }
      uint64_t v16 = [(ICSProperty *)self value];
      NSLog(&cfstr_PropertyvalueB_6.isa, v16);
      break;
    case 5006uLL:
      v21 = [(ICSProperty *)self value];
      uint64_t v22 = objc_opt_class();
      uint64_t v23 = objc_opt_class();

      if (v22 == v23) {
        goto LABEL_49;
      }
      uint64_t v16 = [(ICSProperty *)self value];
      NSLog(&cfstr_PropertyvalueB.isa, v16);
      break;
    case 5007uLL:
    case 5010uLL:
      uint64_t v7 = [(ICSProperty *)self value];
      if (v7)
      {
        id v8 = (void *)v7;
        v9 = [(ICSProperty *)self value];
        objc_opt_class();
        char v10 = objc_opt_isKindOfClass();

        if ((v10 & 1) == 0)
        {
          v11 = [(ICSProperty *)self value];
          NSLog(&cfstr_PropertyvalueB_4.isa, v11);
        }
      }
      [v57 appendString:@":"];
      v12 = [(ICSProperty *)self value];
      v13 = [v12 _ICSStringForProperyValue];
      [v13 _ICSStringWithOptions:a3 appendingToString:v57];

      goto LABEL_51;
    case 5008uLL:
      v24 = [(ICSProperty *)self value];
      objc_opt_class();
      char v25 = objc_opt_isKindOfClass();

      if (v25) {
        goto LABEL_49;
      }
      uint64_t v16 = [(ICSProperty *)self value];
      NSLog(&cfstr_PropertyvalueB_5.isa, v16);
      break;
    case 5009uLL:
      v26 = [(ICSProperty *)self value];
      objc_opt_class();
      char v27 = objc_opt_isKindOfClass();

      if (v27) {
        goto LABEL_49;
      }
      uint64_t v16 = [(ICSProperty *)self value];
      NSLog(&cfstr_PropertyvalueB_14.isa, v16);
      break;
    case 5011uLL:
      v28 = [(ICSProperty *)self value];
      objc_opt_class();
      char v29 = objc_opt_isKindOfClass();

      if (v29) {
        goto LABEL_49;
      }
      uint64_t v16 = [(ICSProperty *)self value];
      NSLog(&cfstr_PropertyvalueB_1.isa, v16);
      break;
    case 5012uLL:
      v30 = [(ICSProperty *)self value];
      objc_opt_class();
      char v31 = objc_opt_isKindOfClass();

      if ((v31 & 1) == 0)
      {
        id v32 = [(ICSProperty *)self value];
        NSLog(&cfstr_PropertyvalueB_15.isa, v32);
      }
      [v57 appendString:@":"];
      v12 = [(ICSProperty *)self value];
      [v12 _ICSBoolAppendingToString:v57];
      goto LABEL_51;
    case 5013uLL:
      long long v33 = [(ICSProperty *)self value];
      objc_opt_class();
      char v34 = objc_opt_isKindOfClass();

      if ((v34 & 1) == 0)
      {
        long long v35 = [(ICSProperty *)self value];
        long long v36 = [(ICSProperty *)self value];
        uint64_t v37 = objc_opt_class();
        NSLog(&cfstr_PropertyvalueB_3.isa, v35, v37);
      }
      id v38 = v57;
      [v38 appendString:@";"];
      [v38 appendString:@"VALUE"];
      [v38 appendString:@"="];
      [v38 appendString:@"URI"];

      [v38 appendString:@":"];
      v39 = [(ICSProperty *)self value];
      v12 = v39;
      unint64_t v40 = a3;
      id v41 = v38;
      goto LABEL_50;
    case 5016uLL:
      v42 = [(ICSProperty *)self value];
      objc_opt_class();
      char v43 = objc_opt_isKindOfClass();

      if (v43) {
        goto LABEL_49;
      }
      uint64_t v16 = [(ICSProperty *)self value];
      NSLog(&cfstr_PropertyvalueB_0.isa, v16);
      break;
    case 5018uLL:
      v44 = [(ICSProperty *)self value];
      objc_opt_class();
      char v45 = objc_opt_isKindOfClass();

      if ((v45 & 1) == 0)
      {
        v46 = [(ICSProperty *)self value];
        NSLog(&cfstr_PropertyvalueB_13.isa, v46);
      }
      [v57 appendString:@":"];
      v12 = [(ICSProperty *)self value];
      [v12 _ICSUTCOffsetAppendingToString:v57];
      goto LABEL_51;
    case 5020uLL:
      v47 = [(ICSProperty *)self value];
      objc_opt_class();
      char v48 = objc_opt_isKindOfClass();

      if (v48) {
        goto LABEL_49;
      }
      uint64_t v16 = [(ICSProperty *)self value];
      NSLog(&cfstr_PropertyvalueB_12.isa, v16);
      break;
    case 5021uLL:
      v49 = [(ICSProperty *)self value];
      objc_opt_class();
      char v50 = objc_opt_isKindOfClass();

      if (v50) {
        goto LABEL_49;
      }
      uint64_t v16 = [(ICSProperty *)self value];
      NSLog(&cfstr_PropertyvalueB_2.isa, v16);
      break;
    case 5025uLL:
      v51 = [(ICSProperty *)self value];
      objc_opt_class();
      char v52 = objc_opt_isKindOfClass();

      if (v52) {
        goto LABEL_49;
      }
      uint64_t v16 = [(ICSProperty *)self value];
      NSLog(&cfstr_PropertyvalueB_11.isa, v16);
      break;
    case 5030uLL:
      v55 = [(ICSProperty *)self value];
      objc_opt_class();
      char v56 = objc_opt_isKindOfClass();

      if (v56) {
        goto LABEL_49;
      }
      uint64_t v16 = [(ICSProperty *)self value];
      NSLog(&cfstr_PropertyvalueB_10.isa, v16);
      break;
    case 5031uLL:
      v53 = [(ICSProperty *)self value];
      objc_opt_class();
      char v54 = objc_opt_isKindOfClass();

      if (v54) {
        goto LABEL_49;
      }
      uint64_t v16 = [(ICSProperty *)self value];
      NSLog(&cfstr_PropertyvalueB_8.isa, v16);
      break;
    default:
      goto LABEL_49;
  }

LABEL_49:
  [v57 appendString:@":"];
  v39 = [(ICSProperty *)self value];
  v12 = v39;
  unint64_t v40 = a3;
  id v41 = v57;
LABEL_50:
  [v39 _ICSStringWithOptions:v40 appendingToString:v41];
LABEL_51:
}

- (BOOL)isMultiValued
{
  return 0;
}

- (unint64_t)type
{
  return self->_type;
}

- (id)value
{
  return self->_value;
}

- (id)parameterValueForName:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_parameters objectForKey:a3];
}

- (void)addParametersFromDictionary:(id)a3
{
}

- (void)setParameters:(id)a3
{
  id obj = (NSMutableDictionary *)a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v5 = obj;
  id v6 = obj;
  if (isKindOfClass)
  {
    id v6 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:obj];

    id v5 = obj;
  }
  parameters = self->_parameters;
  p_parameters = &self->_parameters;
  if (parameters != v5) {
    objc_storeStrong((id *)p_parameters, v6);
  }
}

- (void)setParameterValue:(id)a3 forName:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  id v7 = v12;
  id v8 = v6;
  parameters = self->_parameters;
  if (v12)
  {
    if (!parameters)
    {
      char v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v11 = self->_parameters;
      self->_parameters = v10;

      id v7 = v12;
      parameters = self->_parameters;
    }
    [(NSMutableDictionary *)parameters setObject:v7 forKey:v8];
  }
  else
  {
    [(NSMutableDictionary *)parameters removeObjectForKey:v8];
  }
}

- (void)removeParameterValueForName:(id)a3
{
}

- (NSSet)propertiesToExcludeForChecksum
{
  return 0;
}

- (id)propertiesToObscure
{
  return 0;
}

- (id)propertiesToHide
{
  return 0;
}

- (BOOL)shouldObscureParameter:(id)a3
{
  return 0;
}

- (BOOL)shouldObscureValue
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  parameters = self->_parameters;
  id v5 = a3;
  [v5 encodeObject:parameters forKey:@"Parameters"];
  [v5 encodeInteger:self->_type forKey:@"Type"];
  [v5 encodeObject:self->_value forKey:@"Value"];
}

+ (id)valueAndParameterClasses
{
  if (valueAndParameterClasses_onceToken != -1) {
    dispatch_once(&valueAndParameterClasses_onceToken, &__block_literal_global_10);
  }
  v2 = (void *)valueAndParameterClasses_valueAndParameterClasses;
  return v2;
}

void __39__ICSProperty_valueAndParameterClasses__block_invoke()
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  uint64_t v16 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  uint64_t v18 = objc_opt_class();
  uint64_t v19 = objc_opt_class();
  uint64_t v20 = objc_opt_class();
  uint64_t v21 = objc_opt_class();
  uint64_t v22 = objc_opt_class();
  uint64_t v23 = objc_opt_class();
  uint64_t v24 = objc_opt_class();
  uint64_t v25 = objc_opt_class();
  uint64_t v26 = objc_opt_class();
  uint64_t v27 = objc_opt_class();
  uint64_t v28 = objc_opt_class();
  uint64_t v29 = objc_opt_class();
  uint64_t v30 = objc_opt_class();
  uint64_t v31 = objc_opt_class();
  uint64_t v32 = objc_opt_class();
  uint64_t v33 = objc_opt_class();
  uint64_t v34 = objc_opt_class();
  uint64_t v35 = objc_opt_class();
  uint64_t v36 = objc_opt_class();
  uint64_t v37 = objc_opt_class();
  uint64_t v38 = objc_opt_class();
  uint64_t v39 = objc_opt_class();
  uint64_t v40 = objc_opt_class();
  uint64_t v41 = objc_opt_class();
  uint64_t v42 = objc_opt_class();
  uint64_t v43 = objc_opt_class();
  uint64_t v44 = objc_opt_class();
  uint64_t v45 = objc_opt_class();
  uint64_t v46 = objc_opt_class();
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v4 count:43];
  objc_msgSend(v0, "setWithArray:", v1, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19,
    v20,
    v21,
    v22,
    v23,
    v24,
    v25,
    v26,
    v27,
    v28,
    v29,
    v30,
    v31,
    v32,
    v33,
    v34,
    v35,
    v36,
    v37,
    v38,
    v39,
    v40,
    v41,
    v42,
    v43,
    v44,
  uint64_t v2 = v45);
  v3 = (void *)valueAndParameterClasses_valueAndParameterClasses;
  valueAndParameterClasses_valueAndParameterClasses = v2;
}

- (ICSProperty)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ICSProperty;
  uint64_t v5 = [(ICSProperty *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [(id)objc_opt_class() valueAndParameterClasses];
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"Parameters"];
    parameters = v5->_parameters;
    v5->_parameters = (NSMutableDictionary *)v7;

    v5->_type = [v4 decodeIntegerForKey:@"Type"];
    uint64_t v9 = [v4 decodeObjectOfClasses:v6 forKey:@"Value"];
    id value = v5->_value;
    v5->_id value = (id)v9;
  }
  return v5;
}

- (id)allParameters
{
  uint64_t v2 = (void *)MEMORY[0x1E4F1C9E8];
  v3 = [(ICSProperty *)self parameters];
  id v4 = [v2 dictionaryWithDictionary:v3];

  return v4;
}

- (ICSProperty)initWithValue:(id)a3 type:(unint64_t)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ICSProperty;
  uint64_t v7 = [(ICSProperty *)&v10 init];
  uint64_t v8 = v7;
  if (v7) {
    [(ICSProperty *)v7 setValue:v6 type:a4];
  }

  return v8;
}

- (void)setValue:(id)a3 type:(unint64_t)a4
{
  if (*(_OWORD *)&self->_type != __PAIR128__((unint64_t)a3, a4))
  {
    objc_storeStrong(&self->_value, a3);
    self->_type = a4;
  }
  MEMORY[0x1F41817F8]();
}

- (BOOL)alwaysHasParametersToSerialize
{
  return 0;
}

- (id)parameters
{
  return self->_parameters;
}

- (id)stringValue
{
  return (id)[self->_value description];
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  id v6 = [(ICSProperty *)self stringValue];
  uint64_t v7 = [v3 stringWithFormat:@"<%@ %p - %@>", v5, self, v6];

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
}

- (void)addParameter:(id)a3 withRawValue:(id)a4 options:(unint64_t)a5
{
  id v12 = a3;
  uint64_t v7 = (__CFString *)a4;
  if ([v12 isEqualToString:@"CUTYPE"])
  {
    uint64_t v8 = +[ICSCalendarUserParameter calendarUserTypeParameterFromICSString:v7];
    goto LABEL_31;
  }
  if ([v12 isEqualToString:@"ROLE"])
  {
    uint64_t v8 = +[ICSRoleParameter roleParameterFromICSString:v7];
    goto LABEL_31;
  }
  if ([v12 isEqualToString:@"PARTSTAT"])
  {
    uint64_t v8 = +[ICSParticipationStatusParameter participationStatusParameterFromICSString:v7];
    goto LABEL_31;
  }
  if ([v12 isEqualToString:@"SCHEDULE-STATUS"])
  {
    uint64_t v8 = +[ICSScheduleStatusParameter scheduleStatusParameterFromICSString:v7];
    goto LABEL_31;
  }
  if ([v12 isEqualToString:@"SCHEDULE-AGENT"])
  {
    uint64_t v8 = +[ICSScheduleAgentParameter scheduleAgentParameterFromICSString:v7];
    goto LABEL_31;
  }
  if ([v12 isEqualToString:@"RSVP"])
  {
    uint64_t v8 = [NSNumber BOOLFromICSString:v7];
    goto LABEL_31;
  }
  if ([v12 isEqualToString:@"SCHEDULE-FORCE-SEND"])
  {
    uint64_t v8 = +[ICSScheduleForceSendParameter scheduleForceSendParameterFromICSString:v7];
    goto LABEL_31;
  }
  if ([v12 isEqualToString:@"X-CALENDARSERVER-DTSTAMP"])
  {
    uint64_t v9 = ICSDateValue;
LABEL_17:
    uint64_t v8 = [(__objc2_class *)v9 dateFromICSString:v7];
    goto LABEL_31;
  }
  if ([v12 isEqualToString:@"FBTYPE"])
  {
    uint64_t v8 = +[ICSFreeBusyTypeParameter freeBusyTypeParameterFromICSString:v7];
  }
  else if ([v12 isEqualToString:@"X-APPLE-RELATED-TRAVEL"])
  {
    uint64_t v8 = +[ICSDuration durationFromICSString:v7];
  }
  else if ([v12 isEqualToString:@"RELTYPE"])
  {
    uint64_t v8 = +[ICSRelationshipTypeParameter relationshipTypeParameterFromICSString:v7];
  }
  else if ([v12 isEqualToString:@"X-APPLE-MAPKIT-HANDLE"])
  {
    CFDataRef v10 = ICSDecodeBase64(0, v7);
    CFAutorelease(v10);
    uint64_t v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if ([v12 isEqualToString:@"ACKNOWLEDGED"])
    {
      uint64_t v9 = ICSDateTimeUTCValue;
      goto LABEL_17;
    }
    if ([v12 isEqualToString:@"TO-ALL-PROPOSED-NEW-TIME"])
    {
      uint64_t v8 = +[ICSAlternateTimeProposal alternateTimeProposalFromICSCString:v7];
    }
    else
    {
      uint64_t v8 = v7;
    }
  }
LABEL_31:
  uint64_t v11 = v8;
  [(ICSProperty *)self setParameterValue:v8 forName:v12];
}

- (void)_setParsedValues:(id)a3 type:(unint64_t)a4
{
  id v7 = a3;
  if ([v7 count])
  {
    id v6 = [v7 objectAtIndex:0];
  }
  else
  {
    id v6 = 0;
  }
  [(ICSProperty *)self setValue:v6 type:a4];
}

- (void)setValueAsProperty:(id)a3 withRawValue:(const char *)a4 options:(unint64_t)a5
{
  char v5 = a5;
  id v8 = a3;
  uint64_t v9 = [NSString stringWithUTF8String:a4];
  CFDataRef v10 = [MEMORY[0x1E4F1C9B8] dataWithBytes:a4 length:8];
  uint64_t v11 = v10;
  if (!v9)
  {
    id v12 = [v10 base64EncodedStringWithOptions:0];
    NSLog(&cfstr_Utf8EncodingFa.isa, v8, v12);

    uint64_t v9 = (__CFString *)CFStringCreateWithCString(0, a4, 0x201u);
    if (!v9)
    {
      uint64_t v9 = (__CFString *)CFStringCreateWithCString(0, a4, 0);
      if (!v9)
      {
        uint64_t v9 = (__CFString *)CFStringCreateWithCString(0, a4, 1u);
        if (!v9)
        {
          uint64_t v9 = (__CFString *)CFStringCreateWithCString(0, a4, 0x500u);
          if (!v9)
          {
            uint64_t v25 = [v11 base64EncodedStringWithOptions:0];
            NSLog(&cfstr_NoCorrectEncod.isa, v8, v25);

            uint64_t v9 = 0;
            goto LABEL_136;
          }
        }
      }
    }
  }
  if ([v8 isEqualToString:@"DURATION"])
  {
    uint64_t v13 = +[ICSDuration durationFromICSString:v9];
    uint64_t v14 = (void *)v13;
    if ((v5 & 1) == 0 || v13)
    {
      uint64_t v15 = self;
      uint64_t v16 = v14;
      uint64_t v17 = 5011;
LABEL_50:
      [(ICSProperty *)v15 setValue:v16 type:v17];
LABEL_51:

      goto LABEL_136;
    }
    goto LABEL_55;
  }
  if ([v8 isEqualToString:@"METHOD"])
  {
    uint64_t v18 = +[ICSMethodValue methodValueFromICSString:v9];
    uint64_t v14 = (void *)v18;
    if ((v5 & 1) == 0 || v18)
    {
      uint64_t v15 = self;
      uint64_t v16 = v14;
      uint64_t v17 = 5025;
      goto LABEL_50;
    }
    goto LABEL_55;
  }
  if ([v8 isEqualToString:@"ACTION"])
  {
    uint64_t v19 = +[ICSActionValue actionValueFromICSString:v9];
    uint64_t v14 = (void *)v19;
    if ((v5 & 1) == 0 || v19)
    {
      uint64_t v15 = self;
      uint64_t v16 = v14;
      uint64_t v17 = 5020;
      goto LABEL_50;
    }
    goto LABEL_55;
  }
  if ([v8 isEqualToString:@"STATUS"])
  {
    uint64_t v20 = +[ICSStatusValue statusValueFromICSString:v9];
    uint64_t v14 = (void *)v20;
    if ((v5 & 1) == 0 || v20)
    {
      uint64_t v15 = self;
      uint64_t v16 = v14;
      uint64_t v17 = 5003;
      goto LABEL_50;
    }
    goto LABEL_55;
  }
  if ([v8 isEqualToString:@"X-CALENDARSERVER-ACCESS"])
  {
    uint64_t v21 = +[ICSCalendarServerAccessValue calendarServerAccessFromICSString:v9];
    uint64_t v14 = (void *)v21;
    if ((v5 & 1) == 0 || v21)
    {
      uint64_t v15 = self;
      uint64_t v16 = v14;
      uint64_t v17 = 5030;
      goto LABEL_50;
    }
    goto LABEL_55;
  }
  if ([v8 isEqualToString:@"URL"])
  {
    uint64_t v22 = objc_msgSend(MEMORY[0x1E4F1CB10], "_lp_URLWithUserTypedString:relativeToURL:", v9, 0);
    uint64_t v14 = (void *)v22;
    if ((v5 & 1) == 0 || v22)
    {
      [(ICSProperty *)self removeParameterValueForName:@"VALUE"];
      uint64_t v15 = self;
      uint64_t v16 = v14;
      uint64_t v17 = 5013;
      goto LABEL_50;
    }
    goto LABEL_55;
  }
  if ([v8 isEqualToString:@"TRANSP"])
  {
    uint64_t v23 = +[ICSTransparencyValue transparencyValueFromICSString:v9];
    uint64_t v14 = (void *)v23;
    if ((v5 & 1) == 0 || v23)
    {
      uint64_t v15 = self;
      uint64_t v16 = v14;
      uint64_t v17 = 5004;
      goto LABEL_50;
    }
    goto LABEL_55;
  }
  if ([v8 isEqualToString:@"X-APPLE-EWS-BUSYSTATUS"])
  {
    uint64_t v24 = +[ICSBusyStatusValue busyStatusValueFromICSString:v9];
    uint64_t v14 = (void *)v24;
    if ((v5 & 1) == 0 || v24)
    {
      uint64_t v15 = self;
      uint64_t v16 = v14;
      uint64_t v17 = 5031;
      goto LABEL_50;
    }
    goto LABEL_55;
  }
  if ([v8 isEqualToString:@"TRIGGER"])
  {
    uint64_t v14 = [(ICSProperty *)self parameterValueForName:@"VALUE"];
    if (([v14 isEqualToString:@"DATE"] & 1) != 0
      || [v14 isEqualToString:@"DATE-TIME"])
    {
      uint64_t v26 = +[ICSDateValue dateFromICSString:v9];
      uint64_t v27 = v26;
      if ((v5 & 1) == 0 || v26)
      {
        uint64_t v28 = (int)[v26 dateType];
        uint64_t v29 = self;
        uint64_t v30 = v27;
LABEL_144:
        [(ICSProperty *)v29 setValue:v30 type:v28];

        goto LABEL_51;
      }
    }
    else
    {
      uint64_t v33 = +[ICSDuration durationFromICSString:v9];
      uint64_t v27 = (void *)v33;
      if ((v5 & 1) == 0 || v33)
      {
        uint64_t v29 = self;
        uint64_t v30 = v27;
        uint64_t v28 = 5011;
        goto LABEL_144;
      }
    }

LABEL_55:
    int v32 = 0;
    goto LABEL_56;
  }
  if (([v8 isEqualToString:@"ATTENDEE"] & 1) != 0
    || [v8 isEqualToString:@"ORGANIZER"])
  {
    uint64_t v31 = [MEMORY[0x1E4F1CB10] URLWithString:v9 encodingInvalidCharacters:0];
    uint64_t v14 = (void *)v31;
    if ((v5 & 1) == 0 || (int v32 = 0, v31))
    {
      uint64_t v15 = self;
      uint64_t v16 = v14;
      uint64_t v17 = 5021;
      goto LABEL_50;
    }
  }
  else
  {
    if (![v8 isEqualToString:@"ATTACH"])
    {
      if ([v8 isEqualToString:@"CLASS"])
      {
        uint64_t v71 = +[ICSClassificationValue classificationValueFromICSString:v9];
        uint64_t v14 = (void *)v71;
        if ((v5 & 1) == 0 || v71)
        {
          uint64_t v15 = self;
          uint64_t v16 = v14;
          uint64_t v17 = 5005;
          goto LABEL_50;
        }
      }
      goto LABEL_55;
    }
    uint64_t v64 = [(ICSProperty *)self parameterValueForName:@"ENCODING"];
    if (v64)
    {
      v65 = (void *)v64;
      v66 = [(ICSProperty *)self parameterValueForName:@"ENCODING"];
      char v67 = [v66 isEqualToString:@"BASE64"];

      if ((v67 & 1) == 0)
      {
        NSLog(&cfstr_IgnoringDataFo.isa, self);
        [(ICSProperty *)self setValue:0 type:5026];
        goto LABEL_136;
      }
    }
    v68 = [(ICSProperty *)self parameterValueForName:@"VALUE"];
    int v69 = [v68 isEqualToString:@"BINARY"];

    if (v69)
    {
      CFDataRef v70 = ICSDecodeBase64(0, v9);
      if (v70)
      {
        uint64_t v35 = v70;
        [(ICSProperty *)self setValue:v70 type:5026];
        goto LABEL_135;
      }
      goto LABEL_55;
    }
    int v32 = 1;
  }
LABEL_56:
  BOOL v34 = [(ICSProperty *)self isMultiValued];
  if (v34)
  {
    uint64_t v35 = [MEMORY[0x1E4F1CA48] array];
  }
  else
  {
    uint64_t v35 = 0;
  }
  uint64_t v36 = (__CFString *)[(__CFString *)v9 length];
  long long v81 = 0u;
  long long v82 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  *(_OWORD *)buffer = 0u;
  long long v76 = 0u;
  CFStringRef theString = v9;
  uint64_t v86 = 0;
  v87 = v36;
  CharactersPtr = CFStringGetCharactersPtr(v9);
  CStringPtr = 0;
  v84 = (UniChar *)CharactersPtr;
  if (!CharactersPtr) {
    CStringPtr = CFStringGetCStringPtr(v9, 0x600u);
  }
  v88 = 0;
  v89 = 0;
  v85 = CStringPtr;
  if (!v36)
  {
LABEL_124:
    if (!v32) {
      goto LABEL_131;
    }
    goto LABEL_125;
  }
  if (v36 == (__CFString *)1)
  {
    uint64_t v36 = 0;
    goto LABEL_124;
  }
  int v72 = v32;
  v73 = self;
  v74 = v11;
  uint64_t v39 = 0;
  unsigned int v40 = 0;
  unsigned int v41 = 0;
  uint64_t v42 = 0;
  do
  {
    uint64_t v43 = v87;
    if ((uint64_t)v87 <= v39) {
      goto LABEL_120;
    }
    uint64_t v44 = v84;
    if (v84)
    {
      uint64_t v45 = v86 + v39;
LABEL_67:
      UniChar v46 = v44[v45];
      goto LABEL_70;
    }
    if (!v85)
    {
      v55 = v88;
      if ((uint64_t)v89 <= v39 || (uint64_t)v88 > v39)
      {
        id v57 = (__CFString *)(v39 - 4);
        if (v41 < 4) {
          id v57 = 0;
        }
        if ((uint64_t)&v57[2] < (uint64_t)v87) {
          uint64_t v43 = v57 + 2;
        }
        v88 = v57;
        v89 = v43;
        v90.location = (CFIndex)v57 + v86;
        v90.length = (char *)v43 - (char *)v57;
        CFStringGetCharacters(theString, v90, buffer);
        v55 = v88;
      }
      uint64_t v45 = v39 - (void)v55;
      uint64_t v44 = buffer;
      goto LABEL_67;
    }
    UniChar v46 = v85[v86 + v39];
LABEL_70:
    if (v46 != 44)
    {
      if (v46 != 92) {
        goto LABEL_120;
      }
      if (!v42)
      {
        uint64_t v42 = [MEMORY[0x1E4F28E78] string];
      }
      uint64_t v47 = -[__CFString substringWithRange:](v9, "substringWithRange:", v40, v41 - v40);
      [v42 appendString:v47];

      uint64_t v48 = v41 + 1;
      v49 = v87;
      if ((uint64_t)v87 <= v48)
      {
        UniChar v52 = 0;
        goto LABEL_83;
      }
      char v50 = v84;
      if (v84)
      {
        uint64_t v51 = v86 + v48;
      }
      else
      {
        if (v85)
        {
          UniChar v52 = v85[v86 + v48];
LABEL_96:
          if (v52 > 0x4Du)
          {
            if (v52 > 0x6Du)
            {
              if (v52 != 110 && v52 != 114) {
                goto LABEL_83;
              }
            }
            else if (v52 != 78)
            {
              if (v52 == 92)
              {
                v58 = v42;
                v59 = @"\\"";
LABEL_118:
                [v58 appendString:v59];
                goto LABEL_119;
              }
              goto LABEL_83;
            }
            v58 = v42;
            v59 = @"\n";
            goto LABEL_118;
          }
          switch(v52)
          {
            case '""':
              v58 = v42;
              v59 = @"\"";
              goto LABEL_118;
            case ',':
              v58 = v42;
              v59 = @",";
              goto LABEL_118;
            case ';':
              v58 = v42;
              v59 = @";";
              goto LABEL_118;
          }
LABEL_83:
          objc_msgSend(v42, "appendFormat:", @"\\%c", v52);
LABEL_119:
          unsigned int v40 = v41 + 2;
          ++v41;
          goto LABEL_120;
        }
        if ((uint64_t)v89 <= v48 || (v60 = v88, (uint64_t)v88 > v48))
        {
          v61 = (__CFString *)(v48 - 4);
          if (v48 < 4) {
            v61 = 0;
          }
          if ((uint64_t)&v61[2] < (uint64_t)v87) {
            v49 = v61 + 2;
          }
          v88 = v61;
          v89 = v49;
          v91.location = (CFIndex)v61 + v86;
          v91.length = (char *)v49 - (char *)v61;
          CFStringGetCharacters(theString, v91, buffer);
          v60 = v88;
        }
        uint64_t v51 = v48 - (void)v60;
        char v50 = buffer;
      }
      UniChar v52 = v50[v51];
      goto LABEL_96;
    }
    if (v34)
    {
      if (!v42)
      {
        uint64_t v42 = [MEMORY[0x1E4F28E78] string];
      }
      v53 = -[__CFString substringWithRange:](v9, "substringWithRange:", v40, v41 - v40);
      [v42 appendString:v53];

      [v35 addObject:v42];
      uint64_t v54 = [MEMORY[0x1E4F28E78] string];

      unsigned int v40 = v41 + 1;
      uint64_t v42 = (void *)v54;
    }
LABEL_120:
    uint64_t v39 = ++v41;
  }
  while ((unint64_t)&v36[-1].length + 7 > v41);
  if (v42)
  {
    v62 = -[__CFString substringWithRange:](v9, "substringWithRange:", v40, (char *)v36 - v40);
    [v42 appendString:v62];

    uint64_t v36 = v42;
    uint64_t v9 = v36;
  }
  else
  {
    uint64_t v36 = 0;
  }
  self = v73;
  uint64_t v11 = v74;
  if (!v72)
  {
LABEL_131:
    if (v34)
    {
      [v35 addObject:v9];
      [(ICSProperty *)self _setParsedValues:v35 type:5007];
    }
    else
    {
      [(ICSProperty *)self setValue:v9 type:5007];
    }
    goto LABEL_134;
  }
LABEL_125:
  v63 = [MEMORY[0x1E4F1CB10] URLWithString:v9 encodingInvalidCharacters:0];
  if (v63) {
    [(ICSProperty *)self setValue:v63 type:5013];
  }
  else {
    NSLog(&cfstr_InvalidUriInAt.isa, v9, self);
  }

LABEL_134:
LABEL_135:

LABEL_136:
}

@end