@interface BCAMSUIBubbleTipViewController
- (AMSDialogRequest)bc_request;
- (BCAMSUIBubbleTipViewController)initWithRequest:(id)a3 placement:(id)a4;
- (BCAMSUIBubbleTipViewController)initWithRequest:(id)a3 placement:(id)a4 messageType:(int64_t)a5;
- (BOOL)isOnScreen;
- (NSDate)impressionStartTime;
- (NSString)placement;
- (id)messageId;
- (id)messagePlacement;
- (int64_t)messageType;
- (void)bc_analyticsVisibilityDidAppear;
- (void)bc_analyticsVisibilityDidDisappear;
- (void)bc_startImpressionEventTracking;
- (void)bc_submitImpressionEvent;
- (void)reportActionTriggered:(id)a3;
- (void)setBc_request:(id)a3;
- (void)setImpressionStartTime:(id)a3;
- (void)setIsOnScreen:(BOOL)a3;
- (void)setMessageType:(int64_t)a3;
- (void)setPlacement:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation BCAMSUIBubbleTipViewController

- (BCAMSUIBubbleTipViewController)initWithRequest:(id)a3 placement:(id)a4
{
  return [(BCAMSUIBubbleTipViewController *)self initWithRequest:a3 placement:a4 messageType:6];
}

- (BCAMSUIBubbleTipViewController)initWithRequest:(id)a3 placement:(id)a4 messageType:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = [(BCAMSUIBubbleTipViewController *)self initWithRequest:v8];
  v11 = v10;
  if (v10)
  {
    [(BCAMSUIBubbleTipViewController *)v10 setPlacement:v9];
    [(BCAMSUIBubbleTipViewController *)v11 setBc_request:v8];
    [(BCAMSUIBubbleTipViewController *)v11 setMessageType:a5];
    v11->_isOnScreen = 1;
  }

  return v11;
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BCAMSUIBubbleTipViewController;
  [(BCAMSUIBubbleTipViewController *)&v4 viewDidAppear:a3];
  [(BCAMSUIBubbleTipViewController *)self bc_analyticsVisibilityUpdateSubtree];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BCAMSUIBubbleTipViewController;
  [(BCAMSUIBubbleTipViewController *)&v4 viewWillDisappear:a3];
  [(BCAMSUIBubbleTipViewController *)self bc_analyticsVisibilityUpdateSubtree];
}

- (void)setIsOnScreen:(BOOL)a3
{
  if ([(BCAMSUIBubbleTipViewController *)self isOnScreen] != a3)
  {
    self->_isOnScreen = a3;
    if ([(BCAMSUIBubbleTipViewController *)self bc_analyticsVisibility])
    {
      if (!self->_isOnScreen
        || ([(BCAMSUIBubbleTipViewController *)self bc_startImpressionEventTracking],
            !self->_isOnScreen))
      {
        [(BCAMSUIBubbleTipViewController *)self bc_submitImpressionEvent];
      }
    }
  }
}

- (void)reportActionTriggered:(id)a3
{
  id v15 = a3;
  objc_super v4 = [(BCAMSUIBubbleTipViewController *)self ba_effectiveAnalyticsTracker];
  if (v4)
  {
    if ((char *)[(BCAMSUIBubbleTipViewController *)self messageType] == (char *)&dword_4 + 2)
    {
      v5 = [(BCAMSUIBubbleTipViewController *)self presentingViewController];
      [(BCAMSUIBubbleTipViewController *)self setMessageType:v5 == 0];
    }
    v6 = [(BCAMSUIBubbleTipViewController *)self bc_request];
    v7 = sub_BA430(v6);

    id v8 = +[BAEventReporter sharedReporter];
    id v9 = [v15 deepLink];
    v10 = [v9 absoluteString];
    int64_t v11 = [(BCAMSUIBubbleTipViewController *)self messageType];
    v12 = [(BCAMSUIBubbleTipViewController *)self messageId];
    BOOL v13 = [v7 count] != 0;
    v14 = [(BCAMSUIBubbleTipViewController *)self placement];
    [v8 emitUnifiedMessageActionEventWithTracker:v4 startDate:v10 messageType:v11 messageIdentifier:v12 hasActionable:v13 actionIdentifier:v7 placementName:v14];
  }
}

- (void)bc_analyticsVisibilityDidAppear
{
  v3.receiver = self;
  v3.super_class = (Class)BCAMSUIBubbleTipViewController;
  [(BCAMSUIBubbleTipViewController *)&v3 bc_analyticsVisibilityDidAppear];
  if ([(BCAMSUIBubbleTipViewController *)self isOnScreen]) {
    [(BCAMSUIBubbleTipViewController *)self bc_startImpressionEventTracking];
  }
}

- (void)bc_analyticsVisibilityDidDisappear
{
  v3.receiver = self;
  v3.super_class = (Class)BCAMSUIBubbleTipViewController;
  [(BCAMSUIBubbleTipViewController *)&v3 bc_analyticsVisibilityDidDisappear];
  if ([(BCAMSUIBubbleTipViewController *)self isOnScreen]) {
    [(BCAMSUIBubbleTipViewController *)self bc_submitImpressionEvent];
  }
}

- (void)bc_startImpressionEventTracking
{
  id v3 = +[NSDate now];
  [(BCAMSUIBubbleTipViewController *)self setImpressionStartTime:v3];
}

- (void)bc_submitImpressionEvent
{
  id v12 = [(BCAMSUIBubbleTipViewController *)self ba_effectiveAnalyticsTracker];
  if (v12)
  {
    id v3 = [(BCAMSUIBubbleTipViewController *)self impressionStartTime];

    if (v3)
    {
      objc_super v4 = [(BCAMSUIBubbleTipViewController *)self bc_request];
      v5 = sub_BA430(v4);

      v6 = +[BAEventReporter sharedReporter];
      v7 = [(BCAMSUIBubbleTipViewController *)self impressionStartTime];
      int64_t v8 = [(BCAMSUIBubbleTipViewController *)self messageType];
      id v9 = [(BCAMSUIBubbleTipViewController *)self messageId];
      BOOL v10 = [v5 count] != 0;
      int64_t v11 = [(BCAMSUIBubbleTipViewController *)self placement];
      [v6 emitUnifiedMessageExposureEventWithTracker:v12 startDate:v7 messageType:v8 messageIdentifier:v9 hasActionable:v10 actionIdentifier:v5 placementName:v11];
    }
  }
  [(BCAMSUIBubbleTipViewController *)self setImpressionStartTime:0];
}

- (id)messageId
{
  v2 = [(BCAMSUIBubbleTipViewController *)self bc_request];
  id v3 = [v2 metricsEvent];
  objc_super v4 = [v3 underlyingDictionary];
  v5 = [v4 objectForKeyedSubscript:@"messageId"];

  return v5;
}

- (id)messagePlacement
{
  v2 = [(BCAMSUIBubbleTipViewController *)self bc_request];
  id v3 = [v2 metricsEvent];
  objc_super v4 = [v3 underlyingDictionary];
  v5 = [v4 objectForKeyedSubscript:@"placement"];

  return v5;
}

- (BOOL)isOnScreen
{
  return self->_isOnScreen;
}

- (AMSDialogRequest)bc_request
{
  return self->_bc_request;
}

- (void)setBc_request:(id)a3
{
}

- (NSString)placement
{
  return self->_placement;
}

- (void)setPlacement:(id)a3
{
}

- (NSDate)impressionStartTime
{
  return self->_impressionStartTime;
}

- (void)setImpressionStartTime:(id)a3
{
}

- (int64_t)messageType
{
  return self->_messageType;
}

- (void)setMessageType:(int64_t)a3
{
  self->_messageType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_impressionStartTime, 0);
  objc_storeStrong((id *)&self->_placement, 0);

  objc_storeStrong((id *)&self->_bc_request, 0);
}

@end