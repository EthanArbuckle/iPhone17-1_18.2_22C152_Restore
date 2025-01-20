@interface TUIColumnBox
- (Class)layoutClass;
- (NSObject)columnSpan;
- (double)containerFraction;
- (void)setColumnSpan:(id)a3;
- (void)setContainerFraction:(double)a3;
@end

@implementation TUIColumnBox

- (Class)layoutClass
{
  return (Class)objc_opt_class();
}

- (NSObject)columnSpan
{
  return self->_columnSpan;
}

- (void)setColumnSpan:(id)a3
{
}

- (double)containerFraction
{
  return self->_containerFraction;
}

- (void)setContainerFraction:(double)a3
{
  self->_containerFraction = a3;
}

- (void).cxx_destruct
{
}

@end