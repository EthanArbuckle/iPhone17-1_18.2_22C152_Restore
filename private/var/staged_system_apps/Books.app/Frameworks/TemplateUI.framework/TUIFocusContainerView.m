@interface TUIFocusContainerView
+ (id)renderModelWithSubviewsModel:(id)a3 identifier:(id)a4 focusStyle:(id)a5 actionHandler:(id)a6 linkEntities:(id)a7;
- (BOOL)canBecomeFocused;
- (TUIFocusContainerView)initWithFrame:(CGRect)a3;
- (id)focusEffect;
- (id)focusGroupIdentifier;
- (id)keyCommands;
- (void)_handleSecondaryTapGesture:(id)a3;
- (void)_handleTapGesture:(id)a3;
- (void)applyLayoutAttributes:(id)a3;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)prepareForReuse;
- (void)tui_handleContextMenuKey:(id)a3;
- (void)tui_handleSelectKey:(id)a3;
- (void)viewDidEndDisplay;
@end

@implementation TUIFocusContainerView

+ (id)renderModelWithSubviewsModel:(id)a3 identifier:(id)a4 focusStyle:(id)a5 actionHandler:(id)a6 linkEntities:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  v16 = [[_TUIFocusContainerRenderModel alloc] initWithIdentifier:v14 submodel:v15 focusStyle:v13 actionHandler:v12 linkEntities:v11];

  return v16;
}

- (TUIFocusContainerView)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)TUIFocusContainerView;
  v3 = -[TUIContainerView initWithFrame:](&v9, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UITapGestureRecognizer *)[objc_alloc((Class)UITapGestureRecognizer) initWithTarget:v3 action:"_handleTapGesture:"];
    tapGesture = v3->_tapGesture;
    v3->_tapGesture = v4;

    [(UITapGestureRecognizer *)v3->_tapGesture setAllowedTouchTypes:&__NSArray0__struct];
    [(UITapGestureRecognizer *)v3->_tapGesture setAllowedPressTypes:&off_266350];
    [(TUIFocusContainerView *)v3 addGestureRecognizer:v3->_tapGesture];
    v6 = [[_TUISecondaryTapGestureRecognizer alloc] initWithTarget:v3 action:"_handleSecondaryTapGesture:"];
    secondaryTapGesture = v3->_secondaryTapGesture;
    v3->_secondaryTapGesture = &v6->super;

    [(TUIFocusContainerView *)v3 addGestureRecognizer:v3->_secondaryTapGesture];
  }
  return v3;
}

- (void)prepareForReuse
{
  v5.receiver = self;
  v5.super_class = (Class)TUIFocusContainerView;
  [(TUIContainerView *)&v5 prepareForReuse];
  [(TUIFocusStylingHelper *)self->_styler reset];
  styler = self->_styler;
  self->_styler = 0;

  [(TUIInteractionsHelper *)self->_interactionHelper detachInteractions];
  interactionHelper = self->_interactionHelper;
  self->_interactionHelper = 0;
}

- (void)applyLayoutAttributes:(id)a3
{
  v19.receiver = self;
  v19.super_class = (Class)TUIFocusContainerView;
  [(TUIContainerView *)&v19 applyLayoutAttributes:a3];
  styler = self->_styler;
  if (styler)
  {
    objc_super v5 = sub_13D828(self);
    v6 = [v5 focusStyle];
    [(TUIFocusStylingHelper *)styler updateStyle:v6];
  }
  else
  {
    v7 = [TUIFocusStylingHelper alloc];
    objc_super v5 = [(TUIContainerView *)self contentView];
    v6 = sub_13D828(self);
    v8 = [v6 focusStyle];
    objc_super v9 = [(TUIFocusStylingHelper *)v7 initWithContainer:self reference:v5 style:v8];
    v10 = self->_styler;
    self->_styler = v9;
  }
  interactionHelper = self->_interactionHelper;
  if (!interactionHelper)
  {
    id v12 = [[TUIInteractionsHelper alloc] initWithView:self];
    id v13 = self->_interactionHelper;
    self->_interactionHelper = v12;

    interactionHelper = self->_interactionHelper;
  }
  id v14 = sub_13D828(self);
  id v15 = [v14 linkEntities];
  [(TUIInteractionsHelper *)interactionHelper updateWithLinkEntities:v15];

  v16 = self->_interactionHelper;
  v17 = [(TUIReusableBaseView *)self feedControllerHost];
  v18 = [v17 interactionBuilder];
  [(TUIInteractionsHelper *)v16 updateInteractionsWithBuilder:v18];
}

- (void)viewDidEndDisplay
{
  [(TUIInteractionsHelper *)self->_interactionHelper detachInteractions];
  interactionHelper = self->_interactionHelper;
  self->_interactionHelper = 0;
}

- (BOOL)canBecomeFocused
{
  return [(TUIFocusStylingHelper *)self->_styler canBecomeFocused];
}

- (id)focusGroupIdentifier
{
  return [(TUIFocusStylingHelper *)self->_styler focusGroupIdentifier];
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  v7 = [v9 nextFocusedItem];

  if (v7 == self)
  {
    [(TUIFocusStylingHelper *)self->_styler activateEffectWithAnimationCoordinator:v6];
  }
  else
  {
    v8 = [v9 previouslyFocusedItem];

    if (v8 == self) {
      [(TUIFocusStylingHelper *)self->_styler deactivateEffectWithAnimationCoordinator:v6];
    }
  }
}

- (id)focusEffect
{
  return [(TUIFocusStylingHelper *)self->_styler focusEffect];
}

- (id)keyCommands
{
  v2 = sub_13D828(self);
  v3 = [v2 actionHandler];
  v4 = [v3 keyCommands];

  return v4;
}

- (void)_handleTapGesture:(id)a3
{
  sub_13D828(self);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = [v5 actionHandler];
  [v4 invoke:@"press" view:self allowRefId:1];
}

- (void)_handleSecondaryTapGesture:(id)a3
{
  id v4 = a3;
  sub_13D828(self);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = [v10 actionHandler];
  [v4 locationInView:self];
  double v7 = v6;
  double v9 = v8;

  [v5 invoke:@"context-menu" view:self point:1 allowRefId:v7];
}

- (void)tui_handleSelectKey:(id)a3
{
  sub_13D828(self);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = [v5 actionHandler];
  [v4 invoke:@"press" view:self allowRefId:1];
}

- (void)tui_handleContextMenuKey:(id)a3
{
  sub_13D828(self);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = [v5 actionHandler];
  [v4 invoke:@"context-menu" view:self allowRefId:1];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interactionHelper, 0);
  objc_storeStrong((id *)&self->_secondaryTapGesture, 0);
  objc_storeStrong((id *)&self->_tapGesture, 0);

  objc_storeStrong((id *)&self->_styler, 0);
}

@end