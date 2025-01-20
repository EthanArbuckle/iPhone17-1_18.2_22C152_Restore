@interface PGControlsViewModelValues
+ (id)defaultPrerollTintColor;
- (BOOL)_BOOLForKey:(id)a3;
- (BOOL)actionButtonsWantBackground;
- (BOOL)cancelButtonWantsBackground;
- (BOOL)controlsShouldAutoHide;
- (BOOL)includesActionButton;
- (BOOL)includesCancelButton;
- (BOOL)includesContentLoadingIndicator;
- (BOOL)includesDoubleDoubleTapGestureRecognizer;
- (BOOL)includesDoubleTapGestureRecognizer;
- (BOOL)includesLiveIndicatorBadge;
- (BOOL)includesProgressBar;
- (BOOL)includesRestoreButton;
- (BOOL)includesSingleTapGestureRecognizer;
- (BOOL)includesSkipBackButton;
- (BOOL)includesSkipForwardButton;
- (BOOL)includesWaitingToPlayIndicator;
- (BOOL)isActionButtonEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPrerollActive;
- (BOOL)isSkipBackButtonEnabled;
- (BOOL)isSkipForwardButtonEnabled;
- (BOOL)progressBarShouldUpdate;
- (BOOL)restoreButtonWantsBackground;
- (NSMutableDictionary)dictionaryRepresentation;
- (NSString)actionButtonAccessibilityIdentifier;
- (NSString)actionButtonSystemImageName;
- (NSString)cancelButtonAccessibilityIdentifier;
- (NSString)cancelButtonCustomText;
- (NSString)cancelButtonSystemImageName;
- (NSString)restoreButtonAccessibilityIdentifier;
- (NSString)restoreButtonSystemImageName;
- (NSString)skipBackButtonAccessibilityIdentifier;
- (NSString)skipBackButtonSystemImageName;
- (NSString)skipForwardButtonAccessibilityIdentifier;
- (NSString)skipForwardButtonSystemImageName;
- (PGControlsViewModelValues)init;
- (PGControlsViewModelValues)initWithDictionaryRepresentation:(id)a3;
- (PGPlaybackStatePrerollAttributes)prerollAttributes;
- (UIColor)actionButtonBackgroundTintColor;
- (UIColor)actionButtonImageTintColor;
- (UIColor)cancelButtonBackgroundTintColor;
- (UIColor)cancelButtonImageTintColor;
- (UIColor)prerollTintColor;
- (UIColor)skipBackButtonBackgroundTintColor;
- (UIColor)skipBackButtonImageTintColor;
- (UIColor)skipForwardButtonBackgroundTintColor;
- (UIColor)skipForwardButtonImageTintColor;
- (UIImage)cancelButtonCustomImage;
- (id)_objectForKey:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)_integerForKey:(id)a3;
- (void)setValue:(id)a3 forKey:(id)a4;
@end

@implementation PGControlsViewModelValues

+ (id)defaultPrerollTintColor
{
  return (id)[MEMORY[0x1E4F428B8] colorWithRed:0.517647059 green:0.752941176 blue:0.996078431 alpha:1.0];
}

- (NSString)restoreButtonAccessibilityIdentifier
{
  return (NSString *)[(PGControlsViewModelValues *)self _objectForKey:@"restoreButtonAccessibilityIdentifier"];
}

- (NSString)cancelButtonAccessibilityIdentifier
{
  return (NSString *)[(PGControlsViewModelValues *)self _objectForKey:@"cancelButtonAccessibilityIdentifier"];
}

- (NSString)actionButtonAccessibilityIdentifier
{
  return (NSString *)[(PGControlsViewModelValues *)self _objectForKey:@"actionButtonAccessibilityIdentifier"];
}

- (NSString)skipBackButtonAccessibilityIdentifier
{
  return (NSString *)[(PGControlsViewModelValues *)self _objectForKey:@"skipBackButtonAccessibilityIdentifier"];
}

- (NSString)skipForwardButtonAccessibilityIdentifier
{
  return (NSString *)[(PGControlsViewModelValues *)self _objectForKey:@"skipForwardButtonAccessibilityIdentifier"];
}

- (PGPlaybackStatePrerollAttributes)prerollAttributes
{
  return (PGPlaybackStatePrerollAttributes *)[(PGControlsViewModelValues *)self _objectForKey:@"prerollAttributes"];
}

- (NSString)actionButtonSystemImageName
{
  return (NSString *)[(PGControlsViewModelValues *)self _objectForKey:@"actionButtonSystemImageName"];
}

- (NSString)cancelButtonSystemImageName
{
  return (NSString *)[(PGControlsViewModelValues *)self _objectForKey:@"cancelButtonSystemImageName"];
}

- (UIColor)actionButtonImageTintColor
{
  return (UIColor *)[(PGControlsViewModelValues *)self _objectForKey:@"actionButtonImageTintColor"];
}

- (UIColor)actionButtonBackgroundTintColor
{
  return (UIColor *)[(PGControlsViewModelValues *)self _objectForKey:@"actionButtonBackgroundTintColor"];
}

- (UIColor)skipBackButtonImageTintColor
{
  return (UIColor *)[(PGControlsViewModelValues *)self _objectForKey:@"skipBackButtonImageTintColor"];
}

- (UIColor)skipBackButtonBackgroundTintColor
{
  return (UIColor *)[(PGControlsViewModelValues *)self _objectForKey:@"skipBackButtonBackgroundTintColor"];
}

- (UIColor)skipForwardButtonImageTintColor
{
  return (UIColor *)[(PGControlsViewModelValues *)self _objectForKey:@"skipForwardButtonImageTintColor"];
}

- (UIColor)skipForwardButtonBackgroundTintColor
{
  return (UIColor *)[(PGControlsViewModelValues *)self _objectForKey:@"skipForwardButtonBackgroundTintColor"];
}

- (UIColor)cancelButtonImageTintColor
{
  return (UIColor *)[(PGControlsViewModelValues *)self _objectForKey:@"cancelButtonImageTintColor"];
}

- (UIColor)cancelButtonBackgroundTintColor
{
  return (UIColor *)[(PGControlsViewModelValues *)self _objectForKey:@"cancelButtonBackgroundTintColor"];
}

- (NSString)skipBackButtonSystemImageName
{
  return (NSString *)[(PGControlsViewModelValues *)self _objectForKey:@"skipBackButtonSystemImageName"];
}

- (NSString)skipForwardButtonSystemImageName
{
  return (NSString *)[(PGControlsViewModelValues *)self _objectForKey:@"skipForwardButtonSystemImageName"];
}

- (UIImage)cancelButtonCustomImage
{
  return (UIImage *)[(PGControlsViewModelValues *)self _objectForKey:@"cancelButtonCustomImage"];
}

- (NSString)cancelButtonCustomText
{
  return (NSString *)[(PGControlsViewModelValues *)self _objectForKey:@"cancelButtonCustomText"];
}

- (BOOL)cancelButtonWantsBackground
{
  return [(PGControlsViewModelValues *)self _BOOLForKey:@"cancelButtonWantsBackground"];
}

- (BOOL)restoreButtonWantsBackground
{
  return [(PGControlsViewModelValues *)self _BOOLForKey:@"restoreButtonWantsBackground"];
}

- (BOOL)actionButtonsWantBackground
{
  return [(PGControlsViewModelValues *)self _BOOLForKey:@"actionButtonsWantBackground"];
}

- (BOOL)includesRestoreButton
{
  return [(PGControlsViewModelValues *)self _BOOLForKey:@"includesRestoreButton"];
}

- (BOOL)includesContentLoadingIndicator
{
  return [(PGControlsViewModelValues *)self _BOOLForKey:@"includesContentLoadingIndicator"];
}

- (BOOL)includesWaitingToPlayIndicator
{
  return [(PGControlsViewModelValues *)self _BOOLForKey:@"includesWaitingToPlayIndicator"];
}

- (BOOL)includesCancelButton
{
  return [(PGControlsViewModelValues *)self _BOOLForKey:@"includesCancelButton"];
}

- (BOOL)includesActionButton
{
  return [(PGControlsViewModelValues *)self _BOOLForKey:@"includesActionButton"];
}

- (BOOL)includesSkipBackButton
{
  return [(PGControlsViewModelValues *)self _BOOLForKey:@"includesSkipBackButton"];
}

- (BOOL)includesSkipForwardButton
{
  return [(PGControlsViewModelValues *)self _BOOLForKey:@"includesSkipForwardButton"];
}

- (BOOL)includesLiveIndicatorBadge
{
  return [(PGControlsViewModelValues *)self _BOOLForKey:@"includesLiveIndicatorBadge"];
}

- (BOOL)includesProgressBar
{
  return [(PGControlsViewModelValues *)self _BOOLForKey:@"includesProgressBar"];
}

- (BOOL)isSkipBackButtonEnabled
{
  return [(PGControlsViewModelValues *)self _BOOLForKey:@"isSkipBackButtonEnabled"];
}

- (BOOL)isActionButtonEnabled
{
  return [(PGControlsViewModelValues *)self _BOOLForKey:@"isActionButtonEnabled"];
}

- (BOOL)isSkipForwardButtonEnabled
{
  return [(PGControlsViewModelValues *)self _BOOLForKey:@"isSkipForwardButtonEnabled"];
}

- (BOOL)includesSingleTapGestureRecognizer
{
  return [(PGControlsViewModelValues *)self _BOOLForKey:@"includesSingleTapGestureRecognizer"];
}

- (BOOL)includesDoubleTapGestureRecognizer
{
  return [(PGControlsViewModelValues *)self _BOOLForKey:@"includesDoubleTapGestureRecognizer"];
}

- (BOOL)includesDoubleDoubleTapGestureRecognizer
{
  return [(PGControlsViewModelValues *)self _BOOLForKey:@"includesDoubleDoubleTapGestureRecognizer"];
}

- (BOOL)progressBarShouldUpdate
{
  return [(PGControlsViewModelValues *)self _BOOLForKey:@"progressBarShouldUpdate"];
}

- (BOOL)controlsShouldAutoHide
{
  return [(PGControlsViewModelValues *)self _BOOLForKey:@"controlsShouldAutoHide"];
}

- (PGControlsViewModelValues)init
{
  return [(PGControlsViewModelValues *)self initWithDictionaryRepresentation:0];
}

- (PGControlsViewModelValues)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PGControlsViewModelValues;
  v5 = [(PGControlsViewModelValues *)&v11 init];
  if (v5)
  {
    v6 = (void *)[v4 mutableCopy];
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      v8 = [MEMORY[0x1E4F1CA60] dictionary];
    }
    dictionaryRepresentation = v5->_dictionaryRepresentation;
    v5->_dictionaryRepresentation = v8;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v5 = [(PGControlsViewModelValues *)self dictionaryRepresentation];
  v6 = (void *)[v4 initWithDictionaryRepresentation:v5];

  return v6;
}

- (NSString)restoreButtonSystemImageName
{
  return (NSString *)@"pip.exit";
}

- (BOOL)isPrerollActive
{
  v2 = [(PGControlsViewModelValues *)self prerollAttributes];
  BOOL v3 = v2 != 0;

  return v3;
}

- (UIColor)prerollTintColor
{
  if ([(PGControlsViewModelValues *)self isPrerollActive])
  {
    BOOL v3 = [(PGControlsViewModelValues *)self prerollAttributes];
    id v4 = [v3 preferredTintColor];
    v5 = v4;
    if (v4)
    {
      id v6 = v4;
    }
    else
    {
      id v6 = [(id)objc_opt_class() defaultPrerollTintColor];
    }
    v7 = v6;
  }
  else
  {
    v7 = 0;
  }

  return (UIColor *)v7;
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  unint64_t v10 = (unint64_t)a3;
  id v6 = a4;
  v7 = [(PGControlsViewModelValues *)self dictionaryRepresentation];
  uint64_t v8 = [v7 objectForKeyedSubscript:v6];

  if (v10 | v8 && ([(id)v8 isEqual:v10] & 1) == 0)
  {
    v9 = [(PGControlsViewModelValues *)self dictionaryRepresentation];
    [v9 setObject:v10 forKeyedSubscript:v6];
  }
}

- (BOOL)_BOOLForKey:(id)a3
{
  BOOL v3 = [(PGControlsViewModelValues *)self _objectForKey:a3];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (int64_t)_integerForKey:(id)a3
{
  BOOL v3 = [(PGControlsViewModelValues *)self _objectForKey:a3];
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (id)_objectForKey:(id)a3
{
  id v4 = a3;
  v5 = [(PGControlsViewModelValues *)self dictionaryRepresentation];
  id v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;
  v7 = [(PGControlsViewModelValues *)self dictionaryRepresentation];
  uint64_t v8 = [v6 dictionaryRepresentation];

  LOBYTE(v6) = [v7 isEqual:v8];
  return (char)v6;
}

- (NSMutableDictionary)dictionaryRepresentation
{
  return self->_dictionaryRepresentation;
}

- (void).cxx_destruct
{
}

@end