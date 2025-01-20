@interface PXUITapGestureRecognizer
- (CGPoint)locationInView:(id)a3;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)reset;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
@end

@implementation PXUITapGestureRecognizer

- (void).cxx_destruct
{
}

- (void)reset
{
  initialEventType = self->_initialEventType;
  self->_initialEventType = 0;

  v4.receiver = self;
  v4.super_class = (Class)PXUITapGestureRecognizer;
  [(PXUITapGestureRecognizer *)&v4 reset];
}

- (CGPoint)locationInView:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PXUITapGestureRecognizer;
  [(PXUITapGestureRecognizer *)&v16 locationInView:v4];
  double v6 = v5;
  double v8 = v7;
  if ([(NSNumber *)self->_initialEventType integerValue] == 3)
  {
    v9 = [MEMORY[0x1E4FB1790] focusSystemForEnvironment:v4];
    v10 = [v9 focusedItem];

    v11 = [v10 parentFocusEnvironment];
    v12 = [v11 focusItemContainer];
    uint64_t v13 = [v12 coordinateSpace];

    if (v13)
    {
      [v10 frame];
      PXRectGetCenter();
    }
  }
  double v14 = v6;
  double v15 = v8;
  result.y = v15;
  result.x = v14;
  return result;
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = v7;
  if (!self->_initialEventType)
  {
    objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v7, "type"));
    v9 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    initialEventType = self->_initialEventType;
    self->_initialEventType = v9;
  }
  v11.receiver = self;
  v11.super_class = (Class)PXUITapGestureRecognizer;
  [(PXUITapGestureRecognizer *)&v11 pressesBegan:v6 withEvent:v8];
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = v7;
  if (!self->_initialEventType)
  {
    objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v7, "type"));
    v9 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    initialEventType = self->_initialEventType;
    self->_initialEventType = v9;
  }
  v11.receiver = self;
  v11.super_class = (Class)PXUITapGestureRecognizer;
  [(PXUITapGestureRecognizer *)&v11 touchesBegan:v6 withEvent:v8];
}

@end