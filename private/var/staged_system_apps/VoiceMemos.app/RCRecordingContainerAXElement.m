@interface RCRecordingContainerAXElement
- (CGPoint)accessibilityActivationPoint;
- (CGRect)accessibilityFrame;
- (RCRecordingContainerAXElement)initWithAccessibilityContainer:(id)a3 recordingContainerView:(id)a4;
- (UIView)recordingContainerView;
- (unint64_t)accessibilityTraits;
- (void)setRecordingContainerView:(id)a3;
@end

@implementation RCRecordingContainerAXElement

- (RCRecordingContainerAXElement)initWithAccessibilityContainer:(id)a3 recordingContainerView:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)RCRecordingContainerAXElement;
  v7 = [(RCRecordingContainerAXElement *)&v10 initWithAccessibilityContainer:a3];
  v8 = v7;
  if (v7) {
    objc_storeWeak((id *)&v7->_recordingContainerView, v6);
  }

  return v8;
}

- (CGRect)accessibilityFrame
{
  v2 = [(RCRecordingContainerAXElement *)self recordingContainerView];
  [v2 accessibilityFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CGPoint)accessibilityActivationPoint
{
  [(RCRecordingContainerAXElement *)self accessibilityFrame];
  double v3 = v2 + 4.0;
  double v5 = v4 + 4.0;
  result.y = v5;
  result.x = v3;
  return result;
}

- (unint64_t)accessibilityTraits
{
  return UIAccessibilityTraitButton;
}

- (UIView)recordingContainerView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_recordingContainerView);

  return (UIView *)WeakRetained;
}

- (void)setRecordingContainerView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end