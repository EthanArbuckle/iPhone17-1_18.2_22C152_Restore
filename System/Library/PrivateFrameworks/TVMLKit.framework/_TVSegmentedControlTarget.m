@interface _TVSegmentedControlTarget
+ (void)addTargetInSegmentedControl:(id)a3 withHighlightViewElements:(id)a4;
- (_TVSegmentedControlTarget)initWithViewElements:(id)a3;
- (void)_valueChanged:(id)a3;
@end

@implementation _TVSegmentedControlTarget

+ (void)addTargetInSegmentedControl:(id)a3 withHighlightViewElements:(id)a4
{
  id object = a3;
  id v6 = a4;
  v7 = objc_getAssociatedObject(object, "AssociatedTarget");
  if (v7) {
    [object removeTarget:v7 action:sel__valueChanged_ forControlEvents:4096];
  }
  v8 = (void *)[objc_alloc((Class)a1) initWithViewElements:v6];

  [object addTarget:v8 action:sel__valueChanged_ forControlEvents:4096];
  objc_setAssociatedObject(object, "AssociatedTarget", v8, (void *)0x301);
}

- (_TVSegmentedControlTarget)initWithViewElements:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_TVSegmentedControlTarget;
  v5 = [(_TVSegmentedControlTarget *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    elements = v5->_elements;
    v5->_elements = (NSArray *)v6;
  }
  return v5;
}

- (void)_valueChanged:(id)a3
{
  id v7 = a3;
  unint64_t v4 = [v7 selectedSegmentIndex];
  if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = v4;
    if (v4 < [(NSArray *)self->_elements count])
    {
      uint64_t v6 = [(NSArray *)self->_elements objectAtIndex:v5];
      objc_msgSend(v6, "tv_dispatchEvent:canBubble:isCancelable:extraInfo:targetResponder:completionBlock:", @"highlight", 1, 0, 0, v7, 0);
    }
  }
}

- (void).cxx_destruct
{
}

@end