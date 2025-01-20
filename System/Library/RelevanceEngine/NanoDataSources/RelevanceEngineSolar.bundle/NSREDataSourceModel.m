@interface NSREDataSourceModel
- (NSArray)events;
- (NSREDataSourceModel)initWithDelegate:(id)a3;
@end

@implementation NSREDataSourceModel

- (NSREDataSourceModel)initWithDelegate:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NSREDataSourceModel;
  return [(NSREDataSourceModel *)&v4 init];
}

- (NSArray)events
{
  return 0;
}

@end