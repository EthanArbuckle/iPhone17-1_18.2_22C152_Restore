@interface VTUIProximityView
- (BOOL)_shouldUsePhoneLandscapeLayoutForSize:(CGSize)a3;
- (void)updateContainerConstraintsForOrientationChangeToSize:(CGSize)a3;
@end

@implementation VTUIProximityView

- (BOOL)_shouldUsePhoneLandscapeLayoutForSize:(CGSize)a3
{
  v3 = objc_msgSend(MEMORY[0x263F82438], "sharedApplication", a3.width, a3.height);
  v4 = [v3 windows];
  v5 = [v4 firstObject];
  v6 = [v5 windowScene];
  uint64_t v7 = [v6 interfaceOrientation];

  v8 = +[MGWrapper sharedMGWrapper];
  char v9 = [v8 isDeviceIPad];

  if ((unint64_t)(v7 - 3) < 2) {
    return v9 ^ 1;
  }
  else {
    return 0;
  }
}

- (void)updateContainerConstraintsForOrientationChangeToSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v6 = (void *)MEMORY[0x263F08938];
  uint64_t v7 = [(VTUIProximityView *)self viewConstraints];
  [v6 deactivateConstraints:v7];

  -[VTUIProximityView _setupConstraintsToSize:](self, "_setupConstraintsToSize:", width, height);
  [(VTUIProximityView *)self layoutIfNeeded];
}

@end