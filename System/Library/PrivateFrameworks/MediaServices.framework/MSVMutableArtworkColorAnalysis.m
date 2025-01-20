@interface MSVMutableArtworkColorAnalysis
- (id)copyWithZone:(_NSZone *)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setBackgroundColorLight:(BOOL)a3;
- (void)setPrimaryTextColor:(id)a3;
- (void)setPrimaryTextColorLight:(BOOL)a3;
- (void)setSecondaryTextColor:(id)a3;
- (void)setSecondaryTextColorLight:(BOOL)a3;
- (void)setTertiaryTextColor:(id)a3;
- (void)setTertiaryTextColorLight:(BOOL)a3;
@end

@implementation MSVMutableArtworkColorAnalysis

- (void)setTertiaryTextColorLight:(BOOL)a3
{
  self->super._tertiaryTextColorLight = a3;
}

- (void)setTertiaryTextColor:(id)a3
{
}

- (void)setSecondaryTextColorLight:(BOOL)a3
{
  self->super._secondaryTextColorLight = a3;
}

- (void)setSecondaryTextColor:(id)a3
{
}

- (void)setPrimaryTextColorLight:(BOOL)a3
{
  self->super._primaryTextColorLight = a3;
}

- (void)setPrimaryTextColor:(id)a3
{
}

- (void)setBackgroundColorLight:(BOOL)a3
{
  self->super._backgroundColorLight = a3;
}

- (void)setBackgroundColor:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_opt_class();
  return [(MSVArtworkColorAnalysis *)self _copyWithClass:v4];
}

@end