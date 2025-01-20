@interface UIAccessibilityBridgeAXActionMessage
+ (BOOL)supportsSecureCoding;
- (NSData)elementRefData;
- (UIAccessibilityBridgeAXActionMessage)initWithAxAction:(int)a3 withValue:(id)a4 forElementRefData:(id)a5;
- (UIAccessibilityBridgeAXActionMessage)initWithCoder:(id)a3;
- (id)value;
- (int)axAction;
- (void)encodeWithCoder:(id)a3;
- (void)setAxAction:(int)a3;
- (void)setElementRefData:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation UIAccessibilityBridgeAXActionMessage

- (UIAccessibilityBridgeAXActionMessage)initWithAxAction:(int)a3 withValue:(id)a4 forElementRefData:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)UIAccessibilityBridgeAXActionMessage;
  v10 = [(UIAccessibilityBridgeAXActionMessage *)&v13 init];
  v11 = v10;
  if (v10)
  {
    [(UIAccessibilityBridgeAXActionMessage *)v10 setAxAction:v6];
    [(UIAccessibilityBridgeAXActionMessage *)v11 setValue:v8];
    [(UIAccessibilityBridgeAXActionMessage *)v11 setElementRefData:v9];
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UIAccessibilityBridgeAXActionMessage)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)UIAccessibilityBridgeAXActionMessage;
  v5 = [(UIAccessibilityBridgeAXActionMessage *)&v10 init];
  if (v5)
  {
    -[UIAccessibilityBridgeAXActionMessage setAxAction:](v5, "setAxAction:", [v4 decodeIntForKey:@"axAction"]);
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    v7 = [v4 decodeObjectOfClasses:v6 forKey:@"value"];
    [(UIAccessibilityBridgeAXActionMessage *)v5 setValue:v7];

    id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"elementRefData"];
    [(UIAccessibilityBridgeAXActionMessage *)v5 setElementRefData:v8];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInt:forKey:", -[UIAccessibilityBridgeAXActionMessage axAction](self, "axAction"), @"axAction");
  v5 = [(UIAccessibilityBridgeAXActionMessage *)self value];
  [v4 encodeObject:v5 forKey:@"value"];

  id v6 = [(UIAccessibilityBridgeAXActionMessage *)self elementRefData];
  [v4 encodeObject:v6 forKey:@"elementRefData"];
}

- (int)axAction
{
  return self->_axAction;
}

- (void)setAxAction:(int)a3
{
  self->_axAction = a3;
}

- (id)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (NSData)elementRefData
{
  return self->_elementRefData;
}

- (void)setElementRefData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elementRefData, 0);

  objc_storeStrong(&self->_value, 0);
}

@end