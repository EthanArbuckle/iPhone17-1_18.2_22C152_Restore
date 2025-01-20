@interface NavSignLayoutDelegateManager
+ (id)compactWidthLayoutDelegateForDriving;
+ (id)compactWidthLayoutDelegateForDrivingAndJunctionView;
+ (id)compactWidthLayoutDelegateForWalking;
+ (id)compactWidthSecondarySignLayoutDelegateForDriving;
+ (id)defaultLayoutDelegateForDriving;
+ (id)defaultLayoutDelegateForStepping;
+ (id)defaultLayoutDelegateForWalking;
+ (id)defaultMessageSignLayoutDelegate;
+ (id)layoutDelegateForSign:(id)a3 layoutType:(unint64_t)a4;
+ (id)minimizedLayoutDelegateForDriving;
+ (id)minimizedLayoutDelegateForDrivingAndJunctionView;
+ (id)secondarySignLayoutDelegateForDriving;
@end

@implementation NavSignLayoutDelegateManager

+ (id)layoutDelegateForSign:(id)a3 layoutType:(unint64_t)a4
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = [a1 defaultMessageSignLayoutDelegate];
    goto LABEL_17;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (a4 == 2) {
      [a1 compactWidthSecondarySignLayoutDelegateForDriving];
    }
    else {
      [a1 secondarySignLayoutDelegateForDriving];
    }
    uint64_t v7 = LABEL_13:;
    goto LABEL_17;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a4 == 2) {
      [a1 compactWidthLayoutDelegateForWalking];
    }
    else {
      [a1 defaultLayoutDelegateForWalking];
    }
    goto LABEL_13;
  }
  if (a4 != 1)
  {
    if (a4 == 2) {
      [a1 compactWidthLayoutDelegateForDriving];
    }
    else {
      [a1 defaultLayoutDelegateForDriving];
    }
    goto LABEL_13;
  }
  uint64_t v7 = [a1 minimizedLayoutDelegateForDriving];
LABEL_17:
  v8 = (void *)v7;

  return v8;
}

+ (id)defaultMessageSignLayoutDelegate
{
  return +[NavMessageSignLayout sharedMessageSignLayout];
}

+ (id)defaultLayoutDelegateForDriving
{
  return +[NavDrivingSignLayout sharedDrivingSignLayout];
}

+ (id)compactWidthLayoutDelegateForDriving
{
  return +[NavDrivingSignLayoutCompactWidth sharedDrivingCompactWidthSignLayout];
}

+ (id)minimizedLayoutDelegateForDriving
{
  return +[NavDrivingSignLayoutMinimized sharedDrivingMinimizedSignLayout];
}

+ (id)minimizedLayoutDelegateForDrivingAndJunctionView
{
  return +[NavDrivingSignLayoutMinimizedWithJunctionView sharedDrivingMinimizedWithJunctionViewSignLayout];
}

+ (id)compactWidthLayoutDelegateForDrivingAndJunctionView
{
  return +[NavDrivingSignLayoutCompactWithJunctionView sharedDrivingCompactWithJunctionViewSignLayout];
}

+ (id)secondarySignLayoutDelegateForDriving
{
  return +[NavDrivingSignLayoutSecondary sharedDrivingSecondarySignLayout];
}

+ (id)compactWidthSecondarySignLayoutDelegateForDriving
{
  return +[NavDrivingSignLayoutSecondaryCompactWidth sharedDrivingSecondaryCompactWidthSignLayout];
}

+ (id)defaultLayoutDelegateForWalking
{
  return +[NavPedestrianSignLayout sharedPedestrianSignLayout];
}

+ (id)compactWidthLayoutDelegateForWalking
{
  return +[NavPedestrianSignLayoutCompactWidth sharedPedestrianSignCompactWidthLayout];
}

+ (id)defaultLayoutDelegateForStepping
{
  return +[NavSteppingSignLayout sharedSteppingSignLayout];
}

@end