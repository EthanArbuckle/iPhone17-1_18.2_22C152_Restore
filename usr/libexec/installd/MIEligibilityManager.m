@interface MIEligibilityManager
+ (MIEligibilityManager)sharedInstance;
- (BOOL)getEligibilityForDomain:(unint64_t)a3 answer:(unint64_t *)a4 source:(unint64_t *)a5 status:(id *)a6 context:(id *)a7 error:(id *)a8;
- (BOOL)testOverridesEnabled;
- (NSDictionary)testOverrides;
- (void)setTestOverrides:(id)a3;
@end

@implementation MIEligibilityManager

+ (MIEligibilityManager)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100053AE8;
  block[3] = &unk_10008CC28;
  block[4] = a1;
  if (qword_1000A60A0 != -1) {
    dispatch_once(&qword_1000A60A0, block);
  }
  v2 = (void *)qword_1000A6098;

  return (MIEligibilityManager *)v2;
}

- (BOOL)testOverridesEnabled
{
  char v7 = 0;
  v2 = +[MIDaemonConfiguration sharedInstance];
  BOOL v3 = 0;
  if ([v2 allowsInternalSecurityPolicy])
  {
    v4 = +[MITestManager sharedInstance];
    unsigned __int8 v5 = [v4 isRunningInTestMode:&v7 outError:0];
    if (v7) {
      BOOL v3 = v5;
    }
    else {
      BOOL v3 = 0;
    }
  }
  return v3;
}

- (void)setTestOverrides:(id)a3
{
  id v7 = a3;
  if ([(MIEligibilityManager *)self testOverridesEnabled])
  {
    if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5)
    {
      id v6 = v7;
      MOLogWrite();
    }
    v4 = (NSDictionary *)[v7 copy:v6];
    testOverrides = self->_testOverrides;
    self->_testOverrides = v4;
  }
}

- (BOOL)getEligibilityForDomain:(unint64_t)a3 answer:(unint64_t *)a4 source:(unint64_t *)a5 status:(id *)a6 context:(id *)a7 error:(id *)a8
{
  v15 = [(MIEligibilityManager *)self testOverrides];
  if (v15 && [(MIEligibilityManager *)self testOverridesEnabled])
  {
    id v16 = +[NSNumber numberWithUnsignedLongLong:a3];
    v18 = [v15 objectForKeyedSubscript:v16];
    BOOL v19 = v18 != 0;
    if (v18)
    {
      if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5) {
        MOLogWrite();
      }
      if (a4) {
        *a4 = (unint64_t)[v18 unsignedLongLongValue];
      }
      if (a5) {
        *a5 = 2;
      }
      if (a6)
      {
        id v20 = *a6;
        *a6 = 0;
      }
      if (!a7) {
        goto LABEL_23;
      }
      id v21 = *a7;
      *a7 = 0;
    }
    else
    {
      sub_100014A08((uint64_t)"-[MIEligibilityManager getEligibilityForDomain:answer:source:status:context:error:]", 81, MIInstallerErrorDomain, 219, 0, 0, @"Test mode: no override set for domain %llu; failing",
        v17,
        a3);
      id v21 = (id)objc_claimAutoreleasedReturnValue();
      if (a8)
      {
        id v21 = v21;
        *a8 = v21;
      }
    }

LABEL_23:
LABEL_24:

    goto LABEL_25;
  }
  int domain_answer = os_eligibility_get_domain_answer();
  if (domain_answer)
  {
    v24 = (void *)MIInstallerErrorDomain;
    v25 = sub_1000149C8((uint64_t)"-[MIEligibilityManager getEligibilityForDomain:answer:source:status:context:error:]", 91, NSPOSIXErrorDomain, domain_answer, 0, 0, @"os_eligibility_get_domain_answer failed", v23, v28);
    sub_1000149C8((uint64_t)"-[MIEligibilityManager getEligibilityForDomain:answer:source:status:context:error:]", 91, v24, 4, v25, 0, @"Failed to check eligibility for domain %llu", v26, a3);
    id v16 = (id)objc_claimAutoreleasedReturnValue();

    if (a8)
    {
      id v16 = v16;
      BOOL v19 = 0;
      *a8 = v16;
    }
    else
    {
      BOOL v19 = 0;
    }
    goto LABEL_24;
  }
  BOOL v19 = 1;
LABEL_25:

  return v19;
}

- (NSDictionary)testOverrides
{
  return self->_testOverrides;
}

- (void).cxx_destruct
{
}

@end