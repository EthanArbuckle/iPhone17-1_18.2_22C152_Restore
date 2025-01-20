@interface MIBUOperationFactory
+ (id)sharedInstance;
- (id)buildCurrentOperationWithDelegate:(id)a3;
- (id)buildOperationFromCode:(unint64_t)a3 andDelegate:(id)a4;
@end

@implementation MIBUOperationFactory

+ (id)sharedInstance
{
  if (qword_10006C890 != -1) {
    dispatch_once(&qword_10006C890, &stru_100059858);
  }
  v2 = (void *)qword_10006C888;

  return v2;
}

- (id)buildCurrentOperationWithDelegate:(id)a3
{
  id v4 = a3;
  unint64_t v5 = +[MIBUOperation currentOperationCode];
  if (qword_10006C958 != -1) {
    dispatch_once(&qword_10006C958, &stru_100059878);
  }
  v6 = qword_10006C950;
  if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 134217984;
    unint64_t v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Current ongoing operation code is %lu", (uint8_t *)&v9, 0xCu);
  }
  v7 = [(MIBUOperationFactory *)self buildOperationFromCode:v5 andDelegate:v4];

  return v7;
}

- (id)buildOperationFromCode:(unint64_t)a3 andDelegate:(id)a4
{
  id v5 = a4;
  if (a3)
  {
    if (a3 == 2)
    {
      v6 = MIBUDiagnosticsOperation;
      goto LABEL_6;
    }
    if (a3 == 1)
    {
      v6 = MIBUSoftwareUpdateOperation;
LABEL_6:
      a3 = (unint64_t)[[v6 alloc] initWithDelegate:v5];
      goto LABEL_12;
    }
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_100059898);
    }
    v7 = qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
      sub_10003E87C(a3, v7);
    }
    a3 = 0;
  }
LABEL_12:

  return (id)a3;
}

@end