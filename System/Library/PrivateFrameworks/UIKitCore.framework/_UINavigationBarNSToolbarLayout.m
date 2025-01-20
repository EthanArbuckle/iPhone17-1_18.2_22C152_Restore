@interface _UINavigationBarNSToolbarLayout
- (BOOL)showSidebarToggle;
- (NSArray)centerGroups;
- (NSArray)leadingGroups;
- (NSArray)trailingGroups;
- (NSString)backButtonTitle;
- (NSString)customizationIdentifier;
- (NSString)title;
- (NSURL)representedURL;
- (UIBarButtonItemGroup)pinnedTrailingGroup;
- (UIImage)backButtonImage;
- (UISearchTextField)inlineSearchTextField;
- (id)_initWithLayout:(id)a3;
- (id)backButtonHandler;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)representedDragItemsProvider;
- (int64_t)location;
- (int64_t)style;
- (void)setBackButtonHandler:(id)a3;
- (void)setBackButtonImage:(id)a3;
- (void)setBackButtonTitle:(id)a3;
- (void)setCenterGroups:(id)a3;
- (void)setCustomizationIdentifier:(id)a3;
- (void)setInlineSearchTextField:(id)a3;
- (void)setLeadingGroups:(id)a3;
- (void)setLocation:(int64_t)a3;
- (void)setPinnedTrailingGroup:(id)a3;
- (void)setRepresentedDragItemsProvider:(id)a3;
- (void)setRepresentedURL:(id)a3;
- (void)setShowSidebarToggle:(BOOL)a3;
- (void)setStyle:(int64_t)a3;
- (void)setTitle:(id)a3;
- (void)setTrailingGroups:(id)a3;
@end

@implementation _UINavigationBarNSToolbarLayout

- (id)_initWithLayout:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)_UINavigationBarNSToolbarLayout;
  v5 = [(_UINavigationBarNSToolbarLayout *)&v26 init];
  v6 = v5;
  if (v5)
  {
    v5->_style = *((void *)v4 + 2);
    v5->_location = *((void *)v4 + 3);
    uint64_t v7 = [*((id *)v4 + 4) copy];
    customizationIdentifier = v6->_customizationIdentifier;
    v6->_customizationIdentifier = (NSString *)v7;

    uint64_t v9 = [*((id *)v4 + 5) copy];
    title = v6->_title;
    v6->_title = (NSString *)v9;

    uint64_t v11 = [*((id *)v4 + 6) copy];
    representedURL = v6->_representedURL;
    v6->_representedURL = (NSURL *)v11;

    uint64_t v13 = [*((id *)v4 + 7) copy];
    id representedDragItemsProvider = v6->_representedDragItemsProvider;
    v6->_id representedDragItemsProvider = (id)v13;

    uint64_t v15 = [*((id *)v4 + 8) copy];
    leadingGroups = v6->_leadingGroups;
    v6->_leadingGroups = (NSArray *)v15;

    uint64_t v17 = [*((id *)v4 + 9) copy];
    centerGroups = v6->_centerGroups;
    v6->_centerGroups = (NSArray *)v17;

    uint64_t v19 = [*((id *)v4 + 10) copy];
    trailingGroups = v6->_trailingGroups;
    v6->_trailingGroups = (NSArray *)v19;

    uint64_t v21 = [*((id *)v4 + 12) copy];
    backButtonTitle = v6->_backButtonTitle;
    v6->_backButtonTitle = (NSString *)v21;

    objc_storeStrong((id *)&v6->_backButtonImage, *((id *)v4 + 13));
    uint64_t v23 = [*((id *)v4 + 14) copy];
    id backButtonHandler = v6->_backButtonHandler;
    v6->_id backButtonHandler = (id)v23;

    objc_storeStrong((id *)&v6->_inlineSearchTextField, *((id *)v4 + 15));
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  return (id)[v4 _initWithLayout:self];
}

- (id)description
{
  v9.receiver = self;
  v9.super_class = (Class)_UINavigationBarNSToolbarLayout;
  v3 = [(_UINavigationBarNSToolbarLayout *)&v9 description];
  id v4 = (void *)[v3 mutableCopy];

  unint64_t v5 = self->_location - 1;
  if (v5 <= 2) {
    [v4 appendString:off_1E52EFE60[v5]];
  }
  if (self->_customizationIdentifier) {
    [v4 appendFormat:@" customizationIdentifier='%@'", self->_customizationIdentifier];
  }
  if (self->_title) {
    [v4 appendFormat:@" title='%@'", self->_title];
  }
  if (self->_representedURL) {
    [v4 appendFormat:@" representedURL='%@'", self->_representedURL];
  }
  id representedDragItemsProvider = self->_representedDragItemsProvider;
  if (representedDragItemsProvider)
  {
    uint64_t v7 = _Block_copy(representedDragItemsProvider);
    [v4 appendFormat:@" representedDragItemsProvider='%@'", v7];
  }
  return v4;
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (int64_t)location
{
  return self->_location;
}

- (void)setLocation:(int64_t)a3
{
  self->_location = a3;
}

- (NSString)customizationIdentifier
{
  return self->_customizationIdentifier;
}

- (void)setCustomizationIdentifier:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSURL)representedURL
{
  return self->_representedURL;
}

- (void)setRepresentedURL:(id)a3
{
}

- (id)representedDragItemsProvider
{
  return self->_representedDragItemsProvider;
}

- (void)setRepresentedDragItemsProvider:(id)a3
{
}

- (NSArray)leadingGroups
{
  return self->_leadingGroups;
}

- (void)setLeadingGroups:(id)a3
{
}

- (NSArray)centerGroups
{
  return self->_centerGroups;
}

- (void)setCenterGroups:(id)a3
{
}

- (NSArray)trailingGroups
{
  return self->_trailingGroups;
}

- (void)setTrailingGroups:(id)a3
{
}

- (UIBarButtonItemGroup)pinnedTrailingGroup
{
  return self->_pinnedTrailingGroup;
}

- (void)setPinnedTrailingGroup:(id)a3
{
}

- (BOOL)showSidebarToggle
{
  return self->_showSidebarToggle;
}

- (void)setShowSidebarToggle:(BOOL)a3
{
  self->_showSidebarToggle = a3;
}

- (NSString)backButtonTitle
{
  return self->_backButtonTitle;
}

- (void)setBackButtonTitle:(id)a3
{
}

- (UIImage)backButtonImage
{
  return self->_backButtonImage;
}

- (void)setBackButtonImage:(id)a3
{
}

- (id)backButtonHandler
{
  return self->_backButtonHandler;
}

- (void)setBackButtonHandler:(id)a3
{
}

- (UISearchTextField)inlineSearchTextField
{
  return self->_inlineSearchTextField;
}

- (void)setInlineSearchTextField:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inlineSearchTextField, 0);
  objc_storeStrong(&self->_backButtonHandler, 0);
  objc_storeStrong((id *)&self->_backButtonImage, 0);
  objc_storeStrong((id *)&self->_backButtonTitle, 0);
  objc_storeStrong((id *)&self->_pinnedTrailingGroup, 0);
  objc_storeStrong((id *)&self->_trailingGroups, 0);
  objc_storeStrong((id *)&self->_centerGroups, 0);
  objc_storeStrong((id *)&self->_leadingGroups, 0);
  objc_storeStrong(&self->_representedDragItemsProvider, 0);
  objc_storeStrong((id *)&self->_representedURL, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_customizationIdentifier, 0);
}

@end