@interface NSSymbolEffect(UIKitAdditions)
- (BOOL)ui_effectPrefersIndefiniteBehaviorOverDiscreteBehavior;
- (id)ui_animationConfigurationWithOptions:()UIKitAdditions completion:configuration:;
- (uint64_t)ui_effectSupportsRepeat;
- (uint64_t)ui_isSupportedByBarButtonItem;
- (uint64_t)ui_isSupportedByImageView;
- (uint64_t)ui_rbAnimation;
@end

@implementation NSSymbolEffect(UIKitAdditions)

- (uint64_t)ui_isSupportedByImageView
{
  unint64_t v1 = [a1 _effectType];
  return (v1 < 0xD) & (0x167Eu >> v1);
}

- (uint64_t)ui_isSupportedByBarButtonItem
{
  if ((unint64_t)([a1 _effectType] - 5) < 2) {
    return 0;
  }
  return objc_msgSend(a1, "ui_isSupportedByImageView");
}

- (uint64_t)ui_rbAnimation
{
  uint64_t v1 = [a1 _effectType];
  if ((unint64_t)(v1 - 1) > 0xB) {
    return 0xFFFFFFFFLL;
  }
  else {
    return dword_186B9DCE0[v1 - 1];
  }
}

- (id)ui_animationConfigurationWithOptions:()UIKitAdditions completion:configuration:
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = objc_msgSend(a1, "ui_rbAnimation");
  v13 = [MEMORY[0x1E4F1CA60] dictionary];
  v14 = [v11 traitCollection];

  uint64_t v15 = [v14 layoutDirection];
  uint64_t v16 = [v9 _repeatBehavior];
  if (v16 == 1 || !v16 && objc_msgSend(a1, "ui_effectPrefersIndefiniteBehaviorOverDiscreteBehavior"))
  {
    int v17 = [v9 _prefersContinuous];
    char v66 = 1;
  }
  else
  {
    char v66 = 0;
    int v17 = 0;
  }
  switch([a1 _effectType])
  {
    case 1:
      id v19 = a1;
      BOOL v20 = [v19 _fillStyle] == 1;
      if ([v19 _inactiveStyle] == 1) {
        unsigned int v21 = v20 | 2;
      }
      else {
        unsigned int v21 = v20;
      }
      uint64_t v22 = [v19 _playbackStyle];

      if (v22 == 1) {
        uint64_t v23 = v21 | 8;
      }
      else {
        uint64_t v23 = v21;
      }
      v24 = [NSNumber numberWithUnsignedInt:v23];
      [v13 setObject:v24 forKeyedSubscript:*MEMORY[0x1E4F960A8]];

      goto LABEL_46;
    case 2:
    case 4:
      uint64_t v18 = [a1 _layerBehavior];
      goto LABEL_41;
    case 3:
      id v38 = a1;
      uint64_t v18 = [v38 _layerBehavior];
      uint64_t v39 = [v38 _direction];

      unsigned int v40 = 2 * (v39 == 2);
      if (v39 == 1) {
        unsigned int v40 = 1;
      }
      if (v17) {
        uint64_t v41 = v40 | 0x10;
      }
      else {
        uint64_t v41 = v40;
      }
      v36 = [NSNumber numberWithUnsignedInt:v41];
      v37 = (void *)MEMORY[0x1E4F96060];
      goto LABEL_40;
    case 5:
      id v42 = a1;
      uint64_t v18 = [v42 _layerBehavior];
      uint64_t v43 = [v42 _style];

      if (v43 == 2) {
        unsigned int v27 = 3;
      }
      else {
        unsigned int v27 = 0;
      }
      BOOL v28 = v43 == 1;
      unsigned int v29 = 2;
      goto LABEL_34;
    case 6:
      id v25 = a1;
      uint64_t v18 = [v25 _layerBehavior];
      uint64_t v26 = [v25 _style];

      unsigned int v27 = 2 * (v26 == 2);
      BOOL v28 = v26 == 1;
      unsigned int v29 = 3;
LABEL_34:
      if (v28) {
        uint64_t v44 = v29;
      }
      else {
        uint64_t v44 = v27;
      }
      v36 = [NSNumber numberWithUnsignedInt:v44];
      v37 = (void *)MEMORY[0x1E4F96058];
      goto LABEL_40;
    case 9:
      id v30 = a1;
      uint64_t v18 = [v30 _layerBehavior];
      switch([v30 _style])
      {
        case 1:
          unsigned int v31 = 19;
          break;
        case 2:
          unsigned int v31 = 35;
          break;
        case 3:
          [v30 _angle];
          objc_msgSend(MEMORY[0x1E4F41A78], "_normalizeAngle:");
          v60 = [NSNumber numberWithDouble:v59 * 0.0174532925];
          [v13 setObject:v60 forKeyedSubscript:*MEMORY[0x1E4F960B0]];

          goto LABEL_59;
        case 4:
          BOOL v61 = v15 == 1;
          int v62 = 16;
          int v63 = 32;
          goto LABEL_62;
        case 5:
          BOOL v61 = v15 == 1;
          int v62 = 32;
          int v63 = 16;
LABEL_62:
          if (v61) {
            int v62 = v63;
          }
          unsigned int v31 = v62 | 1;
          break;
        default:
LABEL_59:
          unsigned int v31 = 0;
          break;
      }
      if (v17) {
        uint64_t v64 = v31 | 0x100;
      }
      else {
        uint64_t v64 = v31;
      }
      v65 = [NSNumber numberWithUnsignedInt:v64];
      [v13 setObject:v65 forKeyedSubscript:*MEMORY[0x1E4F960B8]];

      goto LABEL_41;
    case 10:
      id v32 = a1;
      uint64_t v18 = [v32 _layerBehavior];
      uint64_t v33 = [v32 _isClockwise];

      unsigned int v34 = 2 * (v33 == 2);
      if (v33 == 1) {
        unsigned int v34 = 1;
      }
      if (v17) {
        uint64_t v35 = v34 | 0x10;
      }
      else {
        uint64_t v35 = v34;
      }
      v36 = [NSNumber numberWithUnsignedInt:v35];
      v37 = (void *)MEMORY[0x1E4F96098];
      goto LABEL_40;
    case 12:
      id v46 = a1;
      uint64_t v18 = [v46 _layerBehavior];
      uint64_t v47 = [v46 _style];

      v36 = [NSNumber numberWithUnsignedInt:v47 == 2];
      v37 = (void *)MEMORY[0x1E4F96068];
LABEL_40:
      [v13 setObject:v36 forKeyedSubscript:*v37];

LABEL_41:
      if (v18 == 2)
      {
        uint64_t v48 = *MEMORY[0x1E4F96070];
        uint64_t v49 = MEMORY[0x1E4F1CC28];
      }
      else
      {
        if (v18 != 1) {
          goto LABEL_46;
        }
        uint64_t v48 = *MEMORY[0x1E4F96070];
        uint64_t v49 = MEMORY[0x1E4F1CC38];
      }
      [v13 setObject:v49 forKeyedSubscript:v48];
LABEL_46:
      if (objc_msgSend(a1, "ui_effectSupportsRepeat"))
      {
        if (v66)
        {
          LODWORD(v50) = 2139095040;
        }
        else
        {
          uint64_t v51 = [v9 _repeatBehavior];
          LODWORD(v50) = 1.0;
          if (v51 == 2) {
            *(float *)&double v50 = (float)objc_msgSend(v9, "_repeatCount", v50);
          }
        }
        v52 = [NSNumber numberWithFloat:v50];
        [v13 setObject:v52 forKeyedSubscript:*MEMORY[0x1E4F96080]];

        v53 = [v9 _repeatDelay];
        [v13 setObject:v53 forKeyedSubscript:*MEMORY[0x1E4F96088]];
      }
      [v9 _speed];
      v55 = objc_msgSend(NSNumber, "numberWithDouble:", fmax(fmin(v54, 2.0), 0.5));
      [v13 setObject:v55 forKeyedSubscript:*MEMORY[0x1E4F960A0]];

      if (v10)
      {
        v56 = _Block_copy(v10);
        [v13 setObject:v56 forKeyedSubscript:*MEMORY[0x1E4F96078]];
      }
      v57 = objc_opt_new();
      [v57 setAnimation:v12];
      [v57 setOptions:v13];

      return v57;
    default:
      v45 = [MEMORY[0x1E4F28B00] currentHandler];
      [v45 handleFailureInMethod:a2 object:a1 file:@"NSSymbolEffect+UIKitAdditions.m" lineNumber:333 description:@"Unsupported effect type added to image view"];

      goto LABEL_46;
  }
}

- (uint64_t)ui_effectSupportsRepeat
{
  unint64_t v1 = [a1 _effectType];
  return (v1 < 0xD) & (0x160Eu >> v1);
}

- (BOOL)ui_effectPrefersIndefiniteBehaviorOverDiscreteBehavior
{
  return (unint64_t)([a1 _effectType] - 1) < 2;
}

@end