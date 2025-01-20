@interface PRIncomingCallTextViewAdapterWrapper
+ (double)idealEmphasizedFontSizeForName:(id)a3 usingLayout:(unint64_t)a4;
- (BOOL)callIsActive;
- (BOOL)displayNameIsSuitableForVerticalLayout;
- (BOOL)isMarqueeRunning;
- (BOOL)multilineNameIsDisplayed;
- (BOOL)statusDeterminesWritingMode;
- (BOOL)statusIsSuitableForVerticalLayout;
- (BOOL)statusLabelIsHidden;
- (CGRect)frame;
- (CGRect)tightFrame;
- (CGSize)sizeThatFitsIn:(CGSize)a3;
- (CGSize)sizeThatFitsInSize:(CGSize)a3;
- (NSString)displayNameText;
- (NSString)statusText;
- (PRIncomingCallTextViewAdapterWrapper)initWithContact:(id)a3 status:(id)a4 callIsActive:(BOOL)a5;
- (PRIncomingCallTextViewAdapterWrapper)initWithGivenName:(id)a3 familyName:(id)a4;
- (PRIncomingCallTextViewAdapterWrapper)initWithGivenName:(id)a3 familyName:(id)a4 status:(id)a5;
- (PRIncomingCallTextViewAdapterWrapper)initWithGivenName:(id)a3 familyName:(id)a4 status:(id)a5 callIsActive:(BOOL)a6;
- (PRIncomingCallTextViewAdapterWrapper)initWithName:(id)a3;
- (PRIncomingCallTextViewAdapterWrapper)initWithName:(id)a3 status:(id)a4;
- (PRIncomingCallTextViewAdapterWrapper)initWithName:(id)a3 status:(id)a4 callIsActive:(BOOL)a5;
- (UIColor)textColor;
- (UIFont)emphasizedNameFont;
- (UIFont)secondaryNameFont;
- (UIFont)statusFont;
- (id)emojiViewController;
- (id)viewController;
- (unint64_t)alignment;
- (unint64_t)layout;
- (unint64_t)preferredAlignment;
- (unint64_t)preferredLayout;
- (void)overrideTitleLayoutWith:(unint64_t)a3;
- (void)posterAppearanceDidChange:(id)a3;
- (void)removeTitleLayoutOverride;
- (void)setCaptionFont:(id)a3;
- (void)setDisplayNameText:(id)a3;
- (void)setEmphasizedNameFont:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setMarqueeRunning:(BOOL)a3;
- (void)setPreferredAlignment:(unint64_t)a3;
- (void)setPreferredLayout:(unint64_t)a3;
- (void)setSecondaryNameFont:(id)a3;
- (void)setStatusFont:(id)a3;
- (void)setStatusLabelHidden:(BOOL)a3;
- (void)setStatusText:(id)a3;
- (void)setTextColor:(id)a3;
- (void)setTextFontUsingDefaultFontSizes:(id)a3;
- (void)transitionCallToActiveStateAnimated:(BOOL)a3;
@end

@implementation PRIncomingCallTextViewAdapterWrapper

+ (double)idealEmphasizedFontSizeForName:(id)a3 usingLayout:(unint64_t)a4
{
  +[PRIncomingCallFontsProvider idealEmphasizedFontSizeForName:a3 usingLayout:a4];
  return result;
}

- (BOOL)statusLabelIsHidden
{
  return [(PRIncomingCallTextViewAdapter *)self->adapter statusIsHidden];
}

- (void)setStatusLabelHidden:(BOOL)a3
{
}

- (CGRect)frame
{
  [(PRIncomingCallTextViewAdapter *)self->adapter frame];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
}

- (CGRect)tightFrame
{
  [(PRIncomingCallTextViewAdapter *)self->adapter tightFrame];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (unint64_t)preferredAlignment
{
  return [(PRIncomingCallTextViewAdapter *)self->adapter preferredAlignment];
}

- (void)setPreferredAlignment:(unint64_t)a3
{
}

- (unint64_t)preferredLayout
{
  return [(PRIncomingCallTextViewAdapter *)self->adapter preferredLayout];
}

- (void)setPreferredLayout:(unint64_t)a3
{
}

- (UIColor)textColor
{
  return [(PRIncomingCallTextViewAdapter *)self->adapter textColor];
}

- (void)setTextColor:(id)a3
{
}

- (UIFont)emphasizedNameFont
{
  return [(PRIncomingCallTextViewAdapter *)self->adapter emphasizedNameFont];
}

- (void)setEmphasizedNameFont:(id)a3
{
}

- (UIFont)secondaryNameFont
{
  return [(PRIncomingCallTextViewAdapter *)self->adapter secondaryNameFont];
}

- (void)setSecondaryNameFont:(id)a3
{
}

- (UIFont)statusFont
{
  return [(PRIncomingCallTextViewAdapter *)self->adapter statusFont];
}

- (void)setStatusFont:(id)a3
{
}

- (NSString)displayNameText
{
  return [(PRIncomingCallTextViewAdapter *)self->adapter displayNameText];
}

- (void)setDisplayNameText:(id)a3
{
}

- (NSString)statusText
{
  return [(PRIncomingCallTextViewAdapter *)self->adapter statusText];
}

- (void)setStatusText:(id)a3
{
}

- (BOOL)isMarqueeRunning
{
  return [(PRIncomingCallTextViewAdapter *)self->adapter marqueeRunning];
}

- (void)setMarqueeRunning:(BOOL)a3
{
}

- (id)viewController
{
  return [(PRIncomingCallTextViewAdapter *)self->adapter viewController];
}

- (id)emojiViewController
{
  return [(PRIncomingCallTextViewAdapter *)self->adapter emojiViewController];
}

- (unint64_t)alignment
{
  return [(PRIncomingCallTextViewAdapter *)self->adapter alignment];
}

- (unint64_t)layout
{
  return [(PRIncomingCallTextViewAdapter *)self->adapter layout];
}

- (BOOL)displayNameIsSuitableForVerticalLayout
{
  return [(PRIncomingCallTextViewAdapter *)self->adapter displayNameIsSuitableForVerticalLayout];
}

- (BOOL)statusIsSuitableForVerticalLayout
{
  return [(PRIncomingCallTextViewAdapter *)self->adapter statusIsSuitableForVerticalLayout];
}

- (BOOL)multilineNameIsDisplayed
{
  return [(PRIncomingCallTextViewAdapter *)self->adapter multilineNameIsDisplayed];
}

- (BOOL)callIsActive
{
  return [(PRIncomingCallTextViewAdapter *)self->adapter callIsActive];
}

- (PRIncomingCallTextViewAdapterWrapper)initWithName:(id)a3
{
  return [(PRIncomingCallTextViewAdapterWrapper *)self initWithName:a3 status:0 callIsActive:0];
}

- (PRIncomingCallTextViewAdapterWrapper)initWithName:(id)a3 status:(id)a4
{
  return [(PRIncomingCallTextViewAdapterWrapper *)self initWithName:a3 status:a4 callIsActive:0];
}

- (PRIncomingCallTextViewAdapterWrapper)initWithName:(id)a3 status:(id)a4 callIsActive:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PRIncomingCallTextViewAdapterWrapper;
  v10 = [(PRIncomingCallTextViewAdapterWrapper *)&v14 init];
  if (v10)
  {
    v11 = [[PRIncomingCallTextViewAdapter alloc] initWithName:v8 status:v9 callIsActive:v5];
    adapter = v10->adapter;
    v10->adapter = v11;
  }
  return v10;
}

- (PRIncomingCallTextViewAdapterWrapper)initWithContact:(id)a3 status:(id)a4 callIsActive:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PRIncomingCallTextViewAdapterWrapper;
  v10 = [(PRIncomingCallTextViewAdapterWrapper *)&v14 init];
  if (v10)
  {
    v11 = [[PRIncomingCallTextViewAdapter alloc] initWithContact:v8 status:v9 callIsActive:v5];
    adapter = v10->adapter;
    v10->adapter = v11;
  }
  return v10;
}

- (void)setTextFontUsingDefaultFontSizes:(id)a3
{
}

- (void)transitionCallToActiveStateAnimated:(BOOL)a3
{
}

- (void)overrideTitleLayoutWith:(unint64_t)a3
{
}

- (void)removeTitleLayoutOverride
{
}

- (CGSize)sizeThatFitsIn:(CGSize)a3
{
  -[PRIncomingCallTextViewAdapter sizeThatFitsIn:](self->adapter, "sizeThatFitsIn:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)sizeThatFitsInSize:(CGSize)a3
{
  -[PRIncomingCallTextViewAdapter sizeThatFitsIn:](self->adapter, "sizeThatFitsIn:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)posterAppearanceDidChange:(id)a3
{
}

- (void).cxx_destruct
{
}

- (BOOL)statusDeterminesWritingMode
{
  return 0;
}

- (PRIncomingCallTextViewAdapterWrapper)initWithGivenName:(id)a3 familyName:(id)a4
{
  return [(PRIncomingCallTextViewAdapterWrapper *)self initWithGivenName:a3 familyName:a4 status:0 callIsActive:0];
}

- (PRIncomingCallTextViewAdapterWrapper)initWithGivenName:(id)a3 familyName:(id)a4 status:(id)a5
{
  return [(PRIncomingCallTextViewAdapterWrapper *)self initWithGivenName:a3 familyName:a4 status:0 callIsActive:0];
}

- (PRIncomingCallTextViewAdapterWrapper)initWithGivenName:(id)a3 familyName:(id)a4 status:(id)a5 callIsActive:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v18.receiver = self;
  v18.super_class = (Class)PRIncomingCallTextViewAdapterWrapper;
  v13 = [(PRIncomingCallTextViewAdapterWrapper *)&v18 init];
  if (v13)
  {
    id v14 = objc_alloc_init(MEMORY[0x1E4F1BA40]);
    [v14 setGivenName:v10];
    [v14 setFamilyName:v11];
    v15 = [[PRIncomingCallTextViewAdapter alloc] initWithContact:v14 status:v12 callIsActive:v6];
    adapter = v13->adapter;
    v13->adapter = v15;
  }
  return v13;
}

- (void)setCaptionFont:(id)a3
{
  id v7 = a3;
  [v7 pointSize];
  double v5 = v4;
  +[PRIncomingCallFontsProvider defaultStatusFontSize];
  if (v5 == v6) {
    [(PRIncomingCallTextViewAdapterWrapper *)self setStatusFont:v7];
  }
  else {
    [(PRIncomingCallTextViewAdapterWrapper *)self setSecondaryNameFont:v7];
  }
}

@end