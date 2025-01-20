@interface UIAccessibilityAggregateElement
- (CGRect)accessibilityFrame;
- (NSArray)representedElements;
- (UIAccessibilityAggregateElement)initWithAccessibilityContainer:(id)a3;
- (UIAccessibilityAggregateElement)initWithAccessibilityContainer:(id)a3 representedElements:(id)a4;
- (id)accessibilityLabel;
- (void)addRepresentedObject:(id)a3;
- (void)setRepresentedElements:(id)a3;
@end

@implementation UIAccessibilityAggregateElement

- (UIAccessibilityAggregateElement)initWithAccessibilityContainer:(id)a3 representedElements:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)UIAccessibilityAggregateElement;
  v7 = [(UIAccessibilityAggregateElement *)&v10 initWithAccessibilityContainer:a3];
  v8 = v7;
  if (v7) {
    [(UIAccessibilityAggregateElement *)v7 setRepresentedElements:v6];
  }

  return v8;
}

- (void)addRepresentedObject:(id)a3
{
  representedElements = self->_representedElements;
  id v5 = a3;
  id v6 = (id)[(NSArray *)representedElements mutableCopy];
  [v6 axSafelyAddObject:v5];

  [(UIAccessibilityAggregateElement *)self setRepresentedElements:v6];
}

- (id)accessibilityLabel
{
  v3 = [(UIAccessibilityAggregateElement *)self accessibilityUserDefinedLabel];

  if (v3)
  {
    v4 = [(UIAccessibilityAggregateElement *)self accessibilityUserDefinedLabel];
  }
  else
  {
    id v5 = [(UIAccessibilityAggregateElement *)self representedElements];
    v4 = UIAXLabelForElements();
  }

  return v4;
}

- (CGRect)accessibilityFrame
{
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([(UIAccessibilityAggregateElement *)self accessibilityUserDefinedFrame],
        v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    v4 = [(UIAccessibilityAggregateElement *)self accessibilityUserDefinedFrame];
    [v4 rectValue];
  }
  else
  {
    v4 = [(UIAccessibilityAggregateElement *)self representedElements];
    double v5 = UIAXFrameForElements(v4);
  }
  double v9 = v5;
  double v10 = v6;
  double v11 = v7;
  double v12 = v8;

  double v13 = v9;
  double v14 = v10;
  double v15 = v11;
  double v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (NSArray)representedElements
{
  return self->_representedElements;
}

- (void)setRepresentedElements:(id)a3
{
}

- (void).cxx_destruct
{
}

- (UIAccessibilityAggregateElement)initWithAccessibilityContainer:(id)a3
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  v5.receiver = self;
  v5.super_class = (Class)UIAccessibilityAggregateElement;
  return [(UIAccessibilityAggregateElement *)&v5 init];
}

@end