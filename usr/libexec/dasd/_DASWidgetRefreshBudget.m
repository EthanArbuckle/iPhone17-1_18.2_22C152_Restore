@interface _DASWidgetRefreshBudget
+ (id)budgetWithName:(id)a3 widgetBudgetID:(id)a4 capacity:(double)a5 balance:(double)a6 allocationType:(unsigned __int8)a7;
- (NSString)widgetBudgetID;
- (_DASWidgetRefreshBudget)initWithCoder:(id)a3;
- (_DASWidgetRefreshBudget)initWithDictionary:(id)a3;
- (_DASWidgetRefreshBudget)initWithName:(id)a3 widgetBudgetID:(id)a4 capacity:(double)a5 balance:(double)a6 allocationType:(unsigned __int8)a7;
- (id)description;
- (id)dictionaryRepresentation;
- (void)encodeWithCoder:(id)a3;
- (void)setWidgetBudgetID:(id)a3;
@end

@implementation _DASWidgetRefreshBudget

- (_DASWidgetRefreshBudget)initWithName:(id)a3 widgetBudgetID:(id)a4 capacity:(double)a5 balance:(double)a6 allocationType:(unsigned __int8)a7
{
  uint64_t v7 = a7;
  id v13 = a4;
  v17.receiver = self;
  v17.super_class = (Class)_DASWidgetRefreshBudget;
  v14 = [(_DASBudget *)&v17 initWithName:a3 capacity:v7 balance:0 allocationType:a5 lastModulatedDate:a6];
  v15 = v14;
  if (v14) {
    objc_storeStrong((id *)&v14->_widgetBudgetID, a4);
  }

  return v15;
}

- (_DASWidgetRefreshBudget)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_DASWidgetRefreshBudget;
  v5 = [(_DASBudget *)&v11 initWithDictionary:v4];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"budgetID"];
    widgetBudgetID = v5->_widgetBudgetID;
    v5->_widgetBudgetID = (NSString *)v6;

    if (!v5->_widgetBudgetID)
    {
      uint64_t v8 = [v4 objectForKeyedSubscript:@"widgetID"];
      v9 = v5->_widgetBudgetID;
      v5->_widgetBudgetID = (NSString *)v8;
    }
  }

  return v5;
}

+ (id)budgetWithName:(id)a3 widgetBudgetID:(id)a4 capacity:(double)a5 balance:(double)a6 allocationType:(unsigned __int8)a7
{
  uint64_t v7 = a7;
  id v11 = a4;
  id v12 = a3;
  id v13 = [objc_alloc((Class)objc_opt_class()) initWithName:v12 widgetBudgetID:v11 capacity:v7 balance:a5 allocationType:a6];

  return v13;
}

- (id)description
{
  v3 = [(_DASBudget *)self name];
  id v4 = [v3 stringByReplacingOccurrencesOfString:@"com.apple.dasd.widget_" withString:&stru_100179948];

  [(_DASBudget *)self balance];
  uint64_t v6 = v5;
  [(_DASBudget *)self capacity];
  uint64_t v8 = +[NSString stringWithFormat:@"<_DASWidgetBudget %@: %12.2lf/%12.2lf>", v4, v6, v7];

  return v8;
}

- (id)dictionaryRepresentation
{
  v6.receiver = self;
  v6.super_class = (Class)_DASWidgetRefreshBudget;
  v3 = [(_DASBudget *)&v6 dictionaryRepresentation];
  id v4 = [v3 mutableCopy];

  [v4 setObject:self->_widgetBudgetID forKeyedSubscript:@"budgetID"];

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_DASWidgetRefreshBudget;
  id v4 = a3;
  [(_DASBudget *)&v5 encodeWithCoder:v4];
  [v4 encodeObject:self->_widgetBudgetID forKey:@"budgetID" v5.receiver, v5.super_class];
}

- (_DASWidgetRefreshBudget)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_DASWidgetRefreshBudget;
  objc_super v5 = [(_DASBudget *)&v10 initWithCoder:v4];
  if (v5)
  {
    objc_super v6 = [v4 decodeObjectForKey:@"budgetID"];
    [(_DASWidgetRefreshBudget *)v5 setWidgetBudgetID:v6];

    uint64_t v7 = [(_DASWidgetRefreshBudget *)v5 widgetBudgetID];

    if (!v7)
    {
      uint64_t v8 = [v4 decodeObjectForKey:@"widgetID"];
      [(_DASWidgetRefreshBudget *)v5 setWidgetBudgetID:v8];
    }
  }

  return v5;
}

- (NSString)widgetBudgetID
{
  return self->_widgetBudgetID;
}

- (void)setWidgetBudgetID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end