@interface TabDocumentActivity
- (BOOL)canPerformOnNewTabPage;
- (BOOL)canPerformWithActivityItems:(id)a3;
- (BOOL)canPerformWithTabDocument:(id)a3;
- (TabDocument)tabDocument;
- (id)_activityImage;
- (id)_embeddedActivityViewController;
- (id)_systemImageName;
- (id)activityImageWithTabDocument:(id)a3;
- (id)activityTitle;
- (id)activityTitleWithTabDocument:(id)a3;
- (id)embeddedActivityViewControllerWithTabDocument:(id)a3;
- (id)systemImageNameWithTabDocument:(id)a3;
- (int64_t)actionType;
- (int64_t)actionTypeWithTabDocument:(id)a3;
- (void)_prepareWithActivityItems:(id)a3 completion:(id)a4;
- (void)performActivity;
- (void)prepareWithTabDocument:(id)a3 completion:(id)a4;
@end

@implementation TabDocumentActivity

- (id)activityTitle
{
  return [(TabDocumentActivity *)self activityTitleWithTabDocument:self->_tabDocument];
}

- (id)activityTitleWithTabDocument:(id)a3
{
  return &stru_1F3C268E8;
}

- (id)_systemImageName
{
  return [(TabDocumentActivity *)self systemImageNameWithTabDocument:self->_tabDocument];
}

- (id)systemImageNameWithTabDocument:(id)a3
{
  return 0;
}

- (id)_activityImage
{
  return [(TabDocumentActivity *)self activityImageWithTabDocument:self->_tabDocument];
}

- (id)activityImageWithTabDocument:(id)a3
{
  return 0;
}

- (int64_t)actionType
{
  return [(TabDocumentActivity *)self actionTypeWithTabDocument:self->_tabDocument];
}

- (int64_t)actionTypeWithTabDocument:(id)a3
{
  return 0;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  objc_msgSend(a3, "safari_firstObjectPassingTest:", &__block_literal_global_37);
  v4 = (TabDocument *)objc_claimAutoreleasedReturnValue();
  tabDocument = self->_tabDocument;
  self->_tabDocument = v4;

  BOOL v6 = [(TabDocument *)self->_tabDocument isShowingStartPageOverriddenByExtension];
  if (![(TabDocumentActivity *)self canPerformOnNewTabPage]
    && ([(TabDocument *)self->_tabDocument isBlank] || v6)
    || !self->_tabDocument)
  {
    return 0;
  }
  return -[TabDocumentActivity canPerformWithTabDocument:](self, "canPerformWithTabDocument:");
}

uint64_t __51__TabDocumentActivity_canPerformWithActivityItems___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)canPerformOnNewTabPage
{
  return 0;
}

- (BOOL)canPerformWithTabDocument:(id)a3
{
  return 1;
}

- (void)_prepareWithActivityItems:(id)a3 completion:(id)a4
{
  id v8 = a4;
  objc_msgSend(a3, "safari_firstObjectPassingTest:", &__block_literal_global_3_1);
  BOOL v6 = (TabDocument *)objc_claimAutoreleasedReturnValue();
  tabDocument = self->_tabDocument;
  self->_tabDocument = v6;

  [(TabDocumentActivity *)self prepareWithTabDocument:self->_tabDocument completion:v8];
}

uint64_t __60__TabDocumentActivity__prepareWithActivityItems_completion___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)prepareWithTabDocument:(id)a3 completion:(id)a4
{
  BOOL v6 = (void (**)(void))a4;
  [(TabDocumentActivity *)self prepareWithTabDocument:a3];
  v6[2]();
}

- (void)performActivity
{
  [(TabDocumentActivity *)self performActivityWithTabDocument:self->_tabDocument];
  id v4 = [(_SFActivity *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    v3 = [MEMORY[0x1E4F97E48] sharedLogger];
    objc_msgSend(v3, "_sf_didPerformFormatMenuAction:provenance:", -[TabDocumentActivity actionType](self, "actionType"), objc_msgSend(v4, "provenanceForSafariActivity:", self));
  }
}

- (id)_embeddedActivityViewController
{
  return [(TabDocumentActivity *)self embeddedActivityViewControllerWithTabDocument:self->_tabDocument];
}

- (id)embeddedActivityViewControllerWithTabDocument:(id)a3
{
  return 0;
}

- (TabDocument)tabDocument
{
  return self->_tabDocument;
}

- (void).cxx_destruct
{
}

@end