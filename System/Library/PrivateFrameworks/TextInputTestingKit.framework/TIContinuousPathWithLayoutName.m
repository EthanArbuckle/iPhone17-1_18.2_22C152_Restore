@interface TIContinuousPathWithLayoutName
- (NSString)layout;
- (TIContinuousPathWithLayoutName)initWithLayout:(id)a3;
@end

@implementation TIContinuousPathWithLayoutName

- (void).cxx_destruct
{
}

- (NSString)layout
{
  return self->_layout;
}

- (TIContinuousPathWithLayoutName)initWithLayout:(id)a3
{
  v4 = (NSString *)a3;
  v8.receiver = self;
  v8.super_class = (Class)TIContinuousPathWithLayoutName;
  v5 = [(TIContinuousPath *)&v8 init];
  layout = v5->_layout;
  v5->_layout = v4;

  return v5;
}

@end