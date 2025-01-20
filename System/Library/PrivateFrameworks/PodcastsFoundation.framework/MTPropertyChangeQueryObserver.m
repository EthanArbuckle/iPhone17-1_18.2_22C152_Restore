@interface MTPropertyChangeQueryObserver
+ (Class)fetchedResultsControllerClass;
- (NSArray)propertyKeys;
- (id)_frc;
- (void)setPropertyKeys:(id)a3;
@end

@implementation MTPropertyChangeQueryObserver

- (id)_frc
{
  v4.receiver = self;
  v4.super_class = (Class)MTPropertyChangeQueryObserver;
  v2 = [(MTBaseQueryObserver *)&v4 _frc];
  return v2;
}

+ (Class)fetchedResultsControllerClass
{
  return (Class)objc_opt_class();
}

- (void)setPropertyKeys:(id)a3
{
  id v4 = a3;
  id v5 = [(MTPropertyChangeQueryObserver *)self _frc];
  [v5 setPropertyKeys:v4];
}

- (NSArray)propertyKeys
{
  v2 = [(MTPropertyChangeQueryObserver *)self _frc];
  v3 = [v2 propertyKeys];

  return (NSArray *)v3;
}

@end