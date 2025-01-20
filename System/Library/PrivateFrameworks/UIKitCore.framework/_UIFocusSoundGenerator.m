@interface _UIFocusSoundGenerator
+ (id)defaultGenerator;
+ (void)_uiktest_unregisterURLForIdentifier:(id)a3;
+ (void)registerURL:(id)a3 forIdentifier:(id)a4;
- (_UIFocusSoundGenerator)initWithFocusSoundPlayer:(id)a3;
- (_UIFocusSoundPlayer)focusSoundPlayer;
- (void)playSoundForFocusUpdateInContext:(id)a3;
@end

@implementation _UIFocusSoundGenerator

+ (id)defaultGenerator
{
  v2 = [_UIFocusSoundGenerator alloc];
  v3 = +[_UIDefaultFocusSoundPlayer sharedInstance];
  v4 = [(_UIFocusSoundGenerator *)v2 initWithFocusSoundPlayer:v3];

  return v4;
}

- (_UIFocusSoundGenerator)initWithFocusSoundPlayer:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIFocusSoundGenerator;
  v6 = [(_UIFocusSoundGenerator *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_focusSoundPlayer, a3);
  }

  return v7;
}

- (void)playSoundForFocusUpdateInContext:(id)a3
{
  id v35 = a3;
  id v5 = [v35 _request];
  int v6 = [v5 shouldPlayFocusSound];

  if (v6) {
    v7 = @"UIFocusSoundIdentifierDefault";
  }
  else {
    v7 = @"UIFocusSoundIdentifierNone";
  }
  id v8 = v7;
  if (([v8 isEqualToString:0x1ED1217C0] & 1) == 0)
  {
    objc_super v9 = [v35 _focusMovement];
    [v9 _velocity];
    long double v11 = v10;
    long double v13 = v12;
    double v14 = 1.0;
    if ([v9 _isVelocityBased])
    {
      double v15 = fmax(_UIFocusVelocityBasedInterpolationFactor(v11, v13), 0.1);
      if (v15 >= 1.0) {
        double v14 = 1.0;
      }
      else {
        double v14 = v15 * 0.6 + 0.4;
      }
    }

    v16 = [v35 _destinationItemInfo];
    v17 = [v16 item];

    if (v17)
    {
      v18 = [v35 _destinationItemInfo];
      v19 = [v18 item];
      v20 = +[_UIFocusSystemSceneComponent sceneComponentForEnvironment:v19];
      v21 = [v20 coordinateSpace];

      if (v21)
      {
        v22 = [v35 _destinationItemInfo];
        v23 = [v22 focusedRegion];
        +[_UIFocusRegionEvaluator frameForRegion:v23 inCoordinateSpace:v21];
        double v26 = v25 + v24 * 0.5;

        [v21 bounds];
        CGFloat Width = CGRectGetWidth(v37);
        double v28 = (v26 - Width * 0.5) / (Width * 0.375);
      }
      else
      {
        double v28 = 0.0;
      }
    }
    else
    {
      double v28 = 0.0;
    }
    if ([v8 isEqualToString:0x1ED1217E0])
    {
      v29 = [v35 _destinationItemInfo];
      v30 = [v29 item];
      uint64_t v31 = _UIFocusedSoundForItem(v30);

      [(_UIFocusSoundPlayer *)self->_focusSoundPlayer playSoundWithFocusSound:v31 volume:v14 pan:v28];
    }
    else
    {
      v32 = _UIFocusSoundRegistry();
      v33 = [v32 objectForKeyedSubscript:v8];

      if (!v33)
      {
        v34 = [MEMORY[0x1E4F28B00] currentHandler];
        [v34 handleFailureInMethod:a2, self, @"_UIFocusSoundGenerator.m", 168, @"Attempted to play sound for identifier '%@', which has not been registered.", v8 object file lineNumber description];
      }
      [(_UIFocusSoundPlayer *)self->_focusSoundPlayer playSoundWithURL:v33 volume:v14 pan:v28];
    }
  }
}

+ (void)registerURL:(id)a3 forIdentifier:(id)a4
{
  id v14 = a3;
  id v7 = a4;
  if (v14)
  {
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    long double v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, a1, @"_UIFocusSoundGenerator.m", 185, @"Invalid parameter not satisfying: %@", @"soundFileURL" object file lineNumber description];

    if (v7) {
      goto LABEL_3;
    }
  }
  double v12 = [MEMORY[0x1E4F28B00] currentHandler];
  [v12 handleFailureInMethod:a2, a1, @"_UIFocusSoundGenerator.m", 186, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];

LABEL_3:
  id v8 = _UIFocusSoundRegistry();
  objc_super v9 = [v8 objectForKeyedSubscript:v7];

  if (v9)
  {
    long double v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, a1, @"_UIFocusSoundGenerator.m", 187, @"A URL is already registered with the identifier '%@'. Identifiers can only be registered once.", v7 object file lineNumber description];
  }
  double v10 = _UIFocusSoundRegistry();
  [v10 setObject:v14 forKeyedSubscript:v7];
}

+ (void)_uiktest_unregisterURLForIdentifier:(id)a3
{
  id v7 = a3;
  if (!v7)
  {
    int v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, a1, @"_UIFocusSoundGenerator.m", 196, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];
  }
  id v5 = _UIFocusSoundRegistry();
  [v5 setObject:0 forKeyedSubscript:v7];
}

- (_UIFocusSoundPlayer)focusSoundPlayer
{
  return self->_focusSoundPlayer;
}

- (void).cxx_destruct
{
}

@end