@interface NCNotificationHighlightsSectionList
- (PLPlatterView)backgroundPlatterView;
- (id)_newGroupListForNotificationRequest:(id)a3;
- (id)_newSectionHeaderView;
- (id)backgroundViewForNotificationList:(id)a3;
- (id)materialGroupNameBase;
- (void)_configureBackgroundPlatterViewIfNecessary;
- (void)insertNotificationRequest:(id)a3;
- (void)removeNotificationRequest:(id)a3;
- (void)setBackgroundPlatterView:(id)a3;
@end

@implementation NCNotificationHighlightsSectionList

- (id)materialGroupNameBase
{
  v3 = [(NCNotificationStructuredSectionList *)self delegate];
  v4 = [v3 backgroundGroupNameBaseForNotificationListBaseComponent:self];

  return v4;
}

- (void)insertNotificationRequest:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)NCNotificationHighlightsSectionList;
  [(NCNotificationStructuredSectionList *)&v3 insertNotificationRequest:a3];
}

- (void)removeNotificationRequest:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NCNotificationHighlightsSectionList;
  [(NCNotificationStructuredSectionList *)&v5 removeNotificationRequest:a3];
  if (![(NCNotificationStructuredSectionList *)self notificationCount])
  {
    v4 = [(NCNotificationStructuredSectionList *)self listView];
    [v4 recycleVisibleViews];
  }
}

- (id)backgroundViewForNotificationList:(id)a3
{
  v4 = [(NCNotificationStructuredSectionList *)self notificationCount];
  if (v4)
  {
    [(NCNotificationHighlightsSectionList *)self _configureBackgroundPlatterViewIfNecessary];
    v4 = self->_backgroundPlatterView;
  }

  return v4;
}

- (void)_configureBackgroundPlatterViewIfNecessary
{
  if (!self->_backgroundPlatterView)
  {
    objc_super v3 = (PLPlatterView *)[objc_alloc(MEMORY[0x1E4F91460]) initWithRecipe:51];
    backgroundPlatterView = self->_backgroundPlatterView;
    self->_backgroundPlatterView = v3;

    [(PLPlatterView *)self->_backgroundPlatterView _setContinuousCornerRadius:28.0];
    objc_super v5 = self->_backgroundPlatterView;
    id v7 = [(NCNotificationStructuredSectionList *)self delegate];
    v6 = [v7 backgroundGroupNameBaseForNotificationListBaseComponent:self];
    [(PLPlatterView *)v5 setMaterialGroupNameBase:v6];
  }
}

- (id)_newGroupListForNotificationRequest:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NCNotificationHighlightsSectionList;
  return [(NCNotificationStructuredSectionList *)&v4 _newGroupListForNotificationRequest:a3];
}

- (id)_newSectionHeaderView
{
  v5.receiver = self;
  v5.super_class = (Class)NCNotificationHighlightsSectionList;
  id v2 = [(NCNotificationStructuredSectionList *)&v5 _newSectionHeaderView];
  objc_super v3 = [v2 clearButton];
  [v3 setHidden:1];

  return v2;
}

- (PLPlatterView)backgroundPlatterView
{
  return self->_backgroundPlatterView;
}

- (void)setBackgroundPlatterView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end