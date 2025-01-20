@interface VMAudioParameter
+ (id)parameterWithName:(id)a3 defaultValue:(float)a4 min:(float)a5 max:(float)a6 internalAddress:(int)a7 graphName:(id)a8;
- (NSString)graphName;
- (NSString)name;
- (VMAudioParameter)initWithName:(id)a3 defaultValue:(float)a4 min:(float)a5 max:(float)a6 internalAddress:(int)a7 graphName:(id)a8;
- (float)currentValue;
- (float)defaultValue;
- (float)max;
- (float)min;
- (float)value;
- (int)address;
- (int)internalAddress;
- (void)setAddress:(int)a3;
- (void)setGraphName:(id)a3;
- (void)setInternalAddress:(int)a3;
@end

@implementation VMAudioParameter

- (VMAudioParameter)initWithName:(id)a3 defaultValue:(float)a4 min:(float)a5 max:(float)a6 internalAddress:(int)a7 graphName:(id)a8
{
  id v15 = a3;
  id v16 = a8;
  v20.receiver = self;
  v20.super_class = (Class)VMAudioParameter;
  v17 = [(VMAudioParameter *)&v20 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_name, a3);
    v18->_defaultValue = a4;
    v18->_min = a5;
    v18->_max = a6;
    v18->_internalAddress = a7;
    objc_storeStrong((id *)&v18->_graphName, a8);
  }

  return v18;
}

+ (id)parameterWithName:(id)a3 defaultValue:(float)a4 min:(float)a5 max:(float)a6 internalAddress:(int)a7 graphName:(id)a8
{
  uint64_t v8 = *(void *)&a7;
  id v13 = a8;
  id v14 = a3;
  id v15 = [VMAudioParameter alloc];
  *(float *)&double v16 = a4;
  *(float *)&double v17 = a5;
  *(float *)&double v18 = a6;
  v19 = [(VMAudioParameter *)v15 initWithName:v14 defaultValue:v8 min:v13 max:v16 internalAddress:v17 graphName:v18];

  return v19;
}

- (float)currentValue
{
  v3 = +[NSUserDefaults standardUserDefaults];
  v4 = [(VMAudioParameter *)self name];
  v5 = [v3 objectForKey:v4];

  if (v5) {
    [v5 floatValue];
  }
  else {
    [(VMAudioParameter *)self defaultValue];
  }
  float v7 = v6;

  return v7;
}

- (NSString)name
{
  return self->_name;
}

- (float)defaultValue
{
  return self->_defaultValue;
}

- (float)min
{
  return self->_min;
}

- (float)max
{
  return self->_max;
}

- (int)address
{
  return self->_address;
}

- (void)setAddress:(int)a3
{
  self->_address = a3;
}

- (float)value
{
  return self->_value;
}

- (int)internalAddress
{
  return self->_internalAddress;
}

- (void)setInternalAddress:(int)a3
{
  self->_internalAddress = a3;
}

- (NSString)graphName
{
  return self->_graphName;
}

- (void)setGraphName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_graphName, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end