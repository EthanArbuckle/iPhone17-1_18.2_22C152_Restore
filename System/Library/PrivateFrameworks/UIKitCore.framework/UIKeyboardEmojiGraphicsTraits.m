@interface UIKeyboardEmojiGraphicsTraits
+ (UIKeyboardEmojiGraphicsTraits)emojiGraphicsTraitsWithScreenTraits:(id)a3;
+ (id)emojiGraphicsTraitsForCurrentScreenTraits;
- (CGSize)fakeEmojiKeySize;
- (UIKeyboardEmojiGraphicsTraits)initWithScreenTrait:(id)a3;
- (double)alertTextWidth;
- (double)bottomPadding;
- (double)categoryHeaderBottomInset;
- (double)categoryHeaderFontSize;
- (double)categoryHeaderHeight;
- (double)categoryHeaderLeftPadding;
- (double)categorySelectedCirWidth;
- (double)columnOffset;
- (double)emojiKeyWidth;
- (double)inputViewLeftMostPadding;
- (double)inputViewRightMostPadding;
- (double)minimumInteritemSpacing;
- (double)minimumLineSpacing;
- (double)rightBiasPercentage;
- (double)screenToNativeScaleRatio;
- (double)scrollSnapOffset;
- (double)sectionOffset;
- (double)topPadding;
- (int64_t)prepolulatedRecentCount;
@end

@implementation UIKeyboardEmojiGraphicsTraits

- (UIKeyboardEmojiGraphicsTraits)initWithScreenTrait:(id)a3
{
  id v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)UIKeyboardEmojiGraphicsTraits;
  v5 = [(UIKeyboardEmojiGraphicsTraits *)&v37 init];
  v6 = v5;
  if (v5)
  {
    if (v4)
    {
      BOOL v7 = *((unsigned char *)v4 + 35) != 0;
    }
    else
    {
      BOOL v7 = 0;
      v5->_scrollSnapOffset = 0.0;
      *(_OWORD *)&v5->_prepolulatedRecentCount = 0u;
      *(_OWORD *)&v5->_inputViewRightMostPadding = 0u;
      *(_OWORD *)&v5->_categoryHeaderHeight = 0u;
      *(_OWORD *)&v5->_categorySelectedCirWidth = 0u;
      *(_OWORD *)&v5->_minimumInteritemSpacing = 0u;
      *(_OWORD *)&v5->_sectionOffset = 0u;
      *(_OWORD *)&v5->_emojiKeyWidth = 0u;
      v5->_fakeEmojiKeySize.width = 0.0;
      v5->_fakeEmojiKeySize.height = 0.0;
      v5->_alertTextWidth = 0.0;
    }
    v5->_isFirstPartyStickers = v7;
    [v4 screenToNativeScaleRatio];
    v6->_screenToNativeScaleRatio = v8;
    int IsStickerPickerService = _UIApplicationIsStickerPickerService();
    if (+[UIKeyboardImpl isSplit])
    {
      *(_OWORD *)&v6->_emojiKeyWidth = xmmword_186B9A4E0;
      *(_OWORD *)&v6->_minimumInteritemSpacing = xmmword_186B9A6D0;
      *(_OWORD *)&v6->_sectionOffset = xmmword_186B9A450;
      *(_OWORD *)&v6->_categoryHeaderHeight = xmmword_186B9A6E0;
      v6->_fakeEmojiKeySize.height = 42.0;
      *(_OWORD *)&v6->_categorySelectedCirWidth = xmmword_186B9A6F0;
      v6->_prepolulatedRecentCount = 30;
      *(_OWORD *)&v6->_inputViewLeftMostPadding = xmmword_186B9A6C0;
      long long v11 = xmmword_186B9A700;
LABEL_7:
      *(_OWORD *)&v6->_alertTextWidth = v11;
      long long v12 = xmmword_186B9A500;
LABEL_51:
      *(_OWORD *)&v6->_rightBiasPercentage = v12;
      goto LABEL_52;
    }
    if (IsStickerPickerService) {
      double v13 = 38.0;
    }
    else {
      double v13 = 32.0;
    }
    if (v6->_isFirstPartyStickers) {
      uint64_t v14 = 15;
    }
    else {
      uint64_t v14 = 24;
    }
    if (v6->_isFirstPartyStickers) {
      double v15 = 20.0;
    }
    else {
      double v15 = 10.0;
    }
    double v16 = 48.0;
    if (!v6->_isFirstPartyStickers) {
      double v16 = v13;
    }
    objc_msgSend(v4, "keyboardWidth", *(void *)&v16, v10);
    double v18 = v17;
    if (v4 && *((unsigned char *)v4 + 38)) {
      double v18 = *((double *)v4 + 12);
    }
    if ([v4 isKeyboardMinorEdgeWidth])
    {
      if (v18 < 1024.0)
      {
        if (v18 < 768.0)
        {
          if (v18 >= 414.0)
          {
            v6->_emojiKeyWidth = v13;
            *(_OWORD *)&v6->_minimumLineSpacing = xmmword_186B9A5F0;
            *(_OWORD *)&v6->_columnOffset = xmmword_186B9A600;
            *(_OWORD *)&v6->_bottomPadding = xmmword_186B9A610;
            *(_OWORD *)&v6->_categoryHeaderLeftPadding = xmmword_186B9A620;
            double v29 = 40.0;
            double v30 = 46.0;
            if (IsStickerPickerService)
            {
              double v29 = 46.0;
              double v30 = 52.0;
            }
            v6->_fakeEmojiKeySize.width = v29;
            v6->_fakeEmojiKeySize.height = v30;
            v6->_categoryHeaderFontSize = 13.0;
            v6->_prepolulatedRecentCount = 30;
            *(_OWORD *)&v6->_inputViewLeftMostPadding = xmmword_186B9A630;
            v6->_alertTextWidth = 280.0;
            *(_OWORD *)&v6->_rightBiasPercentage = xmmword_186B999C0;
          }
          else
          {
            if (v18 < 375.0)
            {
              if (v18 >= 360.0)
              {
                v6->_emojiKeyWidth = v13;
                *(_OWORD *)&v6->_minimumLineSpacing = xmmword_186B9A650;
                *(_OWORD *)&v6->_columnOffset = xmmword_186B9A660;
                *(_OWORD *)&v6->_bottomPadding = xmmword_186B9A670;
                *(_OWORD *)&v6->_categoryHeaderLeftPadding = xmmword_186B9A620;
                double v34 = 38.0;
                double v35 = 44.0;
                if (IsStickerPickerService)
                {
                  double v34 = 44.0;
                  double v35 = 50.0;
                }
                v6->_fakeEmojiKeySize.width = v34;
                v6->_fakeEmojiKeySize.height = v35;
                v6->_categoryHeaderFontSize = 12.0;
                v6->_prepolulatedRecentCount = 30;
                long long v21 = xmmword_186B9A680;
LABEL_70:
                *(_OWORD *)&v6->_inputViewLeftMostPadding = v21;
                v6->_alertTextWidth = 280.0;
                *(_OWORD *)&v6->_rightBiasPercentage = xmmword_186B9A500;
                if (![v4 isEmojiScrollingDirectionVertical]) {
                  goto LABEL_52;
                }
                v6->_fakeEmojiKeySize = (CGSize)vaddq_f64((float64x2_t)vdupq_lane_s64(v36, 0), (float64x2_t)xmmword_186B99F70);
                v6->_prepolulatedRecentCount = v14;
                *(void *)&v6->_emojiKeyWidth = v36;
                v6->_minimumLineSpacing = v15;
                v6->_minimumInteritemSpacing = v15;
                v6->_inputViewRightMostPadding = v6->_inputViewLeftMostPadding;
                if (v6->_isFirstPartyStickers)
                {
                  v6->_minimumInteritemSpacing = 9.0;
                  goto LABEL_73;
                }
                goto LABEL_59;
              }
              if (v18 >= 320.0)
              {
                v6->_emojiKeyWidth = v13;
                *(_OWORD *)&v6->_minimumLineSpacing = xmmword_186B99000;
                *(_OWORD *)&v6->_columnOffset = xmmword_186B9A690;
                *(_OWORD *)&v6->_bottomPadding = xmmword_186B9A6A0;
                *(_OWORD *)&v6->_categoryHeaderLeftPadding = xmmword_186B9A6B0;
                double v19 = 38.0;
                if (IsStickerPickerService) {
                  double v19 = 44.0;
                }
                double v20 = 42.0;
                if (IsStickerPickerService) {
                  double v20 = 48.0;
                }
                v6->_fakeEmojiKeySize.width = v19;
                v6->_fakeEmojiKeySize.height = v20;
                v6->_categoryHeaderFontSize = 12.0;
                v6->_prepolulatedRecentCount = 30;
                long long v21 = xmmword_186B9A6C0;
                goto LABEL_70;
              }
LABEL_52:
              v27 = v6;
              goto LABEL_53;
            }
            v6->_emojiKeyWidth = v13;
            *(_OWORD *)&v6->_minimumLineSpacing = xmmword_186B9A650;
            *(_OWORD *)&v6->_columnOffset = xmmword_186B9A660;
            *(_OWORD *)&v6->_bottomPadding = xmmword_186B9A670;
            *(_OWORD *)&v6->_categoryHeaderLeftPadding = xmmword_186B9A620;
            double v31 = 38.0;
            double v32 = 44.0;
            if (IsStickerPickerService)
            {
              double v31 = 44.0;
              double v32 = 50.0;
            }
            v6->_fakeEmojiKeySize.width = v31;
            v6->_fakeEmojiKeySize.height = v32;
            v6->_categoryHeaderFontSize = 12.0;
            v6->_prepolulatedRecentCount = 30;
            *(_OWORD *)&v6->_inputViewLeftMostPadding = xmmword_186B9A680;
            v6->_alertTextWidth = 280.0;
            *(_OWORD *)&v6->_rightBiasPercentage = xmmword_186B9A500;
            if ([v4 isInPopover]) {
              v6->_bottomPadding = 2.0;
            }
          }
          if (![v4 isEmojiScrollingDirectionVertical]) {
            goto LABEL_52;
          }
          v6->_fakeEmojiKeySize = (CGSize)vaddq_f64((float64x2_t)vdupq_lane_s64(v36, 0), (float64x2_t)xmmword_186B99F70);
          v6->_prepolulatedRecentCount = v14;
          *(void *)&v6->_emojiKeyWidth = v36;
          v6->_minimumLineSpacing = v15;
          v6->_minimumInteritemSpacing = v15;
          v6->_inputViewRightMostPadding = v6->_inputViewLeftMostPadding;
          if (v6->_isFirstPartyStickers)
          {
LABEL_73:
            v6->_sectionOffset = v15 + 9.0;
            v6->_topPadding = v15 + -9.0;
            v6->_categoryHeaderFontSize = 15.0;
            *(_OWORD *)&v6->_categoryHeaderHeight = xmmword_186B9A640;
            goto LABEL_52;
          }
LABEL_59:
          v6->_sectionOffset = v15;
          v6->_topPadding = v15;
          goto LABEL_52;
        }
        *(_OWORD *)&v6->_emojiKeyWidth = xmmword_186B9A5A0;
        *(_OWORD *)&v6->_minimumInteritemSpacing = xmmword_186B9A5B0;
        *(_OWORD *)&v6->_sectionOffset = xmmword_186B9A5C0;
        *(_OWORD *)&v6->_categoryHeaderHeight = xmmword_186B9A5D0;
        v6->_fakeEmojiKeySize.height = 64.0;
        *(_OWORD *)&v6->_categorySelectedCirWidth = xmmword_186B9A3D0;
        v6->_prepolulatedRecentCount = 30;
        long long v25 = xmmword_186B9A5E0;
        goto LABEL_49;
      }
      *(_OWORD *)&v6->_emojiKeyWidth = xmmword_186B9A390;
      *(_OWORD *)&v6->_minimumInteritemSpacing = xmmword_186B9A570;
      *(_OWORD *)&v6->_sectionOffset = xmmword_186B9A3B0;
      *(_OWORD *)&v6->_categoryHeaderHeight = xmmword_186B9A580;
      v6->_fakeEmojiKeySize.height = 64.0;
      *(_OWORD *)&v6->_categorySelectedCirWidth = xmmword_186B9A590;
      uint64_t v22 = 27;
    }
    else
    {
      if (v18 >= 1366.0)
      {
        *(_OWORD *)&v6->_emojiKeyWidth = xmmword_186B9A390;
        *(_OWORD *)&v6->_minimumInteritemSpacing = xmmword_186B9A3A0;
        long long v23 = xmmword_186B9A3B0;
        long long v24 = xmmword_186B9A3C0;
      }
      else
      {
        if (v18 < 1024.0)
        {
          if (v18 >= 812.0)
          {
            *(_OWORD *)&v6->_emojiKeyWidth = xmmword_186B9A430;
            *(_OWORD *)&v6->_minimumInteritemSpacing = xmmword_186B9A440;
            *(_OWORD *)&v6->_sectionOffset = xmmword_186B9A450;
            *(_OWORD *)&v6->_categoryHeaderHeight = xmmword_186B9A460;
            v6->_fakeEmojiKeySize.height = 33.0;
            *(_OWORD *)&v6->_categorySelectedCirWidth = xmmword_186B9A470;
            v6->_prepolulatedRecentCount = 30;
            *(int64x2_t *)&v6->_inputViewLeftMostPadding = vdupq_n_s64(0x404E000000000000uLL);
            *(_OWORD *)&v6->_alertTextWidth = xmmword_186B9A480;
            long long v12 = xmmword_186B9A490;
            goto LABEL_51;
          }
          if (v18 >= 780.0)
          {
            *(_OWORD *)&v6->_emojiKeyWidth = xmmword_186B9A4A0;
            *(_OWORD *)&v6->_minimumInteritemSpacing = xmmword_186B9A4B0;
            *(_OWORD *)&v6->_sectionOffset = xmmword_186B9A4C0;
            *(_OWORD *)&v6->_categoryHeaderHeight = xmmword_186B9A4D0;
            v6->_fakeEmojiKeySize.height = 33.0;
            *(_OWORD *)&v6->_categorySelectedCirWidth = xmmword_186B9A4E0;
            v6->_prepolulatedRecentCount = 30;
            long long v33 = xmmword_186B9A4F0;
          }
          else
          {
            if (v18 >= 736.0)
            {
              *(_OWORD *)&v6->_emojiKeyWidth = xmmword_186B9A430;
              *(_OWORD *)&v6->_minimumInteritemSpacing = xmmword_186B9A440;
              *(_OWORD *)&v6->_sectionOffset = xmmword_186B9A450;
              *(_OWORD *)&v6->_categoryHeaderHeight = xmmword_186B9A460;
              v6->_fakeEmojiKeySize.height = 33.0;
              *(_OWORD *)&v6->_categorySelectedCirWidth = xmmword_186B9A470;
              v6->_prepolulatedRecentCount = 30;
              *(_OWORD *)&v6->_inputViewLeftMostPadding = xmmword_186B9A510;
              long long v26 = xmmword_186B9A480;
              goto LABEL_50;
            }
            if (v18 >= 667.0)
            {
              *(_OWORD *)&v6->_emojiKeyWidth = xmmword_186B9A4A0;
              *(_OWORD *)&v6->_minimumInteritemSpacing = xmmword_186B9A4B0;
              *(_OWORD *)&v6->_sectionOffset = xmmword_186B9A4C0;
              *(_OWORD *)&v6->_categoryHeaderHeight = xmmword_186B9A4D0;
              v6->_fakeEmojiKeySize.height = 33.0;
              *(_OWORD *)&v6->_categorySelectedCirWidth = xmmword_186B9A4E0;
              v6->_prepolulatedRecentCount = 30;
              long long v33 = xmmword_186B9A520;
            }
            else
            {
              if (v18 < 568.0)
              {
                if (v18 >= 480.0)
                {
                  *(_OWORD *)&v6->_emojiKeyWidth = xmmword_186B9A4A0;
                  *(_OWORD *)&v6->_minimumInteritemSpacing = xmmword_186B99F70;
                  *(_OWORD *)&v6->_sectionOffset = xmmword_186B9A4C0;
                  *(_OWORD *)&v6->_categoryHeaderHeight = xmmword_186B9A530;
                  v6->_fakeEmojiKeySize.height = 35.0;
                  *(_OWORD *)&v6->_categorySelectedCirWidth = xmmword_186B9A540;
                  v6->_prepolulatedRecentCount = 30;
                  *(_OWORD *)&v6->_inputViewLeftMostPadding = xmmword_186B9A550;
                  long long v11 = xmmword_186B9A560;
                  goto LABEL_7;
                }
                goto LABEL_52;
              }
              *(_OWORD *)&v6->_emojiKeyWidth = xmmword_186B9A4A0;
              *(_OWORD *)&v6->_minimumInteritemSpacing = xmmword_186B99F70;
              *(_OWORD *)&v6->_sectionOffset = xmmword_186B9A4C0;
              *(_OWORD *)&v6->_categoryHeaderHeight = xmmword_186B9A530;
              v6->_fakeEmojiKeySize.height = 33.0;
              *(_OWORD *)&v6->_categorySelectedCirWidth = xmmword_186B9A540;
              v6->_prepolulatedRecentCount = 30;
              long long v33 = xmmword_186B9A550;
            }
          }
          *(_OWORD *)&v6->_inputViewLeftMostPadding = v33;
          long long v11 = xmmword_186B9A480;
          goto LABEL_7;
        }
        *(_OWORD *)&v6->_emojiKeyWidth = xmmword_186B9A390;
        *(_OWORD *)&v6->_minimumInteritemSpacing = xmmword_186B9A410;
        long long v23 = xmmword_186B9A3B0;
        long long v24 = xmmword_186B9A420;
      }
      *(_OWORD *)&v6->_sectionOffset = v23;
      *(_OWORD *)&v6->_categoryHeaderHeight = v24;
      v6->_fakeEmojiKeySize.height = 64.0;
      *(_OWORD *)&v6->_categorySelectedCirWidth = xmmword_186B9A3D0;
      uint64_t v22 = 30;
    }
    v6->_prepolulatedRecentCount = v22;
    long long v25 = xmmword_186B9A3E0;
LABEL_49:
    *(_OWORD *)&v6->_inputViewLeftMostPadding = v25;
    long long v26 = xmmword_186B9A3F0;
LABEL_50:
    *(_OWORD *)&v6->_alertTextWidth = v26;
    long long v12 = xmmword_186B9A400;
    goto LABEL_51;
  }
LABEL_53:

  return v6;
}

+ (UIKeyboardEmojiGraphicsTraits)emojiGraphicsTraitsWithScreenTraits:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithScreenTrait:v4];

  return (UIKeyboardEmojiGraphicsTraits *)v5;
}

+ (id)emojiGraphicsTraitsForCurrentScreenTraits
{
  v3 = +[UIKeyboardImpl keyboardScreen];
  [v3 bounds];
  CGFloat x = v14.origin.x;
  CGFloat y = v14.origin.y;
  CGFloat width = v14.size.width;
  CGFloat height = v14.size.height;
  double v8 = CGRectGetWidth(v14);
  v15.origin.CGFloat x = x;
  v15.origin.CGFloat y = y;
  v15.size.CGFloat width = width;
  v15.size.CGFloat height = height;
  if (v8 <= CGRectGetHeight(v15)) {
    uint64_t v9 = 1;
  }
  else {
    uint64_t v9 = 4;
  }
  uint64_t v10 = +[UIKBScreenTraits traitsWithScreen:v3 orientation:v9 ignoreRemoteKeyboard:1];
  long long v11 = (void *)[objc_alloc((Class)a1) initWithScreenTrait:v10];

  return v11;
}

- (double)emojiKeyWidth
{
  return self->_emojiKeyWidth;
}

- (double)minimumLineSpacing
{
  return self->_minimumLineSpacing;
}

- (double)minimumInteritemSpacing
{
  return self->_minimumInteritemSpacing;
}

- (double)columnOffset
{
  return self->_columnOffset;
}

- (double)sectionOffset
{
  return self->_sectionOffset;
}

- (double)bottomPadding
{
  return self->_bottomPadding;
}

- (double)categoryHeaderHeight
{
  return self->_categoryHeaderHeight;
}

- (double)categoryHeaderLeftPadding
{
  return self->_categoryHeaderLeftPadding;
}

- (double)categorySelectedCirWidth
{
  return self->_categorySelectedCirWidth;
}

- (CGSize)fakeEmojiKeySize
{
  double width = self->_fakeEmojiKeySize.width;
  double height = self->_fakeEmojiKeySize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)categoryHeaderFontSize
{
  return self->_categoryHeaderFontSize;
}

- (int64_t)prepolulatedRecentCount
{
  return self->_prepolulatedRecentCount;
}

- (double)inputViewLeftMostPadding
{
  return self->_inputViewLeftMostPadding;
}

- (double)inputViewRightMostPadding
{
  return self->_inputViewRightMostPadding;
}

- (double)rightBiasPercentage
{
  return self->_rightBiasPercentage;
}

- (double)scrollSnapOffset
{
  return self->_scrollSnapOffset;
}

- (double)screenToNativeScaleRatio
{
  return self->_screenToNativeScaleRatio;
}

- (double)topPadding
{
  return self->_topPadding;
}

- (double)categoryHeaderBottomInset
{
  return self->_categoryHeaderBottomInset;
}

- (double)alertTextWidth
{
  return self->_alertTextWidth;
}

@end