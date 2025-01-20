@interface UIDictationSearchButton
+ (id)button;
- (int64_t)_interactionTextInputSource;
- (void)configureButtonForActiveInputType;
@end

@implementation UIDictationSearchButton

+ (id)button
{
  v2 = +[UIButton buttonWithType:0];
  [v2 configureButtonForActiveInputType];
  v3 = +[UIColor secondaryLabelColor];
  [v2 setTintColor:v3];

  [v2 setPointerInteractionEnabled:1];
  return v2;
}

- (void)configureButtonForActiveInputType
{
  id v3 = +[UIImage systemImageNamed:@"mic.fill"];
  [(UIButton *)self setImage:v3 forState:0];
}

- (int64_t)_interactionTextInputSource
{
  return 2;
}

@end