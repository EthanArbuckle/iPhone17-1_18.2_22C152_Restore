@interface ShowPublisherActionHandler
+ (void)performAction:(id)a3 inContext:(id)a4;
@end

@implementation ShowPublisherActionHandler

+ (void)performAction:(id)a3 inContext:(id)a4
{
  id v12 = a3;
  id v5 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v12;
    id v7 = objc_alloc((Class)MKMapItemIdentifier);
    id v8 = [v6 publisherMUID];
    id v9 = [v6 resultProviderID];

    id v10 = [v7 initWithMUID:v8 resultProviderID:v9 coordinate:MKCoordinateInvalid];
    v11 = [v5 appCoordinator];
    [v11 openPublisherWithIdentifier:v10];
  }
}

@end