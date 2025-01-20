@interface ReaderFormatActivity
- (BOOL)canPerformWithTabDocument:(id)a3;
- (id)_navigationControllerWithTabDocument:(id)a3;
- (id)activityTitle;
- (id)activityType;
- (id)systemImageNameWithTabDocument:(id)a3;
- (void)performActivityWithTabDocument:(id)a3;
@end

@implementation ReaderFormatActivity

- (id)activityTitle
{
  return (id)_WBSLocalizedString();
}

- (id)systemImageNameWithTabDocument:(id)a3
{
  return @"doc.text.magnifyingglass";
}

- (id)activityType
{
  return @"SafariActivityTypeReaderFormat";
}

- (BOOL)canPerformWithTabDocument:(id)a3
{
  return [a3 isShowingReader];
}

- (id)_navigationControllerWithTabDocument:(id)a3
{
  id v4 = a3;
  v5 = [(_SFActivity *)self delegate];
  if (objc_opt_respondsToSelector()) {
    uint64_t v6 = [v5 provenanceForSafariActivity:self];
  }
  else {
    uint64_t v6 = 0;
  }
  v7 = [ReaderFormatViewController alloc];
  v8 = [v4 readerContext];

  v9 = [(ReaderFormatViewController *)v7 initWithReaderContext:v8 provenance:v6];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v9];

  return v10;
}

- (void)performActivityWithTabDocument:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(_SFActivity *)self activityDidFinish:1];
  v5 = [(ReaderFormatActivity *)self _navigationControllerWithTabDocument:v4];
  uint64_t v6 = [v5 presentationController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = (void *)MEMORY[0x1E4FB22A0];
    id v8 = v6;
    v9 = [v7 _mediumDetent];
    v13[0] = v9;
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    [v8 _setDetents:v10];
  }
  v11 = [v4 browserController];
  v12 = [v11 viewControllerToPresentFrom];
  [v12 presentViewController:v5 animated:1 completion:0];
}

@end