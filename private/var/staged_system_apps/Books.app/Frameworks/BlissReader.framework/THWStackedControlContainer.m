@interface THWStackedControlContainer
- (Class)layoutClass;
- (THWStackedControlContainer)initWithDelegate:(id)a3;
@end

@implementation THWStackedControlContainer

- (THWStackedControlContainer)initWithDelegate:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)THWStackedControlContainer;
  return [(THWControlContainer *)&v4 initWithDelegate:a3];
}

- (Class)layoutClass
{
  return (Class)objc_opt_class();
}

@end