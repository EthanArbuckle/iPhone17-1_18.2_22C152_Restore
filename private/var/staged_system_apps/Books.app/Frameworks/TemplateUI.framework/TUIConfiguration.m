@interface TUIConfiguration
- (BOOL)BOOLForKey:(id)a3;
- (CGSize)sizeForKey:(id)a3;
- (NSDictionary)data;
- (TUIConfiguration)initWithData:(id)a3;
- (UIEdgeInsets)insetsForKey:(id)a3;
- (double)floatForKey:(id)a3;
- (id)boxForKey:(id)a3;
- (id)colorForKey:(id)a3;
- (id)dataForKey:(id)a3;
- (id)dictionaryForKey:(id)a3;
- (id)fontSpecForKey:(id)a3;
- (id)sectionForKey:(id)a3;
- (id)snapForKey:(id)a3;
- (id)stringForKey:(id)a3;
- (int64_t)integerForKey:(id)a3;
- (void)setData:(id)a3;
@end

@implementation TUIConfiguration

- (TUIConfiguration)initWithData:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TUIConfiguration;
  v5 = [(TUIConfiguration *)&v9 init];
  if (v5)
  {
    v6 = (NSDictionary *)[v4 copy];
    data = v5->_data;
    v5->_data = v6;
  }
  return v5;
}

- (id)sectionForKey:(id)a3
{
  v3 = [(NSDictionary *)self->_data objectForKeyedSubscript:a3];
  if (v3) {
    id v4 = [[TUIConfiguration alloc] initWithData:v3];
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (id)colorForKey:(id)a3
{
  return [(NSDictionary *)self->_data objectForKeyedSubscript:a3];
}

- (id)fontSpecForKey:(id)a3
{
  return [(NSDictionary *)self->_data objectForKeyedSubscript:a3];
}

- (id)dataForKey:(id)a3
{
  return [(NSDictionary *)self->_data objectForKeyedSubscript:a3];
}

- (double)floatForKey:(id)a3
{
  v3 = [(NSDictionary *)self->_data objectForKeyedSubscript:a3];
  [v3 doubleValue];
  double v5 = v4;

  return v5;
}

- (int64_t)integerForKey:(id)a3
{
  v3 = [(NSDictionary *)self->_data objectForKeyedSubscript:a3];
  id v4 = [v3 integerValue];

  return (int64_t)v4;
}

- (BOOL)BOOLForKey:(id)a3
{
  v3 = [(NSDictionary *)self->_data objectForKeyedSubscript:a3];
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (id)stringForKey:(id)a3
{
  return [(NSDictionary *)self->_data objectForKeyedSubscript:a3];
}

- (CGSize)sizeForKey:(id)a3
{
  v3 = [(NSDictionary *)self->_data objectForKeyedSubscript:a3];
  unsigned __int8 v4 = v3;
  if (v3)
  {
    [v3 CGSizeValue];
    CGFloat width = v5;
    CGFloat height = v7;
  }
  else
  {
    CGFloat width = CGSizeZero.width;
    CGFloat height = CGSizeZero.height;
  }

  double v9 = width;
  double v10 = height;
  result.CGFloat height = v10;
  result.CGFloat width = v9;
  return result;
}

- (UIEdgeInsets)insetsForKey:(id)a3
{
  v3 = [(NSDictionary *)self->_data objectForKeyedSubscript:a3];
  unsigned __int8 v4 = v3;
  if (v3)
  {
    [v3 UIEdgeInsetsValue];
    CGFloat top = v5;
    CGFloat left = v7;
    CGFloat bottom = v9;
    CGFloat right = v11;
  }
  else
  {
    CGFloat top = UIEdgeInsetsZero.top;
    CGFloat left = UIEdgeInsetsZero.left;
    CGFloat bottom = UIEdgeInsetsZero.bottom;
    CGFloat right = UIEdgeInsetsZero.right;
  }

  double v13 = top;
  double v14 = left;
  double v15 = bottom;
  double v16 = right;
  result.CGFloat right = v16;
  result.CGFloat bottom = v15;
  result.CGFloat left = v14;
  result.CGFloat top = v13;
  return result;
}

- (id)boxForKey:(id)a3
{
  return [(NSDictionary *)self->_data objectForKeyedSubscript:a3];
}

- (id)snapForKey:(id)a3
{
  return [(NSDictionary *)self->_data objectForKeyedSubscript:a3];
}

- (id)dictionaryForKey:(id)a3
{
  return [(NSDictionary *)self->_data objectForKeyedSubscript:a3];
}

- (NSDictionary)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end