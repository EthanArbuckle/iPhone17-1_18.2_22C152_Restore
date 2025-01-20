@interface PGGraphCalendarUnitNode
+ (MANodeFilter)dayFilter;
+ (MANodeFilter)monthDayFilter;
+ (MANodeFilter)monthFilter;
+ (MANodeFilter)weekOfMonthFilter;
+ (MANodeFilter)weekOfYearFilter;
+ (MANodeFilter)yearFilter;
+ (PGCalendarUnitMonthDayValue)monthDayValueForMonthDayNode:(id)a3;
+ (PGCalendarUnitMonthDayValue)monthDayValueForMonthDayNodeCalendarUnitValue:(int64_t)a3;
+ (id)propertiesForMonth:(int64_t)a3 day:(int64_t)a4;
+ (id)propertiesWithCalendarUnitValue:(int64_t)a3;
+ (int64_t)encodedMonthDayForMonth:(int64_t)a3 day:(int64_t)a4;
- (BOOL)hasProperties:(id)a3;
- (MANodeFilter)uniquelyIdentifyingFilter;
- (NSString)description;
- (NSString)featureIdentifier;
- (PGGraphCalendarUnitNode)initWithCalendarUnit:(unint64_t)a3 value:(int64_t)a4;
- (PGGraphCalendarUnitNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5;
- (id)collection;
- (id)label;
- (id)name;
- (id)propertyDictionary;
- (id)propertyForKey:(id)a3;
- (int64_t)calendarUnitValue;
- (unint64_t)featureType;
- (unsigned)domain;
@end

@implementation PGGraphCalendarUnitNode

- (int64_t)calendarUnitValue
{
  return *((__int16 *)self + 16);
}

- (id)collection
{
  v2 = [(MANodeCollection *)[PGGraphCalendarUnitNodeCollection alloc] initWithNode:self];
  return v2;
}

- (NSString)featureIdentifier
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(PGGraphCalendarUnitNode *)self label];
  v7 = [v3 stringWithFormat:@"%@|%@|%d", v5, v6, *((__int16 *)self + 16)];

  return (NSString *)v7;
}

- (unint64_t)featureType
{
  uint64_t v3 = *((unsigned __int8 *)self + 34);
  if (+[PGGraphYearNodeCollection calendarUnit] == v3) {
    return 1;
  }
  uint64_t v5 = *((unsigned __int8 *)self + 34);
  if (+[PGGraphMonthDayNodeCollection calendarUnit] == v5) {
    return 29;
  }
  else {
    return 0;
  }
}

- (id)name
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%d", *((__int16 *)self + 16));
}

- (MANodeFilter)uniquelyIdentifyingFilter
{
  id v3 = objc_alloc(MEMORY[0x1E4F71F00]);
  v4 = [(PGGraphCalendarUnitNode *)self label];
  uint64_t v5 = [(PGGraphCalendarUnitNode *)self domain];
  v6 = [(PGGraphCalendarUnitNode *)self propertyDictionary];
  v7 = (void *)[v3 initWithLabel:v4 domain:v5 properties:v6];

  return (MANodeFilter *)v7;
}

- (unsigned)domain
{
  return 400;
}

- (id)label
{
  if (*((unsigned __int8 *)self + 34) - 1 > 5) {
    v2 = 0;
  }
  else {
    v2 = *off_1E68ED5F0[(*((unsigned char *)self + 34) - 1)];
  }
  return v2;
}

- (NSString)description
{
  id v3 = NSString;
  v4 = [(PGGraphCalendarUnitNode *)self label];
  uint64_t v5 = [v3 stringWithFormat:@"%@ (%d)", v4, *((__int16 *)self + 16)];

  return (NSString *)v5;
}

- (id)propertyForKey:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 isEqualToString:@"name"])
  {
    if (*((__int16 *)self + 16) == -1) {
      uint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      uint64_t v5 = *((__int16 *)self + 16);
    }
    v6 = [NSNumber numberWithInteger:v5];
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      int v8 = 138412290;
      id v9 = v4;
      _os_log_fault_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Unsupported property '%@' accessed on PGGraphCalendarUnitNode.", (uint8_t *)&v8, 0xCu);
    }
    v6 = 0;
  }

  return v6;
}

- (id)propertyDictionary
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v6 = @"name";
  uint64_t v2 = *((__int16 *)self + 16);
  if (v2 == -1)
  {
    id v3 = &unk_1F28D28F8;
  }
  else
  {
    id v3 = [NSNumber numberWithInteger:v2];
  }
  v7[0] = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  if (v2 != -1) {

  }
  return v4;
}

- (BOOL)hasProperties:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4 && [v4 count])
  {
    v6 = [v5 objectForKeyedSubscript:@"name"];
    v7 = v6;
    BOOL v8 = !v6 || [v6 integerValue] == *((__int16 *)self + 16);
  }
  else
  {
    BOOL v8 = 1;
  }

  return v8;
}

- (PGGraphCalendarUnitNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = v7;
  if ([v9 isEqualToString:@"Day"])
  {
    uint64_t v10 = 1;
  }
  else if ([v9 isEqualToString:@"Month"])
  {
    uint64_t v10 = 2;
  }
  else if ([v9 isEqualToString:@"MonthDay"])
  {
    uint64_t v10 = 3;
  }
  else if ([v9 isEqualToString:@"Year"])
  {
    uint64_t v10 = 4;
  }
  else if ([v9 isEqualToString:@"WeekMonth"])
  {
    uint64_t v10 = 5;
  }
  else
  {
    if (([v9 isEqualToString:@"WeekYear"] & 1) == 0)
    {

      __assert_rtn("-[PGGraphCalendarUnitNode initWithLabel:domain:properties:]", "PGGraphCalendarUnitNode.m", 101, "calendarUnit != PGGraphCalendarUnitUnitUnknown");
    }
    uint64_t v10 = 6;
  }

  v11 = [v8 objectForKeyedSubscript:@"name"];
  uint64_t v12 = [v11 integerValue];

  v13 = [(PGGraphCalendarUnitNode *)self initWithCalendarUnit:v10 value:v12];
  return v13;
}

- (PGGraphCalendarUnitNode)initWithCalendarUnit:(unint64_t)a3 value:(int64_t)a4
{
  __int16 v4 = a4;
  char v5 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PGGraphCalendarUnitNode;
  result = [(PGGraphNode *)&v7 init];
  if (result)
  {
    *((unsigned char *)result + 34) = v5;
    *((_WORD *)result + 16) = v4;
  }
  return result;
}

+ (MANodeFilter)weekOfYearFilter
{
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F71F00]) initWithLabel:@"WeekYear" domain:400];
  return (MANodeFilter *)v2;
}

+ (MANodeFilter)weekOfMonthFilter
{
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F71F00]) initWithLabel:@"WeekMonth" domain:400];
  return (MANodeFilter *)v2;
}

+ (MANodeFilter)yearFilter
{
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F71F00]) initWithLabel:@"Year" domain:400];
  return (MANodeFilter *)v2;
}

+ (MANodeFilter)monthDayFilter
{
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F71F00]) initWithLabel:@"MonthDay" domain:400];
  return (MANodeFilter *)v2;
}

+ (MANodeFilter)monthFilter
{
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F71F00]) initWithLabel:@"Month" domain:400];
  return (MANodeFilter *)v2;
}

+ (MANodeFilter)dayFilter
{
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F71F00]) initWithLabel:@"Day" domain:400];
  return (MANodeFilter *)v2;
}

+ (int64_t)encodedMonthDayForMonth:(int64_t)a3 day:(int64_t)a4
{
  return a4 + 100 * a3;
}

+ (PGCalendarUnitMonthDayValue)monthDayValueForMonthDayNode:(id)a3
{
  uint64_t v4 = [a3 calendarUnitValue];
  int64_t v5 = [a1 monthDayValueForMonthDayNodeCalendarUnitValue:v4];
  result.var1 = v6;
  result.var0 = v5;
  return result;
}

+ (PGCalendarUnitMonthDayValue)monthDayValueForMonthDayNodeCalendarUnitValue:(int64_t)a3
{
  int64_t v3 = a3 / 100;
  int64_t v4 = a3 % 100;
  result.var1 = v4;
  result.var0 = v3;
  return result;
}

+ (id)propertiesWithCalendarUnitValue:(int64_t)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  int64_t v6 = @"name";
  int64_t v3 = [NSNumber numberWithLong:a3];
  v7[0] = v3;
  int64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];

  return v4;
}

+ (id)propertiesForMonth:(int64_t)a3 day:(int64_t)a4
{
  uint64_t v5 = [a1 encodedMonthDayForMonth:a3 day:a4];
  return (id)[a1 propertiesWithCalendarUnitValue:v5];
}

@end