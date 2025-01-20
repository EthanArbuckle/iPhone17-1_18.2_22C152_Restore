@interface IMConfigurationAdder
- (BOOL)addProhibited;
- (IMConfiguration)configuration;
- (IMConfigurationAdder)initWithConfiguration:(id)a3 predicate:(id)a4;
- (IMConfigurationPredicate)predicate;
- (void)addBool:(BOOL)a3 forKey:(id)a4;
- (void)addEdgeInsets:(UIEdgeInsets)a3 forKey:(id)a4;
- (void)addFloat:(double)a3 forKey:(id)a4;
- (void)addInteger:(int64_t)a3 forKey:(id)a4;
- (void)addObject:(id)a3 forKey:(id)a4;
- (void)addPoint:(CGPoint)a3 forKey:(id)a4;
- (void)addRect:(CGRect)a3 forKey:(id)a4;
- (void)addSize:(CGSize)a3 forKey:(id)a4;
- (void)addWithPredicate:(id)a3 adder:(id)a4;
- (void)setAddProhibited:(BOOL)a3;
- (void)setConfiguration:(id)a3;
- (void)setPredicate:(id)a3;
@end

@implementation IMConfigurationAdder

- (IMConfigurationAdder)initWithConfiguration:(id)a3 predicate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)IMConfigurationAdder;
  v8 = [(IMConfigurationAdder *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_configuration, v6);
    objc_storeStrong((id *)&v9->_predicate, a4);
  }

  return v9;
}

- (void)addObject:(id)a3 forKey:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if (self->_addProhibited) {
    +[NSException raise:@"IMConfigurationWrongAdderCalledError" format:@"For a given adder block, only the adder passed into that block can be used"];
  }
  id v7 = [(IMConfigurationAdder *)self configuration];
  v8 = [(IMConfigurationAdder *)self predicate];
  [v7 addValue:v9 predicate:v8 forKey:v6];
}

- (void)addFloat:(double)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = +[NSNumber numberWithDouble:a3];
  [(IMConfigurationAdder *)self addObject:v7 forKey:v6];
}

- (void)addBool:(BOOL)a3 forKey:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = +[NSNumber numberWithBool:v4];
  [(IMConfigurationAdder *)self addObject:v7 forKey:v6];
}

- (void)addInteger:(int64_t)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = +[NSNumber numberWithInteger:a3];
  [(IMConfigurationAdder *)self addObject:v7 forKey:v6];
}

- (void)addPoint:(CGPoint)a3 forKey:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", x, y);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [(IMConfigurationAdder *)self addObject:v8 forKey:v7];
}

- (void)addSize:(CGSize)a3 forKey:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  +[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", width, height);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [(IMConfigurationAdder *)self addObject:v8 forKey:v7];
}

- (void)addRect:(CGRect)a3 forKey:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", x, y, width, height);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  [(IMConfigurationAdder *)self addObject:v10 forKey:v9];
}

- (void)addEdgeInsets:(UIEdgeInsets)a3 forKey:(id)a4
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  id v9 = a4;
  +[NSValue valueWithUIEdgeInsets:](NSValue, "valueWithUIEdgeInsets:", top, left, bottom, right);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  [(IMConfigurationAdder *)self addObject:v10 forKey:v9];
}

- (void)addWithPredicate:(id)a3 adder:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id))a4;
  if (self->_addProhibited) {
    +[NSException raise:@"IMConfigurationWrongAdderCalledError" format:@"For a given adder block, only the adder passed into that block can be used"];
  }
  id v8 = [(IMConfigurationAdder *)self predicate];
  v14[0] = v8;
  v14[1] = v6;
  id v9 = +[NSArray arrayWithObjects:v14 count:2];
  id v10 = +[IMCompoundConfigurationPredicate andPredicateWithSubpredicates:v9];

  id v11 = objc_alloc((Class)objc_opt_class());
  v12 = [(IMConfigurationAdder *)self configuration];
  id v13 = [v11 initWithConfiguration:v12 predicate:v10];

  [(IMConfigurationAdder *)self setAddProhibited:1];
  [v13 setAddProhibited:0];
  v7[2](v7, v13);
  [v13 setAddProhibited:1];
  [(IMConfigurationAdder *)self setAddProhibited:0];
}

- (IMConfiguration)configuration
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_configuration);

  return (IMConfiguration *)WeakRetained;
}

- (void)setConfiguration:(id)a3
{
}

- (IMConfigurationPredicate)predicate
{
  return self->_predicate;
}

- (void)setPredicate:(id)a3
{
}

- (BOOL)addProhibited
{
  return self->_addProhibited;
}

- (void)setAddProhibited:(BOOL)a3
{
  self->_addProhibited = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predicate, 0);

  objc_destroyWeak((id *)&self->_configuration);
}

@end