@interface _HUDRow
- (NSString)name;
- (_HUDRow)initWithName:(id)a3;
- (void)setName:(id)a3;
@end

@implementation _HUDRow

- (_HUDRow)initWithName:(id)a3
{
  id v5 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_HUDRow;
  v6 = [(_HUDRow *)&v8 init];
  if (v6)
  {
    if (v5 && [v5 length])
    {
      objc_storeStrong((id *)&v6->_name, a3);
    }
    else
    {

      v6 = 0;
    }
  }

  return v6;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end