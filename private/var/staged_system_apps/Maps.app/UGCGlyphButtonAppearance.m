@interface UGCGlyphButtonAppearance
+ (id)_sharedThumbButtonConfig;
+ (id)thumbsDownButtonAppearance;
+ (id)thumbsUpButtonAppearance;
- (NSString)mutedGlyphName;
- (NSString)selectedGlyphName;
- (NSString)unselectedGlyphName;
- (UIColor)mutedBackgroundColor;
- (UIColor)mutedGlyphColor;
- (UIColor)selectedBackgroundColor;
- (UIColor)selectedGlyphColor;
- (UIColor)unselectedBackgroundColor;
- (UIColor)unselectedGlyphColor;
- (UIFont)mutedGlyphFontSize;
- (UIFont)selectedGlyphFontSize;
- (UIFont)unselectedGlyphFontSize;
- (void)setMutedBackgroundColor:(id)a3;
- (void)setMutedGlyphColor:(id)a3;
- (void)setMutedGlyphFontSize:(id)a3;
- (void)setMutedGlyphName:(id)a3;
- (void)setSelectedBackgroundColor:(id)a3;
- (void)setSelectedGlyphColor:(id)a3;
- (void)setSelectedGlyphFontSize:(id)a3;
- (void)setSelectedGlyphName:(id)a3;
- (void)setUnselectedBackgroundColor:(id)a3;
- (void)setUnselectedGlyphColor:(id)a3;
- (void)setUnselectedGlyphFontSize:(id)a3;
- (void)setUnselectedGlyphName:(id)a3;
@end

@implementation UGCGlyphButtonAppearance

+ (id)_sharedThumbButtonConfig
{
  v2 = objc_alloc_init(UGCGlyphButtonAppearance);
  v3 = +[MapsTheme ugcGlyphButtonViewMutedBackgroundColor];
  [(UGCGlyphButtonAppearance *)v2 setMutedBackgroundColor:v3];

  v4 = +[MapsTheme ugcGlyphButtonViewMutedGlyphColor];
  [(UGCGlyphButtonAppearance *)v2 setMutedGlyphColor:v4];

  v5 = +[MapsTheme ugcGlyphButtonViewUnselectedBackgroundColor];
  [(UGCGlyphButtonAppearance *)v2 setUnselectedBackgroundColor:v5];

  v6 = +[MapsTheme ugcGlyphButtonViewUnselectedGlyphColor];
  [(UGCGlyphButtonAppearance *)v2 setUnselectedGlyphColor:v6];

  v7 = +[MapsTheme ugcGlyphButtonViewSelectedGlyphColor];
  [(UGCGlyphButtonAppearance *)v2 setSelectedGlyphColor:v7];

  v8 = +[MapsTheme ugcGlyphButtonViewSelectedBackgroundColor];
  [(UGCGlyphButtonAppearance *)v2 setSelectedBackgroundColor:v8];

  v9 = +[UGCFontManager ratingGlyphButtonFont];
  [(UGCGlyphButtonAppearance *)v2 setSelectedGlyphFontSize:v9];

  v10 = +[UGCFontManager ratingGlyphButtonFont];
  [(UGCGlyphButtonAppearance *)v2 setUnselectedGlyphFontSize:v10];

  v11 = +[UGCFontManager ratingGlyphButtonFont];
  [(UGCGlyphButtonAppearance *)v2 setMutedGlyphFontSize:v11];

  return v2;
}

+ (id)thumbsUpButtonAppearance
{
  v2 = [a1 _sharedThumbButtonConfig];
  v3 = +[UIDevice currentDevice];
  id v4 = [v3 userInterfaceIdiom];

  if (v4 == (id)5) {
    CFStringRef v5 = @"hand.thumbsup";
  }
  else {
    CFStringRef v5 = @"hand.thumbsup.fill";
  }
  [v2 setMutedGlyphName:v5];
  [v2 setUnselectedGlyphName:v5];
  [v2 setSelectedGlyphName:@"hand.thumbsup.fill"];

  return v2;
}

+ (id)thumbsDownButtonAppearance
{
  v2 = [a1 _sharedThumbButtonConfig];
  v3 = +[UIDevice currentDevice];
  id v4 = [v3 userInterfaceIdiom];

  if (v4 == (id)5) {
    CFStringRef v5 = @"hand.thumbsdown";
  }
  else {
    CFStringRef v5 = @"hand.thumbsdown.fill";
  }
  [v2 setMutedGlyphName:v5];
  [v2 setUnselectedGlyphName:v5];
  [v2 setSelectedGlyphName:@"hand.thumbsdown.fill"];

  return v2;
}

- (NSString)mutedGlyphName
{
  return self->_mutedGlyphName;
}

- (void)setMutedGlyphName:(id)a3
{
}

- (UIColor)mutedBackgroundColor
{
  return self->_mutedBackgroundColor;
}

- (void)setMutedBackgroundColor:(id)a3
{
}

- (UIColor)mutedGlyphColor
{
  return self->_mutedGlyphColor;
}

- (void)setMutedGlyphColor:(id)a3
{
}

- (NSString)unselectedGlyphName
{
  return self->_unselectedGlyphName;
}

- (void)setUnselectedGlyphName:(id)a3
{
}

- (UIColor)unselectedBackgroundColor
{
  return self->_unselectedBackgroundColor;
}

- (void)setUnselectedBackgroundColor:(id)a3
{
}

- (UIColor)unselectedGlyphColor
{
  return self->_unselectedGlyphColor;
}

- (void)setUnselectedGlyphColor:(id)a3
{
}

- (NSString)selectedGlyphName
{
  return self->_selectedGlyphName;
}

- (void)setSelectedGlyphName:(id)a3
{
}

- (UIColor)selectedBackgroundColor
{
  return self->_selectedBackgroundColor;
}

- (void)setSelectedBackgroundColor:(id)a3
{
}

- (UIColor)selectedGlyphColor
{
  return self->_selectedGlyphColor;
}

- (void)setSelectedGlyphColor:(id)a3
{
}

- (UIFont)selectedGlyphFontSize
{
  return self->_selectedGlyphFontSize;
}

- (void)setSelectedGlyphFontSize:(id)a3
{
}

- (UIFont)unselectedGlyphFontSize
{
  return self->_unselectedGlyphFontSize;
}

- (void)setUnselectedGlyphFontSize:(id)a3
{
}

- (UIFont)mutedGlyphFontSize
{
  return self->_mutedGlyphFontSize;
}

- (void)setMutedGlyphFontSize:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutedGlyphFontSize, 0);
  objc_storeStrong((id *)&self->_unselectedGlyphFontSize, 0);
  objc_storeStrong((id *)&self->_selectedGlyphFontSize, 0);
  objc_storeStrong((id *)&self->_selectedGlyphColor, 0);
  objc_storeStrong((id *)&self->_selectedBackgroundColor, 0);
  objc_storeStrong((id *)&self->_selectedGlyphName, 0);
  objc_storeStrong((id *)&self->_unselectedGlyphColor, 0);
  objc_storeStrong((id *)&self->_unselectedBackgroundColor, 0);
  objc_storeStrong((id *)&self->_unselectedGlyphName, 0);
  objc_storeStrong((id *)&self->_mutedGlyphColor, 0);
  objc_storeStrong((id *)&self->_mutedBackgroundColor, 0);

  objc_storeStrong((id *)&self->_mutedGlyphName, 0);
}

@end