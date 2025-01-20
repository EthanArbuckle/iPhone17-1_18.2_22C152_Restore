@interface _VFXUIApplicationObserver
+ (id)sharedInstance;
@end

@implementation _VFXUIApplicationObserver

+ (id)sharedInstance
{
  if (qword_1E9DDAFF0 != -1) {
    dispatch_once(&qword_1E9DDAFF0, &unk_1F0FB6348);
  }
  return (id)qword_1E9DDAFE8;
}

@end