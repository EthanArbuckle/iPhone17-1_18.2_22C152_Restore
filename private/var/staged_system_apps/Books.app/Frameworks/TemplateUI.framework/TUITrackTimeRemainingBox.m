@interface TUITrackTimeRemainingBox
- (Class)layoutClass;
- (TUIDynamicProgress)dynamicProgress;
- (TUITextContentStyler)style;
- (void)setDynamicProgress:(id)a3;
- (void)setStyle:(id)a3;
@end

@implementation TUITrackTimeRemainingBox

- (Class)layoutClass
{
  return (Class)objc_opt_class();
}

- (TUIDynamicProgress)dynamicProgress
{
  return self->_dynamicProgress;
}

- (void)setDynamicProgress:(id)a3
{
}

- (TUITextContentStyler)style
{
  return self->_style;
}

- (void)setStyle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_style, 0);

  objc_storeStrong((id *)&self->_dynamicProgress, 0);
}

@end