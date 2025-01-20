@interface SFSearchViewAppearFeedback
+ (BOOL)supportsSecureCoding;
- (BOOL)isOnLockScreen;
- (BOOL)isOverApp;
- (BOOL)isUsingLoweredSearchBar;
- (BOOL)readerTextAvailable;
- (NSString)originatingApp;
- (NSString)preexistingInput;
- (SFSearchViewAppearFeedback)initWithCoder:(id)a3;
- (SFSearchViewAppearFeedback)initWithEvent:(unint64_t)a3;
- (unint64_t)viewAppearEvent;
- (void)encodeWithCoder:(id)a3;
- (void)setIsOnLockScreen:(BOOL)a3;
- (void)setIsOverApp:(BOOL)a3;
- (void)setIsUsingLoweredSearchBar:(BOOL)a3;
- (void)setOriginatingApp:(id)a3;
- (void)setPreexistingInput:(id)a3;
- (void)setReaderTextAvailable:(BOOL)a3;
- (void)setViewAppearEvent:(unint64_t)a3;
@end

@implementation SFSearchViewAppearFeedback

- (void)setPreexistingInput:(id)a3
{
}

- (unint64_t)viewAppearEvent
{
  return self->_viewAppearEvent;
}

- (void)setReaderTextAvailable:(BOOL)a3
{
  self->_readerTextAvailable = a3;
}

- (void)setIsUsingLoweredSearchBar:(BOOL)a3
{
  self->_isUsingLoweredSearchBar = a3;
}

- (BOOL)readerTextAvailable
{
  return self->_readerTextAvailable;
}

- (NSString)preexistingInput
{
  return self->_preexistingInput;
}

- (NSString)originatingApp
{
  return self->_originatingApp;
}

- (BOOL)isUsingLoweredSearchBar
{
  return self->_isUsingLoweredSearchBar;
}

- (BOOL)isOverApp
{
  return self->_isOverApp;
}

- (BOOL)isOnLockScreen
{
  return self->_isOnLockScreen;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originatingApp, 0);
  objc_storeStrong((id *)&self->_preexistingInput, 0);
}

- (SFSearchViewAppearFeedback)initWithEvent:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SFSearchViewAppearFeedback;
  result = [(SFFeedback *)&v5 init];
  if (result) {
    result->_viewAppearEvent = a3;
  }
  return result;
}

- (void)setOriginatingApp:(id)a3
{
}

- (void)setIsOverApp:(BOOL)a3
{
  self->_isOverApp = a3;
}

- (void)setIsOnLockScreen:(BOOL)a3
{
  self->_isOnLockScreen = a3;
}

- (void)setViewAppearEvent:(unint64_t)a3
{
  self->_viewAppearEvent = a3;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SFSearchViewAppearFeedback;
  id v4 = a3;
  [(SFFeedback *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_viewAppearEvent, @"viewAppearEvent", v5.receiver, v5.super_class);
  [v4 encodeBool:self->_isOnLockScreen forKey:@"_isOnLockScreen"];
  [v4 encodeBool:self->_isOverApp forKey:@"_isOverApp"];
  [v4 encodeBool:self->_readerTextAvailable forKey:@"_readerTextAvailable"];
  [v4 encodeObject:self->_preexistingInput forKey:@"_preexistingInput"];
  [v4 encodeObject:self->_originatingApp forKey:@"_originatingApp"];
  [v4 encodeBool:self->_isUsingLoweredSearchBar forKey:@"_isUsingLoweredSearchBar"];
}

- (SFSearchViewAppearFeedback)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SFSearchViewAppearFeedback;
  objc_super v5 = [(SFFeedback *)&v11 initWithCoder:v4];
  if (v5)
  {
    v5->_viewAppearEvent = [v4 decodeIntegerForKey:@"viewAppearEvent"];
    v5->_isOnLockScreen = [v4 decodeBoolForKey:@"_isOnLockScreen"];
    v5->_isOverApp = [v4 decodeBoolForKey:@"_isOverApp"];
    v5->_readerTextAvailable = [v4 decodeBoolForKey:@"_readerTextAvailable"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_preexistingInput"];
    preexistingInput = v5->_preexistingInput;
    v5->_preexistingInput = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_originatingApp"];
    originatingApp = v5->_originatingApp;
    v5->_originatingApp = (NSString *)v8;

    v5->_isUsingLoweredSearchBar = [v4 decodeBoolForKey:@"_isUsingLoweredSearchBar"];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end