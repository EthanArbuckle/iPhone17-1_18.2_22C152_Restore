@interface MTPerfKit
- (MTPerfKit)initWithTopic:(id)a3;
- (id)flexibleMeasurementWithEventType:(id)a3;
- (id)flexibleMeasurementWithEventType:(id)a3 eventData:(id)a4;
- (id)loadUrlMeasurement;
- (id)loadUrlMeasurementWithEventData:(id)a3;
- (id)pageRenderMeasurementWithPageId:(id)a3 pageType:(id)a4 pageContext:(id)a5;
- (id)pageRenderMeasurementWithPageId:(id)a3 pageType:(id)a4 pageContext:(id)a5 eventData:(id)a6;
- (id)sampling;
@end

@implementation MTPerfKit

- (id)flexibleMeasurementWithEventType:(id)a3 eventData:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [MTFlexiblePerfMeasurement alloc];
  v9 = [(MTMetricsKitTemplate *)self eventHandlers];
  v10 = [v9 flexible];
  v11 = [(MTFlexiblePerfMeasurement *)v8 initWithMeasurementTransformer:v10 eventType:v7 eventData:v6];

  return v11;
}

- (id)flexibleMeasurementWithEventType:(id)a3
{
  return [(MTPerfKit *)self flexibleMeasurementWithEventType:a3 eventData:0];
}

- (MTPerfKit)initWithTopic:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MTPerfKit;
  v3 = [(MTMetricsKitTemplate *)&v7 initWithTopic:a3];
  if (v3)
  {
    v4 = [(MTObject *)[MTPerfEventHandlers alloc] initWithMetricsKit:v3];
    [(MTMetricsKitTemplate *)v3 setEventHandlers:v4];

    v5 = [(MTObject *)[MTPerfUtils alloc] initWithMetricsKit:v3];
    [(MTMetricsKitTemplate *)v3 setUtils:v5];
  }
  return v3;
}

- (void).cxx_destruct
{
}

- (id)sampling
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_sampling)
  {
    v3 = objc_alloc_init(MTSampling);
    sampling = v2->_sampling;
    v2->_sampling = v3;
  }
  objc_sync_exit(v2);

  v5 = v2->_sampling;

  return v5;
}

- (id)pageRenderMeasurementWithPageId:(id)a3 pageType:(id)a4 pageContext:(id)a5
{
  return [(MTPerfKit *)self pageRenderMeasurementWithPageId:a3 pageType:a4 pageContext:a5 eventData:0];
}

- (id)pageRenderMeasurementWithPageId:(id)a3 pageType:(id)a4 pageContext:(id)a5 eventData:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = [MTPageRenderMeasurement alloc];
  v15 = [(MTMetricsKitTemplate *)self eventHandlers];
  v16 = [v15 pageRender];
  v17 = [(MTPageRenderMeasurement *)v14 initWithMeasurementTransformer:v16 pageId:v13 pageType:v12 pageContext:v11 eventData:v10];

  return v17;
}

- (id)loadUrlMeasurement
{
  return [(MTPerfKit *)self loadUrlMeasurementWithEventData:0];
}

- (id)loadUrlMeasurementWithEventData:(id)a3
{
  id v4 = a3;
  v5 = [MTLoadUrlMeasurement alloc];
  id v6 = [(MTMetricsKitTemplate *)self eventHandlers];
  objc_super v7 = [v6 loadUrl];
  v8 = [(MTPerfBaseMeasurement *)v5 initWithMeasurementTransformer:v7 eventData:v4];

  return v8;
}

@end