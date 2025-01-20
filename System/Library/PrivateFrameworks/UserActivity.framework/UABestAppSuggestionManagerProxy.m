@interface UABestAppSuggestionManagerProxy
- (UABestAppSuggestionManager)weakManager;
- (void)notifyBestAppsChanged:(id)a3 when:(id)a4 confidence:(double)a5;
- (void)setWeakManager:(id)a3;
@end

@implementation UABestAppSuggestionManagerProxy

- (void)setWeakManager:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)notifyBestAppsChanged:(id)a3 when:(id)a4 confidence:(double)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [(UABestAppSuggestionManagerProxy *)self weakManager];
  [v10 notifyBestAppsChanged:v9 when:v8 confidence:a5];
}

- (UABestAppSuggestionManager)weakManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_weakManager);

  return (UABestAppSuggestionManager *)WeakRetained;
}

@end