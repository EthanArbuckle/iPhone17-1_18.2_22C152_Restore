@interface PGGraphDayOfWeekNode
+ (id)filter;
+ (id)nameForDayOfWeek:(int64_t)a3;
+ (int64_t)dayOfWeekForName:(id)a3;
- (BOOL)hasProperties:(id)a3;
- (MANodeFilter)uniquelyIdentifyingFilter;
- (NSString)name;
- (PGGraphDayOfWeekNode)initWithDayOfWeek:(int64_t)a3;
- (PGGraphDayOfWeekNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5;
- (id)description;
- (id)label;
- (id)propertyDictionary;
- (int64_t)dayOfWeek;
- (unsigned)domain;
@end

@implementation PGGraphDayOfWeekNode

- (int64_t)dayOfWeek
{
  int64_t result = self->_dayOfWeek;
  if (!result)
  {
    v4 = [(PGGraphDayOfWeekNode *)self name];
    self->_dayOfWeek = [(id)objc_opt_class() dayOfWeekForName:v4];

    return self->_dayOfWeek;
  }
  return result;
}

- (NSString)name
{
  v3 = objc_opt_class();
  int64_t dayOfWeek = self->_dayOfWeek;
  return (NSString *)[v3 nameForDayOfWeek:dayOfWeek];
}

- (MANodeFilter)uniquelyIdentifyingFilter
{
  id v3 = objc_alloc(MEMORY[0x1E4F71F00]);
  v4 = [(PGGraphDayOfWeekNode *)self propertyDictionary];
  v5 = (void *)[v3 initWithLabel:@"DayOfWeek" domain:400 properties:v4];

  return (MANodeFilter *)v5;
}

- (unsigned)domain
{
  return 400;
}

- (id)label
{
  v2 = @"DayOfWeek";
  return @"DayOfWeek";
}

- (id)description
{
  v2 = [(id)objc_opt_class() nameForDayOfWeek:self->_dayOfWeek];
  id v3 = [NSString stringWithFormat:@"PGGraphDayOfWeekNode (%@)", v2];

  return v3;
}

- (id)propertyDictionary
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v2 = [(id)objc_opt_class() nameForDayOfWeek:self->_dayOfWeek];
  v5 = @"name";
  v6[0] = v2;
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

- (BOOL)hasProperties:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4 && [v4 count])
  {
    v6 = [(id)objc_opt_class() nameForDayOfWeek:self->_dayOfWeek];
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

- (PGGraphDayOfWeekNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5
{
  v6 = objc_msgSend(a5, "objectForKeyedSubscript:", @"name", a4);
  v7 = -[PGGraphDayOfWeekNode initWithDayOfWeek:](self, "initWithDayOfWeek:", [(id)objc_opt_class() dayOfWeekForName:v6]);

  return v7;
}

- (PGGraphDayOfWeekNode)initWithDayOfWeek:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PGGraphDayOfWeekNode;
  int64_t result = [(PGGraphNode *)&v5 init];
  if (result) {
    result->_int64_t dayOfWeek = a3;
  }
  return result;
}

+ (id)nameForDayOfWeek:(int64_t)a3
{
  if (nameForDayOfWeek__onceToken != -1) {
    dispatch_once(&nameForDayOfWeek__onceToken, &__block_literal_global_42);
  }
  if ((unint64_t)a3 > 7)
  {
    id v4 = @"UnknownDayOfWeek";
  }
  else
  {
    id v4 = [(id)nameForDayOfWeek__descriptionByDayOfWeekIndex objectAtIndexedSubscript:a3];
  }
  return v4;
}

void __41__PGGraphDayOfWeekNode_nameForDayOfWeek___block_invoke()
{
  v2[8] = *MEMORY[0x1E4F143B8];
  v2[0] = @"UnknownDayOfWeek";
  v2[1] = @"Sunday";
  v2[2] = @"Monday";
  v2[3] = @"Tuesday";
  v2[4] = @"Wednesday";
  v2[5] = @"Thursday";
  v2[6] = @"Friday";
  v2[7] = @"Saturday";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:8];
  v1 = (void *)nameForDayOfWeek__descriptionByDayOfWeekIndex;
  nameForDayOfWeek__descriptionByDayOfWeekIndex = v0;
}

+ (int64_t)dayOfWeekForName:(id)a3
{
  id v3 = a3;
  if (dayOfWeekForName__onceToken != -1) {
    dispatch_once(&dayOfWeekForName__onceToken, &__block_literal_global_7240);
  }
  id v4 = [(id)dayOfWeekForName__dayOfWeekByDescription objectForKeyedSubscript:v3];
  objc_super v5 = v4;
  if (v4) {
    int64_t v6 = [v4 integerValue];
  }
  else {
    int64_t v6 = -1;
  }

  return v6;
}

void __41__PGGraphDayOfWeekNode_dayOfWeekForName___block_invoke()
{
  v3[7] = *MEMORY[0x1E4F143B8];
  v2[0] = @"Monday";
  v2[1] = @"Tuesday";
  v3[0] = &unk_1F28D0C78;
  v3[1] = &unk_1F28D0C90;
  v2[2] = @"Wednesday";
  v2[3] = @"Thursday";
  v3[2] = &unk_1F28D0CA8;
  v3[3] = &unk_1F28D0CC0;
  v2[4] = @"Friday";
  v2[5] = @"Saturday";
  v3[4] = &unk_1F28D0CD8;
  v3[5] = &unk_1F28D0CF0;
  v2[6] = @"Sunday";
  v3[6] = &unk_1F28D0D08;
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:7];
  v1 = (void *)dayOfWeekForName__dayOfWeekByDescription;
  dayOfWeekForName__dayOfWeekByDescription = v0;
}

+ (id)filter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F71F00]) initWithLabel:@"DayOfWeek" domain:400];
  return v2;
}

@end