@interface screentimediagnose
+ (screentimediagnose)shared;
- (BOOL)parseGlobalOptions:(id)a3;
- (screentimediagnose)init;
- (void)registerGlobalOptions;
@end

@implementation screentimediagnose

- (screentimediagnose)init
{
  v3.receiver = self;
  v3.super_class = (Class)screentimediagnose;
  return [(screentimediagnose *)&v3 init];
}

+ (screentimediagnose)shared
{
  if (qword_1000159A0 != -1) {
    dispatch_once(&qword_1000159A0, &stru_100010400);
  }
  v2 = (void *)qword_1000159A8;
  return (screentimediagnose *)v2;
}

- (void)registerGlobalOptions
{
}

- (BOOL)parseGlobalOptions:(id)a3
{
  return 1;
}

@end