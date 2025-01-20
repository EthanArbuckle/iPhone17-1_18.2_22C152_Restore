@interface NSLayoutConstraint(WBSNSLayoutConstraintExtras)
+ (id)safari_constraintsMatchingFrameOfView:()WBSNSLayoutConstraintExtras withFrameOfView:directionalInsets:;
+ (id)safari_constraintsMatchingFrameOfView:()WBSNSLayoutConstraintExtras withFrameOfView:edgeInsets:;
+ (uint64_t)safari_constraintsMatchingFrameOfView:()WBSNSLayoutConstraintExtras withFrameOfView:;
@end

@implementation NSLayoutConstraint(WBSNSLayoutConstraintExtras)

+ (uint64_t)safari_constraintsMatchingFrameOfView:()WBSNSLayoutConstraintExtras withFrameOfView:
{
  return objc_msgSend(a1, "safari_constraintsMatchingFrameOfView:withFrameOfView:edgeInsets:", 0.0, 0.0, 0.0, 0.0);
}

+ (id)safari_constraintsMatchingFrameOfView:()WBSNSLayoutConstraintExtras withFrameOfView:edgeInsets:
{
  v22[4] = *MEMORY[0x1E4F143B8];
  id v14 = a8;
  id v15 = a7;
  v16 = [a1 constraintWithItem:v15 attribute:3 relatedBy:0 toItem:v14 attribute:3 multiplier:1.0 constant:a2];
  v22[0] = v16;
  v17 = [a1 constraintWithItem:v15 attribute:4 relatedBy:0 toItem:v14 attribute:4 multiplier:1.0 constant:-a4];
  v22[1] = v17;
  v18 = [a1 constraintWithItem:v15 attribute:5 relatedBy:0 toItem:v14 attribute:5 multiplier:1.0 constant:a3];
  v22[2] = v18;
  v19 = [a1 constraintWithItem:v15 attribute:6 relatedBy:0 toItem:v14 attribute:6 multiplier:1.0 constant:-a5];

  v22[3] = v19;
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:4];

  return v20;
}

+ (id)safari_constraintsMatchingFrameOfView:()WBSNSLayoutConstraintExtras withFrameOfView:directionalInsets:
{
  v29[4] = *MEMORY[0x1E4F143B8];
  id v13 = a8;
  id v14 = a7;
  v28 = [v14 topAnchor];
  v27 = [v13 topAnchor];
  v26 = [v28 constraintEqualToAnchor:v27 constant:a1];
  v29[0] = v26;
  id v15 = [v14 bottomAnchor];
  v16 = [v13 bottomAnchor];
  v17 = [v15 constraintEqualToAnchor:v16 constant:-a3];
  v29[1] = v17;
  v18 = [v14 leadingAnchor];
  v19 = [v13 leadingAnchor];
  v20 = [v18 constraintEqualToAnchor:v19 constant:a2];
  v29[2] = v20;
  v21 = [v14 trailingAnchor];

  v22 = [v13 trailingAnchor];

  v23 = [v21 constraintEqualToAnchor:v22 constant:-a4];
  v29[3] = v23;
  v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:4];

  return v24;
}

@end