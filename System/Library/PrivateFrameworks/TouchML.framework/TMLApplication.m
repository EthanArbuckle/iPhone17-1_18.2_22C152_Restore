@interface TMLApplication
+ (id)allocWithZone:(_NSZone *)a3;
+ (id)sharedInstance;
- (NSString)applicationVersion;
- (NSString)hardwareModel;
@end

@implementation TMLApplication

+ (id)allocWithZone:(_NSZone *)a3
{
  objc_msgSend_sharedInstance(a1, a2, v3, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_23983F25C;
  block[3] = &unk_264DAB680;
  block[4] = a1;
  if (qword_268A05700 != -1) {
    dispatch_once(&qword_268A05700, block);
  }
  v2 = (void *)qword_268A056F8;
  return v2;
}

- (NSString)hardwareModel
{
  if (qword_268A05710 != -1) {
    dispatch_once(&qword_268A05710, &unk_26ECEBCF8);
  }
  v2 = (void *)qword_268A05708;
  return (NSString *)v2;
}

- (NSString)applicationVersion
{
  if (qword_268A05720 != -1) {
    dispatch_once(&qword_268A05720, &unk_26ECEBD18);
  }
  v2 = (void *)qword_268A05718;
  return (NSString *)v2;
}

@end