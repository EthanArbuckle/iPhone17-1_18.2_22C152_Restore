@interface _UILabelMarqueeAnimationDelegate
- (BOOL)suppressEnded;
- (UILabel)label;
- (_UILabelMarqueeAnimationDelegate)initWithLabel:(id)a3;
- (void)animationDidStart:(id)a3;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)setLabel:(id)a3;
- (void)setSuppressEnded:(BOOL)a3;
@end

@implementation _UILabelMarqueeAnimationDelegate

- (_UILabelMarqueeAnimationDelegate)initWithLabel:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UILabelMarqueeAnimationDelegate;
  v5 = [(_UILabelMarqueeAnimationDelegate *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_label, v4);
  }

  return v6;
}

- (void)animationDidStart:(id)a3
{
  v35[1] = *MEMORY[0x1E4F143B8];
  p_BOOL started = &self->_started;
  BOOL started = self->_started;
  v6 = objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", a3);
  v7 = (id *)(p_started + 8);
  if (started)
  {
    uint64_t v8 = _UILabelMarqueeUpdatedNotification;
    id WeakRetained = objc_loadWeakRetained(v7);
    uint64_t v32 = _UILabelMarqueeNotificationDurationKey;
    v10 = NSNumber;
    id v11 = WeakRetained;
    [v11 textSizeForWidth:3.40282347e38];
    double v13 = v12;
    [v11 marqueeLoopPadding];
    double v15 = (v13 + v14) / 30.0;
    double v16 = -[UILabel _maximumMarqueeTextWidth](v11);
    [v11 marqueeLoopPadding];
    v18 = [v10 numberWithDouble:v15 + 1.5 + (v16 + v17) / 30.0 - v15 + 0.0];
    v33 = v18;
    v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];
    [v6 postNotificationName:v8 object:v11 userInfo:v19];

    p_BOOL started = &self->_updated;
  }
  else
  {
    uint64_t v20 = _UILabelMarqueeStartedNotification;
    id v21 = objc_loadWeakRetained(v7);
    uint64_t v34 = _UILabelMarqueeNotificationDurationKey;
    v22 = NSNumber;
    id v23 = v21;
    [v23 textSizeForWidth:3.40282347e38];
    double v25 = v24;
    [v23 marqueeLoopPadding];
    double v27 = (v25 + v26) / 30.0;
    double v28 = -[UILabel _maximumMarqueeTextWidth](v23);
    [v23 marqueeLoopPadding];
    v30 = [v22 numberWithDouble:v27 + 1.5 + (v28 + v29) / 30.0 - v27 + 0.0];
    v35[0] = v30;
    v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:&v34 count:1];
    [v6 postNotificationName:v20 object:v23 userInfo:v31];
  }
  *p_BOOL started = 1;
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  if (self->_suppressEnded)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __62___UILabelMarqueeAnimationDelegate_animationDidStop_finished___block_invoke;
    block[3] = &unk_1E52D9F70;
    block[4] = self;
    v5 = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
    self->_suppressEnded = 0;
  }
  else
  {
    BOOL v6 = a4;
    v7 = objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", a3);
    uint64_t v8 = _UILabelMarqueeEndedNotification;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_label);
    [v7 postNotificationName:v8 object:WeakRetained userInfo:0];

    id v10 = objc_loadWeakRetained((id *)&self->_label);
    objc_setAssociatedObject(v10, &__marqueeAnimationDelegateKey, 0, (void *)1);

    if (v6)
    {
      id v11 = objc_loadWeakRetained((id *)&self->_label);
      uint64_t v12 = [v11 marqueeRepeatCount];

      if (v12)
      {
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __62___UILabelMarqueeAnimationDelegate_animationDidStop_finished___block_invoke_2;
        v13[3] = &unk_1E52D9F70;
        v13[4] = self;
        dispatch_async(MEMORY[0x1E4F14428], v13);
      }
    }
  }
}

- (UILabel)label
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_label);
  return (UILabel *)WeakRetained;
}

- (void)setLabel:(id)a3
{
}

- (BOOL)suppressEnded
{
  return self->_suppressEnded;
}

- (void)setSuppressEnded:(BOOL)a3
{
  self->_suppressEnded = a3;
}

- (void).cxx_destruct
{
}

@end