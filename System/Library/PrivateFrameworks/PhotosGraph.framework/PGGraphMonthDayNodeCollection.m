@interface PGGraphMonthDayNodeCollection
+ (id)monthDayNodesForLocalDate:(id)a3 inGraph:(id)a4;
+ (id)monthDayNodesForMonth:(int64_t)a3 day:(int64_t)a4 inGraph:(id)a5;
+ (unint64_t)calendarUnit;
- (PGGraphPersonNodeCollection)anniversaryPersonNodes;
- (PGGraphPersonNodeCollection)birthdayPersonNodes;
@end

@implementation PGGraphMonthDayNodeCollection

- (PGGraphPersonNodeCollection)anniversaryPersonNodes
{
  v3 = +[PGGraphAnniversaryMonthDayEdge filter];
  v4 = [v3 inRelation];
  v5 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v4];

  return (PGGraphPersonNodeCollection *)v5;
}

- (PGGraphPersonNodeCollection)birthdayPersonNodes
{
  v3 = +[PGGraphBirthdayMonthDayEdge filter];
  v4 = [v3 inRelation];
  v5 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v4];

  return (PGGraphPersonNodeCollection *)v5;
}

+ (id)monthDayNodesForLocalDate:(id)a3 inGraph:(id)a4
{
  v6 = (void *)MEMORY[0x1E4F76C68];
  id v7 = a4;
  v8 = [v6 components:24 fromDate:a3];
  v9 = objc_msgSend(a1, "calendarUnitNodesForUnitValue:inGraph:", +[PGGraphCalendarUnitNode encodedMonthDayForMonth:day:](PGGraphCalendarUnitNode, "encodedMonthDayForMonth:day:", objc_msgSend(v8, "month"), objc_msgSend(v8, "day")), v7);

  return v9;
}

+ (id)monthDayNodesForMonth:(int64_t)a3 day:(int64_t)a4 inGraph:(id)a5
{
  id v8 = a5;
  v9 = objc_msgSend(a1, "calendarUnitNodesForUnitValue:inGraph:", +[PGGraphCalendarUnitNode encodedMonthDayForMonth:day:](PGGraphCalendarUnitNode, "encodedMonthDayForMonth:day:", a3, a4), v8);

  return v9;
}

+ (unint64_t)calendarUnit
{
  return 3;
}

@end