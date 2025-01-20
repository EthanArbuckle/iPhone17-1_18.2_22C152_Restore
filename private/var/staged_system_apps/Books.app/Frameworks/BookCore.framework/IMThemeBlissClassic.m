@interface IMThemeBlissClassic
- (BOOL)forceNightTheme;
- (BOOL)isNight:(id)a3;
- (IMThemeBlissClassic)init;
- (id)HUDBackgroundColor;
- (id)HUDTextColor;
- (id)backgroundColorForTraitCollection:(id)a3;
- (id)backgroundColorForTraitEnvironment:(id)a3;
- (id)chevronColor;
- (id)groupedBackgroundColor;
- (id)headerTextColor;
- (id)keyColor;
- (id)linkColor;
- (id)primaryBackgroundColor;
- (id)primaryTextColor;
- (id)quarternaryTextColor;
- (id)searchBackgroundColor;
- (id)secondaryBackgroundColor;
- (id)secondaryGroupedBackgroundColor;
- (id)secondaryTextColor;
- (id)separatorColor;
- (id)switchColor;
- (id)tableViewHeaderViewColor;
- (id)tertiaryTextColor;
- (int64_t)epubTheme;
- (void)setForceNightTheme:(BOOL)a3;
@end

@implementation IMThemeBlissClassic

- (IMThemeBlissClassic)init
{
  v6.receiver = self;
  v6.super_class = (Class)IMThemeBlissClassic;
  v2 = [(IMThemePage *)&v6 init];
  if (v2)
  {
    v3 = +[UIColor whiteColor];
    [(IMTheme *)v2 setToolbarTitleColor:v3];

    v4 = +[UIColor colorWithWhite:0.909803922 alpha:1.0];
    [(IMTheme *)v2 setTableViewCellSelectedColor:v4];

    [(IMTheme *)v2 setTextHighlightType:2];
  }
  return v2;
}

- (BOOL)isNight:(id)a3
{
  return [(IMThemeBlissClassic *)self forceNightTheme];
}

- (int64_t)epubTheme
{
  return 0;
}

- (id)backgroundColorForTraitEnvironment:(id)a3
{
  return [(IMThemeBlissClassic *)self backgroundColorForTraitCollection:0];
}

- (id)backgroundColorForTraitCollection:(id)a3
{
  return +[UIColor whiteColor];
}

- (id)headerTextColor
{
  return +[UIColor whiteColor];
}

- (id)primaryBackgroundColor
{
  return +[UIColor whiteColor];
}

- (id)secondaryBackgroundColor
{
  return +[UIColor bc_booksSecondaryBackground];
}

- (id)groupedBackgroundColor
{
  return +[UIColor bc_booksGroupedBackground];
}

- (id)secondaryGroupedBackgroundColor
{
  return +[UIColor bc_booksSecondaryGroupedBackground];
}

- (id)primaryTextColor
{
  return +[UIColor bc_booksLabelColor];
}

- (id)secondaryTextColor
{
  return +[UIColor bc_booksSecondaryLabelColor];
}

- (id)tertiaryTextColor
{
  return +[UIColor bc_booksTertiaryLabelColor];
}

- (id)quarternaryTextColor
{
  return +[UIColor bc_booksQuaternaryLabelColor];
}

- (id)separatorColor
{
  return +[UIColor bc_booksSeparatorColor];
}

- (id)chevronColor
{
  return +[UIColor bc_booksChevronColor];
}

- (id)switchColor
{
  return +[UIColor bc_booksGreen];
}

- (id)linkColor
{
  return +[UIColor bc_booksCyan];
}

- (id)keyColor
{
  return +[UIColor bc_booksKeyColor];
}

- (id)HUDBackgroundColor
{
  return +[UIColor whiteColor];
}

- (id)HUDTextColor
{
  return +[UIColor blackColor];
}

- (id)tableViewHeaderViewColor
{
  return +[UIColor bc_booksSecondaryBackground];
}

- (id)searchBackgroundColor
{
  return +[UIColor bc_booksBackground];
}

- (BOOL)forceNightTheme
{
  return self->_forceNightTheme;
}

- (void)setForceNightTheme:(BOOL)a3
{
  self->_forceNightTheme = a3;
}

@end