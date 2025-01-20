@interface LibraryConfiguration
- (BookmarksNavigationControllerDelegate)bookmarksNavigationControllerDelegate;
- (DownloadOpenHandler)downloadOpenHandler;
- (LibraryItemOpenHandler)libraryItemOpenHandler;
- (LinkPreviewProvider)linkPreviewProvider;
- (PinnedTabsManager)pinnedTabsManager;
- (SFTabIconPool)tabIconPool;
- (TabGroupProvider)tabGroupProvider;
- (_SFNavigationIntentHandling)navigationIntentHandler;
- (void)setBookmarksNavigationControllerDelegate:(id)a3;
- (void)setDownloadOpenHandler:(id)a3;
- (void)setLibraryItemOpenHandler:(id)a3;
- (void)setLinkPreviewProvider:(id)a3;
- (void)setNavigationIntentHandler:(id)a3;
- (void)setPinnedTabsManager:(id)a3;
- (void)setTabGroupProvider:(id)a3;
- (void)setTabIconPool:(id)a3;
@end

@implementation LibraryConfiguration

- (void)setTabIconPool:(id)a3
{
}

- (void)setTabGroupProvider:(id)a3
{
}

- (void)setPinnedTabsManager:(id)a3
{
}

- (void)setNavigationIntentHandler:(id)a3
{
}

- (void)setLinkPreviewProvider:(id)a3
{
}

- (void)setLibraryItemOpenHandler:(id)a3
{
}

- (void)setDownloadOpenHandler:(id)a3
{
}

- (void)setBookmarksNavigationControllerDelegate:(id)a3
{
}

- (DownloadOpenHandler)downloadOpenHandler
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_downloadOpenHandler);
  return (DownloadOpenHandler *)WeakRetained;
}

- (LinkPreviewProvider)linkPreviewProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_linkPreviewProvider);
  return (LinkPreviewProvider *)WeakRetained;
}

- (LibraryItemOpenHandler)libraryItemOpenHandler
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_libraryItemOpenHandler);
  return (LibraryItemOpenHandler *)WeakRetained;
}

- (TabGroupProvider)tabGroupProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tabGroupProvider);
  return (TabGroupProvider *)WeakRetained;
}

- (_SFNavigationIntentHandling)navigationIntentHandler
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationIntentHandler);
  return (_SFNavigationIntentHandling *)WeakRetained;
}

- (BookmarksNavigationControllerDelegate)bookmarksNavigationControllerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_bookmarksNavigationControllerDelegate);
  return (BookmarksNavigationControllerDelegate *)WeakRetained;
}

- (PinnedTabsManager)pinnedTabsManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pinnedTabsManager);
  return (PinnedTabsManager *)WeakRetained;
}

- (SFTabIconPool)tabIconPool
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tabIconPool);
  return (SFTabIconPool *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_tabIconPool);
  objc_destroyWeak((id *)&self->_pinnedTabsManager);
  objc_destroyWeak((id *)&self->_bookmarksNavigationControllerDelegate);
  objc_destroyWeak((id *)&self->_navigationIntentHandler);
  objc_destroyWeak((id *)&self->_tabGroupProvider);
  objc_destroyWeak((id *)&self->_libraryItemOpenHandler);
  objc_destroyWeak((id *)&self->_linkPreviewProvider);
  objc_destroyWeak((id *)&self->_downloadOpenHandler);
}

@end