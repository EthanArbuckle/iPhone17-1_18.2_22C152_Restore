@interface RTEventLocationIdentifier
- (BOOL)isEqual:(id)a3;
- (BOOL)isSuitableForFuzzyMatch;
- (NSString)calendarIdentifier;
- (NSString)name;
- (RTEventLocationIdentifier)initWithEvent:(id)a3 source:(unint64_t)a4 useCalendarIdentifier:(BOOL)a5;
- (RTEventLocationIdentifier)initWithName:(id)a3 source:(unint64_t)a4 calendarIdentifier:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)normalize;
- (int64_t)levenshteinDistanceToIdentifier:(id)a3;
- (unint64_t)hash;
- (unint64_t)source;
- (void)setCalendarIdentifier:(id)a3;
- (void)setName:(id)a3;
- (void)setSource:(unint64_t)a3;
@end

@implementation RTEventLocationIdentifier

- (id)normalize
{
  v3 = [(RTEventLocationIdentifier *)self name];
  v4 = [v3 lowercaseString];

  v5 = [v4 stringByRemovingAllWhitespaceAndPunctuation];
  [(RTEventLocationIdentifier *)self setName:v5];

  return self;
}

- (void)setName:(id)a3
{
}

- (void)setSource:(unint64_t)a3
{
  self->_source = a3;
}

- (void)setCalendarIdentifier:(id)a3
{
}

- (unint64_t)hash
{
  v3 = [(RTEventLocationIdentifier *)self name];
  uint64_t v4 = [v3 hash];
  unint64_t v5 = [(RTEventLocationIdentifier *)self source] + v4;
  v6 = [(RTEventLocationIdentifier *)self calendarIdentifier];
  unint64_t v7 = v5 + [v6 hash];

  return v7;
}

- (NSString)calendarIdentifier
{
  return self->_calendarIdentifier;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    unint64_t v6 = [(RTEventLocationIdentifier *)self source];
    if (v6 == [v5 source])
    {
      unint64_t v7 = [(RTEventLocationIdentifier *)self name];
      v8 = [v5 name];
      if ([v7 isEqualToString:v8])
      {
        v9 = [(RTEventLocationIdentifier *)self calendarIdentifier];
        v10 = [v5 calendarIdentifier];
        if (v9 == v10)
        {
          char v13 = 1;
        }
        else
        {
          v11 = [(RTEventLocationIdentifier *)self calendarIdentifier];
          v12 = [v5 calendarIdentifier];
          char v13 = [v11 isEqualToString:v12];
        }
      }
      else
      {
        char v13 = 0;
      }
    }
    else
    {
      char v13 = 0;
    }
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (unint64_t)source
{
  return self->_source;
}

- (NSString)name
{
  return self->_name;
}

- (RTEventLocationIdentifier)initWithName:(id)a3 source:(unint64_t)a4 calendarIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)RTEventLocationIdentifier;
  v10 = [(RTEventLocationIdentifier *)&v16 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    name = v10->_name;
    v10->_name = (NSString *)v11;

    v10->_source = a4;
    uint64_t v13 = [v9 copy];
    calendarIdentifier = v10->_calendarIdentifier;
    v10->_calendarIdentifier = (NSString *)v13;
  }
  return v10;
}

- (RTEventLocationIdentifier)initWithEvent:(id)a3 source:(unint64_t)a4 useCalendarIdentifier:(BOOL)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = v8;
  switch(a4)
  {
    case 2uLL:
      v12 = [v8 title];
      if (a5)
      {
        uint64_t v13 = [v9 calendar];
        v14 = [v13 calendarIdentifier];
        v15 = self;
        objc_super v16 = v12;
        uint64_t v17 = 2;
LABEL_12:
        self = [(RTEventLocationIdentifier *)v15 initWithName:v16 source:v17 calendarIdentifier:v14];

LABEL_16:
        uint64_t v11 = self;
        goto LABEL_17;
      }
      v18 = self;
      v19 = v12;
      uint64_t v20 = 2;
LABEL_15:
      self = [(RTEventLocationIdentifier *)v18 initWithName:v19 source:v20 calendarIdentifier:0];
      goto LABEL_16;
    case 1uLL:
      v12 = [v8 locationWithoutPrediction];
      if (a5)
      {
        uint64_t v13 = [v9 calendar];
        v14 = [v13 calendarIdentifier];
        v15 = self;
        objc_super v16 = v12;
        uint64_t v17 = 1;
        goto LABEL_12;
      }
      v18 = self;
      v19 = v12;
      uint64_t v20 = 1;
      goto LABEL_15;
    case 0uLL:
      v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v22 = 136315394;
        v23 = "-[RTEventLocationIdentifier initWithEvent:source:useCalendarIdentifier:]";
        __int16 v24 = 1024;
        int v25 = 95;
        _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: source != RTEventLocationIdentifierSourceUnknown (in %s:%d)", (uint8_t *)&v22, 0x12u);
      }

      break;
  }
  uint64_t v11 = 0;
LABEL_17:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  id v5 = [(RTEventLocationIdentifier *)self name];
  unint64_t v6 = [(RTEventLocationIdentifier *)self source];
  unint64_t v7 = [(RTEventLocationIdentifier *)self calendarIdentifier];
  id v8 = (void *)[v4 initWithName:v5 source:v6 calendarIdentifier:v7];

  return v8;
}

- (BOOL)isSuitableForFuzzyMatch
{
  v2 = [(RTEventLocationIdentifier *)self name];
  BOOL v3 = (unint64_t)[v2 length] > 2;

  return v3;
}

- (int64_t)levenshteinDistanceToIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(RTEventLocationIdentifier *)self name];
  unint64_t v6 = [v4 name];

  int64_t v7 = [v5 levenshteinDistanceFromString:v6 withMaxCutOffDistance:3];
  return v7;
}

- (id)description
{
  BOOL v3 = NSString;
  id v4 = [(RTEventLocationIdentifier *)self name];
  unint64_t v5 = [(RTEventLocationIdentifier *)self source];
  unint64_t v6 = [(RTEventLocationIdentifier *)self calendarIdentifier];
  int64_t v7 = [v3 stringWithFormat:@"name, %@, source, %lu, calendarIdentifier, %@", v4, v5, v6];

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendarIdentifier, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end