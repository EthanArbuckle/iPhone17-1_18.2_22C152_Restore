@interface PUReviewScreenScrubberBar
- (PUScrubberView)scrubber;
- (void)layoutSubviews;
- (void)setScrubber:(id)a3;
@end

@implementation PUReviewScreenScrubberBar

- (void).cxx_destruct
{
}

- (PUScrubberView)scrubber
{
  return self->_scrubber;
}

- (void)setScrubber:(id)a3
{
  v5 = (PUScrubberView *)a3;
  p_scrubber = &self->_scrubber;
  scrubber = self->_scrubber;
  if (scrubber != v5)
  {
    v9 = v5;
    v8 = [(PUScrubberView *)scrubber superview];

    if (v8 == self) {
      [(PUScrubberView *)*p_scrubber removeFromSuperview];
    }
    objc_storeStrong((id *)&self->_scrubber, a3);
    [(PUReviewScreenScrubberBar *)self addSubview:*p_scrubber];
    v5 = v9;
  }
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)PUReviewScreenScrubberBar;
  [(PUReviewScreenScrubberBar *)&v12 layoutSubviews];
  v3 = [(PUReviewScreenScrubberBar *)self scrubber];
  [(PUReviewScreenScrubberBar *)self bounds];
  double v5 = v4;
  double v7 = v6;
  [(PUReviewScreenScrubberBar *)self safeAreaInsets];
  double v9 = v8;
  v10 = +[PUScrubberSettings sharedInstance];
  [v10 topOutset];
  objc_msgSend(v3, "setFrame:", 0.0, -v11, v5, v7 + v11 - v9);
}

@end