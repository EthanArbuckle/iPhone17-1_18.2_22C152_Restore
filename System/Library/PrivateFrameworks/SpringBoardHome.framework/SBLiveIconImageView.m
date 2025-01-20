@interface SBLiveIconImageView
+ (BOOL)allowsImageLayer;
- (BOOL)isAnimationAllowed;
- (id)snapshot;
- (void)prepareForReuse;
- (void)setContentVisibility:(unint64_t)a3;
- (void)setIcon:(id)a3 location:(id)a4 animated:(BOOL)a5;
- (void)setPaused:(BOOL)a3;
- (void)updateImageAnimated:(BOOL)a3;
@end

@implementation SBLiveIconImageView

- (void)setIcon:(id)a3 location:(id)a4 animated:(BOOL)a5
{
  v7.receiver = self;
  v7.super_class = (Class)SBLiveIconImageView;
  [(SBIconImageView *)&v7 setIcon:a3 location:a4 animated:a5];
  v6 = [(SBIconImageView *)self icon];

  if (v6) {
    [(SBLiveIconImageView *)self updateUnanimated];
  }
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)SBLiveIconImageView;
  [(SBIconImageView *)&v3 prepareForReuse];
  [(SBLiveIconImageView *)self updateAnimatingState];
}

- (void)setContentVisibility:(unint64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBLiveIconImageView;
  [(SBIconImageView *)&v4 setContentVisibility:a3];
  [(SBLiveIconImageView *)self updateAnimatingState];
}

- (void)setPaused:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBLiveIconImageView;
  [(SBIconImageView *)&v4 setPaused:a3];
  [(SBLiveIconImageView *)self updateAnimatingState];
}

- (void)updateImageAnimated:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBLiveIconImageView;
  [(SBIconImageView *)&v4 updateImageAnimated:a3];
  [(SBLiveIconImageView *)self updateAnimatingState];
}

- (BOOL)isAnimationAllowed
{
  return ![(SBIconImageView *)self isPaused]
      && [(SBIconImageView *)self contentVisibility] != 2;
}

+ (BOOL)allowsImageLayer
{
  return 0;
}

- (id)snapshot
{
  objc_super v3 = [(SBIconImageView *)self icon];
  [(SBIconImageView *)self iconImageInfo];
  objc_super v4 = objc_msgSend(v3, "iconImageWithInfo:");

  return v4;
}

@end