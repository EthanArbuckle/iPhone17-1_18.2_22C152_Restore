@interface UIFont
+ (BOOL)accessibilityTextEnabled;
+ (double)_maps_bodyScaledValueForValue:(double)a3;
+ (double)_maps_bodyScaledValueForValue:(double)a3 compatibleWithTraitCollection:(id)a4;
+ (double)_maps_discreteSizeForSize:(double)a3;
+ (id)_mapsCar_fontForTextStyle:(id)a3 traits:(unsigned int)a4;
+ (id)_mapsCar_fontForTextStyle:(id)a3 weight:(double)a4;
+ (id)_mapsCar_fontForTextStyle:(id)a3 weight:(double)a4 grade:(int)a5;
+ (id)_mapsCar_fontForTextStyle:(id)a3 weight:(double)a4 grade:(int)a5 traits:(unsigned int)a6;
+ (id)_mapsCar_fontForTextStyle:(id)a3 weight:(double)a4 traits:(unsigned int)a5;
+ (id)_maps_boldSystemFontWithFixedSize:(double)a3;
+ (id)_maps_boldSystemFontWithFixedSize:(double)a3 adaptiveFont:(BOOL)a4;
+ (id)_maps_boldSystemFontWithSize:(double)a3;
+ (id)_maps_cappedFont:(id)a3 withMaxPoint:(double)a4;
+ (id)_maps_fontProviderWeight:(double)a3 minimumPointSize:(double)a4 minimumSizeCategory:(id)a5 maximumPointSize:(double)a6 maximumSizeCategory:(id)a7;
+ (id)_maps_fontWithTextStyle:(id)a3 weight:(double)a4 compatibleWithTraitCollection:(id)a5;
+ (id)_maps_navHeadingFontWithPreferredSize:(double)a3 diameter:(double)a4 desiredPadding:(double)a5;
+ (id)_maps_systemFontWithFixedSize:(double)a3;
+ (id)_maps_systemFontWithFixedSize:(double)a3 adaptiveFont:(BOOL)a4;
+ (id)_maps_systemFontWithSize:(double)a3;
+ (id)_maps_systemFontWithSize:(double)a3 weight:(double)a4 grade:(unint64_t)a5;
+ (id)_maps_textStyleForSize:(double)a3 useAdaptiveIfNeeded:(BOOL)a4 effectivePointSize:(double *)a5;
+ (id)system11;
+ (id)system11Bold;
+ (id)system12;
+ (id)system12Bold;
+ (id)system12BoldCompatibleWithTraitCollection:(id)a3;
+ (id)system12CompatibleWithTraitCollection:(id)a3;
+ (id)system12Medium;
+ (id)system12MediumCompatibleWithTraitCollection:(id)a3;
+ (id)system12Semibold;
+ (id)system12SemiboldCompatibleWithTraitCollection:(id)a3;
+ (id)system13;
+ (id)system13Adaptive;
+ (id)system13AdaptiveCompatibleWithTraitCollection:(id)a3;
+ (id)system13CompatibleWithTraitCollection:(id)a3;
+ (id)system13CompatibleWithTraitCollection:(id)a3 withSymbolicTraits:(unsigned int)a4;
+ (id)system13MediumCompatibleWithTraitCollection:(id)a3;
+ (id)system13SemiboldCompatibleWithTraitCollection:(id)a3;
+ (id)system13Tall;
+ (id)system15;
+ (id)system15Bold;
+ (id)system15CompatibleWithTraitCollection:(id)a3;
+ (id)system15CompatibleWithTraitCollection:(id)a3 withSymbolicTraits:(unsigned int)a4;
+ (id)system15Light;
+ (id)system15Medium;
+ (id)system15MediumCompatibleWithTraitCollection:(id)a3;
+ (id)system15Semibold;
+ (id)system15SemiboldCompatibleWithTraitCollection:(id)a3;
+ (id)system15Tall;
+ (id)system16;
+ (id)system17;
+ (id)system17Bold;
+ (id)system17CompatibleWithTraitCollection:(id)a3;
+ (id)system17CompatibleWithTraitCollection:(id)a3 withSymbolicTraits:(unsigned int)a4;
+ (id)system17Light;
+ (id)system17Medium;
+ (id)system17SemiBold;
+ (id)system17SemiboldCompatibleWithTraitCollection:(id)a3;
+ (id)system17SemiboldTall;
+ (id)system17Tall;
+ (id)system18;
+ (id)system20;
+ (id)system20Adaptive;
+ (id)system20AdaptiveMedium;
+ (id)system20AdaptiveSemibold;
+ (id)system20AdaptiveSemiboldCompatibleWithTraitCollection:(id)a3;
+ (id)system20Bold;
+ (id)system20CompatibleWithTraitCollection:(id)a3;
+ (id)system20CompatibleWithTraitCollection:(id)a3 withSymbolicTraits:(unsigned int)a4;
+ (id)system20Light;
+ (id)system20Medium;
+ (id)system20Semibold;
+ (id)system22;
+ (id)system22AdaptiveCondensedBold;
+ (id)system22AdaptiveSemibold;
+ (id)system22Bold;
+ (id)system22Semibold;
+ (id)system22SemiboldCompatibleWithTraitCollection:(id)a3;
+ (id)system28;
+ (id)system28AdaptiveBoldShort;
+ (id)system28AdaptiveCondensedBold;
+ (id)system28Bold;
+ (id)system28BoldCompatibleWithTraitCollection:(id)a3;
+ (id)system28Medium;
+ (void)setPlacecardShouldUseSmallFont:(BOOL)a3;
- (UIFont)_maps_fontWithMonospacedNumbers;
- (id)_maps_scaledFontForScaleFactor:(double)a3;
@end

@implementation UIFont

+ (id)_maps_systemFontWithSize:(double)a3 weight:(double)a4 grade:(unint64_t)a5
{
  v9 = [a1 _maps_textStyleForSize:0 useAdaptiveIfNeeded:0];
  v10 = +[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:v9 weight:a5 grade:a4];
  [a1 _maps_discreteSizeForSize:a3];
  v12 = [v10 _fontScaledByScaleFactor:a3 / v11];

  return v12;
}

+ (id)_maps_cappedFont:(id)a3 withMaxPoint:(double)a4
{
  id v5 = a3;
  [v5 pointSize];
  if (v6 <= a4)
  {
    id v9 = v5;
  }
  else
  {
    v7 = [v5 fontDescriptor];
    v8 = [v7 fontDescriptorWithSize:a4];
    id v9 = +[UIFont fontWithDescriptor:v8 size:0.0];
  }

  return v9;
}

+ (id)_maps_systemFontWithFixedSize:(double)a3 adaptiveFont:(BOOL)a4
{
  double v8 = 0.0;
  v4 = [a1 _maps_textStyleForSize:a4 useAdaptiveIfNeeded:&v8 effectivePointSize:a3];
  id v5 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:v4 addingSymbolicTraits:0 options:0];
  double v6 = +[UIFont fontWithDescriptor:v5 size:v8];

  return v6;
}

+ (id)_maps_textStyleForSize:(double)a3 useAdaptiveIfNeeded:(BOOL)a4 effectivePointSize:(double *)a5
{
  BOOL v6 = a4;
  if (qword_10160EEB0 != -1) {
    dispatch_once(&qword_10160EEB0, &stru_1012ECEB0);
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = (id)qword_10160EEA0;
  id v9 = (char *)[v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    id v10 = v9;
    double v11 = 0;
    uint64_t v12 = *(void *)v21;
    while (2)
    {
      v13 = 0;
      v14 = &v11[(void)v10];
      do
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v20 + 1) + 8 * (void)v13) floatValue:(void)v20];
        if (v15 >= a3)
        {
          v14 = (char *)v13 + (void)v11;
          goto LABEL_14;
        }
        v13 = (char *)v13 + 1;
      }
      while (v10 != v13);
      id v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
      double v11 = v14;
      if (v10) {
        continue;
      }
      break;
    }
  }
  else
  {
    v14 = 0;
  }
LABEL_14:

  if (v14 >= [(id)qword_10160EEA0 count]) {
    v14 = (char *)[(id)qword_10160EEA0 count];
  }
  if (v6 && _MKPlaceCardUseSmallerFont() && v14)
  {
    v16 = [(id)qword_10160EEA0 objectAtIndexedSubscript:--v14];
    [v16 floatValue];
    a3 = v17;
  }
  if (a5) {
    *a5 = a3;
  }
  v18 = [qword_10160EEA8 objectAtIndexedSubscript:v14];

  return v18;
}

+ (id)_maps_systemFontWithFixedSize:(double)a3
{
  return [a1 _maps_systemFontWithFixedSize:0 adaptiveFont:a3];
}

+ (id)system15CompatibleWithTraitCollection:(id)a3
{
  return [a1 system15CompatibleWithTraitCollection:a3 withSymbolicTraits:0];
}

+ (id)system13AdaptiveCompatibleWithTraitCollection:(id)a3
{
  id v3 = a3;
  if (_MKPlaceCardUseSmallerFont()) {
    v4 = &UIFontTextStyleCaption1;
  }
  else {
    v4 = &UIFontTextStyleFootnote;
  }
  UIFontTextStyle v5 = *v4;
  BOOL v6 = [v3 preferredContentSizeCategory];

  v7 = +[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:v5 weight:v6 contentSizeCategory:0 symbolicTraits:0.0];

  return v7;
}

+ (id)system15CompatibleWithTraitCollection:(id)a3 withSymbolicTraits:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  UIFontTextStyle v5 = [a3 preferredContentSizeCategory];
  BOOL v6 = +[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:UIFontTextStyleSubheadline weight:v5 contentSizeCategory:v4 symbolicTraits:0.0];

  return v6;
}

+ (double)_maps_bodyScaledValueForValue:(double)a3 compatibleWithTraitCollection:(id)a4
{
  id v6 = a4;
  v7 = [v6 preferredContentSizeCategory];
  id v8 = [a1 _mapkit_preferredFontForTextStyleInTableViewCell:UIFontTextStyleBody weight:v7 contentSizeCategory:0 symbolicTraits:0];

  [v6 displayScale];
  double v10 = v9;

  if (v10 == 0.0)
  {
    double v11 = +[UIScreen mainScreen];
    [v11 scale];
  }
  [v8 _scaledValueForValue:a3];
  UICeilToScale();
  double v13 = v12;

  return v13;
}

+ (id)system15SemiboldCompatibleWithTraitCollection:(id)a3
{
  id v3 = [a3 preferredContentSizeCategory];
  uint64_t v4 = +[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:UIFontTextStyleSubheadline weight:v3 contentSizeCategory:0 symbolicTraits:UIFontWeightSemibold];

  return v4;
}

+ (void)setPlacecardShouldUseSmallFont:(BOOL)a3
{
}

+ (double)_maps_discreteSizeForSize:(double)a3
{
  double v3 = 11.0;
  if (a3 > 11.0)
  {
    double v3 = 12.0;
    if (a3 > 12.0)
    {
      double v3 = 15.0;
      if (a3 > 15.0)
      {
        double v3 = 17.0;
        if (a3 > 17.0)
        {
          double v3 = 20.0;
          if (a3 > 20.0)
          {
            double v3 = 22.0;
            if (a3 > 22.0) {
              return 28.0;
            }
          }
        }
      }
    }
  }
  return v3;
}

+ (BOOL)accessibilityTextEnabled
{
  v2 = +[UIApplication sharedApplication];
  double v3 = [v2 preferredContentSizeCategory];

  if (qword_10160EE98 != -1) {
    dispatch_once(&qword_10160EE98, &stru_1012ECE90);
  }
  unsigned __int8 v4 = [(id)qword_10160EE90 containsObject:v3];

  return v4;
}

+ (id)system28Bold
{
  return [a1 system28BoldCompatibleWithTraitCollection:0];
}

+ (id)system28BoldCompatibleWithTraitCollection:(id)a3
{
  double v3 = [a3 preferredContentSizeCategory];
  unsigned __int8 v4 = +[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:UIFontTextStyleTitle1 weight:v3 contentSizeCategory:0 symbolicTraits:UIFontWeightBold];

  return v4;
}

+ (id)system28Medium
{
  return +[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:UIFontTextStyleTitle1 weight:UIFontWeightMedium];
}

+ (id)system28AdaptiveBoldShort
{
  int v2 = _MKPlaceCardUseSmallerFont();
  double v3 = &UIFontTextStyleTitle1;
  if (v2) {
    double v3 = &UIFontTextStyleTitle2;
  }
  unsigned __int8 v4 = +[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:*v3 weight:0 contentSizeCategory:0x8000 symbolicTraits:UIFontWeightBold];

  return v4;
}

+ (id)system28AdaptiveCondensedBold
{
  int v2 = _MKPlaceCardUseSmallerFont();
  double v3 = &UIFontTextStyleTitle1;
  if (v2) {
    double v3 = &UIFontTextStyleTitle2;
  }
  unsigned __int8 v4 = +[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:*v3 weight:0 contentSizeCategory:64 symbolicTraits:UIFontWeightBold];

  return v4;
}

+ (id)system28
{
  return +[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:UIFontTextStyleTitle1];
}

+ (id)system22Bold
{
  return +[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:UIFontTextStyleTitle2 weight:UIFontWeightBold];
}

+ (id)system22AdaptiveCondensedBold
{
  int v2 = _MKPlaceCardUseSmallerFont();
  double v3 = &UIFontTextStyleTitle2;
  if (v2) {
    double v3 = &UIFontTextStyleTitle3;
  }
  unsigned __int8 v4 = +[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:*v3 weight:0 contentSizeCategory:64 symbolicTraits:UIFontWeightBold];

  return v4;
}

+ (id)system22Semibold
{
  return [a1 system22SemiboldCompatibleWithTraitCollection:0];
}

+ (id)system22SemiboldCompatibleWithTraitCollection:(id)a3
{
  double v3 = [a3 preferredContentSizeCategory];
  unsigned __int8 v4 = +[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:UIFontTextStyleTitle2 weight:v3 contentSizeCategory:0 symbolicTraits:UIFontWeightSemibold];

  return v4;
}

+ (id)system22
{
  return +[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:UIFontTextStyleTitle2];
}

+ (id)system20Bold
{
  return +[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:UIFontTextStyleTitle3 weight:UIFontWeightBold];
}

+ (id)system20
{
  return [a1 system20CompatibleWithTraitCollection:0];
}

+ (id)system20CompatibleWithTraitCollection:(id)a3
{
  return _[a1 system20CompatibleWithTraitCollection:a3 withSymbolicTraits:0];
}

+ (id)system20CompatibleWithTraitCollection:(id)a3 withSymbolicTraits:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  UIFontTextStyle v5 = [a3 preferredContentSizeCategory];
  id v6 = +[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:UIFontTextStyleTitle3 weight:v5 contentSizeCategory:v4 symbolicTraits:0.0];

  return v6;
}

+ (id)system20Light
{
  return +[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:UIFontTextStyleTitle3 weight:UIFontWeightLight];
}

+ (id)system20Medium
{
  return +[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:UIFontTextStyleTitle3 weight:UIFontWeightMedium];
}

+ (id)system20Semibold
{
  return +[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:UIFontTextStyleTitle3 weight:UIFontWeightSemibold];
}

+ (id)system22AdaptiveSemibold
{
  int v2 = _MKPlaceCardUseSmallerFont();
  double v3 = &UIFontTextStyleTitle2;
  if (v2) {
    double v3 = &UIFontTextStyleBody;
  }
  uint64_t v4 = +[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:*v3 weight:UIFontWeightSemibold];

  return v4;
}

+ (id)system20AdaptiveSemibold
{
  return _[a1 system20AdaptiveSemiboldCompatibleWithTraitCollection:0];
}

+ (id)system20AdaptiveSemiboldCompatibleWithTraitCollection:(id)a3
{
  id v3 = a3;
  if (_MKPlaceCardUseSmallerFont()) {
    uint64_t v4 = &UIFontTextStyleBody;
  }
  else {
    uint64_t v4 = &UIFontTextStyleTitle3;
  }
  UIFontTextStyle v5 = *v4;
  id v6 = [v3 preferredContentSizeCategory];

  v7 = +[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:v5 weight:v6 contentSizeCategory:0 symbolicTraits:UIFontWeightSemibold];

  return v7;
}

+ (id)system20AdaptiveMedium
{
  int v2 = _MKPlaceCardUseSmallerFont();
  id v3 = &UIFontTextStyleTitle3;
  if (v2) {
    id v3 = &UIFontTextStyleBody;
  }
  uint64_t v4 = +[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:*v3 weight:UIFontWeightMedium];

  return v4;
}

+ (id)system20Adaptive
{
  int v2 = _MKPlaceCardUseSmallerFont();
  id v3 = &UIFontTextStyleBody;
  if (!v2) {
    id v3 = &UIFontTextStyleTitle3;
  }
  uint64_t v4 = +[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:*v3];

  return v4;
}

+ (id)system18
{
  return +[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:UIFontTextStyleHeadline];
}

+ (id)system17Bold
{
  return +[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:UIFontTextStyleBody weight:UIFontWeightBold];
}

+ (id)system17SemiBold
{
  return [a1 system17SemiboldCompatibleWithTraitCollection:0];
}

+ (id)system17SemiboldCompatibleWithTraitCollection:(id)a3
{
  id v3 = [a3 preferredContentSizeCategory];
  uint64_t v4 = +[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:UIFontTextStyleBody weight:v3 contentSizeCategory:0 symbolicTraits:UIFontWeightSemibold];

  return v4;
}

+ (id)system17SemiboldTall
{
  return +[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:UIFontTextStyleBody weight:0 contentSizeCategory:0x10000 symbolicTraits:UIFontWeightSemibold];
}

+ (id)system17Medium
{
  return +[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:UIFontTextStyleBody weight:UIFontWeightMedium];
}

+ (id)system17Light
{
  return +[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:UIFontTextStyleBody weight:UIFontWeightLight];
}

+ (id)system17Tall
{
  return _[a1 system17CompatibleWithTraitCollection:0 withSymbolicTraits:0x10000];
}

+ (id)system17
{
  return [a1 system17CompatibleWithTraitCollection:0];
}

+ (id)system17CompatibleWithTraitCollection:(id)a3
{
  return _[a1 system17CompatibleWithTraitCollection:a3 withSymbolicTraits:0];
}

+ (id)system17CompatibleWithTraitCollection:(id)a3 withSymbolicTraits:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  UIFontTextStyle v5 = [a3 preferredContentSizeCategory];
  id v6 = +[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:UIFontTextStyleBody weight:v5 contentSizeCategory:v4 symbolicTraits:0.0];

  return v6;
}

+ (id)system16
{
  return +[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:UIFontTextStyleCallout];
}

+ (id)system15Bold
{
  return +[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:UIFontTextStyleSubheadline weight:UIFontWeightBold];
}

+ (id)system15Semibold
{
  return [a1 system15SemiboldCompatibleWithTraitCollection:0];
}

+ (id)system15Medium
{
  return [a1 system15MediumCompatibleWithTraitCollection:0];
}

+ (id)system15MediumCompatibleWithTraitCollection:(id)a3
{
  uint64_t v4 = [a3 preferredContentSizeCategory];
  UIFontTextStyle v5 = [a1 _mapkit_preferredFontForTextStyleInTableViewCell:UIFontTextStyleSubheadline weight:v4 contentSizeCategory:0 symbolicTraits:UIFontWeightMedium];

  return v5;
}

+ (id)system15Tall
{
  return [a1 system15CompatibleWithTraitCollection:0 withSymbolicTraits:0x10000];
}

+ (id)system15
{
  return [a1 system15CompatibleWithTraitCollection:0];
}

+ (id)system15Light
{
  return +[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:UIFontTextStyleSubheadline weight:UIFontWeightLight];
}

+ (id)system13SemiboldCompatibleWithTraitCollection:(id)a3
{
  id v3 = [a3 preferredContentSizeCategory];
  uint64_t v4 = +[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:UIFontTextStyleFootnote weight:v3 contentSizeCategory:0 symbolicTraits:UIFontWeightSemibold];

  return v4;
}

+ (id)system13Adaptive
{
  return _[a1 system13AdaptiveCompatibleWithTraitCollection:0];
}

+ (id)system13MediumCompatibleWithTraitCollection:(id)a3
{
  uint64_t v4 = [a3 preferredContentSizeCategory];
  UIFontTextStyle v5 = [a1 _mapkit_preferredFontForTextStyleInTableViewCell:UIFontTextStyleFootnote weight:v4 contentSizeCategory:0 symbolicTraits:UIFontWeightMedium];

  return v5;
}

+ (id)system13Tall
{
  return _[a1 system13CompatibleWithTraitCollection:0 withSymbolicTraits:0x10000];
}

+ (id)system13
{
  return [a1 system13CompatibleWithTraitCollection:0];
}

+ (id)system13CompatibleWithTraitCollection:(id)a3
{
  return _[a1 system13CompatibleWithTraitCollection:a3 withSymbolicTraits:0];
}

+ (id)system13CompatibleWithTraitCollection:(id)a3 withSymbolicTraits:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  UIFontTextStyle v5 = [a3 preferredContentSizeCategory];
  id v6 = +[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:UIFontTextStyleFootnote weight:v5 contentSizeCategory:v4 symbolicTraits:0.0];

  return v6;
}

+ (id)system12Bold
{
  return [a1 system12BoldCompatibleWithTraitCollection:0];
}

+ (id)system12BoldCompatibleWithTraitCollection:(id)a3
{
  id v3 = [a3 preferredContentSizeCategory];
  uint64_t v4 = +[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:UIFontTextStyleCaption1 weight:v3 contentSizeCategory:0 symbolicTraits:UIFontWeightBold];

  return v4;
}

+ (id)system12Semibold
{
  return _[a1 system12SemiboldCompatibleWithTraitCollection:0];
}

+ (id)system12SemiboldCompatibleWithTraitCollection:(id)a3
{
  id v3 = [a3 preferredContentSizeCategory];
  uint64_t v4 = +[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:UIFontTextStyleCaption1 weight:v3 contentSizeCategory:0 symbolicTraits:UIFontWeightSemibold];

  return v4;
}

+ (id)system12Medium
{
  return _[a1 system12MediumCompatibleWithTraitCollection:0];
}

+ (id)system12MediumCompatibleWithTraitCollection:(id)a3
{
  id v3 = [a3 preferredContentSizeCategory];
  uint64_t v4 = +[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:UIFontTextStyleCaption1 weight:v3 contentSizeCategory:0 symbolicTraits:UIFontWeightMedium];

  return v4;
}

+ (id)system12
{
  return _[a1 system12CompatibleWithTraitCollection:0];
}

+ (id)system12CompatibleWithTraitCollection:(id)a3
{
  id v3 = [a3 preferredContentSizeCategory];
  uint64_t v4 = +[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:UIFontTextStyleCaption1 weight:v3 contentSizeCategory:0 symbolicTraits:0.0];

  return v4;
}

+ (id)system11Bold
{
  return +[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:UIFontTextStyleCaption2 weight:UIFontWeightBold];
}

+ (id)system11
{
  return +[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:UIFontTextStyleCaption2];
}

+ (id)_maps_systemFontWithSize:(double)a3
{
  UIFontTextStyle v5 = [a1 _maps_textStyleForSize:0 useAdaptiveIfNeeded:0 effectivePointSize:0];
  id v6 = +[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:v5 addingSymbolicTraits:0];

  [a1 _maps_discreteSizeForSize:a3];
  id v8 = [v6 _fontScaledByScaleFactor:a3 / v7];

  return v8;
}

+ (id)_maps_boldSystemFontWithSize:(double)a3
{
  UIFontTextStyle v5 = [a1 _maps_textStyleForSize:0 useAdaptiveIfNeeded:0 effectivePointSize:0];
  id v6 = +[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:v5 addingSymbolicTraits:2];

  [a1 _maps_discreteSizeForSize:a3];
  id v8 = [v6 _fontScaledByScaleFactor:a3 / v7];

  return v8;
}

+ (id)_maps_boldSystemFontWithFixedSize:(double)a3
{
  return [a1 _maps_boldSystemFontWithFixedSize:0 adaptiveFont:a3];
}

+ (id)_maps_boldSystemFontWithFixedSize:(double)a3 adaptiveFont:(BOOL)a4
{
  double v8 = 0.0;
  uint64_t v4 = [a1 _maps_textStyleForSize:a4 useAdaptiveIfNeeded:&v8 effectivePointSize:a3];
  UIFontTextStyle v5 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:v4 addingSymbolicTraits:2 options:0];
  id v6 = +[UIFont fontWithDescriptor:v5 size:v8];

  return v6;
}

+ (id)_maps_navHeadingFontWithPreferredSize:(double)a3 diameter:(double)a4 desiredPadding:(double)a5
{
  double v8 = MKLocalizedAbbreviationForCompassPoint();
  v62[0] = v8;
  double v9 = MKLocalizedAbbreviationForCompassPoint();
  v62[1] = v9;
  double v10 = MKLocalizedAbbreviationForCompassPoint();
  v62[2] = v10;
  double v11 = MKLocalizedAbbreviationForCompassPoint();
  v62[3] = v11;
  double v12 = MKLocalizedAbbreviationForCompassPoint();
  v62[4] = v12;
  double v13 = MKLocalizedAbbreviationForCompassPoint();
  v62[5] = v13;
  v14 = MKLocalizedAbbreviationForCompassPoint();
  v62[6] = v14;
  float v15 = MKLocalizedAbbreviationForCompassPoint();
  v62[7] = v15;
  v16 = +[NSArray arrayWithObjects:v62 count:8];

  float v17 = +[NSNumber numberWithDouble:a3];
  v61[0] = v17;
  v18 = +[NSNumber numberWithDouble:a3 + -1.0];
  v61[1] = v18;
  v19 = +[NSNumber numberWithDouble:a3 + -2.0];
  v61[2] = v19;
  long long v20 = +[NSArray arrayWithObjects:v61 count:3];

  long long v21 = [v20 firstObject];
  [v21 cgFloatValue];
  double v23 = v22;

  v24 = +[UIFont _maps_boldSystemFontWithFixedSize:v23];
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v25 = v16;
  id v26 = [v25 countByEnumeratingWithState:&v51 objects:v60 count:16];
  if (v26)
  {
    id v27 = v26;
    v28 = 0;
    uint64_t v29 = *(void *)v52;
    double v30 = 0.0;
    do
    {
      for (i = 0; i != v27; i = (char *)i + 1)
      {
        if (*(void *)v52 != v29) {
          objc_enumerationMutation(v25);
        }
        v32 = *(void **)(*((void *)&v51 + 1) + 8 * i);
        NSAttributedStringKey v58 = NSFontAttributeName;
        v59 = v24;
        v33 = +[NSDictionary dictionaryWithObjects:&v59 forKeys:&v58 count:1];
        [v32 boundingRectWithSize:3 options:v33 attributes:0 context:a4];
        double v35 = v34;

        if (v30 < v35)
        {
          id v36 = v32;

          double v30 = v35;
          v28 = v36;
        }
      }
      id v27 = [v25 countByEnumeratingWithState:&v51 objects:v60 count:16];
    }
    while (v27);
  }
  else
  {
    v28 = 0;
  }

  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v37 = v20;
  id v38 = [v37 countByEnumeratingWithState:&v47 objects:v57 count:16];
  if (v38)
  {
    id v39 = v38;
    uint64_t v40 = *(void *)v48;
LABEL_14:
    v41 = 0;
    v42 = v24;
    while (1)
    {
      if (*(void *)v48 != v40) {
        objc_enumerationMutation(v37);
      }
      [*(id *)(*((void *)&v47 + 1) + 8 * (void)v41) cgFloatValue];
      v24 = +[UIFont _maps_boldSystemFontWithFixedSize:](UIFont, "_maps_boldSystemFontWithFixedSize:");

      NSAttributedStringKey v55 = NSFontAttributeName;
      v56 = v24;
      v43 = +[NSDictionary dictionaryWithObjects:&v56 forKeys:&v55 count:1];
      [v28 boundingRectWithSize:3 options:v43 attributes:0 context:a4];
      double v45 = v44;

      if (ceil((a4 - v45) * 0.5) >= a5) {
        break;
      }
      v41 = (char *)v41 + 1;
      v42 = v24;
      if (v39 == v41)
      {
        id v39 = [v37 countByEnumeratingWithState:&v47 objects:v57 count:16];
        if (v39) {
          goto LABEL_14;
        }
        break;
      }
    }
  }

  return v24;
}

- (UIFont)_maps_fontWithMonospacedNumbers
{
  [(UIFont *)self pointSize];
  double v4 = v3;
  UIFontTextStyle v5 = [(UIFont *)self fontDescriptor];
  id v6 = [v5 _mapkit_fontDescriptorByAddingFeaturesForTabularFigures];
  double v7 = +[UIFont fontWithDescriptor:v6 size:v4];

  return (UIFont *)v7;
}

+ (double)_maps_bodyScaledValueForValue:(double)a3
{
  [a1 _maps_bodyScaledValueForValue:0 compatibleWithTraitCollection:a3];
  return result;
}

+ (id)_maps_fontWithTextStyle:(id)a3 weight:(double)a4 compatibleWithTraitCollection:(id)a5
{
  double v7 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:a3 compatibleWithTraitCollection:a5];
  UIFontDescriptorAttributeName v16 = UIFontDescriptorTraitsAttribute;
  UIFontDescriptorTraitKey v14 = UIFontWeightTrait;
  double v8 = +[NSNumber numberWithDouble:a4];
  float v15 = v8;
  double v9 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  float v17 = v9;
  double v10 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
  double v11 = [v7 fontDescriptorByAddingAttributes:v10];

  double v12 = [a1 fontWithDescriptor:v11 size:0.0];

  return v12;
}

- (id)_maps_scaledFontForScaleFactor:(double)a3
{
  [(UIFont *)self pointSize];
  double v6 = ceil(v5 * a3 + -0.5);
  double v7 = [(UIFont *)self fontDescriptor];
  double v8 = +[UIFont fontWithDescriptor:v7 size:v6];

  return v8;
}

+ (id)_maps_fontProviderWeight:(double)a3 minimumPointSize:(double)a4 minimumSizeCategory:(id)a5 maximumPointSize:(double)a6 maximumSizeCategory:(id)a7
{
  id v11 = a5;
  id v12 = a7;
  if (qword_10160EE88 != -1) {
    dispatch_once(&qword_10160EE88, &stru_1012ECED0);
  }
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1004DFBB0;
  v17[3] = &unk_1012ECEF8;
  double v20 = a4;
  double v21 = a3;
  id v18 = v11;
  id v19 = v12;
  double v22 = a6;
  id v13 = v12;
  id v14 = v11;
  float v15 = objc_retainBlock(v17);

  return v15;
}

+ (id)_mapsCar_fontForTextStyle:(id)a3 weight:(double)a4
{
  return [a1 _mapsCar_fontForTextStyle:a3 weight:0xFFFFFFFFLL grade:a4];
}

+ (id)_mapsCar_fontForTextStyle:(id)a3 weight:(double)a4 grade:(int)a5
{
  return _objc_msgSend(a1, "_mapsCar_fontForTextStyle:weight:grade:traits:", a3, *(void *)&a5, 0, a4);
}

+ (id)_mapsCar_fontForTextStyle:(id)a3 traits:(unsigned int)a4
{
  return _objc_msgSend(a1, "_mapsCar_fontForTextStyle:weight:grade:traits:", a3, 0xFFFFFFFFLL, *(void *)&a4, UIFontWeightRegular);
}

+ (id)_mapsCar_fontForTextStyle:(id)a3 weight:(double)a4 traits:(unsigned int)a5
{
  return _objc_msgSend(a1, "_mapsCar_fontForTextStyle:weight:grade:traits:", a3, 0xFFFFFFFFLL, *(void *)&a5, a4);
}

+ (id)_mapsCar_fontForTextStyle:(id)a3 weight:(double)a4 grade:(int)a5 traits:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v7 = *(void *)&a5;
  id v9 = a3;
  double v10 = +[NSString stringWithFormat:@"%@_w%.2f_g%d_t%d", v9, *(void *)&a4, v7, v6];
  id v11 = (void *)qword_10160F268;
  if (!qword_10160F268)
  {
    id v12 = objc_alloc_init((Class)NSCache);
    id v13 = (void *)qword_10160F268;
    qword_10160F268 = (uint64_t)v12;

    id v11 = (void *)qword_10160F268;
  }
  id v14 = [v11 objectForKey:v10];
  if (!v14)
  {
    float v15 = +[CarDisplayController sharedInstance];
    UIFontDescriptorAttributeName v16 = [v15 screenTraitCollection];
    float v17 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:v9 compatibleWithTraitCollection:v16];

    id v18 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:2];
    double v19 = UIFontWeightRegular;
    if (UIFontWeightRegular != a4)
    {
      double v20 = +[NSNumber numberWithDouble:a4];
      [v18 setObject:v20 forKeyedSubscript:UIFontWeightTrait];
    }
    if (v6)
    {
      double v21 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v6, v19);
      [v18 setObject:v21 forKeyedSubscript:UIFontSymbolicTrait];
    }
    if (v7 != -1)
    {
      double v22 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v7, v19);
      [v18 setObject:v22 forKeyedSubscript:kCTFontGradeTrait];
    }
    if ([v18 count])
    {
      UIFontDescriptorAttributeName v26 = UIFontDescriptorTraitsAttribute;
      id v27 = v18;
      double v23 = +[NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
      uint64_t v24 = [v17 fontDescriptorByAddingAttributes:v23];

      float v17 = (void *)v24;
    }
    id v14 = +[UIFont fontWithDescriptor:v17 size:0.0];
    if (v14) {
      [(id)qword_10160F268 setObject:v14 forKey:v10];
    }
  }

  return v14;
}

@end