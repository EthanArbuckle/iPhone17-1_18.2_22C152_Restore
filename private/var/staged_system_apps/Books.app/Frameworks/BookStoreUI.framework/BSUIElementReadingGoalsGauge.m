@interface BSUIElementReadingGoalsGauge
+ (Class)builderClass;
+ (Class)objectClass;
+ (id)supportedAttributes;
+ (unint64_t)definesScopes;
+ (void)configureBox:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6;
+ (void)configureObject:(id)a3 withBuilder:(id)a4 context:(id)a5;
@end

@implementation BSUIElementReadingGoalsGauge

+ (unint64_t)definesScopes
{
  return 0;
}

+ (id)supportedAttributes
{
  return +[BSUIReadingGoalsGaugeMetrics supportedAttributes];
}

+ (Class)objectClass
{
  return (Class)objc_opt_class();
}

+ (Class)builderClass
{
  return (Class)objc_opt_class();
}

+ (void)configureObject:(id)a3 withBuilder:(id)a4 context:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = objc_alloc((Class)TUIConfiguration);
  v11 = [v8 finalizeWidgetWithParent:0];

  id v12 = [v10 initWithData:v11];
  [v9 setConfiguration:v12];

  id v14 = [v9 readingGoalsGaugeMetrics];
  v13 = [v9 configuration];

  [v14 updateWithConfiguration:v13 context:v7];
}

+ (void)configureBox:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a3;
  id v12 = [[BSUIReadingGoalsGaugeMetrics alloc] initWithNode:a4.var0 attributes:v10 context:v9];

  [v11 setReadingGoalsGaugeMetrics:v12];
}

@end