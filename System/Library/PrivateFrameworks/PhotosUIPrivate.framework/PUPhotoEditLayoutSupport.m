@interface PUPhotoEditLayoutSupport
+ (BOOL)doneCancelButtonsInNotchAreaForLayoutOrientation:(int64_t)a3 viewWidth:(double)a4;
+ (BOOL)isNotchedPhone;
+ (BOOL)isPhoneClassDevice;
+ (double)topToolbarVerticalOffsetForLayoutOrientation:(int64_t)a3 view:(id)a4;
+ (id)constraintsForNotchAreaButtonsLeading:(id)a3 trailing:(id)a4 inWindow:(id)a5;
+ (id)layoutConstraintsForHidingSecondaryView:(id)a3 layoutOrientation:(int64_t)a4;
+ (id)layoutConstraintsForHidingView:(id)a3 layoutOrientation:(int64_t)a4;
+ (int)productType;
+ (void)currentDeviceButtonSize:(CGSize *)a3 offset:(UIOffset *)a4 zoomedSize:(CGSize *)a5 zoomedOffset:(UIOffset *)a6 normalScreenWidth:(double *)a7;
+ (void)getTopLeadingButtonFrame:(CGRect *)a3 topTrailingButtonFrame:(CGRect *)a4 inBounds:(CGRect)a5 inRTL:(BOOL)a6;
+ (void)transitionFromBarView:(id)a3 orientation:(int64_t)a4 toBarView:(id)a5 orientation:(int64_t)a6 coordinator:(id)a7 completionHandler:(id)a8;
@end

@implementation PUPhotoEditLayoutSupport

+ (void)currentDeviceButtonSize:(CGSize *)a3 offset:(UIOffset *)a4 zoomedSize:(CGSize *)a5 zoomedOffset:(UIOffset *)a6 normalScreenWidth:(double *)a7
{
  CGFloat v13 = 26.0;
  double v14 = 16.0;
  double v15 = 16.0;
  CGFloat v16 = 10.0;
  CGFloat v17 = 10.0;
  CGFloat v18 = 60.0;
  double v19 = 375.0;
  uint64_t v20 = MGGetProductType();
  if (v20 <= 2159747552)
  {
    if (v20 <= 1169082143)
    {
      if (v20 > 689804741)
      {
        if (v20 <= 910181309)
        {
          if (v20 != 689804742)
          {
            uint64_t v21 = 851437781;
            goto LABEL_46;
          }
          goto LABEL_36;
        }
        if (v20 != 910181310)
        {
          if (v20 != 1060988941) {
            goto LABEL_73;
          }
          double v15 = 19.0;
          double v14 = 25.0;
          CGFloat v17 = 18.0;
          CGFloat v16 = 16.0;
          double v22 = 64.0;
          uint64_t v25 = 0x404E000000000000;
          goto LABEL_72;
        }
LABEL_53:
        CGFloat v16 = 16.0;
        double v14 = 28.0;
        CGFloat v18 = 60.0;
        double v19 = 414.0;
        CGFloat v17 = 16.0;
        goto LABEL_54;
      }
      if (v20 != 133314240)
      {
        if (v20 != 330877086)
        {
          uint64_t v24 = 574536383;
          goto LABEL_27;
        }
LABEL_37:
        double v23 = 28.0;
        CGFloat v13 = 27.0;
        CGFloat v17 = 12.0;
        CGFloat v18 = 68.0;
        double v14 = 50.0;
        CGFloat v16 = 40.0;
        double v19 = 428.0;
        goto LABEL_38;
      }
LABEL_47:
      CGFloat v13 = 28.0;
      CGFloat v16 = 25.0;
      CGFloat v18 = 66.0;
      double v14 = 37.0;
      double v19 = 390.0;
      goto LABEL_48;
    }
    if (v20 > 1434404432)
    {
      if (v20 <= 2032616840)
      {
        if (v20 != 1434404433)
        {
          if (v20 != 2021146989) {
            goto LABEL_73;
          }
          goto LABEL_40;
        }
LABEL_36:
        CGFloat v16 = 18.0;
        double v14 = 30.0;
        CGFloat v17 = 16.0;
        CGFloat v18 = 60.0;
        double v19 = 390.0;
        double v15 = 18.0;
LABEL_54:
        double v22 = 60.0;
LABEL_55:
        double v23 = 26.0;
        goto LABEL_56;
      }
      if (v20 == 2032616841) {
        goto LABEL_53;
      }
      if (v20 != 2078329141) {
        goto LABEL_73;
      }
LABEL_52:
      CGFloat v17 = 6.0;
      CGFloat v18 = 60.0;
      double v14 = 10.0;
      double v15 = 6.0;
      goto LABEL_54;
    }
    if (v20 != 1169082144)
    {
      if (v20 != 1234705395)
      {
        double v22 = 60.0;
        double v23 = 26.0;
        if (v20 != 1371389549) {
          goto LABEL_73;
        }
LABEL_56:
        if (!a3) {
          goto LABEL_58;
        }
        goto LABEL_57;
      }
      goto LABEL_53;
    }
LABEL_40:
    double v15 = 18.0;
    double v14 = 20.0;
    CGFloat v17 = 16.0;
    CGFloat v16 = 13.0;
    CGFloat v18 = 60.0;
    double v19 = 390.0;
    goto LABEL_54;
  }
  if (v20 > 2941181570)
  {
    if (v20 > 3743999267)
    {
      if (v20 > 3885279869)
      {
        if (v20 == 3885279870)
        {
          double v15 = 19.0;
          double v14 = 14.0;
          double v22 = 58.0;
          uint64_t v25 = 0x404A000000000000;
LABEL_72:
          CGFloat v18 = *(double *)&v25;
          goto LABEL_55;
        }
        if (v20 != 4201643249) {
          goto LABEL_73;
        }
        double v23 = 28.0;
        CGFloat v17 = 20.0;
        double v14 = 30.0;
        CGFloat v16 = 22.0;
        CGFloat v18 = 66.0;
        double v19 = 428.0;
        double v15 = 20.0;
LABEL_38:
        double v22 = v18;
        if (!a3) {
          goto LABEL_58;
        }
        goto LABEL_57;
      }
      double v22 = 60.0;
      double v23 = 26.0;
      if (v20 == 3743999268) {
        goto LABEL_56;
      }
      uint64_t v24 = 3825599860;
      goto LABEL_27;
    }
    if (v20 == 2941181571) {
      goto LABEL_37;
    }
    if (v20 != 3001488778)
    {
      if (v20 != 3585085679) {
        goto LABEL_73;
      }
      goto LABEL_36;
    }
    goto LABEL_40;
  }
  if (v20 <= 2722529671)
  {
    if (v20 != 2159747553)
    {
      if (v20 == 2309863438)
      {
        CGFloat v16 = 28.0;
        double v15 = 23.0;
        CGFloat v17 = 20.0;
        CGFloat v18 = 68.0;
        double v14 = 42.0;
        double v19 = 428.0;
        CGFloat v13 = 28.0;
LABEL_48:
        double v22 = v18;
        double v23 = 28.0;
        if (!a3) {
          goto LABEL_58;
        }
LABEL_57:
        a3->width = v22;
        a3->height = v23;
        goto LABEL_58;
      }
      uint64_t v24 = 2688879999;
LABEL_27:
      if (v20 != v24) {
        goto LABEL_73;
      }
      goto LABEL_37;
    }
    goto LABEL_52;
  }
  if (v20 > 2795618602)
  {
    if (v20 == 2795618603) {
      goto LABEL_47;
    }
    uint64_t v21 = 2940697645;
  }
  else
  {
    if (v20 == 2722529672) {
      goto LABEL_53;
    }
    uint64_t v21 = 2793418701;
  }
LABEL_46:
  if (v20 == v21) {
    goto LABEL_47;
  }
LABEL_73:
  int v26 = [a1 isPhoneClassDevice];
  if (v26) {
    double v15 = 19.0;
  }
  else {
    double v15 = 22.0;
  }
  if (v26) {
    double v14 = 14.0;
  }
  else {
    double v14 = 16.0;
  }
  double v23 = 28.0;
  if (v26) {
    double v23 = 26.0;
  }
  double v22 = 68.0;
  if (v26) {
    double v22 = 58.0;
  }
  CGFloat v16 = 0.0;
  double v19 = 1.0;
  CGFloat v17 = 0.0;
  CGFloat v18 = 0.0;
  CGFloat v13 = 0.0;
  if (a3) {
    goto LABEL_57;
  }
LABEL_58:
  if (a4)
  {
    a4->horizontal = v14;
    a4->vertical = v15;
  }
  if (a5)
  {
    a5->width = v18;
    a5->height = v13;
  }
  if (a6)
  {
    a6->horizontal = v16;
    a6->vertical = v17;
  }
  if (a7) {
    *a7 = v19;
  }
}

+ (void)getTopLeadingButtonFrame:(CGRect *)a3 topTrailingButtonFrame:(CGRect *)a4 inBounds:(CGRect)a5 inRTL:(BOOL)a6
{
  BOOL v6 = a6;
  CGFloat height = a5.size.height;
  double width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  long long v13 = *MEMORY[0x1E4FB2E10];
  long long v29 = *MEMORY[0x1E4F1DB30];
  long long v30 = v13;
  double v28 = 0.0;
  long long v26 = v29;
  long long v27 = v13;
  [a1 currentDeviceButtonSize:&v29 offset:&v30 zoomedSize:&v26 zoomedOffset:&v27 normalScreenWidth:&v28];
  v31.origin.CGFloat x = x;
  v31.origin.CGFloat y = y;
  v31.size.double width = width;
  v31.size.CGFloat height = height;
  if (!CGRectIsEmpty(v31) && width < v28)
  {
    long long v29 = v26;
    long long v30 = v27;
  }
  if (a3)
  {
    PXRectWithSize();
    a3->origin.CGFloat x = v14;
    a3->origin.CGFloat y = v15;
    a3->size.double width = v16;
    a3->size.CGFloat height = v17;
    v32.origin.CGFloat x = x;
    v32.origin.CGFloat y = y;
    v32.size.double width = width;
    v32.size.CGFloat height = height;
    a3->origin.CGFloat y = CGRectGetMinY(v32) + *((double *)&v30 + 1);
  }
  if (a4)
  {
    PXRectWithSize();
    a4->origin.CGFloat x = v18;
    a4->origin.CGFloat y = v19;
    a4->size.double width = v20;
    a4->size.CGFloat height = v21;
    if (a3)
    {
      double v22 = a3->origin.y;
    }
    else
    {
      v33.origin.CGFloat x = x;
      v33.origin.CGFloat y = y;
      v33.size.double width = width;
      v33.size.CGFloat height = height;
      double v22 = CGRectGetMinX(v33) + *((double *)&v30 + 1);
    }
    a4->origin.CGFloat y = v22;
  }
  BOOL v23 = !v6;
  if (v6) {
    uint64_t v24 = a4;
  }
  else {
    uint64_t v24 = a3;
  }
  if (!v23) {
    a4 = a3;
  }
  if (a4)
  {
    v34.origin.CGFloat x = x;
    v34.origin.CGFloat y = y;
    v34.size.double width = width;
    v34.size.CGFloat height = height;
    double MaxX = CGRectGetMaxX(v34);
    a4->origin.CGFloat x = MaxX - CGRectGetWidth(*a4) - *(double *)&v30;
  }
  if (v24)
  {
    v35.origin.CGFloat x = x;
    v35.origin.CGFloat y = y;
    v35.size.double width = width;
    v35.size.CGFloat height = height;
    v24->origin.CGFloat x = CGRectGetMinX(v35) + *(double *)&v30;
  }
}

+ (double)topToolbarVerticalOffsetForLayoutOrientation:(int64_t)a3 view:(id)a4
{
  id v6 = a4;
  uint64_t v7 = MGGetProductType();
  BOOL v9 = v7 == 2078329141 || v7 == 2159747553;
  if (a3 == 1 && v9)
  {
    double v10 = 66.0;
  }
  else
  {
    BOOL v11 = +[PUPhotoEditLayoutSupport isPhoneClassDevice];
    if (a3 != 1 || v11)
    {
      BOOL v13 = +[PUPhotoEditLayoutSupport isPhoneClassDevice];
      double v10 = 0.0;
      if (a3 == 1 && v13)
      {
        [v6 safeAreaInsets];
        double v10 = fmin(fmax(59.0 - v14, 0.0), 12.0);
      }
    }
    else
    {
      [v6 bounds];
      if ([a1 doneCancelButtonsInNotchAreaForLayoutOrientation:1 viewWidth:v12]) {
        double v10 = 46.0;
      }
      else {
        double v10 = 0.0;
      }
    }
  }

  return v10;
}

+ (id)constraintsForNotchAreaButtonsLeading:(id)a3 trailing:(id)a4 inWindow:(id)a5
{
  v49[8] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  memset(&v48, 0, sizeof(v48));
  memset(&v47, 0, sizeof(v47));
  double v10 = (void *)MEMORY[0x1E4FB1BA8];
  id v11 = a5;
  double v12 = [v10 mainScreen];
  BOOL v13 = [v12 traitCollection];

  uint64_t v14 = [v13 layoutDirection];
  CGFloat v15 = [v11 screen];
  [v15 bounds];
  double v17 = v16;

  CGFloat v18 = [v11 screen];

  [v18 bounds];
  objc_msgSend(a1, "getTopLeadingButtonFrame:topTrailingButtonFrame:inBounds:inRTL:", &v48, &v47, v14 == 1);

  CGFloat v19 = [v8 superview];
  if (v19)
  {
    CGRect v20 = v48;
    v45 = v13;
    if (v14 == 1)
    {
      double v21 = v17 - CGRectGetMaxX(v20);
      double MinX = CGRectGetMinX(v47);
    }
    else
    {
      double v21 = CGRectGetMinX(v20);
      double MinX = v17 - CGRectGetMaxX(v47);
    }
    v44 = [v8 widthAnchor];
    v43 = [v44 constraintEqualToConstant:v48.size.width];
    v49[0] = v43;
    v42 = [v8 heightAnchor];
    v41 = [v42 constraintEqualToConstant:v48.size.height];
    v49[1] = v41;
    v40 = [v8 leadingAnchor];
    v39 = [v19 leadingAnchor];
    v38 = [v40 constraintEqualToAnchor:v39 constant:v21];
    v49[2] = v38;
    v37 = [v8 topAnchor];
    v36 = [v19 topAnchor];
    CGRect v35 = [v37 constraintEqualToAnchor:v36 constant:v48.origin.y];
    v49[3] = v35;
    CGRect v34 = [v9 widthAnchor];
    CGRect v33 = [v34 constraintEqualToConstant:v47.size.width];
    v49[4] = v33;
    CGRect v32 = [v9 heightAnchor];
    BOOL v23 = [v32 constraintEqualToConstant:v47.size.height];
    v49[5] = v23;
    uint64_t v24 = [v9 trailingAnchor];
    uint64_t v25 = [v19 trailingAnchor];
    long long v26 = [v24 constraintEqualToAnchor:v25 constant:-MinX];
    v49[6] = v26;
    long long v27 = [v9 topAnchor];
    [v19 topAnchor];
    v29 = id v28 = v9;
    long long v30 = [v27 constraintEqualToAnchor:v29 constant:v47.origin.y];
    v49[7] = v30;
    id v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:8];

    id v9 = v28;
    BOOL v13 = v45;
  }
  else
  {
    id v46 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v46;
}

+ (BOOL)doneCancelButtonsInNotchAreaForLayoutOrientation:(int64_t)a3 viewWidth:(double)a4
{
  BOOL v6 = +[PUPhotoEditLayoutSupport isPhoneClassDevice];
  BOOL v7 = a4 < 510.0 || v6;
  return a3 != 2 && v7;
}

+ (BOOL)isNotchedPhone
{
  int v3 = [a1 isPhoneClassDevice];
  if (v3)
  {
    uint64_t v4 = [a1 productType];
    LOBYTE(v3) = v4 != 2078329141 && v4 != 2159747553;
  }
  return v3;
}

+ (BOOL)isPhoneClassDevice
{
  if (isPhoneClassDevice_onceToken != -1) {
    dispatch_once(&isPhoneClassDevice_onceToken, &__block_literal_global_9);
  }
  return isPhoneClassDevice_isiPhoneClass;
}

void __46__PUPhotoEditLayoutSupport_isPhoneClassDevice__block_invoke()
{
  v0 = (const void *)MGCopyAnswer();
  isPhoneClassDevice_isiPhoneClass = CFEqual(v0, @"iPhone") != 0;
  if (v0)
  {
    CFRelease(v0);
  }
}

+ (int)productType
{
  if (productType_onceToken != -1) {
    dispatch_once(&productType_onceToken, &__block_literal_global_56649);
  }
  return productType_productType;
}

uint64_t __39__PUPhotoEditLayoutSupport_productType__block_invoke()
{
  uint64_t result = MGGetProductType();
  productType_productType = result;
  return result;
}

+ (void)transitionFromBarView:(id)a3 orientation:(int64_t)a4 toBarView:(id)a5 orientation:(int64_t)a6 coordinator:(id)a7 completionHandler:(id)a8
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a8;
  id v17 = a7;
  CGFloat v18 = +[PUPhotoEditLayoutSupport layoutConstraintsForHidingView:v14 layoutOrientation:a4];
  CGFloat v19 = +[PUPhotoEditLayoutSupport layoutConstraintsForHidingView:v15 layoutOrientation:a6];
  CGRect v20 = [v14 superview];
  if (!v20)
  {
    long long v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2 object:a1 file:@"PUPhotoEditLayoutSupport.m" lineNumber:60 description:@"The view must have a superview"];
  }
  [v20 addConstraint:v19];
  [v15 setAlpha:0.0];
  [v20 layoutIfNeeded];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __114__PUPhotoEditLayoutSupport_transitionFromBarView_orientation_toBarView_orientation_coordinator_completionHandler___block_invoke;
  v31[3] = &unk_1E5F28D48;
  id v32 = v20;
  id v33 = v18;
  id v34 = v19;
  id v35 = v14;
  id v36 = v15;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __114__PUPhotoEditLayoutSupport_transitionFromBarView_orientation_toBarView_orientation_coordinator_completionHandler___block_invoke_2;
  v29[3] = &unk_1E5F28AC0;
  id v30 = v16;
  id v21 = v16;
  id v22 = v15;
  id v23 = v14;
  id v24 = v19;
  id v25 = v18;
  id v26 = v20;
  [v17 animateAlongsideTransition:v31 completion:v29];
}

uint64_t __114__PUPhotoEditLayoutSupport_transitionFromBarView_orientation_toBarView_orientation_coordinator_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) addConstraint:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) removeConstraint:*(void *)(a1 + 48)];
  [*(id *)(a1 + 56) setAlpha:0.0];
  [*(id *)(a1 + 64) setAlpha:1.0];
  v2 = *(void **)(a1 + 32);
  return [v2 layoutIfNeeded];
}

uint64_t __114__PUPhotoEditLayoutSupport_transitionFromBarView_orientation_toBarView_orientation_coordinator_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

+ (id)layoutConstraintsForHidingSecondaryView:(id)a3 layoutOrientation:(int64_t)a4
{
  id v6 = a3;
  BOOL v7 = [v6 superview];
  if (!v7)
  {
    double v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:a1 file:@"PUPhotoEditLayoutSupport.m" lineNumber:45 description:@"The view must have a superview"];
  }
  id v8 = [MEMORY[0x1E4F28DC8] constraintWithItem:v6 attribute:4 relatedBy:0 toItem:v7 attribute:3 multiplier:1.0 constant:0.0];

  return v8;
}

+ (id)layoutConstraintsForHidingView:(id)a3 layoutOrientation:(int64_t)a4
{
  id v7 = a3;
  id v8 = [v7 superview];
  if (!v8)
  {
    id v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2 object:a1 file:@"PUPhotoEditLayoutSupport.m" lineNumber:22 description:@"The view must have a superview"];
  }
  if (a4 == 2)
  {
    id v9 = (void *)MEMORY[0x1E4F28DC8];
    double v10 = 1.0;
    id v11 = v7;
    uint64_t v12 = 1;
    BOOL v13 = v8;
    uint64_t v14 = 2;
    goto LABEL_7;
  }
  if (a4 == 1)
  {
    id v9 = (void *)MEMORY[0x1E4F28DC8];
    double v10 = 1.0;
    id v11 = v7;
    uint64_t v12 = 3;
    BOOL v13 = v8;
    uint64_t v14 = 4;
LABEL_7:
    id v15 = [v9 constraintWithItem:v11 attribute:v12 relatedBy:0 toItem:v13 attribute:v14 multiplier:v10 constant:0.0];
    goto LABEL_9;
  }
  id v15 = 0;
LABEL_9:

  return v15;
}

@end