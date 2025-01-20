@interface j7CSI6j8vNYi4bMa
+ (id)sharedInstance;
- (id)email;
- (j7CSI6j8vNYi4bMa)init;
@end

@implementation j7CSI6j8vNYi4bMa

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100013214;
  block[3] = &unk_10065ED90;
  block[4] = a1;
  if (qword_1006A5D58 != -1) {
    dispatch_once(&qword_1006A5D58, block);
  }
  v2 = (void *)qword_1006A5D50;

  return v2;
}

- (j7CSI6j8vNYi4bMa)init
{
  v3.receiver = self;
  v3.super_class = (Class)j7CSI6j8vNYi4bMa;
  return [(j7CSI6j8vNYi4bMa *)&v3 init];
}

- (id)email
{
  id v2 = objc_alloc_init((Class)ACAccountStore);
  objc_super v3 = [v2 aa_primaryAppleAccount];
  v4 = [v3 aa_primaryEmail];

  return v4;
}

@end