@interface PageLoadTest
- (PageLoadTest)initWithTabDocument:(id)a3;
- (PageLoadTest)initWithTabDocument:(id)a3 pagesNeedingMemoryWarningSent:(id)a4;
- (void)_enablePageLoadMeasurementCollection;
- (void)_invalidateRemoteObjects;
- (void)_setUpPageLoadTestEventsListener;
- (void)_setUpWebProcessForPageLoadMeasurementCollection;
- (void)dealloc;
- (void)didFinishPageLoadWithLoadData:(id)a3;
- (void)resetAfterWebProcessCrash;
@end

@implementation PageLoadTest

- (PageLoadTest)initWithTabDocument:(id)a3
{
  return [(PageLoadTest *)self initWithTabDocument:a3 pagesNeedingMemoryWarningSent:0];
}

- (PageLoadTest)initWithTabDocument:(id)a3 pagesNeedingMemoryWarningSent:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PageLoadTest;
  v9 = [(PageLoadTest *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_pagesNeedingMemoryWarningSent, a4);
    objc_storeStrong((id *)&v10->_tabDocument, a3);
    [(PageLoadTest *)v10 _setUpWebProcessForPageLoadMeasurementCollection];
    v11 = v10;
  }

  return v10;
}

- (void)dealloc
{
  [(PageLoadTest *)self _invalidateRemoteObjects];
  v3.receiver = self;
  v3.super_class = (Class)PageLoadTest;
  [(PageLoadTest *)&v3 dealloc];
}

- (void)_invalidateRemoteObjects
{
  objc_super v3 = [(TabDocument *)self->_tabDocument webView];
  id v5 = [v3 _remoteObjectRegistry];

  [v5 unregisterExportedObject:self interface:self->_eventsListenerInterface];
  eventsListenerInterface = self->_eventsListenerInterface;
  self->_eventsListenerInterface = 0;
}

- (void)_setUpWebProcessForPageLoadMeasurementCollection
{
  [(PageLoadTest *)self _setUpPageLoadTestEventsListener];
  [(PageLoadTest *)self _enablePageLoadMeasurementCollection];
}

- (void)_setUpPageLoadTestEventsListener
{
  objc_super v3 = [(TabDocument *)self->_tabDocument webView];
  id v6 = [v3 _remoteObjectRegistry];

  v4 = [MEMORY[0x1E4F46788] remoteObjectInterfaceWithProtocol:&unk_1F3D630A0];
  eventsListenerInterface = self->_eventsListenerInterface;
  self->_eventsListenerInterface = v4;

  [v6 registerExportedObject:self interface:self->_eventsListenerInterface];
}

- (void)_enablePageLoadMeasurementCollection
{
  objc_super v3 = [(TabDocument *)self->_tabDocument webView];
  id v7 = [v3 _remoteObjectRegistry];

  v4 = [MEMORY[0x1E4F46788] remoteObjectInterfaceWithProtocol:&unk_1F3D63100];
  id v5 = [v7 remoteObjectProxyWithInterface:v4];
  id v6 = v5;
  if (self->_pagesNeedingMemoryWarningSent) {
    objc_msgSend(v5, "enablePageMemoryMeasurementCollection:");
  }
}

- (void)resetAfterWebProcessCrash
{
  [(PageLoadTest *)self _invalidateRemoteObjects];
  [(PageLoadTest *)self _setUpWebProcessForPageLoadMeasurementCollection];
}

- (void)didFinishPageLoadWithLoadData:(id)a3
{
  tabDocument = self->_tabDocument;
  id v4 = a3;
  id v5 = [(TabDocument *)tabDocument pageLoadStatistics];
  [v5 pageLoadFinishedForTestsWK2WithLoadData:v4];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventsListenerInterface, 0);
  objc_storeStrong((id *)&self->_pagesNeedingMemoryWarningSent, 0);
  objc_storeStrong((id *)&self->_tabDocument, 0);
}

@end