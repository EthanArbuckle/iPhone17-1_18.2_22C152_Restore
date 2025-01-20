@interface FnfDbwO2lFcwJMJU
+ (id)sharedInstance;
- (FnfDbwO2lFcwJMJU)init;
- (id)N6iJbZh5ycxf9a3z;
- (void)OiM1BBSmKozL6ooU;
@end

@implementation FnfDbwO2lFcwJMJU

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000C548;
  block[3] = &unk_10065ED90;
  block[4] = a1;
  if (qword_1006A5D30 != -1) {
    dispatch_once(&qword_1006A5D30, block);
  }
  v2 = (void *)qword_1006A5D28;

  return v2;
}

- (FnfDbwO2lFcwJMJU)init
{
  v9.receiver = self;
  v9.super_class = (Class)FnfDbwO2lFcwJMJU;
  v2 = [(FnfDbwO2lFcwJMJU *)&v9 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.asd.pr", 0);
    gTBjgtWKPdOTHwT4 = v2->gTBjgtWKPdOTHwT4;
    v2->gTBjgtWKPdOTHwT4 = (OS_dispatch_queue *)v3;

    QSDcma8s0bThnyOF = v2->QSDcma8s0bThnyOF;
    v2->QSDcma8s0bThnyOF = 0;

    v6 = (CoreTelephonyClient *)[objc_alloc((Class)CoreTelephonyClient) initWithQueue:v2->gTBjgtWKPdOTHwT4];
    VeKeMRBxEIiHlARL = v2->VeKeMRBxEIiHlARL;
    v2->VeKeMRBxEIiHlARL = v6;

    [(CoreTelephonyClient *)v2->VeKeMRBxEIiHlARL setDelegate:v2];
    [(FnfDbwO2lFcwJMJU *)v2 OiM1BBSmKozL6ooU];
  }
  return v2;
}

- (id)N6iJbZh5ycxf9a3z
{
  return self->QSDcma8s0bThnyOF;
}

- (void)OiM1BBSmKozL6ooU
{
  v2 = self;
  objc_sync_enter(v2);
  QSDcma8s0bThnyOF = v2->QSDcma8s0bThnyOF;
  v2->QSDcma8s0bThnyOF = 0;

  VeKeMRBxEIiHlARL = v2->VeKeMRBxEIiHlARL;
  id v11 = 0;
  v5 = [(CoreTelephonyClient *)VeKeMRBxEIiHlARL getActiveContexts:&v11];
  id v6 = v11;
  if (!v6)
  {
    v7 = [v5 voicePreferred];
    if (v7)
    {
      v8 = [v5 findForUuid:v7];
      uint64_t v9 = [v8 phoneNumber];
      v10 = v2->QSDcma8s0bThnyOF;
      v2->QSDcma8s0bThnyOF = (NSString *)v9;
    }
  }

  objc_sync_exit(v2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->QSDcma8s0bThnyOF, 0);
  objc_storeStrong((id *)&self->VeKeMRBxEIiHlARL, 0);

  objc_storeStrong((id *)&self->gTBjgtWKPdOTHwT4, 0);
}

@end