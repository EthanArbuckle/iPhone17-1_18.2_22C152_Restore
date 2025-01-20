@interface _UIViewControllerAnimatedTransitionHandoffData
- (BOOL)isPush;
- (UIViewFloatAnimatableProperty)progressValue;
- (_UIViewControllerAnimatedTransitionHandoffData)initWithFromViewControllerHandoffData:(id)a3 toViewControllerHandoffData:(id)a4 progressValue:(id)a5 isPush:(BOOL)a6;
- (_UIViewControllerAnimatedTransitionViewControllerHandoffData)fromViewControllerHandoffData;
- (_UIViewControllerAnimatedTransitionViewControllerHandoffData)toViewControllerHandoffData;
- (id)handoffDataForViewController:(id)a3;
@end

@implementation _UIViewControllerAnimatedTransitionHandoffData

- (_UIViewControllerAnimatedTransitionHandoffData)initWithFromViewControllerHandoffData:(id)a3 toViewControllerHandoffData:(id)a4 progressValue:(id)a5 isPush:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)_UIViewControllerAnimatedTransitionHandoffData;
  v14 = [(_UIViewControllerAnimatedTransitionHandoffData *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_fromViewControllerHandoffData, a3);
    objc_storeStrong((id *)&v15->_toViewControllerHandoffData, a4);
    objc_storeStrong((id *)&v15->_progressValue, a5);
    v15->_isPush = a6;
  }

  return v15;
}

- (id)handoffDataForViewController:(id)a3
{
  id v4 = a3;
  p_fromViewControllerHandoffData = &self->_fromViewControllerHandoffData;
  id v6 = [(_UIViewControllerAnimatedTransitionViewControllerHandoffData *)self->_fromViewControllerHandoffData viewController];

  if (v6 != v4)
  {
    toViewControllerHandoffData = self->_toViewControllerHandoffData;
    p_toViewControllerHandoffData = &self->_toViewControllerHandoffData;
    id v9 = [(_UIViewControllerAnimatedTransitionViewControllerHandoffData *)toViewControllerHandoffData viewController];

    if (v9 != v4)
    {
      v10 = 0;
      goto LABEL_6;
    }
    p_fromViewControllerHandoffData = p_toViewControllerHandoffData;
  }
  v10 = *p_fromViewControllerHandoffData;
LABEL_6:

  return v10;
}

- (_UIViewControllerAnimatedTransitionViewControllerHandoffData)fromViewControllerHandoffData
{
  return self->_fromViewControllerHandoffData;
}

- (_UIViewControllerAnimatedTransitionViewControllerHandoffData)toViewControllerHandoffData
{
  return self->_toViewControllerHandoffData;
}

- (UIViewFloatAnimatableProperty)progressValue
{
  return self->_progressValue;
}

- (BOOL)isPush
{
  return self->_isPush;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressValue, 0);
  objc_storeStrong((id *)&self->_toViewControllerHandoffData, 0);
  objc_storeStrong((id *)&self->_fromViewControllerHandoffData, 0);
}

@end