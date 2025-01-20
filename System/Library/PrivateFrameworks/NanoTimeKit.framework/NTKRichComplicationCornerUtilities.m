@interface NTKRichComplicationCornerUtilities
+ (CGAffineTransform)transformForState:(SEL)a3 position:(int64_t)a4 device:(int64_t)a5;
+ (CGSize)viewSizeForDevice:(id)a3;
+ (UIEdgeInsets)_keylinePaddingForPosition:(int64_t)a3 conentSize:(CGSize)a4 forDevice:(id)a5 narrowTopSlots:(BOOL)a6;
+ (id)keylineImageForPosition:(int64_t)a3 filled:(BOOL)a4 forDevice:(id)a5 narrowTopSlots:(BOOL)a6;
+ (id)keylineViewForPosition:(int64_t)a3 forDevice:(id)a4 narrowTopSlots:(BOOL)a5;
+ (id)layoutRuleForState:(int64_t)a3 position:(int64_t)a4 faceBounds:(CGRect)a5 forDevice:(id)a6 narrowTopSlots:(BOOL)a7;
+ (id)viewWithLegacyComplicationType:(unint64_t)a3;
+ (void)updateCustomDataAnimationFromEarlierView:(id)a3 laterView:(id)a4 isForward:(BOOL)a5 animationType:(unint64_t)a6 animationDuration:(double)a7 animationFraction:(float)a8;
@end

@implementation NTKRichComplicationCornerUtilities

+ (CGSize)viewSizeForDevice:(id)a3
{
}

+ (id)layoutRuleForState:(int64_t)a3 position:(int64_t)a4 faceBounds:(CGRect)a5 forDevice:(id)a6 narrowTopSlots:(BOOL)a7
{
  id v7 = a6;
  CDCornerComplicationSize();
}

+ (CGAffineTransform)transformForState:(SEL)a3 position:(int64_t)a4 device:(int64_t)a5
{
  id v9 = a6;
  v10 = v9;
  if ((a4 & 0xFFFFFFFFFFFFFFFELL) != 2)
  {
    uint64_t v15 = MEMORY[0x1E4F1DAB8];
    long long v16 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&retstr->a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&retstr->c = v16;
    long long v17 = *(_OWORD *)(v15 + 32);
    goto LABEL_14;
  }
  id v11 = v9;
  os_unfair_lock_lock((os_unfair_lock_t)&_LayoutConstants___lock_33);
  id WeakRetained = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_33);
  if (!WeakRetained) {
    goto LABEL_7;
  }
  v13 = WeakRetained;
  id v14 = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_33);
  if (v14 != v11)
  {

LABEL_7:
    id v20 = objc_storeWeak(&_LayoutConstants___cachedDevice_33, v11);
    _LayoutConstants___previousCLKDeviceVersion_33 = [v11 version];

    ___LayoutConstants_block_invoke_30(v21, v11);
    goto LABEL_8;
  }
  uint64_t v18 = [v11 version];
  uint64_t v19 = _LayoutConstants___previousCLKDeviceVersion_33;

  if (v18 != v19) {
    goto LABEL_7;
  }
LABEL_8:
  os_unfair_lock_unlock((os_unfair_lock_t)&_LayoutConstants___lock_33);
  double v22 = *(double *)&_LayoutConstants___constants_1_4;
  double v23 = *(double *)&_LayoutConstants___constants_2_4;

  switch(a5)
  {
    case 0:
      double v22 = -v22;
      goto LABEL_10;
    case 1:
LABEL_10:
      double v23 = -v23;
      break;
    case 2:
      double v22 = -v22;
      break;
    case 3:
      break;
    default:
      double v22 = *MEMORY[0x1E4F1DAD8];
      double v23 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
      break;
  }
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  CGAffineTransformMakeScale(retstr, 0.8, 0.8);
  long long v24 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v27.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v27.c = v24;
  *(_OWORD *)&v27.tx = *(_OWORD *)&retstr->tx;
  CGAffineTransformTranslate(&v28, &v27, v22, v23);
  long long v25 = *(_OWORD *)&v28.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v28.a;
  *(_OWORD *)&retstr->c = v25;
  long long v17 = *(_OWORD *)&v28.tx;
LABEL_14:
  *(_OWORD *)&retstr->tx = v17;

  return result;
}

+ (id)keylineImageForPosition:(int64_t)a3 filled:(BOOL)a4 forDevice:(id)a5 narrowTopSlots:(BOOL)a6
{
  id v6 = a5;
  CDCornerComplicationSize();
}

+ (id)keylineViewForPosition:(int64_t)a3 forDevice:(id)a4 narrowTopSlots:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = [a1 keylineImageForPosition:a3 filled:0 forDevice:v8 narrowTopSlots:v5];
  v10 = v9;
  if (v9)
  {
    id v11 = NTKKeylineViewWithImage(v9);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __86__NTKRichComplicationCornerUtilities_keylineViewForPosition_forDevice_narrowTopSlots___block_invoke;
    v14[3] = &unk_1E62C4DA8;
    id v16 = a1;
    int64_t v17 = a3;
    id v15 = v8;
    v12 = +[NTKKeylineTouchable touchableWithHandler:v14];
    [v11 setTouchable:v12];
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

uint64_t __86__NTKRichComplicationCornerUtilities_keylineViewForPosition_forDevice_narrowTopSlots___block_invoke(uint64_t a1, void *a2, CGFloat a3, CGFloat a4)
{
  id v7 = a2;
  id v8 = objc_opt_class();
  [v7 bounds];
  id v9 = objc_msgSend(v8, "hitTestPathWithViewBounds:position:forDevice:", *(void *)(a1 + 48), *(void *)(a1 + 32));
  [v7 bounds];
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;

  v21.origin.x = v11;
  v21.origin.y = v13;
  v21.size.width = v15;
  v21.size.height = v17;
  v20.x = a3;
  v20.y = a4;
  if (CGRectContainsPoint(v21, v20)) {
    uint64_t v18 = objc_msgSend(v9, "containsPoint:", a3, a4);
  }
  else {
    uint64_t v18 = 0;
  }

  return v18;
}

+ (void)updateCustomDataAnimationFromEarlierView:(id)a3 laterView:(id)a4 isForward:(BOOL)a5 animationType:(unint64_t)a6 animationDuration:(double)a7 animationFraction:(float)a8
{
  BOOL v9 = a5;
  id v11 = a3;
  id v12 = a4;
  memset(&v31, 0, sizeof(v31));
  if (a6 == 1)
  {
    long long v16 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v31.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v31.c = v16;
    *(_OWORD *)&v31.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    if (v9)
    {
LABEL_5:
      CGFloat v13 = (CGAffineTransform *)MEMORY[0x1E4F1DAB8];
      long long v14 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      *(_OWORD *)&v30.a = *MEMORY[0x1E4F1DAB8];
      *(_OWORD *)&v30.c = v14;
      *(_OWORD *)&v30.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      CGAffineTransform v29 = v31;
      CGAffineTransform v28 = v31;
      CGFloat v15 = v12;
      goto LABEL_8;
    }
  }
  else
  {
    if (!a6) {
      CGAffineTransformMakeScale(&v31, 0.9, 0.9);
    }
    if (v9) {
      goto LABEL_5;
    }
  }
  CGAffineTransform v30 = v31;
  long long v17 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&v29.a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&v29.c = v17;
  *(_OWORD *)&v29.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  *(_OWORD *)&v28.a = *(_OWORD *)&v29.a;
  *(_OWORD *)&v28.c = v17;
  *(_OWORD *)&v28.tx = *(_OWORD *)&v29.tx;
  CGFloat v13 = &v31;
  CGFloat v15 = v11;
LABEL_8:
  long long v18 = *(_OWORD *)&v13->c;
  *(_OWORD *)&v27.a = *(_OWORD *)&v13->a;
  *(_OWORD *)&v27.c = v18;
  *(_OWORD *)&v27.tx = *(_OWORD *)&v13->tx;
  id v19 = v15;
  if (a6 == 1) {
    CDTemplicateComplicationShouldPerformFullFade();
  }
  CLKCompressFraction();
  CLKCompressFraction();
  CLKInterpolateBetweenFloatsClipped();
  objc_msgSend(v11, "setAlpha:");
  CGAffineTransform v23 = v30;
  CGAffineTransform v22 = v28;
  CLKInterpolateBetweenTransform();
  v21[0] = v24;
  v21[1] = v25;
  v21[2] = v26;
  [v11 setTransform:v21];
  CLKInterpolateBetweenFloatsClipped();
  objc_msgSend(v12, "setAlpha:");
  CGAffineTransform v23 = v29;
  CGAffineTransform v22 = v27;
  CLKInterpolateBetweenTransform();
  v20[0] = v20[3];
  v20[1] = v20[4];
  v20[2] = v20[5];
  [v12 setTransform:v20];
}

+ (UIEdgeInsets)_keylinePaddingForPosition:(int64_t)a3 conentSize:(CGSize)a4 forDevice:(id)a5 narrowTopSlots:(BOOL)a6
{
  double height = a4.height;
  double width = a4.width;
  BOOL v9 = [a1 keylineImageForPosition:a3 filled:0 forDevice:a5 narrowTopSlots:a6];
  [v9 size];
  double v11 = v10;
  double v13 = v12;

  switch(a3)
  {
    case 0:
      double v16 = v13 - height;
      double v17 = v11 - width;
      double v14 = 0.0;
      double v15 = 0.0;
      break;
    case 1:
      double v15 = v11 - width;
      double v16 = v13 - height;
      double v14 = 0.0;
      goto LABEL_6;
    case 2:
      double v14 = v13 - height;
      double v17 = v11 - width;
      double v15 = 0.0;
      double v16 = 0.0;
      break;
    case 3:
      double v14 = v13 - height;
      double v15 = v11 - width;
      double v16 = 0.0;
LABEL_6:
      double v17 = 0.0;
      break;
    default:
      break;
  }
  result.right = v17;
  result.bottom = v16;
  result.left = v15;
  result.top = v14;
  return result;
}

+ (id)viewWithLegacyComplicationType:(unint64_t)a3
{
  if (a3)
  {
    BOOL v5 = 0;
  }
  else
  {
    BOOL v5 = objc_msgSend(objc_alloc((Class)off_1E62BD618), "initWithFontFallback:", 0, v3);
  }
  return v5;
}

@end