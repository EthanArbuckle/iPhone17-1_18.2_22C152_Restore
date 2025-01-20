@interface MKLocationManager
+ (id)unretainedUGCInstance;
@end

@implementation MKLocationManager

+ (id)unretainedUGCInstance
{
  id WeakRetained = objc_loadWeakRetained(&qword_10160EC90);
  if (!WeakRetained)
  {
    id WeakRetained = [objc_alloc((Class)MKLocationManager) initWithCLLocationManager:0];
    [WeakRetained setDesiredAccuracy:6380000.0];
    objc_storeWeak(&qword_10160EC90, WeakRetained);
  }

  return WeakRetained;
}

@end