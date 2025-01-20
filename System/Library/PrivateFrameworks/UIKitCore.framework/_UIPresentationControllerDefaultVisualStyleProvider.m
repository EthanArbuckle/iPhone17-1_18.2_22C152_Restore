@interface _UIPresentationControllerDefaultVisualStyleProvider
+ (id)sharedInstance;
- (Class)presentationControllerClassForModalPresentationStyle:(int64_t)a3 inIdiom:(int64_t)a4;
- (NSMutableDictionary)providerByIdiom;
- (_UIPresentationControllerNullVisualStyleProvider)fallbackProvider;
- (_UISheetPresentationMetrics)defaultSheetMetrics;
- (id)_init;
- (id)_providerForIdiom:(int64_t)a3;
- (id)_providerForPresentationController:(id)a3;
- (id)_providerForViewController:(id)a3;
- (id)defaultStyleForPresentationController:(id)a3;
- (id)presentationControllerForPresentedViewController:(id)a3;
- (id)presentationControllerForPresentedViewController:(id)a3 inIdiom:(int64_t)a4;
- (id)styleForAlertPresentationController:(id)a3;
- (id)styleForPopoverPresentationController:(id)a3;
- (id)styleForRootPresentationController:(id)a3;
- (id)styleForSearchPresentationController:(id)a3;
- (id)styleForSheetPresentationController:(id)a3;
- (int64_t)defaultConcretePresentationStyleForViewController:(id)a3;
- (int64_t)defaultConcreteTransitionStyleForViewController:(id)a3;
- (void)registerVisualStyleProvider:(id)a3 forIdiom:(int64_t)a4;
- (void)setFallbackProvider:(id)a3;
- (void)setProviderByIdiom:(id)a3;
@end

@implementation _UIPresentationControllerDefaultVisualStyleProvider

- (int64_t)defaultConcreteTransitionStyleForViewController:(id)a3
{
  id v4 = a3;
  v5 = +[UIDevice currentDevice];
  -[_UIPresentationControllerDefaultVisualStyleProvider _providerForIdiom:](self, "_providerForIdiom:", [v5 userInterfaceIdiom]);
  v6 = (_UIPresentationControllerNullVisualStyleProvider *)objc_claimAutoreleasedReturnValue();

  char v7 = objc_opt_respondsToSelector();
  fallbackProvider = v6;
  if ((v7 & 1) == 0) {
    fallbackProvider = self->_fallbackProvider;
  }
  int64_t v9 = [(_UIPresentationControllerNullVisualStyleProvider *)fallbackProvider defaultConcreteTransitionStyleForViewController:v4];

  return v9;
}

+ (id)sharedInstance
{
  if (qword_1EB261E98 != -1) {
    dispatch_once(&qword_1EB261E98, &__block_literal_global_115_1);
  }
  v2 = (void *)qword_1EB261EA0;
  return v2;
}

- (int64_t)defaultConcretePresentationStyleForViewController:(id)a3
{
  id v4 = a3;
  v5 = [(_UIPresentationControllerDefaultVisualStyleProvider *)self _providerForViewController:v4];
  char v6 = objc_opt_respondsToSelector();
  fallbackProvider = v5;
  if ((v6 & 1) == 0) {
    fallbackProvider = self->_fallbackProvider;
  }
  int64_t v8 = [(_UIPresentationControllerNullVisualStyleProvider *)fallbackProvider defaultConcretePresentationStyleForViewController:v4];

  return v8;
}

- (_UISheetPresentationMetrics)defaultSheetMetrics
{
  v3 = +[UIDevice currentDevice];
  -[_UIPresentationControllerDefaultVisualStyleProvider _providerForIdiom:](self, "_providerForIdiom:", [v3 userInterfaceIdiom]);
  id v4 = (_UIPresentationControllerNullVisualStyleProvider *)objc_claimAutoreleasedReturnValue();

  char v5 = objc_opt_respondsToSelector();
  fallbackProvider = v4;
  if ((v5 & 1) == 0) {
    fallbackProvider = self->_fallbackProvider;
  }
  char v7 = [(_UIPresentationControllerNullVisualStyleProvider *)fallbackProvider defaultSheetMetrics];

  return (_UISheetPresentationMetrics *)v7;
}

- (id)_providerForViewController:(id)a3
{
  id v4 = [a3 traitCollection];
  char v5 = -[_UIPresentationControllerDefaultVisualStyleProvider _providerForIdiom:](self, "_providerForIdiom:", [v4 userInterfaceIdiom]);

  return v5;
}

- (id)_providerForIdiom:(int64_t)a3
{
  providerByIdiom = self->_providerByIdiom;
  char v5 = [NSNumber numberWithInteger:a3];
  fallbackProvider = [(NSMutableDictionary *)providerByIdiom objectForKeyedSubscript:v5];
  char v7 = fallbackProvider;
  if (!fallbackProvider) {
    fallbackProvider = self->_fallbackProvider;
  }
  id v8 = fallbackProvider;

  return v8;
}

- (id)styleForRootPresentationController:(id)a3
{
  id v4 = a3;
  char v5 = [(_UIPresentationControllerDefaultVisualStyleProvider *)self _providerForPresentationController:v4];
  char v6 = [v5 styleForRootPresentationController:v4];

  return v6;
}

- (id)_providerForPresentationController:(id)a3
{
  id v4 = [a3 traitCollection];
  char v5 = -[_UIPresentationControllerDefaultVisualStyleProvider _providerForIdiom:](self, "_providerForIdiom:", [v4 userInterfaceIdiom]);

  return v5;
}

- (id)presentationControllerForPresentedViewController:(id)a3
{
  id v4 = a3;
  char v5 = [v4 traitCollection];
  char v6 = -[_UIPresentationControllerDefaultVisualStyleProvider presentationControllerForPresentedViewController:inIdiom:](self, "presentationControllerForPresentedViewController:inIdiom:", v4, [v5 userInterfaceIdiom]);

  return v6;
}

- (id)presentationControllerForPresentedViewController:(id)a3 inIdiom:(int64_t)a4
{
  id v6 = a3;
  char v7 = [(_UIPresentationControllerDefaultVisualStyleProvider *)self _providerForIdiom:a4];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v8 = [v7 presentationControllerForPresentedViewController:v6 inIdiom:a4];
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
LABEL_6:
      char v10 = objc_opt_respondsToSelector();
      fallbackProvider = self->_fallbackProvider;
      if (v10) {
        [(_UIPresentationControllerNullVisualStyleProvider *)fallbackProvider presentationControllerForPresentedViewController:v6 inIdiom:a4];
      }
      else {
      int64_t v9 = [(_UIPresentationControllerNullVisualStyleProvider *)fallbackProvider presentationControllerForPresentedViewController:v6];
      }
      goto LABEL_10;
    }
    uint64_t v8 = [v7 presentationControllerForPresentedViewController:v6];
  }
  int64_t v9 = (void *)v8;
  if (!v8) {
    goto LABEL_6;
  }
LABEL_10:

  return v9;
}

- (id)_init
{
  v8.receiver = self;
  v8.super_class = (Class)_UIPresentationControllerDefaultVisualStyleProvider;
  v2 = [(_UIPresentationControllerDefaultVisualStyleProvider *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    providerByIdiom = v2->_providerByIdiom;
    v2->_providerByIdiom = (NSMutableDictionary *)v3;

    char v5 = objc_alloc_init(_UIPresentationControllerNullVisualStyleProvider);
    fallbackProvider = v2->_fallbackProvider;
    v2->_fallbackProvider = v5;
  }
  return v2;
}

- (id)defaultStyleForPresentationController:(id)a3
{
  id v4 = a3;
  char v5 = [(_UIPresentationControllerDefaultVisualStyleProvider *)self _providerForPresentationController:v4];
  id v6 = [v5 defaultStyleForPresentationController:v4];

  return v6;
}

- (id)styleForSheetPresentationController:(id)a3
{
  id v4 = a3;
  char v5 = [(_UIPresentationControllerDefaultVisualStyleProvider *)self _providerForPresentationController:v4];
  id v6 = [v5 styleForSheetPresentationController:v4];

  return v6;
}

- (id)styleForPopoverPresentationController:(id)a3
{
  id v4 = a3;
  char v5 = [(_UIPresentationControllerDefaultVisualStyleProvider *)self _providerForPresentationController:v4];
  id v6 = [v5 styleForPopoverPresentationController:v4];

  return v6;
}

- (void)registerVisualStyleProvider:(id)a3 forIdiom:(int64_t)a4
{
  providerByIdiom = self->_providerByIdiom;
  id v6 = NSNumber;
  id v7 = a3;
  id v8 = [v6 numberWithInteger:a4];
  [(NSMutableDictionary *)providerByIdiom setObject:v7 forKeyedSubscript:v8];
}

- (id)styleForAlertPresentationController:(id)a3
{
  id v4 = a3;
  char v5 = [(_UIPresentationControllerDefaultVisualStyleProvider *)self _providerForPresentationController:v4];
  id v6 = [v5 styleForAlertPresentationController:v4];

  return v6;
}

- (id)styleForSearchPresentationController:(id)a3
{
  id v4 = a3;
  char v5 = [(_UIPresentationControllerDefaultVisualStyleProvider *)self _providerForPresentationController:v4];
  id v6 = [v5 styleForSearchPresentationController:v4];

  return v6;
}

- (Class)presentationControllerClassForModalPresentationStyle:(int64_t)a3 inIdiom:(int64_t)a4
{
  id v7 = [(_UIPresentationControllerDefaultVisualStyleProvider *)self _providerForIdiom:a4];
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (id v8 = (objc_class *)[v7 presentationControllerClassForModalPresentationStyle:a3 inIdiom:a4]) == 0)
  {
    id v8 = [(_UIPresentationControllerNullVisualStyleProvider *)self->_fallbackProvider presentationControllerClassForModalPresentationStyle:a3 inIdiom:a4];
  }
  int64_t v9 = v8;

  return v9;
}

- (NSMutableDictionary)providerByIdiom
{
  return self->_providerByIdiom;
}

- (void)setProviderByIdiom:(id)a3
{
}

- (_UIPresentationControllerNullVisualStyleProvider)fallbackProvider
{
  return self->_fallbackProvider;
}

- (void)setFallbackProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fallbackProvider, 0);
  objc_storeStrong((id *)&self->_providerByIdiom, 0);
}

@end