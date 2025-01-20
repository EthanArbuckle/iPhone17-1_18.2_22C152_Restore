@interface PDDiscoveryService
- (PDDiscoveryManager)discoveryManager;
- (PDDiscoveryService)initWithConnection:(id)a3;
- (PDDiscoveryService)initWithConnection:(id)a3 server:(id)a4;
- (PDRuleManager)ruleManager;
- (id)remoteObjectProxy;
- (id)remoteObjectProxyWithErrorHandler:(id)a3;
- (void)beginReportingDiscoveryAnalyticsCompletion:(id)a3;
- (void)completedCTAForItem:(id)a3;
- (void)completedDiscoveryItemCTAWithCompletion:(id)a3;
- (void)deleteRuleWithIdentifier:(id)a3 completion:(id)a4;
- (void)dialogRequestsChangedForPlacement:(id)a3;
- (void)dialogRequestsForPlacement:(id)a3 completion:(id)a4;
- (void)discoveryArticleLayoutForItemWithIdentifier:(id)a3 completion:(id)a4;
- (void)discoveryArticleLayoutsWithCompletion:(id)a3;
- (void)discoveryEngagementMessagesForPassUniqueIdentifier:(id)a3 active:(unint64_t)a4 completion:(id)a5;
- (void)discoveryItemWithIdentifier:(id)a3 callToAction:(int64_t)a4 isScrollable:(BOOL)a5 completion:(id)a6;
- (void)discoveryItemWithIdentifier:(id)a3 callToAction:(int64_t)a4 wasScrolledToTheBottom:(BOOL)a5 completion:(id)a6;
- (void)discoveryItemWithIdentifier:(id)a3 launchedWithReferralSource:(unint64_t)a4 completion:(id)a5;
- (void)discoveryItemsWithCompletion:(id)a3;
- (void)dismissDialogRequestWithIdentifier:(id)a3 forPlacement:(id)a4 completion:(id)a5;
- (void)dismissedDiscoveryItemWithIdentifier:(id)a3 callToAction:(int64_t)a4 cardSize:(int64_t)a5 completion:(id)a6;
- (void)dismissedDiscoveryItems:(id)a3;
- (void)dispatchDiscoveryRequestBlock:(id)a3 errorBlock:(id)a4;
- (void)displayedDiscoveryEngagementMessageWithIdentifier:(id)a3 completion:(id)a4;
- (void)displayedDiscoveryItemWithIdentifier:(id)a3 isWelcomeCard:(BOOL)a4 afterSwipingToCard:(BOOL)a5 multipleStoryCardsAvailable:(BOOL)a6 callToAction:(int64_t)a7 cardSize:(int64_t)a8 completion:(id)a9;
- (void)endReportingDiscoveryAnalyticsCompletion:(id)a3;
- (void)evaluateRulesWithIdentifiers:(id)a3 completion:(id)a4;
- (void)expandedDiscoveryItemWithIdentifier:(id)a3 callToAction:(int64_t)a4 afterSwipingToCard:(BOOL)a5 multipleStoryCardsAvailable:(BOOL)a6 cardSize:(int64_t)a7 completion:(id)a8;
- (void)fetchUserProperties:(id)a3 withParameters:(id)a4 completion:(id)a5;
- (void)fireEngagementEventNamed:(id)a3 completion:(id)a4;
- (void)insertDiscoveryEngagementMessages:(id)a3 completion:(id)a4;
- (void)insertDiscoveryItems:(id)a3 discoveryArticleLayouts:(id)a4 completion:(id)a5;
- (void)insertRule:(id)a3 completion:(id)a4;
- (void)manifestAllowsMiniCardsWithCompletion:(id)a3;
- (void)processDiscoveryItemsAndMessagesWithCompletion:(id)a3;
- (void)removeDiscoveryMessageWithIdentifier:(id)a3 completion:(id)a4;
- (void)removeDiscoveryUserNotificationsWithCompletion:(id)a3;
- (void)removedAllDiscoveryItemsWithCompletion:(id)a3;
- (void)rulesWithCompletion:(id)a3;
- (void)sendDiscoveryArticleLayoutsUpdated:(id)a3;
- (void)sendDiscoveryEngagementMessagesUpdated;
- (void)setDiscoveryManager:(id)a3;
- (void)setRuleManager:(id)a3;
- (void)tappedDiscoveryItemCTA:(int64_t)a3 itemIdentifier:(id)a4 cardSize:(int64_t)a5 completion:(id)a6;
- (void)updateDiscoveryEngagementMessageWithIdentifier:(id)a3 forAction:(int64_t)a4 completion:(id)a5;
- (void)updateDiscoveryItemWithIdentifier:(id)a3 forAction:(int64_t)a4 completion:(id)a5;
- (void)updateDiscoveryManifestWithCompletion:(id)a3;
@end

@implementation PDDiscoveryService

- (void)beginReportingDiscoveryAnalyticsCompletion:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100021238;
    v8[3] = &unk_10072FDC8;
    v8[4] = self;
    id v9 = v4;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10039AF40;
    v6[3] = &unk_1007378B8;
    id v7 = v9;
    [(PDDiscoveryService *)self dispatchDiscoveryRequestBlock:v8 errorBlock:v6];
  }
}

- (void)dismissedDiscoveryItems:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10000715C;
    v8[3] = &unk_10072FDC8;
    v8[4] = self;
    id v9 = v4;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100398C2C;
    v6[3] = &unk_1007378B8;
    id v7 = v9;
    [(PDDiscoveryService *)self dispatchDiscoveryRequestBlock:v8 errorBlock:v6];
  }
}

- (void)manifestAllowsMiniCardsWithCompletion:(id)a3
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000213B4;
  v6[3] = &unk_10072FDC8;
  id v7 = self;
  id v8 = a3;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100398EF0;
  v4[3] = &unk_1007378B8;
  id v5 = v8;
  id v3 = v8;
  [(PDDiscoveryService *)v7 dispatchDiscoveryRequestBlock:v6 errorBlock:v4];
}

- (void)discoveryArticleLayoutsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100007BE8;
    v8[3] = &unk_10072FDC8;
    v8[4] = self;
    id v9 = v4;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100398A34;
    v6[3] = &unk_1007378B8;
    id v7 = v9;
    [(PDDiscoveryService *)self dispatchDiscoveryRequestBlock:v8 errorBlock:v6];
  }
}

- (void)processDiscoveryItemsAndMessagesWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000077EC;
    v8[3] = &unk_10072FDC8;
    v8[4] = self;
    id v9 = v4;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1003993FC;
    v6[3] = &unk_1007378B8;
    id v7 = v9;
    [(PDDiscoveryService *)self dispatchDiscoveryRequestBlock:v8 errorBlock:v6];
  }
}

- (PDDiscoveryService)initWithConnection:(id)a3 server:(id)a4
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PDDiscoveryService;
  v6 = [(PDDiscoveryService *)&v12 initWithConnection:v5];
  if (v6)
  {
    id v7 = (PKEntitlementWhitelist *)[objc_alloc((Class)PKEntitlementWhitelist) initWithConnection:v5];
    whitelist = v6->_whitelist;
    v6->_whitelist = v7;

    v6->_entitledForDiscoveryUse = [(PKEntitlementWhitelist *)v6->_whitelist paymentAllAccess];
    id v9 = PKDiscoveryServiceInterface();
    [v5 setRemoteObjectInterface:v9];

    v10 = PDDiscoveryServiceInterface();
    [v5 setExportedInterface:v10];

    [v5 setExportedObject:v6];
  }

  return v6;
}

- (void)dispatchDiscoveryRequestBlock:(id)a3 errorBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void (**)(void, void))v7;
  if (v6)
  {
    id v9 = dispatch_get_global_queue(21, 0);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10000D920;
    v12[3] = &unk_100731BF0;
    v12[4] = self;
    id v13 = v6;
    v14 = v8;
    v10 = v12;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000D8D4;
    block[3] = &unk_10072F788;
    id v16 = v10;
    dispatch_async(v9, block);
  }
  else if (v7)
  {
    v11 = +[NSError errorWithDomain:PKDiscoveryErrorDomain code:0 userInfo:0];
    ((void (**)(void, void *))v8)[2](v8, v11);
  }
}

- (void)setRuleManager:(id)a3
{
}

- (void)setDiscoveryManager:(id)a3
{
}

- (PDDiscoveryService)initWithConnection:(id)a3
{
  return 0;
}

- (void)sendDiscoveryArticleLayoutsUpdated:(id)a3
{
  if (self->_entitledForDiscoveryUse)
  {
    id v4 = a3;
    id v5 = [(PDDiscoveryService *)self remoteObjectProxy];
    [v5 discoveryArticleLayoutsUpdated:v4];
  }
}

- (void)completedCTAForItem:(id)a3
{
  if (self->_entitledForDiscoveryUse)
  {
    id v4 = a3;
    id v5 = [(PDDiscoveryService *)self remoteObjectProxy];
    [v5 completedCTAForItem:v4];
  }
}

- (void)dialogRequestsChangedForPlacement:(id)a3
{
  if (self->_entitledForDiscoveryUse)
  {
    id v4 = a3;
    id v5 = [(PDDiscoveryService *)self remoteObjectProxy];
    [v5 dialogRequestsChangedForPlacement:v4];
  }
}

- (void)sendDiscoveryEngagementMessagesUpdated
{
  if (self->_entitledForDiscoveryUse)
  {
    id v2 = [(PDDiscoveryService *)self remoteObjectProxy];
    [v2 discoveryEngagementMessagesUpdated];
  }
}

- (id)remoteObjectProxy
{
  v4.receiver = self;
  v4.super_class = (Class)PDDiscoveryService;
  id v2 = [(PDDiscoveryService *)&v4 remoteObjectProxy];
  return v2;
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PDDiscoveryService;
  id v3 = [(PDDiscoveryService *)&v5 remoteObjectProxyWithErrorHandler:a3];
  return v3;
}

- (void)discoveryArticleLayoutForItemWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100398B68;
    v10[3] = &unk_10072E9D8;
    v10[4] = self;
    id v11 = v6;
    id v12 = v7;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100398C14;
    v8[3] = &unk_1007378B8;
    id v9 = v12;
    [(PDDiscoveryService *)self dispatchDiscoveryRequestBlock:v10 errorBlock:v8];
  }
}

- (void)updateDiscoveryItemWithIdentifier:(id)a3 forAction:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v9)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100398D68;
    v12[3] = &unk_100731AD8;
    v12[4] = self;
    id v13 = v8;
    int64_t v15 = a4;
    id v14 = v9;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100398EE0;
    v10[3] = &unk_1007378B8;
    id v11 = v14;
    [(PDDiscoveryService *)self dispatchDiscoveryRequestBlock:v12 errorBlock:v10];
  }
}

- (void)updateDiscoveryManifestWithCompletion:(id)a3
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100398FF4;
  v6[3] = &unk_10072FDC8;
  id v7 = self;
  id v8 = a3;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100399008;
  v4[3] = &unk_1007378B8;
  id v5 = v8;
  id v3 = v8;
  [(PDDiscoveryService *)v7 dispatchDiscoveryRequestBlock:v6 errorBlock:v4];
}

- (void)discoveryItemsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10039910C;
    v8[3] = &unk_10072FDC8;
    void v8[4] = self;
    id v9 = v4;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1003991B8;
    v6[3] = &unk_1007378B8;
    id v7 = v9;
    [(PDDiscoveryService *)self dispatchDiscoveryRequestBlock:v8 errorBlock:v6];
  }
}

- (void)insertDiscoveryItems:(id)a3 discoveryArticleLayouts:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10039930C;
    v13[3] = &unk_100730578;
    v13[4] = self;
    id v14 = v8;
    id v15 = v9;
    id v16 = v10;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1003993D0;
    v11[3] = &unk_1007378B8;
    id v12 = v16;
    [(PDDiscoveryService *)self dispatchDiscoveryRequestBlock:v13 errorBlock:v11];
  }
}

- (void)discoveryEngagementMessagesForPassUniqueIdentifier:(id)a3 active:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v9)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100399530;
    v12[3] = &unk_100731AD8;
    v12[4] = self;
    id v13 = v8;
    unint64_t v15 = a4;
    id v14 = v9;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1003995EC;
    v10[3] = &unk_1007378B8;
    id v11 = v14;
    [(PDDiscoveryService *)self dispatchDiscoveryRequestBlock:v12 errorBlock:v10];
  }
}

- (void)dialogRequestsForPlacement:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100399720;
    v10[3] = &unk_10072E9D8;
    void v10[4] = self;
    id v11 = v6;
    id v12 = v7;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1003997D0;
    v8[3] = &unk_1007378B8;
    id v9 = v12;
    [(PDDiscoveryService *)self dispatchDiscoveryRequestBlock:v10 errorBlock:v8];
  }
}

- (void)dismissDialogRequestWithIdentifier:(id)a3 forPlacement:(id)a4 completion:(id)a5
{
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100399924;
  v12[3] = &unk_100730578;
  id v13 = self;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100399940;
  v10[3] = &unk_1007378B8;
  id v11 = v16;
  id v7 = v16;
  id v8 = v15;
  id v9 = v14;
  [(PDDiscoveryService *)v13 dispatchDiscoveryRequestBlock:v12 errorBlock:v10];
}

- (void)updateDiscoveryEngagementMessageWithIdentifier:(id)a3 forAction:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v9)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100399A74;
    v12[3] = &unk_100731AD8;
    void v12[4] = self;
    id v13 = v8;
    int64_t v15 = a4;
    id v14 = v9;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100399BCC;
    v10[3] = &unk_1007378B8;
    id v11 = v14;
    [(PDDiscoveryService *)self dispatchDiscoveryRequestBlock:v12 errorBlock:v10];
  }
}

- (void)insertDiscoveryEngagementMessages:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100399CF8;
    v10[3] = &unk_10072E9D8;
    void v10[4] = self;
    id v11 = v6;
    id v12 = v7;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100399DA8;
    v8[3] = &unk_1007378B8;
    id v9 = v12;
    [(PDDiscoveryService *)self dispatchDiscoveryRequestBlock:v10 errorBlock:v8];
  }
}

- (void)removeDiscoveryMessageWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100399ED4;
    v10[3] = &unk_10072E9D8;
    void v10[4] = self;
    id v11 = v6;
    id v12 = v7;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100399F84;
    v8[3] = &unk_1007378B8;
    id v9 = v12;
    [(PDDiscoveryService *)self dispatchDiscoveryRequestBlock:v10 errorBlock:v8];
  }
}

- (void)displayedDiscoveryEngagementMessageWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10039A0B0;
    v10[3] = &unk_10072E9D8;
    void v10[4] = self;
    id v11 = v6;
    id v12 = v7;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10039A104;
    v8[3] = &unk_1007378B8;
    id v9 = v12;
    [(PDDiscoveryService *)self dispatchDiscoveryRequestBlock:v10 errorBlock:v8];
  }
}

- (void)displayedDiscoveryItemWithIdentifier:(id)a3 isWelcomeCard:(BOOL)a4 afterSwipingToCard:(BOOL)a5 multipleStoryCardsAvailable:(BOOL)a6 callToAction:(int64_t)a7 cardSize:(int64_t)a8 completion:(id)a9
{
  id v15 = a3;
  id v16 = a9;
  if (v16)
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10039A264;
    v19[3] = &unk_10074D560;
    v19[4] = self;
    BOOL v24 = a4;
    BOOL v25 = a5;
    BOOL v26 = a6;
    id v20 = v15;
    int64_t v22 = a7;
    int64_t v23 = a8;
    id v21 = v16;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10039A2C8;
    v17[3] = &unk_1007378B8;
    id v18 = v21;
    [(PDDiscoveryService *)self dispatchDiscoveryRequestBlock:v19 errorBlock:v17];
  }
}

- (void)expandedDiscoveryItemWithIdentifier:(id)a3 callToAction:(int64_t)a4 afterSwipingToCard:(BOOL)a5 multipleStoryCardsAvailable:(BOOL)a6 cardSize:(int64_t)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a8;
  if (v15)
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10039A420;
    v18[3] = &unk_10074D588;
    v18[4] = self;
    id v19 = v14;
    int64_t v21 = a4;
    int64_t v22 = a7;
    BOOL v23 = a5;
    BOOL v24 = a6;
    id v20 = v15;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10039A480;
    v16[3] = &unk_1007378B8;
    id v17 = v20;
    [(PDDiscoveryService *)self dispatchDiscoveryRequestBlock:v18 errorBlock:v16];
  }
}

- (void)dismissedDiscoveryItemWithIdentifier:(id)a3 callToAction:(int64_t)a4 cardSize:(int64_t)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  if (v11)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10039A5C0;
    v14[3] = &unk_100732BF0;
    v14[4] = self;
    id v15 = v10;
    int64_t v17 = a4;
    int64_t v18 = a5;
    id v16 = v11;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10039A618;
    v12[3] = &unk_1007378B8;
    id v13 = v16;
    [(PDDiscoveryService *)self dispatchDiscoveryRequestBlock:v14 errorBlock:v12];
  }
}

- (void)removedAllDiscoveryItemsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10039A71C;
    v8[3] = &unk_10072FDC8;
    void v8[4] = self;
    id v9 = v4;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10039A770;
    v6[3] = &unk_1007378B8;
    id v7 = v9;
    [(PDDiscoveryService *)self dispatchDiscoveryRequestBlock:v8 errorBlock:v6];
  }
}

- (void)tappedDiscoveryItemCTA:(int64_t)a3 itemIdentifier:(id)a4 cardSize:(int64_t)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  if (v11)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10039A8B4;
    v14[3] = &unk_100732BF0;
    v14[4] = self;
    int64_t v17 = a3;
    id v15 = v10;
    int64_t v18 = a5;
    id v16 = v11;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10039A90C;
    v12[3] = &unk_1007378B8;
    id v13 = v16;
    [(PDDiscoveryService *)self dispatchDiscoveryRequestBlock:v14 errorBlock:v12];
  }
}

- (void)completedDiscoveryItemCTAWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10039AA10;
    v8[3] = &unk_10072FDC8;
    void v8[4] = self;
    id v9 = v4;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10039AA64;
    v6[3] = &unk_1007378B8;
    id v7 = v9;
    [(PDDiscoveryService *)self dispatchDiscoveryRequestBlock:v8 errorBlock:v6];
  }
}

- (void)discoveryItemWithIdentifier:(id)a3 launchedWithReferralSource:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v9)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10039AB98;
    v12[3] = &unk_100731AD8;
    void v12[4] = self;
    id v13 = v8;
    unint64_t v15 = a4;
    id v14 = v9;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10039ABF0;
    v10[3] = &unk_1007378B8;
    id v11 = v14;
    [(PDDiscoveryService *)self dispatchDiscoveryRequestBlock:v12 errorBlock:v10];
  }
}

- (void)discoveryItemWithIdentifier:(id)a3 callToAction:(int64_t)a4 isScrollable:(BOOL)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  if (v11)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10039AD34;
    v14[3] = &unk_1007402C8;
    v14[4] = self;
    id v15 = v10;
    int64_t v17 = a4;
    BOOL v18 = a5;
    id v16 = v11;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10039AD90;
    v12[3] = &unk_1007378B8;
    id v13 = v16;
    [(PDDiscoveryService *)self dispatchDiscoveryRequestBlock:v14 errorBlock:v12];
  }
}

- (void)discoveryItemWithIdentifier:(id)a3 callToAction:(int64_t)a4 wasScrolledToTheBottom:(BOOL)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  if (v11)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10039AED4;
    v14[3] = &unk_1007402C8;
    v14[4] = self;
    id v15 = v10;
    int64_t v17 = a4;
    BOOL v18 = a5;
    id v16 = v11;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10039AF30;
    v12[3] = &unk_1007378B8;
    id v13 = v16;
    [(PDDiscoveryService *)self dispatchDiscoveryRequestBlock:v14 errorBlock:v12];
  }
}

- (void)endReportingDiscoveryAnalyticsCompletion:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10039B044;
    v8[3] = &unk_10072FDC8;
    void v8[4] = self;
    id v9 = v4;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10039B098;
    v6[3] = &unk_1007378B8;
    id v7 = v9;
    [(PDDiscoveryService *)self dispatchDiscoveryRequestBlock:v8 errorBlock:v6];
  }
}

- (void)rulesWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10039B19C;
    v8[3] = &unk_10072FDC8;
    void v8[4] = self;
    id v9 = v4;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10039B248;
    v6[3] = &unk_1007378B8;
    id v7 = v9;
    [(PDDiscoveryService *)self dispatchDiscoveryRequestBlock:v8 errorBlock:v6];
  }
}

- (void)insertRule:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10039B37C;
    v10[3] = &unk_10072E9D8;
    void v10[4] = self;
    id v11 = v6;
    id v12 = v7;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10039B3D0;
    v8[3] = &unk_1007378B8;
    id v9 = v12;
    [(PDDiscoveryService *)self dispatchDiscoveryRequestBlock:v10 errorBlock:v8];
  }
}

- (void)deleteRuleWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10039B4FC;
    v10[3] = &unk_10072E9D8;
    void v10[4] = self;
    id v11 = v6;
    id v12 = v7;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10039B550;
    v8[3] = &unk_1007378B8;
    id v9 = v12;
    [(PDDiscoveryService *)self dispatchDiscoveryRequestBlock:v10 errorBlock:v8];
  }
}

- (void)evaluateRulesWithIdentifiers:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10039B67C;
    v10[3] = &unk_10072E9D8;
    void v10[4] = self;
    id v11 = v6;
    id v12 = v7;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10039B698;
    v8[3] = &unk_1007378B8;
    id v9 = v12;
    [(PDDiscoveryService *)self dispatchDiscoveryRequestBlock:v10 errorBlock:v8];
  }
}

- (void)removeDiscoveryUserNotificationsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10039B7A4;
    v8[3] = &unk_10072FDC8;
    void v8[4] = self;
    id v9 = v4;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10039B850;
    v6[3] = &unk_1007378B8;
    id v7 = v9;
    [(PDDiscoveryService *)self dispatchDiscoveryRequestBlock:v8 errorBlock:v6];
  }
}

- (void)fetchUserProperties:(id)a3 withParameters:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10039B99C;
    v13[3] = &unk_100730578;
    v13[4] = self;
    id v14 = v8;
    id v15 = v9;
    id v16 = v10;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10039B9B8;
    v11[3] = &unk_1007378B8;
    id v12 = v16;
    [(PDDiscoveryService *)self dispatchDiscoveryRequestBlock:v13 errorBlock:v11];
  }
}

- (void)fireEngagementEventNamed:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10039BAEC;
    v10[3] = &unk_10072E9D8;
    void v10[4] = self;
    id v11 = v6;
    id v12 = v7;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10039BB08;
    v8[3] = &unk_1007378B8;
    id v9 = v12;
    [(PDDiscoveryService *)self dispatchDiscoveryRequestBlock:v10 errorBlock:v8];
  }
}

- (PDDiscoveryManager)discoveryManager
{
  return self->_discoveryManager;
}

- (PDRuleManager)ruleManager
{
  return self->_ruleManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ruleManager, 0);
  objc_storeStrong((id *)&self->_discoveryManager, 0);
  objc_storeStrong((id *)&self->_whitelist, 0);
}

@end