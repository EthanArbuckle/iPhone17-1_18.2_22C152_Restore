@interface _UIPencilHoverState
+ (void)_hoverStateFromHoverPose:(uint64_t)a1;
- (_UIPencilHoverState)init;
@end

@implementation _UIPencilHoverState

+ (void)_hoverStateFromHoverPose:(uint64_t)a1
{
  self;
  if (a2)
  {
    v3 = [_UIPencilHoverState alloc];
    if (v3)
    {
      v14.receiver = v3;
      v14.super_class = (Class)UIPencilHoverPose;
      v4 = (char *)objc_msgSendSuper2(&v14, sel_init);
      if (v4)
      {
        v5 = v4;
        uint64_t v6 = *(void *)(a2 + 72);
        *(_OWORD *)(v4 + 56) = *(_OWORD *)(a2 + 56);
        *((void *)v4 + 9) = v6;
        [(id)a2 zOffset];
        v5[1] = v7;
        [(id)a2 azimuthAngle];
        v5[2] = v8;
        [(id)a2 azimuthUnitVector];
        v5[5] = v9;
        v5[6] = v10;
        [(id)a2 altitudeAngle];
        v5[3] = v11;
        [(id)a2 rollAngle];
        v5[4] = v12;
        goto LABEL_7;
      }
    }
    [(id)a2 zOffset];
    [(id)a2 azimuthAngle];
    [(id)a2 azimuthUnitVector];
    [(id)a2 altitudeAngle];
    [(id)a2 rollAngle];
  }
  v5 = 0;
LABEL_7:
  return v5;
}

- (_UIPencilHoverState)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"UIPencilInteraction.m", 337, @"%s: init is not allowed on %@", "-[_UIPencilHoverState init]", objc_opt_class() object file lineNumber description];

  return 0;
}

@end