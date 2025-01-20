@interface SFCollaborationUnifiedBarItem
- (SFCollaborationUnifiedBarItem)init;
- (_SWCollaborationButtonView)collaborationButton;
- (id)view;
- (void)setCollaborationButton:(id)a3;
@end

@implementation SFCollaborationUnifiedBarItem

- (SFCollaborationUnifiedBarItem)init
{
  v7.receiver = self;
  v7.super_class = (Class)SFCollaborationUnifiedBarItem;
  v2 = [(SFCollaborationUnifiedBarItem *)&v7 init];
  if (v2)
  {
    v3 = objc_alloc_init(SFCollaborationUnifiedBarItemView);
    view = v2->_view;
    v2->_view = v3;

    v5 = v2;
  }

  return v2;
}

- (_SWCollaborationButtonView)collaborationButton
{
  return [(SFCollaborationUnifiedBarItemView *)self->_view collaborationButton];
}

- (void)setCollaborationButton:(id)a3
{
}

- (id)view
{
  return self->_view;
}

- (void).cxx_destruct
{
}

@end