@interface PUPlaybackTimeLabel
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentPlaybackTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)playbackDuration;
- (BOOL)_needsUpdate;
- (BOOL)_needsUpdateBackground;
- (BOOL)_needsUpdateLabel;
- (CGSize)_maximumLabelSizeWithDuration:(double)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (PUPlaybackTimeLabel)initWithFrame:(CGRect)a3;
- (UILabel)_label;
- (UIView)_backgroundView;
- (id)_labelTextWithFormat:(int64_t)a3 elapsedInterval:(double)a4 remainingInterval:(double)a5;
- (id)_stringFromTimeInterval:(double)a3;
- (int64_t)format;
- (void)_invalidateBackground;
- (void)_invalidateLabel;
- (void)_setNeedsUpdateBackground:(BOOL)a3;
- (void)_setNeedsUpdateLabel:(BOOL)a3;
- (void)_updateBackgroundIfNeeded;
- (void)_updateIfNeeded;
- (void)_updateLabelIfNeeded;
- (void)layoutSubviews;
- (void)setCurrentPlaybackTime:(id *)a3;
- (void)setFormat:(int64_t)a3;
- (void)setPlaybackDuration:(id *)a3;
@end

@implementation PUPlaybackTimeLabel

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__label, 0);
  objc_storeStrong((id *)&self->__backgroundView, 0);
}

- (void)_setNeedsUpdateLabel:(BOOL)a3
{
  self->__needsUpdateLabel = a3;
}

- (BOOL)_needsUpdateLabel
{
  return self->__needsUpdateLabel;
}

- (void)_setNeedsUpdateBackground:(BOOL)a3
{
  self->__needsUpdateBackground = a3;
}

- (BOOL)_needsUpdateBackground
{
  return self->__needsUpdateBackground;
}

- (UILabel)_label
{
  return self->__label;
}

- (UIView)_backgroundView
{
  return self->__backgroundView;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)playbackDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 464);
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentPlaybackTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 440);
  return self;
}

- (int64_t)format
{
  return self->_format;
}

- (id)_stringFromTimeInterval:(double)a3
{
  if (_stringFromTimeInterval__onceToken_73316 != -1) {
    dispatch_once(&_stringFromTimeInterval__onceToken_73316, &__block_literal_global_73317);
  }
  v4 = &_stringFromTimeInterval__hourMinuteSecondFormatter_73318;
  if (a3 < 3600.0) {
    v4 = &_stringFromTimeInterval__minuteSecondFormatter_73319;
  }
  v5 = (void *)*v4;
  return (id)[v5 stringFromTimeInterval:a3];
}

uint64_t __47__PUPlaybackTimeLabel__stringFromTimeInterval___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C00]);
  v1 = (void *)_stringFromTimeInterval__minuteSecondFormatter_73319;
  _stringFromTimeInterval__minuteSecondFormatter_73319 = (uint64_t)v0;

  [(id)_stringFromTimeInterval__minuteSecondFormatter_73319 setAllowedUnits:192];
  [(id)_stringFromTimeInterval__minuteSecondFormatter_73319 setUnitsStyle:0];
  [(id)_stringFromTimeInterval__minuteSecondFormatter_73319 setZeroFormattingBehavior:0x10000];
  id v2 = objc_alloc_init(MEMORY[0x1E4F28C00]);
  v3 = (void *)_stringFromTimeInterval__hourMinuteSecondFormatter_73318;
  _stringFromTimeInterval__hourMinuteSecondFormatter_73318 = (uint64_t)v2;

  [(id)_stringFromTimeInterval__hourMinuteSecondFormatter_73318 setAllowedUnits:224];
  [(id)_stringFromTimeInterval__hourMinuteSecondFormatter_73318 setUnitsStyle:0];
  v4 = (void *)_stringFromTimeInterval__hourMinuteSecondFormatter_73318;
  return [v4 setZeroFormattingBehavior:0x10000];
}

- (id)_labelTextWithFormat:(int64_t)a3 elapsedInterval:(double)a4 remainingInterval:(double)a5
{
  switch(a3)
  {
    case 3:
      v9 = NSString;
      v8 = [(PUPlaybackTimeLabel *)self _stringFromTimeInterval:a4];
      v10 = [(PUPlaybackTimeLabel *)self _stringFromTimeInterval:a5];
      v11 = [v9 stringWithFormat:@"%@ / -%@", v8, v10];

LABEL_8:
      goto LABEL_10;
    case 2:
      v12 = NSString;
      v8 = [(PUPlaybackTimeLabel *)self _stringFromTimeInterval:a5];
      [v12 stringWithFormat:@"-%@", v8];
      goto LABEL_7;
    case 1:
      v7 = NSString;
      v8 = [(PUPlaybackTimeLabel *)self _stringFromTimeInterval:a4];
      [v7 stringWithFormat:@"%@", v8];
      v11 = LABEL_7:;
      goto LABEL_8;
  }
  v11 = 0;
LABEL_10:
  return v11;
}

- (CGSize)_maximumLabelSizeWithDuration:(double)a3
{
  v5 = [(PUPlaybackTimeLabel *)self _label];
  v6 = [v5 text];
  uint64_t v23 = 0;
  v24 = (double *)&v23;
  uint64_t v25 = 0x2020000000;
  uint64_t v26 = 0x4008000000000000;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __53__PUPlaybackTimeLabel__maximumLabelSizeWithDuration___block_invoke;
  aBlock[3] = &unk_1E5F2B0A8;
  *(double *)&aBlock[5] = a3;
  aBlock[4] = &v23;
  aBlock[6] = 3;
  v7 = (void (**)(double))_Block_copy(aBlock);
  v7[2](10.0);
  ((void (*)(void (**)(double), double))v7[2])(v7, 60.0);
  ((void (*)(void (**)(double), double))v7[2])(v7, 600.0);
  ((void (*)(void (**)(double), double))v7[2])(v7, 3600.0);
  ((void (*)(void (**)(double), double))v7[2])(v7, 36000.0);
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = 2;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __53__PUPlaybackTimeLabel__maximumLabelSizeWithDuration___block_invoke_2;
  v17[3] = &unk_1E5F2B0D0;
  v17[4] = &v18;
  v8 = (void (**)(void *, uint64_t))_Block_copy(v17);
  v9 = +[PUScrubberSettings sharedInstance];
  v8[2](v8, [v9 defaultPlaybackIndicator]);
  v8[2](v8, [v9 initialPlaybackIndicator]);
  v8[2](v8, [v9 scrubbingPlaybackIndicator]);
  v8[2](v8, [v9 chromeShownPlaybackIndicator]);
  v8[2](v8, [v9 playingPlaybackIndicator]);
  v10 = [(PUPlaybackTimeLabel *)self _labelTextWithFormat:v19[3] elapsedInterval:v24[3] remainingInterval:v24[3]];
  [v5 setText:v10];
  objc_msgSend(v5, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  double v12 = v11;
  double v14 = v13;
  [v5 setText:v6];

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v23, 8);

  double v15 = v12;
  double v16 = v14;
  result.height = v16;
  result.width = v15;
  return result;
}

double __53__PUPlaybackTimeLabel__maximumLabelSizeWithDuration___block_invoke(uint64_t a1, double result)
{
  if (*(double *)(a1 + 40) >= result)
  {
    uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
    CGSize result = *(double *)(v2 + 24) + (double)*(uint64_t *)(a1 + 48) * result;
    *(double *)(v2 + 24) = result;
  }
  return result;
}

uint64_t __53__PUPlaybackTimeLabel__maximumLabelSizeWithDuration___block_invoke_2(uint64_t result, uint64_t a2)
{
  if (a2 == 3) {
    *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 3;
  }
  return result;
}

- (void)_updateLabelIfNeeded
{
  if ([(PUPlaybackTimeLabel *)self _needsUpdateLabel])
  {
    [(PUPlaybackTimeLabel *)self _setNeedsUpdateLabel:0];
    [(PUPlaybackTimeLabel *)self currentPlaybackTime];
    memset(&v6[32], 0, 48);
    [(PUPlaybackTimeLabel *)self playbackDuration];
    v3 = 0;
    if ((unsigned __int128)0 >> 96 == 1)
    {
      if ((v6[44] & 0x1D) == 1)
      {
        *(CMTime *)v6 = *(CMTime *)&v6[56];
        double v4 = round(CMTimeGetSeconds((CMTime *)v6));
        *(CMTime *)v6 = *(CMTime *)&v6[32];
        v3 = [(PUPlaybackTimeLabel *)self _labelTextWithFormat:[(PUPlaybackTimeLabel *)self format] elapsedInterval:v4 remainingInterval:round(CMTimeGetSeconds((CMTime *)v6)) - v4];
      }
      else
      {
        v3 = 0;
      }
    }
    v5 = [(PUPlaybackTimeLabel *)self _label];
    [v5 setText:v3];
  }
}

- (void)_invalidateLabel
{
  [(PUPlaybackTimeLabel *)self _setNeedsUpdateLabel:1];
  [(PUPlaybackTimeLabel *)self _setNeedsUpdate];
}

- (void)_updateBackgroundIfNeeded
{
  if ([(PUPlaybackTimeLabel *)self _needsUpdateBackground])
  {
    [(PUPlaybackTimeLabel *)self _setNeedsUpdateBackground:0];
    memset(&v14[1], 0, sizeof(CMTime));
    [(PUPlaybackTimeLabel *)self playbackDuration];
    if ((unsigned __int128)0 >> 96 == 1)
    {
      v14[0] = v14[1];
      double v3 = round(CMTimeGetSeconds(v14));
    }
    else
    {
      double v3 = 120.0;
    }
    [(PUPlaybackTimeLabel *)self _maximumLabelSizeWithDuration:v3];
    double v5 = v4 + 16.0;
    double v7 = v6 + 4.0;
    v8 = [(PUPlaybackTimeLabel *)self _backgroundView];
    [(PUPlaybackTimeLabel *)self bounds];
    CGFloat x = v15.origin.x;
    CGFloat y = v15.origin.y;
    CGFloat width = v15.size.width;
    CGFloat height = v15.size.height;
    double MidX = CGRectGetMidX(v15);
    v16.origin.CGFloat x = x;
    v16.origin.CGFloat y = y;
    v16.size.CGFloat width = width;
    v16.size.CGFloat height = height;
    objc_msgSend(v8, "setCenter:", MidX + 0.0, CGRectGetMidY(v16) + 0.0);
    objc_msgSend(v8, "setBounds:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), v5, v7);
  }
}

- (void)_invalidateBackground
{
  [(PUPlaybackTimeLabel *)self _setNeedsUpdateBackground:1];
  [(PUPlaybackTimeLabel *)self _setNeedsUpdate];
}

- (void)_updateIfNeeded
{
  if ([(PUPlaybackTimeLabel *)self _needsUpdate])
  {
    [(PUPlaybackTimeLabel *)self _updateBackgroundIfNeeded];
    [(PUPlaybackTimeLabel *)self _updateLabelIfNeeded];
  }
}

- (BOOL)_needsUpdate
{
  if ([(PUPlaybackTimeLabel *)self _needsUpdateBackground]) {
    return 1;
  }
  return [(PUPlaybackTimeLabel *)self _needsUpdateLabel];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  [(PUPlaybackTimeLabel *)self _updateIfNeeded];
  double v4 = [(PUPlaybackTimeLabel *)self _backgroundView];
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.CGFloat height = v10;
  result.CGFloat width = v9;
  return result;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PUPlaybackTimeLabel;
  [(PUPlaybackTimeLabel *)&v3 layoutSubviews];
  [(PUPlaybackTimeLabel *)self _updateIfNeeded];
}

- (void)setPlaybackDuration:(id *)a3
{
  p_$95D729B680665BEAEFA1D6FCA8238556 playbackDuration = &self->_playbackDuration;
  CMTime time1 = *(CMTime *)a3;
  $95D729B680665BEAEFA1D6FCA8238556 playbackDuration = self->_playbackDuration;
  if (CMTimeCompare(&time1, (CMTime *)&playbackDuration))
  {
    long long v6 = *(_OWORD *)&a3->var0;
    p_playbackDuration->epoch = a3->var3;
    *(_OWORD *)&p_playbackDuration->value = v6;
    if ([(PUPlaybackTimeLabel *)self format])
    {
      [(PUPlaybackTimeLabel *)self _invalidateBackground];
      [(PUPlaybackTimeLabel *)self _invalidateLabel];
    }
  }
}

- (void)setCurrentPlaybackTime:(id *)a3
{
  p_$95D729B680665BEAEFA1D6FCA8238556 currentPlaybackTime = &self->_currentPlaybackTime;
  CMTime time1 = *(CMTime *)a3;
  $95D729B680665BEAEFA1D6FCA8238556 currentPlaybackTime = self->_currentPlaybackTime;
  if (CMTimeCompare(&time1, (CMTime *)&currentPlaybackTime))
  {
    long long v6 = *(_OWORD *)&a3->var0;
    p_currentPlaybackTime->epoch = a3->var3;
    *(_OWORD *)&p_currentPlaybackTime->value = v6;
    if ([(PUPlaybackTimeLabel *)self format]) {
      [(PUPlaybackTimeLabel *)self _invalidateLabel];
    }
  }
}

- (void)setFormat:(int64_t)a3
{
  if (self->_format != a3)
  {
    self->_format = a3;
    [(PUPlaybackTimeLabel *)self _invalidateBackground];
    [(PUPlaybackTimeLabel *)self _invalidateLabel];
  }
}

- (PUPlaybackTimeLabel)initWithFrame:(CGRect)a3
{
  v20.receiver = self;
  v20.super_class = (Class)PUPlaybackTimeLabel;
  objc_super v3 = -[PUPlaybackTimeLabel initWithFrame:](&v20, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    [(PUPlaybackTimeLabel *)v3 bounds];
    uint64_t v5 = objc_msgSend(v4, "initWithFrame:");
    backgroundView = v3->__backgroundView;
    v3->__backgroundView = (UIView *)v5;

    double v7 = [(UIView *)v3->__backgroundView layer];
    [v7 setCornerRadius:2.0];

    double v8 = v3->__backgroundView;
    double v9 = +[PUInterfaceManager currentTheme];
    double v10 = [v9 playbackTimeLabelBackgroundColor];
    [(UIView *)v8 setBackgroundColor:v10];

    [(UIView *)v3->__backgroundView setAutoresizingMask:45];
    [(PUPlaybackTimeLabel *)v3 addSubview:v3->__backgroundView];
    id v11 = objc_alloc(MEMORY[0x1E4FB1930]);
    [(PUPlaybackTimeLabel *)v3 bounds];
    uint64_t v12 = objc_msgSend(v11, "initWithFrame:");
    label = v3->__label;
    v3->__label = (UILabel *)v12;

    double v14 = v3->__label;
    CGRect v15 = +[PUInterfaceManager currentTheme];
    CGRect v16 = [v15 playbackTimeLabelFont];
    [(UILabel *)v14 setFont:v16];

    [(UILabel *)v3->__label setTextAlignment:1];
    [(UILabel *)v3->__label setNumberOfLines:1];
    v17 = v3->__label;
    uint64_t v18 = [MEMORY[0x1E4FB1618] clearColor];
    [(UILabel *)v17 setBackgroundColor:v18];

    [(UILabel *)v3->__label setAutoresizingMask:18];
    [(PUPlaybackTimeLabel *)v3 addSubview:v3->__label];
  }
  return v3;
}

@end