@interface TUIStringTextFragment
- (NSString)string;
- (TUIStringTextFragment)initWithString:(id)a3;
- (void)appendToBuilder:(id)a3 context:(id)a4;
@end

@implementation TUIStringTextFragment

- (TUIStringTextFragment)initWithString:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TUIStringTextFragment;
  v5 = [(TUIStringTextFragment *)&v9 init];
  if (v5)
  {
    v6 = (NSString *)[v4 copy];
    string = v5->_string;
    v5->_string = v6;
  }
  return v5;
}

- (void)appendToBuilder:(id)a3 context:(id)a4
{
}

- (NSString)string
{
  return self->_string;
}

- (void).cxx_destruct
{
}

@end