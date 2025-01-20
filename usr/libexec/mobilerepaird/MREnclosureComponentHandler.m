@interface MREnclosureComponentHandler
+ (id)sharedSingleton;
- (id)_init;
@end

@implementation MREnclosureComponentHandler

- (id)_init
{
  v6.receiver = self;
  v6.super_class = (Class)MREnclosureComponentHandler;
  v2 = [(MRSystemHealthComponentHandler *)&v6 initWithComponentName:@"Enclosure"];
  v3 = v2;
  if (v2)
  {
    [(MRBaseComponentHandler *)v2 setComponentName:@"Enclosure"];
    v4 = objc_opt_new();
    [(MRBaseComponentHandler *)v3 setComponentAuthHandler:v4];

    [(MRBaseComponentHandler *)v3 setComponentId:14];
    [(MRBaseComponentHandler *)v3 setSupportsRepair:1];
    [(MRBaseComponentHandler *)v3 setFinishRepairTitle:@"FINISH_ECL_REPAIR_TITLE"];
    [(MRBaseComponentHandler *)v3 setFinishRepairMessage:@"FINISH_ECL_REPAIR_DESC"];
    [(MRBaseComponentHandler *)v3 setComponentForceKey:@"ForceEnclosureStatus"];
  }
  return v3;
}

+ (id)sharedSingleton
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100009D68;
  block[3] = &unk_1000185F8;
  block[4] = a1;
  if (qword_10001EA88 != -1) {
    dispatch_once(&qword_10001EA88, block);
  }
  v2 = (void *)qword_10001EA80;

  return v2;
}

@end