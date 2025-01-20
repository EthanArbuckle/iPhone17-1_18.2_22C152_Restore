@interface UIMutableStatusBarStyleRequest
- (id)copyWithZone:(_NSZone *)a3;
- (void)setForegroundAlpha:(double)a3;
- (void)setForegroundColor:(id)a3;
- (void)setLegibilityStyle:(int64_t)a3;
- (void)setOverrideHeight:(id)a3;
- (void)setStyle:(int64_t)a3;
@end

@implementation UIMutableStatusBarStyleRequest

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_opt_class();
  return [(UIStatusBarStyleRequest *)self _copyWithZone:a3 class:v5];
}

- (void)setStyle:(int64_t)a3
{
  self->super._style = a3;
}

- (void)setLegibilityStyle:(int64_t)a3
{
  self->super._legibilityStyle = a3;
}

- (void)setForegroundColor:(id)a3
{
  uint64_t v5 = (UIColor *)a3;
  foregroundColor = self->super._foregroundColor;
  p_foregroundColor = &self->super._foregroundColor;
  if (foregroundColor != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_foregroundColor, a3);
    uint64_t v5 = v8;
  }
}

- (void)setOverrideHeight:(id)a3
{
  uint64_t v5 = (NSNumber *)a3;
  overrideHeight = self->super._overrideHeight;
  p_overrideHeight = &self->super._overrideHeight;
  if (overrideHeight != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_overrideHeight, a3);
    uint64_t v5 = v8;
  }
}

- (void)setForegroundAlpha:(double)a3
{
  self->super._foregroundAlpha = a3;
}

@end