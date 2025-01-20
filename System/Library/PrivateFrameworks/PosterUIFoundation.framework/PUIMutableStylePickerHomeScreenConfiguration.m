@interface PUIMutableStylePickerHomeScreenConfiguration
+ (BOOL)supportsSecureCoding;
- (void)setAccentColor:(id)a3;
- (void)setLuminance:(double)a3;
- (void)setSaturation:(double)a3;
- (void)setVariation:(double)a3;
@end

@implementation PUIMutableStylePickerHomeScreenConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setAccentColor:(id)a3
{
  id v4 = a3;
  id v6 = [(PUIStylePickerHomeScreenConfiguration *)self accentStyle];
  v5 = (void *)[v6 copyWithVariatedColor:v4];

  [(PUIStylePickerHomeScreenConfiguration *)self setAccentStyle:v5];
}

- (void)setVariation:(double)a3
{
  id v6 = [(PUIStylePickerHomeScreenConfiguration *)self accentStyle];
  v5 = (void *)[v6 copyWithVariation:a3];
  [(PUIStylePickerHomeScreenConfiguration *)self setAccentStyle:v5];
}

- (void)setLuminance:(double)a3
{
  id v6 = [(PUIStylePickerHomeScreenConfiguration *)self accentStyle];
  v5 = (void *)[v6 copyWithLuminance:a3];
  [(PUIStylePickerHomeScreenConfiguration *)self setAccentStyle:v5];
}

- (void)setSaturation:(double)a3
{
  id v6 = [(PUIStylePickerHomeScreenConfiguration *)self accentStyle];
  id v4 = [(PUIStylePickerHomeScreenConfiguration *)self accentStyle];
  [v4 luminance];
  v5 = objc_msgSend(v6, "copyWithLuminance:saturation:");
  [(PUIStylePickerHomeScreenConfiguration *)self setAccentStyle:v5];
}

@end