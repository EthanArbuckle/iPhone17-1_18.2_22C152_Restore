@interface TTKSimpleKey
- (CGRect)frame;
- (NSString)string;
- (TTKSimpleKey)initWithJsonDictionary:(id)a3;
- (TTKSimpleKey)initWithString:(id)a3 frame:(CGRect)a4 keyCode:(signed __int16)a5;
- (id)toJsonDictionary;
- (signed)keyCode;
@end

@implementation TTKSimpleKey

- (void).cxx_destruct
{
}

- (signed)keyCode
{
  return self->_keyCode;
}

- (CGRect)frame
{
  double x = self->_frame.origin.x;
  double y = self->_frame.origin.y;
  double width = self->_frame.size.width;
  double height = self->_frame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (NSString)string
{
  return self->_string;
}

- (id)toJsonDictionary
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  [v3 setObject:self->_string forKeyedSubscript:@"string"];
  v4 = [NSNumber numberWithInt:self->_keyCode];
  [v3 setObject:v4 forKeyedSubscript:@"key_code"];

  v5 = [MEMORY[0x263EFF9A0] dictionary];
  CGFloat x = self->_frame.origin.x;
  *(float *)&CGFloat x = x;
  v7 = [NSNumber numberWithFloat:x];
  [v5 setObject:v7 forKeyedSubscript:@"x"];

  CGFloat y = self->_frame.origin.y;
  *(float *)&CGFloat y = y;
  v9 = [NSNumber numberWithFloat:y];
  [v5 setObject:v9 forKeyedSubscript:@"y"];

  CGFloat height = self->_frame.size.height;
  *(float *)&CGFloat height = height;
  v11 = [NSNumber numberWithFloat:height];
  [v5 setObject:v11 forKeyedSubscript:@"height"];

  CGFloat width = self->_frame.size.width;
  *(float *)&CGFloat width = width;
  v13 = [NSNumber numberWithFloat:width];
  [v5 setObject:v13 forKeyedSubscript:@"width"];

  [v3 setObject:v5 forKeyedSubscript:@"frame"];
  return v3;
}

- (TTKSimpleKey)initWithJsonDictionary:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)TTKSimpleKey;
  v5 = [(TTKSimpleKey *)&v22 init];
  if (v5)
  {
    v6 = [v4 objectForKey:@"frame"];
    v7 = [v6 objectForKey:@"x"];
    v8 = [v6 objectForKey:@"y"];
    v9 = [v6 objectForKey:@"height"];
    v10 = [v6 objectForKey:@"width"];
    [v7 floatValue];
    CGFloat v12 = v11;
    [v8 floatValue];
    CGFloat v14 = v13;
    [v10 floatValue];
    CGFloat v16 = v15;
    [v9 floatValue];
    v5->_frame.origin.CGFloat x = v12;
    v5->_frame.origin.CGFloat y = v14;
    v5->_frame.size.CGFloat width = v16;
    v5->_frame.size.CGFloat height = v17;
    uint64_t v18 = [v4 objectForKey:@"string"];
    string = v5->_string;
    v5->_string = (NSString *)v18;

    v20 = [v4 objectForKey:@"key_code"];
    v5->_keyCode = [v20 intValue];
  }
  return v5;
}

- (TTKSimpleKey)initWithString:(id)a3 frame:(CGRect)a4 keyCode:(signed __int16)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v12 = a3;
  v16.receiver = self;
  v16.super_class = (Class)TTKSimpleKey;
  float v13 = [(TTKSimpleKey *)&v16 init];
  CGFloat v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_string, a3);
    v14->_frame.origin.CGFloat x = x;
    v14->_frame.origin.CGFloat y = y;
    v14->_frame.size.CGFloat width = width;
    v14->_frame.size.CGFloat height = height;
    v14->_keyCode = a5;
  }

  return v14;
}

@end