@interface WFMatchedAppIconColorData
- (NSArray)colors;
- (WFMatchedAppIconColorData)initWithColors:(id)a3;
@end

@implementation WFMatchedAppIconColorData

- (void).cxx_destruct
{
}

- (NSArray)colors
{
  return self->_colors;
}

- (WFMatchedAppIconColorData)initWithColors:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFMatchedAppIconColorData;
  v6 = [(WFMatchedAppIconColorData *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_colors, a3);
    v8 = v7;
  }

  return v7;
}

@end