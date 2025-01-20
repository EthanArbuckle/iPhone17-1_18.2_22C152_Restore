@interface PGGraphPartOfDayNode
+ (id)filter;
+ (id)filterWithPartOfDay:(unint64_t)a3;
+ (id)partOfDayNameForPartOfDay:(unint64_t)a3;
+ (id)stringValueForPartOfDay:(unint64_t)a3;
+ (unint64_t)partOfDayForPartOfDayName:(id)a3;
- (BOOL)hasProperties:(id)a3;
- (NSString)name;
- (PGGraphPartOfDayNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5;
- (PGGraphPartOfDayNode)initWithPartOfDay:(unint64_t)a3;
- (id)description;
- (id)label;
- (id)propertyDictionary;
- (unint64_t)partOfDay;
- (unsigned)domain;
@end

@implementation PGGraphPartOfDayNode

- (unint64_t)partOfDay
{
  v3 = objc_opt_class();
  v4 = [(PGGraphPartOfDayNode *)self name];
  unint64_t v5 = [v3 partOfDayForPartOfDayName:v4];

  return v5;
}

- (NSString)name
{
  v3 = objc_opt_class();
  unint64_t partOfDay = self->_partOfDay;
  return (NSString *)[v3 partOfDayNameForPartOfDay:partOfDay];
}

- (unsigned)domain
{
  return 400;
}

- (id)label
{
  v2 = @"PartOfDay";
  return @"PartOfDay";
}

- (id)description
{
  v2 = [(id)objc_opt_class() partOfDayNameForPartOfDay:self->_partOfDay];
  v3 = [NSString stringWithFormat:@"PGGraphPartOfDayNode (%@)", v2];

  return v3;
}

- (id)propertyDictionary
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v2 = [(id)objc_opt_class() partOfDayNameForPartOfDay:self->_partOfDay];
  unint64_t v5 = @"name";
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

- (BOOL)hasProperties:(id)a3
{
  id v4 = a3;
  unint64_t v5 = v4;
  if (v4 && [v4 count])
  {
    v6 = [(id)objc_opt_class() partOfDayNameForPartOfDay:self->_partOfDay];
    v7 = [v5 objectForKeyedSubscript:@"name"];
    v8 = v7;
    BOOL v9 = !v7 || [v7 isEqual:v6];
  }
  else
  {
    BOOL v9 = 1;
  }

  return v9;
}

- (PGGraphPartOfDayNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5
{
  v6 = objc_msgSend(a5, "objectForKeyedSubscript:", @"name", a4);
  v7 = -[PGGraphPartOfDayNode initWithPartOfDay:](self, "initWithPartOfDay:", [(id)objc_opt_class() partOfDayForPartOfDayName:v6]);

  return v7;
}

- (PGGraphPartOfDayNode)initWithPartOfDay:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PGGraphPartOfDayNode;
  result = [(PGGraphNode *)&v5 init];
  if (result) {
    result->_unint64_t partOfDay = a3;
  }
  return result;
}

+ (id)partOfDayNameForPartOfDay:(unint64_t)a3
{
  int v3 = a3;
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if ((uint64_t)a3 <= 7)
  {
    if (a3 == 2)
    {
      id v4 = (id *)MEMORY[0x1E4F76BA8];
      goto LABEL_12;
    }
    if (a3 == 4)
    {
      id v4 = (id *)MEMORY[0x1E4F76BB8];
      goto LABEL_12;
    }
  }
  else
  {
    switch(a3)
    {
      case 8uLL:
        id v4 = (id *)MEMORY[0x1E4F76B98];
        goto LABEL_12;
      case 0x10uLL:
        id v4 = (id *)MEMORY[0x1E4F76BA0];
        goto LABEL_12;
      case 0x20uLL:
        id v4 = (id *)MEMORY[0x1E4F76BB0];
LABEL_12:
        objc_super v5 = (__CFString *)*v4;
        goto LABEL_13;
    }
  }
  v7 = +[PGLogging sharedLogging];
  v8 = [v7 loggingConnection];

  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    v9[0] = 67109120;
    v9[1] = v3;
    _os_log_error_impl(&dword_1D1805000, v8, OS_LOG_TYPE_ERROR, "Unknown part of day %d", (uint8_t *)v9, 8u);
  }

  objc_super v5 = @"Unknown";
LABEL_13:
  return v5;
}

+ (unint64_t)partOfDayForPartOfDayName:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 isEqualToString:*MEMORY[0x1E4F76BA8]])
  {
    unint64_t v4 = 2;
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4F76BB8]])
  {
    unint64_t v4 = 4;
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4F76B98]])
  {
    unint64_t v4 = 8;
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4F76BA0]])
  {
    unint64_t v4 = 16;
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4F76BB0]])
  {
    unint64_t v4 = 32;
  }
  else
  {
    objc_super v5 = +[PGLogging sharedLogging];
    v6 = [v5 loggingConnection];

    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412290;
      id v9 = v3;
      _os_log_error_impl(&dword_1D1805000, v6, OS_LOG_TYPE_ERROR, "Unknown part of day name %@", (uint8_t *)&v8, 0xCu);
    }

    unint64_t v4 = 1;
  }

  return v4;
}

+ (id)stringValueForPartOfDay:(unint64_t)a3
{
  char v3 = a3;
  unint64_t v4 = [MEMORY[0x1E4F1CA48] array];
  objc_super v5 = v4;
  if (v3) {
    [v4 addObject:@"Unknown"];
  }
  if ((v3 & 2) != 0)
  {
    id v9 = +[PGPhotosGraphProfile partOfDayMorning];
    [v5 addObject:v9];

    if ((v3 & 4) == 0)
    {
LABEL_5:
      if ((v3 & 8) == 0) {
        goto LABEL_6;
      }
      goto LABEL_14;
    }
  }
  else if ((v3 & 4) == 0)
  {
    goto LABEL_5;
  }
  uint64_t v10 = +[PGPhotosGraphProfile partOfDayNoon];
  [v5 addObject:v10];

  if ((v3 & 8) == 0)
  {
LABEL_6:
    if ((v3 & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  v11 = +[PGPhotosGraphProfile partOfDayAfternoon];
  [v5 addObject:v11];

  if ((v3 & 0x10) == 0)
  {
LABEL_7:
    if ((v3 & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_15:
  v12 = +[PGPhotosGraphProfile partOfDayEvening];
  [v5 addObject:v12];

  if ((v3 & 0x20) != 0)
  {
LABEL_8:
    v6 = +[PGPhotosGraphProfile partOfDayNight];
    [v5 addObject:v6];
  }
LABEL_9:
  v7 = [v5 componentsJoinedByString:@", "];

  return v7;
}

+ (id)filterWithPartOfDay:(unint64_t)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  unint64_t v4 = [(id)objc_opt_class() partOfDayNameForPartOfDay:a3];
  objc_super v5 = [a1 filter];
  id v9 = @"name";
  v10[0] = v4;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  v7 = [v5 filterBySettingProperties:v6];

  return v7;
}

+ (id)filter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F71F00]) initWithLabel:@"PartOfDay" domain:400];
  return v2;
}

@end