@interface ChildItemButton
+ (UIEdgeInsets)contentEdgeInsets;
+ (UIFont)buttonTitleFont;
+ (id)button;
+ (id)buttonTitleWithChildAction:(id)a3;
+ (id)buttonTitleWithChildItem:(id)a3;
- (ChildItemButtonDelegate)delegate;
- (GEOMapItemChildItem)childItem;
- (void)_buttonAction;
- (void)_setAttributes;
- (void)setChildItem:(id)a3;
- (void)setDelegate:(id)a3;
- (void)updateTheme;
@end

@implementation ChildItemButton

+ (id)button
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___ChildItemButton;
  v2 = [super buttonWithType:0];
  [v2 _setAttributes];

  return v2;
}

+ (UIEdgeInsets)contentEdgeInsets
{
  double v2 = 9.5;
  double v3 = 4.0;
  double v4 = 12.5;
  double v5 = 4.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)_setAttributes
{
  [(ChildItemButton *)self setClipsToBounds:1];
  double v3 = [(ChildItemButton *)self layer];
  [v3 setCornerRadius:8.0];

  double v4 = [(ChildItemButton *)self titleLabel];
  +[DynamicTypeWizard autorefreshLabel:v4 withFontProvider:&stru_10131A5A0];

  double v5 = [(ChildItemButton *)self titleLabel];
  [v5 setLineBreakMode:4];

  v6 = [(ChildItemButton *)self theme];
  v7 = [v6 keyColor];
  [(ChildItemButton *)self setTitleColor:v7 forState:0];

  [(id)objc_opt_class() contentEdgeInsets];
  -[ChildItemButton setContentEdgeInsets:](self, "setContentEdgeInsets:");

  [(ChildItemButton *)self addTarget:self action:"_buttonAction" forControlEvents:0x2000];
}

- (void)updateTheme
{
  id v4 = [(ChildItemButton *)self theme];
  double v3 = [v4 childItemButtonBackgroundColor];
  [(ChildItemButton *)self setBackgroundColor:v3];
}

- (void)_buttonAction
{
  id v4 = [(ChildItemButton *)self delegate];
  double v3 = [(ChildItemButton *)self childItem];
  [v4 didTapChildItemButtonForChildItem:v3];
}

- (void)setChildItem:(id)a3
{
  v6 = (GEOMapItemChildItem *)a3;
  if (self->_childItem != v6)
  {
    objc_storeStrong((id *)&self->_childItem, a3);
    double v5 = [(id)objc_opt_class() buttonTitleWithChildItem:v6];
    [(ChildItemButton *)self setTitle:v5 forState:0];
  }
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);

  v6 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)p_delegate, obj);
    v6 = obj;
  }
}

+ (UIFont)buttonTitleFont
{
  if (sub_10072FF94()) {
    +[UIFont system13];
  }
  else {
  double v2 = +[UIFont system15];
  }

  return (UIFont *)v2;
}

+ (id)buttonTitleWithChildItem:(id)a3
{
  id v4 = a3;
  id v5 = [v4 childItemType];
  if (v5 == (id)3)
  {
    v8 = [v4 publisherResult];
    v9 = [v8 publisher];
    id v10 = [v9 totalCollectionCount];

    if (!v10) {
      goto LABEL_13;
    }
    v11 = +[NSBundle mainBundle];
    v12 = v11;
    if (v10 == (id)1) {
      CFStringRef v13 = @"Guide_One [Autocomplete]";
    }
    else {
      CFStringRef v13 = @"Guide_Many [Autocomplete]";
    }
    v6 = [v11 localizedStringForKey:v13 value:@"localized string not found" table:0];

    uint64_t v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v6, v10);
  }
  else if (v5 == (id)2)
  {
    v6 = [v4 childItemAction];
    uint64_t v7 = [a1 buttonTitleWithChildAction:v6];
  }
  else
  {
    if (v5 != (id)1)
    {
      id v10 = 0;
      goto LABEL_13;
    }
    v6 = [v4 childItemPlace];
    uint64_t v7 = [v6 name];
  }
  id v10 = (id)v7;

LABEL_13:

  return v10;
}

+ (id)buttonTitleWithChildAction:(id)a3
{
  id v3 = a3;
  switch((unint64_t)[v3 childActionType])
  {
    case 1uLL:
      id v4 = +[NSBundle mainBundle];
      id v5 = v4;
      CFStringRef v6 = @"Directions [Autocomplete]";
      goto LABEL_17;
    case 2uLL:
      uint64_t v7 = +[VKPlatform sharedPlatform];
      unsigned int v8 = [v7 supportsARMode];

      id v4 = +[NSBundle mainBundle];
      id v5 = v4;
      if (v8) {
        CFStringRef v6 = @"Flyover [Autocomplete]";
      }
      else {
        CFStringRef v6 = @"Flyover Tour [Autocomplete]";
      }
      goto LABEL_17;
    case 3uLL:
      id v5 = [v3 childActionSearch];
      uint64_t v9 = [v5 displayString];
      goto LABEL_19;
    case 4uLL:
      id v4 = +[NSBundle mainBundle];
      id v5 = v4;
      CFStringRef v6 = @"Look Around [Autocomplete]";
      goto LABEL_17;
    case 5uLL:
      id v4 = +[NSBundle mainBundle];
      id v5 = v4;
      CFStringRef v6 = @"Call [Autocomplete]";
      goto LABEL_17;
    case 6uLL:
      id v4 = +[NSBundle mainBundle];
      id v5 = v4;
      CFStringRef v6 = @"Website [Autocomplete]";
LABEL_17:
      CFStringRef v10 = 0;
      goto LABEL_18;
    case 7uLL:
      v12 = [v3 guideLocation];
      id v13 = [v12 numberOfGuides];
      v14 = +[NSBundle mainBundle];
      v15 = v14;
      if (v13 == (id)1) {
        CFStringRef v16 = @"Guide_One [Autocomplete]";
      }
      else {
        CFStringRef v16 = @"Guide_Many [Autocomplete]";
      }
      id v5 = [v14 localizedStringForKey:v16 value:@"localized string not found" table:0];

      v17 = [v3 guideLocation];
      v11 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v5, [v17 numberOfGuides]);

      goto LABEL_20;
    case 8uLL:
      id v4 = +[NSBundle mainBundle];
      id v5 = v4;
      CFStringRef v6 = @"[Autocomplete] Download Offline";
      CFStringRef v10 = @"Offline";
LABEL_18:
      uint64_t v9 = [v4 localizedStringForKey:v6 value:@"localized string not found" table:v10];
LABEL_19:
      v11 = (void *)v9;
LABEL_20:

      break;
    default:
      v11 = 0;
      break;
  }

  return v11;
}

- (GEOMapItemChildItem)childItem
{
  return self->_childItem;
}

- (ChildItemButtonDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ChildItemButtonDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_childItem, 0);
}

@end