@interface PGGraphTimeDomainBuildingHelper
- (PGGraphTimeDomainBuildingHelper)initWithGraph:(id)a3;
- (id)calendarUnitNodeForCalendarUnit:(unint64_t)a3 value:(int64_t)a4;
- (id)dayOfWeekNodeForDayOfWeek:(int64_t)a3;
- (id)description;
- (id)seasonNodeForSeasonName:(id)a3;
@end

@implementation PGGraphTimeDomainBuildingHelper

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dayOfWeekNodeByDayOfWeek, 0);
  objc_storeStrong((id *)&self->_seasonNodeBySeasonName, 0);
  objc_storeStrong((id *)&self->_calendarUnitNodeByValueByUnit, 0);
  objc_storeStrong((id *)&self->_graph, 0);
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<PGGraphTimeDomainBuildingHelper: %@, %@, %@>", self->_calendarUnitNodeByValueByUnit, self->_seasonNodeBySeasonName, self->_dayOfWeekNodeByDayOfWeek];
}

- (id)dayOfWeekNodeForDayOfWeek:(int64_t)a3
{
  dayOfWeekNodeByDayOfWeek = self->_dayOfWeekNodeByDayOfWeek;
  v6 = objc_msgSend(NSNumber, "numberWithInteger:");
  v7 = [(NSMutableDictionary *)dayOfWeekNodeByDayOfWeek objectForKeyedSubscript:v6];

  if (!v7)
  {
    v7 = [[PGGraphDayOfWeekNode alloc] initWithDayOfWeek:a3];
    [(MAGraph *)self->_graph addUniqueNode:v7 didInsert:0];
    v8 = self->_dayOfWeekNodeByDayOfWeek;
    v9 = [NSNumber numberWithInteger:a3];
    [(NSMutableDictionary *)v8 setObject:v7 forKeyedSubscript:v9];
  }
  return v7;
}

- (id)seasonNodeForSeasonName:(id)a3
{
  id v4 = a3;
  v5 = [(NSMutableDictionary *)self->_seasonNodeBySeasonName objectForKeyedSubscript:v4];
  if (!v5)
  {
    v5 = [[PGGraphSeasonNode alloc] initWithName:v4];
    [(MAGraph *)self->_graph addUniqueNode:v5 didInsert:0];
    [(NSMutableDictionary *)self->_seasonNodeBySeasonName setObject:v5 forKeyedSubscript:v4];
  }

  return v5;
}

- (id)calendarUnitNodeForCalendarUnit:(unint64_t)a3 value:(int64_t)a4
{
  calendarUnitNodeByValueByUnit = self->_calendarUnitNodeByValueByUnit;
  v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  id v9 = [(NSMutableDictionary *)calendarUnitNodeByValueByUnit objectForKeyedSubscript:v8];

  if (!v9)
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v10 = self->_calendarUnitNodeByValueByUnit;
    v11 = [NSNumber numberWithUnsignedInteger:a3];
    [(NSMutableDictionary *)v10 setObject:v9 forKeyedSubscript:v11];
  }
  v12 = [NSNumber numberWithInteger:a4];
  v13 = [v9 objectForKeyedSubscript:v12];

  if (!v13)
  {
    v13 = [[PGGraphCalendarUnitNode alloc] initWithCalendarUnit:a3 value:a4];
    [(MAGraph *)self->_graph addUniqueNode:v13 didInsert:0];
    v14 = [NSNumber numberWithInteger:a4];
    [v9 setObject:v13 forKeyedSubscript:v14];
  }
  return v13;
}

- (PGGraphTimeDomainBuildingHelper)initWithGraph:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PGGraphTimeDomainBuildingHelper;
  v6 = [(PGGraphTimeDomainBuildingHelper *)&v15 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_graph, a3);
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    calendarUnitNodeByValueByUnit = v7->_calendarUnitNodeByValueByUnit;
    v7->_calendarUnitNodeByValueByUnit = v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    seasonNodeBySeasonName = v7->_seasonNodeBySeasonName;
    v7->_seasonNodeBySeasonName = v10;

    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    dayOfWeekNodeByDayOfWeek = v7->_dayOfWeekNodeByDayOfWeek;
    v7->_dayOfWeekNodeByDayOfWeek = v12;
  }
  return v7;
}

@end