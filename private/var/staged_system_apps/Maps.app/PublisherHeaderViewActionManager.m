@interface PublisherHeaderViewActionManager
- (BOOL)shouldHideApp;
- (GEOCollectionPublisherAttribution)attribution;
- (PublisherAnalytics)analyticsManager;
- (PublisherHeaderActionDelegate)actionDelegate;
- (PublisherHeaderViewActionManager)initWithAttribution:(id)a3 withActionsDelegate:(id)a4 usingAnalyticsManager:(id)a5 shouldHideAppIcon:(BOOL)a6;
- (UIButton)ellipsis;
- (UIMenu)publisherMenu;
- (id)createRowActionsWithStyle:(unint64_t)a3;
- (id)headerEllipsis;
- (id)menuForPublisher;
- (void)didTapAppButton;
- (void)didTapShareButton:(id)a3;
- (void)didTapWebsiteButton;
- (void)performAction:(id)a3 options:(id)a4 completion:(id)a5;
- (void)setActionDelegate:(id)a3;
- (void)setAnalyticsManager:(id)a3;
- (void)setAttribution:(id)a3;
- (void)setEllipsis:(id)a3;
- (void)setPublisherMenu:(id)a3;
- (void)setShouldHideApp:(BOOL)a3;
@end

@implementation PublisherHeaderViewActionManager

- (PublisherHeaderViewActionManager)initWithAttribution:(id)a3 withActionsDelegate:(id)a4 usingAnalyticsManager:(id)a5 shouldHideAppIcon:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v19.receiver = self;
  v19.super_class = (Class)PublisherHeaderViewActionManager;
  v14 = [(PublisherHeaderViewActionManager *)&v19 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_attribution, a3);
    objc_storeWeak((id *)&v15->_actionDelegate, v12);
    objc_storeStrong((id *)&v15->_analyticsManager, a5);
    v15->_shouldHideApp = a6;
    uint64_t v16 = [(PublisherHeaderViewActionManager *)v15 menuForPublisher];
    publisherMenu = v15->_publisherMenu;
    v15->_publisherMenu = (UIMenu *)v16;
  }
  return v15;
}

- (id)menuForPublisher
{
  v3 = [(PublisherHeaderViewActionManager *)self attribution];
  v4 = [v3 websiteURL];
  BOOL v5 = v4 == 0;

  v6 = +[NSMutableArray array];
  if (!v5)
  {
    objc_initWeak(&location, self);
    v7 = +[NSBundle mainBundle];
    v8 = [v7 localizedStringForKey:@"Publishers_Website_Mac_Menu_Item" value:@"localized string not found" table:0];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_1008821B4;
    v25[3] = &unk_1012E8CD0;
    objc_copyWeak(&v26, &location);
    v9 = +[UIAction actionWithTitle:v8 image:0 identifier:0 handler:v25];

    v29 = v9;
    v10 = +[NSArray arrayWithObjects:&v29 count:1];
    id v11 = +[UIMenu menuWithTitle:&stru_101324E70 image:0 identifier:0 options:1 children:v10];

    [v6 addObject:v11];
    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }
  objc_initWeak(&location, self);
  id v12 = +[NSBundle mainBundle];
  id v13 = [v12 localizedStringForKey:@"All_Guides_Mac_Menu_Item" value:@"localized string not found" table:0];
  v20 = _NSConcreteStackBlock;
  uint64_t v21 = 3221225472;
  v22 = sub_1008821F4;
  v23 = &unk_1012E8CD0;
  objc_copyWeak(&v24, &location);
  v14 = +[UIAction actionWithTitle:v13 image:0 identifier:0 handler:&v20];

  v28 = v14;
  v15 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v28, 1, v20, v21, v22, v23);
  uint64_t v16 = +[UIMenu menuWithTitle:&stru_101324E70 image:0 identifier:0 options:1 children:v15];

  [v6 addObject:v16];
  v17 = +[MapsMenuBuilder sendToDeviceAndShareMenuWithSendToDeviceEnabled:0];
  [v6 addObject:v17];

  v18 = +[UIMenu menuWithChildren:v6];

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);

  return v18;
}

- (id)createRowActionsWithStyle:(unint64_t)a3
{
  id v4 = objc_alloc_init((Class)NSMutableArray);
  BOOL v5 = [(PublisherHeaderViewActionManager *)self attribution];
  v6 = [v5 applicationAdamId];
  if ([v6 length]) {
    BOOL v7 = !self->_shouldHideApp;
  }
  else {
    BOOL v7 = 0;
  }

  v8 = [(PublisherHeaderViewActionManager *)self attribution];
  v9 = [v8 websiteURL];
  v10 = [v9 absoluteString];
  id v11 = [v10 length];

  if (v7)
  {
    id v12 = objc_alloc((Class)MKPlaceCardActionItem);
    id v13 = +[NSBundle mainBundle];
    v14 = [v13 localizedStringForKey:@"Publishers_App_Store_Action_Row" value:@"localized string not found" table:0];
    id v15 = [v12 initWithType:26 displayString:v14 glyph:@"appstore" enabled:1];

    [v4 addObject:v15];
  }
  if (v11)
  {
    id v16 = objc_alloc((Class)MKPlaceCardActionItem);
    v17 = +[NSBundle mainBundle];
    v18 = [v17 localizedStringForKey:@"Publishers_Website_Action_Row" value:@"localized string not found" table:0];
    id v19 = [v16 initWithType:7 displayString:v18 glyph:@"safari.fill" enabled:1];

    [v4 addObject:v19];
  }
  id v20 = objc_alloc((Class)MKPlaceCardActionItem);
  uint64_t v21 = +[NSBundle mainBundle];
  v22 = [v21 localizedStringForKey:@"Publishers_Share_Action_Row" value:@"localized string not found" table:0];
  id v23 = [v20 initWithType:16 displayString:v22 glyph:@"square.and.arrow.up" enabled:1];

  [v4 addObject:v23];
  id v24 = [v4 copy];

  return v24;
}

- (id)headerEllipsis
{
  v3 = +[UIButton buttonWithType:0];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v4 = +[UIImageSymbolConfiguration configurationWithPointSize:15.0];
  BOOL v5 = +[UIImage systemImageNamed:@"ellipsis" withConfiguration:v4];

  v6 = [v5 imageWithRenderingMode:2];

  [v3 setImage:v6 forState:0];
  [v3 setContextMenuInteractionEnabled:1];
  [v3 setShowsMenuAsPrimaryAction:1];
  BOOL v7 = [(PublisherHeaderViewActionManager *)self publisherMenu];
  [v3 setMenu:v7];

  v8 = [v3 heightAnchor];
  v9 = [v8 constraintEqualToConstant:24.0];
  v14[0] = v9;
  v10 = [v3 widthAnchor];
  id v11 = [v10 constraintEqualToConstant:24.0];
  v14[1] = v11;
  id v12 = +[NSArray arrayWithObjects:v14 count:2];
  +[NSLayoutConstraint activateConstraints:v12];

  [(PublisherHeaderViewActionManager *)self setEllipsis:v3];

  return v3;
}

- (void)performAction:(id)a3 options:(id)a4 completion:(id)a5
{
  id v9 = a4;
  id v7 = [a3 type];
  if (v7 == (id)7)
  {
    [(PublisherHeaderViewActionManager *)self didTapWebsiteButton];
  }
  else if (v7 == (id)26)
  {
    [(PublisherHeaderViewActionManager *)self didTapAppButton];
  }
  else if (v7 == (id)16)
  {
    v8 = [v9 objectForKeyedSubscript:@"view"];
    [(PublisherHeaderViewActionManager *)self didTapShareButton:v8];
  }
}

- (void)didTapAppButton
{
  v3 = [(PublisherHeaderViewActionManager *)self actionDelegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    BOOL v5 = [(PublisherHeaderViewActionManager *)self actionDelegate];
    [v5 didSelectAppItem];

    id v6 = [(PublisherHeaderViewActionManager *)self analyticsManager];
    [v6 publisherHeaderAppButtonTapped];
  }
}

- (void)didTapWebsiteButton
{
  v3 = [(PublisherHeaderViewActionManager *)self actionDelegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    BOOL v5 = [(PublisherHeaderViewActionManager *)self actionDelegate];
    [v5 didSelectWebsiteItem];

    id v6 = [(PublisherHeaderViewActionManager *)self analyticsManager];
    [v6 publisherHeaderWebsiteButtonTapped];
  }
}

- (void)didTapShareButton:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(PublisherHeaderViewActionManager *)self actionDelegate];
  [v5 didSelectShareFromView:v4];

  id v6 = [(PublisherHeaderViewActionManager *)self analyticsManager];
  [v6 publisherHeaderShareButtonTapped];
}

- (GEOCollectionPublisherAttribution)attribution
{
  return self->_attribution;
}

- (void)setAttribution:(id)a3
{
}

- (PublisherHeaderActionDelegate)actionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionDelegate);

  return (PublisherHeaderActionDelegate *)WeakRetained;
}

- (void)setActionDelegate:(id)a3
{
}

- (PublisherAnalytics)analyticsManager
{
  return self->_analyticsManager;
}

- (void)setAnalyticsManager:(id)a3
{
}

- (BOOL)shouldHideApp
{
  return self->_shouldHideApp;
}

- (void)setShouldHideApp:(BOOL)a3
{
  self->_shouldHideApp = a3;
}

- (UIMenu)publisherMenu
{
  return self->_publisherMenu;
}

- (void)setPublisherMenu:(id)a3
{
}

- (UIButton)ellipsis
{
  return self->_ellipsis;
}

- (void)setEllipsis:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ellipsis, 0);
  objc_storeStrong((id *)&self->_publisherMenu, 0);
  objc_storeStrong((id *)&self->_analyticsManager, 0);
  objc_destroyWeak((id *)&self->_actionDelegate);

  objc_storeStrong((id *)&self->_attribution, 0);
}

@end