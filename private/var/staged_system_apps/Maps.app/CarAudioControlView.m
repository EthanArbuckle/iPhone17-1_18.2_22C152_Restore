@interface CarAudioControlView
- (NSArray)focusOrderSubItems;
- (NSArray)preferredFocusEnvironments;
- (double)collapsedDimension;
- (double)containerTopPositionWhenCollapsedForAudioType:(unint64_t)a3;
- (double)expandedHeight;
- (double)fullHeight;
- (double)highlightTopPosition;
- (double)highlightWidth;
- (id)accessibilityUserInputLabels;
- (id)createBackgroundView;
- (id)createButton;
- (id)preferredSymbolConfigurationForImage;
- (int)analyticsTarget;
@end

@implementation CarAudioControlView

- (id)createBackgroundView
{
  v2 = [[CarDynamicBlurView alloc] initWithBlurViewContext:0 delegate:0];

  return v2;
}

- (id)createButton
{
  v2 = +[CarFocusableButton button];
  [v2 setModifiesBackgroundColor:1];

  return v2;
}

- (id)preferredSymbolConfigurationForImage
{
  return +[UIImageSymbolConfiguration configurationWithPointSize:5 weight:10.0];
}

- (double)collapsedDimension
{
  return 28.0;
}

- (double)fullHeight
{
  return 88.0;
}

- (double)highlightWidth
{
  [(CarAudioControlView *)self collapsedDimension];
  return v2 + -3.0;
}

- (double)expandedHeight
{
  v3 = [(NavAudioControlView *)self availableAudioTypes];
  id v4 = [v3 count];

  if (v4 == (id)3)
  {
    [(CarAudioControlView *)self fullHeight];
  }
  else if (v4 == (id)2)
  {
    [(CarAudioControlView *)self collapsedDimension];
    return v6 * 2.0 + 2.0;
  }
  else if (v4 == (id)1)
  {
    [(CarAudioControlView *)self collapsedDimension];
  }
  else
  {
    return 0.0;
  }
  return result;
}

- (double)containerTopPositionWhenCollapsedForAudioType:(unint64_t)a3
{
  id v4 = [(NavAudioControlView *)self availableAudioTypes];
  v5 = +[NSNumber numberWithUnsignedInteger:a3];
  id v6 = [v4 indexOfObject:v5];

  double result = 0.0;
  if (v6 == (id)1) {
    double result = -30.0;
  }
  if (v6 == (id)2) {
    return -60.0;
  }
  return result;
}

- (double)highlightTopPosition
{
  v3 = [(NavAudioControlView *)self availableAudioTypes];
  id v4 = +[NSNumber numberWithUnsignedInteger:[(NavAudioControlView *)self currentAudioType]];
  id v5 = [v3 indexOfObject:v4];

  double result = 31.5;
  if (v5 != (id)1) {
    double result = 1.5;
  }
  if (v5 == (id)2) {
    return 60.0;
  }
  return result;
}

- (int)analyticsTarget
{
  return 1001;
}

- (NSArray)focusOrderSubItems
{
  if ([(NavAudioControlView *)self isExpanded])
  {
    v3 = [(NavAudioControlView *)self buttons];
  }
  else
  {
    id v4 = [(NavAudioControlView *)self availableAudioTypes];
    id v5 = +[NSNumber numberWithUnsignedInteger:[(NavAudioControlView *)self currentAudioType]];
    id v6 = [v4 indexOfObject:v5];

    v7 = [(NavAudioControlView *)self buttons];
    id v8 = [v7 count];

    if (v6 >= v8)
    {
      v3 = &__NSArray0__struct;
    }
    else
    {
      v9 = [(NavAudioControlView *)self buttons];
      v10 = [v9 objectAtIndexedSubscript:v6];
      v12 = v10;
      v3 = +[NSArray arrayWithObjects:&v12 count:1];
    }
  }

  return (NSArray *)v3;
}

- (NSArray)preferredFocusEnvironments
{
  v3 = [(NavAudioControlView *)self availableAudioTypes];
  id v4 = +[NSNumber numberWithUnsignedInteger:[(NavAudioControlView *)self currentAudioType]];
  id v5 = [v3 indexOfObject:v4];

  id v6 = [(NavAudioControlView *)self buttons];
  id v7 = [v6 count];

  if (v5 >= v7)
  {
    v10 = &__NSArray0__struct;
  }
  else
  {
    id v8 = [(NavAudioControlView *)self buttons];
    v9 = [v8 objectAtIndexedSubscript:v5];
    v12 = v9;
    v10 = +[NSArray arrayWithObjects:&v12 count:1];
  }

  return (NSArray *)v10;
}

- (id)accessibilityUserInputLabels
{
  double v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"CarPlay_Audio" value:@"localized string not found" table:0];
  v8[0] = v3;
  id v4 = +[NSBundle mainBundle];
  id v5 = [v4 localizedStringForKey:@"CarPlay_Speaker" value:@"localized string not found" table:0];
  v8[1] = v5;
  id v6 = +[NSArray arrayWithObjects:v8 count:2];

  return v6;
}

@end