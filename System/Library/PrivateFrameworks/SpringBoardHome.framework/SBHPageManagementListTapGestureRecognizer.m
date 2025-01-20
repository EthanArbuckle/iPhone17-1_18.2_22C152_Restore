@interface SBHPageManagementListTapGestureRecognizer
- (UITouch)activeTouch;
- (void)reset;
- (void)setActiveTouch:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation SBHPageManagementListTapGestureRecognizer

- (void)reset
{
  v3.receiver = self;
  v3.super_class = (Class)SBHPageManagementListTapGestureRecognizer;
  [(SBHPageManagementListTapGestureRecognizer *)&v3 reset];
  [(SBHPageManagementListTapGestureRecognizer *)self setActiveTouch:0];
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SBHPageManagementListTapGestureRecognizer;
  [(SBHPageManagementListTapGestureRecognizer *)&v8 touchesBegan:v6 withEvent:a4];
  if ((unint64_t)[v6 count] < 2)
  {
    if (![(SBHPageManagementListTapGestureRecognizer *)self state])
    {
      v7 = [v6 anyObject];
      [(SBHPageManagementListTapGestureRecognizer *)self setActiveTouch:v7];
      [(SBHPageManagementListTapGestureRecognizer *)self setState:1];
    }
  }
  else
  {
    [(SBHPageManagementListTapGestureRecognizer *)self setState:5];
  }
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)SBHPageManagementListTapGestureRecognizer;
  id v6 = a3;
  [(SBHPageManagementListTapGestureRecognizer *)&v11 touchesMoved:v6 withEvent:a4];
  v7 = objc_msgSend(v6, "anyObject", v11.receiver, v11.super_class);
  unint64_t v8 = [v6 count];

  if (v8 > 1)
  {
    uint64_t v10 = 5;
  }
  else
  {
    v9 = [(SBHPageManagementListTapGestureRecognizer *)self activeTouch];

    if (v7 == v9) {
      uint64_t v10 = 2;
    }
    else {
      uint64_t v10 = 5;
    }
  }
  [(SBHPageManagementListTapGestureRecognizer *)self setState:v10];
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)SBHPageManagementListTapGestureRecognizer;
  id v6 = a3;
  [(SBHPageManagementListTapGestureRecognizer *)&v11 touchesEnded:v6 withEvent:a4];
  v7 = objc_msgSend(v6, "anyObject", v11.receiver, v11.super_class);
  unint64_t v8 = [v6 count];

  if (v8 > 1)
  {
    uint64_t v10 = 5;
  }
  else
  {
    v9 = [(SBHPageManagementListTapGestureRecognizer *)self activeTouch];

    if (v7 == v9) {
      uint64_t v10 = 3;
    }
    else {
      uint64_t v10 = 5;
    }
  }
  [(SBHPageManagementListTapGestureRecognizer *)self setState:v10];
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)SBHPageManagementListTapGestureRecognizer;
  [(SBHPageManagementListTapGestureRecognizer *)&v5 touchesCancelled:a3 withEvent:a4];
  [(SBHPageManagementListTapGestureRecognizer *)self setState:4];
}

- (UITouch)activeTouch
{
  return self->_activeTouch;
}

- (void)setActiveTouch:(id)a3
{
}

- (void).cxx_destruct
{
}

@end