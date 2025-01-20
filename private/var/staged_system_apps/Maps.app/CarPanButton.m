@interface CarPanButton
+ (id)arrowImageForDirection:(int64_t)a3;
- (BOOL)canBecomeFocused;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CarPanButton)initWithDirection:(int64_t)a3;
- (NSString)description;
- (id)accessibilityUserInputLabels;
- (id)axIdentifierForDirection:(int64_t)a3;
- (int64_t)direction;
- (void)handleLongPress:(id)a3;
- (void)handleTap:(id)a3;
@end

@implementation CarPanButton

+ (id)arrowImageForDirection:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 3)
  {
    v5 = 0;
  }
  else
  {
    v5 = +[UIImage _mapsCar_systemImageNamed:textStyle:](UIImage, "_mapsCar_systemImageNamed:textStyle:", off_1012F8C80[a3 - 1], UIFontTextStyleSubheadline, v3);
  }
  return v5;
}

- (CarPanButton)initWithDirection:(int64_t)a3
{
  v5 = [(id)objc_opt_class() arrowImageForDirection:a3];
  v29.receiver = self;
  v29.super_class = (Class)CarPanButton;
  v6 = [(CarFocusableImageButton *)&v29 initWithImage:v5];
  v7 = v6;
  if (v6)
  {
    v6->_direction = a3;
    v8 = [(CarPanButton *)v6 axIdentifierForDirection:a3];
    [(CarPanButton *)v7 setAccessibilityIdentifier:v8];

    if ((unint64_t)(a3 - 3) >= 2) {
      uint64_t v9 = 0;
    }
    else {
      uint64_t v9 = 3;
    }
    [(CarFocusableImageButton *)v7 setSemanticContentAttributeForImage:v9];
    v10 = (UILongPressGestureRecognizer *)[objc_alloc((Class)UILongPressGestureRecognizer) initWithTarget:v7 action:"handleLongPress:"];
    longPressRecognizer = v7->_longPressRecognizer;
    v7->_longPressRecognizer = v10;

    [(UILongPressGestureRecognizer *)v7->_longPressRecognizer setCancelsTouchesInView:0];
    [(UILongPressGestureRecognizer *)v7->_longPressRecognizer setMinimumPressDuration:0.25];
    v12 = (UILongPressGestureRecognizer *)[objc_alloc((Class)UILongPressGestureRecognizer) initWithTarget:v7 action:"handleLongPress:"];
    physicalLongPressRecognizer = v7->_physicalLongPressRecognizer;
    v7->_physicalLongPressRecognizer = v12;

    [(UILongPressGestureRecognizer *)v7->_physicalLongPressRecognizer setAllowedPressTypes:&off_1013ADF80];
    [(UILongPressGestureRecognizer *)v7->_physicalLongPressRecognizer setMinimumPressDuration:0.25];
    v14 = (UITapGestureRecognizer *)[objc_alloc((Class)UITapGestureRecognizer) initWithTarget:v7 action:"handleTap:"];
    tapRecognizer = v7->_tapRecognizer;
    v7->_tapRecognizer = v14;

    [(UITapGestureRecognizer *)v7->_tapRecognizer setCancelsTouchesInView:0];
    [(UITapGestureRecognizer *)v7->_tapRecognizer requireGestureRecognizerToFail:v7->_longPressRecognizer];
    v16 = (UITapGestureRecognizer *)[objc_alloc((Class)UITapGestureRecognizer) initWithTarget:v7 action:"handleTap:"];
    physicalTapRecognizer = v7->_physicalTapRecognizer;
    v7->_physicalTapRecognizer = v16;

    [(UITapGestureRecognizer *)v7->_physicalTapRecognizer setAllowedPressTypes:&off_1013ADF98];
    [(UITapGestureRecognizer *)v7->_physicalTapRecognizer requireGestureRecognizerToFail:v7->_physicalLongPressRecognizer];
    [(UITapGestureRecognizer *)v7->_physicalTapRecognizer setDelegate:v7];
    v31[0] = v7->_longPressRecognizer;
    v31[1] = v7->_tapRecognizer;
    v31[2] = v7->_physicalLongPressRecognizer;
    v31[3] = v7->_physicalTapRecognizer;
    +[NSArray arrayWithObjects:v31 count:4];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    id v19 = [v18 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v26;
      do
      {
        for (i = 0; i != v20; i = (char *)i + 1)
        {
          if (*(void *)v26 != v21) {
            objc_enumerationMutation(v18);
          }
          v23 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          [v23 setAllowedTouchTypes:&off_1013ADFB0, v25];
          [(CarPanButton *)v7 addGestureRecognizer:v23];
        }
        id v20 = [v18 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v20);
    }
  }
  return v7;
}

- (void)handleLongPress:(id)a3
{
  id v5 = a3;
  if ([v5 state] == (id)1)
  {
    uint64_t v4 = 0x2000000;
LABEL_6:
    [(CarPanButton *)self sendActionsForControlEvents:v4];
    goto LABEL_7;
  }
  if ([v5 state] == (id)3 || objc_msgSend(v5, "state") == (id)4)
  {
    uint64_t v4 = 0x4000000;
    goto LABEL_6;
  }
LABEL_7:
}

- (void)handleTap:(id)a3
{
  if ([a3 state] == (id)3)
  {
    [(CarPanButton *)self sendActionsForControlEvents:0x1000000];
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3 = 28.0;
  double v4 = 28.0;
  result.height = v4;
  result.width = v3;
  return result;
}

- (NSString)description
{
  uint64_t v3 = objc_opt_class();
  double v4 = +[NSNumber numberWithInteger:[(CarPanButton *)self direction]];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@: %p; direction=%@>",
    v3,
    self,
  id v5 = v4);

  return (NSString *)v5;
}

- (id)axIdentifierForDirection:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 3) {
    CFStringRef v3 = &stru_101324E70;
  }
  else {
    CFStringRef v3 = off_1012F8CA0[a3 - 1];
  }
  return [@"CarPanButton." stringByAppendingString:v3];
}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  double v4 = (UILongPressGestureRecognizer *)a3;
  id v5 = v4;
  if (self->_longPressRecognizer == v4 || (UILongPressGestureRecognizer *)self->_tapRecognizer == v4)
  {
    BOOL v6 = 1;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CarPanButton;
    BOOL v6 = [(CarPanButton *)&v8 gestureRecognizerShouldBegin:v4];
  }

  return v6;
}

- (id)accessibilityUserInputLabels
{
  switch([(CarPanButton *)self direction])
  {
    case 1:
      v2 = +[NSBundle mainBundle];
      CFStringRef v3 = [v2 localizedStringForKey:@"CarPlay_Up" value:@"localized string not found" table:0];
      v10[0] = v3;
      double v4 = +[NSBundle mainBundle];
      id v5 = [v4 localizedStringForKey:@"CarPlay_Pan_Up" value:@"localized string not found" table:0];
      v10[1] = v5;
      BOOL v6 = v10;
      goto LABEL_7;
    case 2:
      v2 = +[NSBundle mainBundle];
      CFStringRef v3 = [v2 localizedStringForKey:@"CarPlay_Down" value:@"localized string not found" table:0];
      v9[0] = v3;
      double v4 = +[NSBundle mainBundle];
      id v5 = [v4 localizedStringForKey:@"CarPlay_Pan_Down" value:@"localized string not found" table:0];
      v9[1] = v5;
      BOOL v6 = v9;
      goto LABEL_7;
    case 3:
      v2 = +[NSBundle mainBundle];
      CFStringRef v3 = [v2 localizedStringForKey:@"CarPlay_Left" value:@"localized string not found" table:0];
      v12[0] = v3;
      double v4 = +[NSBundle mainBundle];
      id v5 = [v4 localizedStringForKey:@"CarPlay_Pan_Left" value:@"localized string not found" table:0];
      v12[1] = v5;
      BOOL v6 = v12;
      goto LABEL_7;
    case 4:
      v2 = +[NSBundle mainBundle];
      CFStringRef v3 = [v2 localizedStringForKey:@"CarPlay_Right" value:@"localized string not found" table:0];
      v11[0] = v3;
      double v4 = +[NSBundle mainBundle];
      id v5 = [v4 localizedStringForKey:@"CarPlay_Pan_Right" value:@"localized string not found" table:0];
      v11[1] = v5;
      BOOL v6 = v11;
LABEL_7:
      v7 = +[NSArray arrayWithObjects:v6 count:2];

      break;
    default:
      v7 = 0;
      break;
  }

  return v7;
}

- (int64_t)direction
{
  return self->_direction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_physicalTapRecognizer, 0);
  objc_storeStrong((id *)&self->_physicalLongPressRecognizer, 0);
  objc_storeStrong((id *)&self->_tapRecognizer, 0);

  objc_storeStrong((id *)&self->_longPressRecognizer, 0);
}

@end