@interface CLWaterSubmersionClientLocal
- (BOOL)valid;
- (CLWaterSubmersionClientLocal)initWithWaterSubmersionClient:(CLWaterSubmersionClient *)a3;
- (void)dealloc;
- (void)onSubmersionMeasurementUpdate:(id)a3;
- (void)onSubmersionStateUpdate:(id)a3;
- (void)onSubmersionTemperatureUpdate:(id)a3;
- (void)setDeepEnabled:(BOOL)a3;
- (void)setValid:(BOOL)a3;
@end

@implementation CLWaterSubmersionClientLocal

- (CLWaterSubmersionClientLocal)initWithWaterSubmersionClient:(CLWaterSubmersionClient *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CLWaterSubmersionClientLocal;
  v4 = [(CLWaterSubmersionClientLocal *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->_waterSubmersionClient = a3;
    v4->_submersionStateMachine = [[CLSubmersionStateMachine alloc] initWithType:0];
    v5->_valid = 1;
  }
  else
  {
    MEMORY[0x18] = 0;
  }
  return v5;
}

- (void)dealloc
{
  self->_submersionStateMachine = 0;
  v3.receiver = self;
  v3.super_class = (Class)CLWaterSubmersionClientLocal;
  [(CLWaterSubmersionClientLocal *)&v3 dealloc];
}

- (void)setDeepEnabled:(BOOL)a3
{
}

- (void)onSubmersionStateUpdate:(id)a3
{
  id v5 = objc_alloc((Class)CMWaterSubmersionEvent);
  id v6 = [a3 state];
  [a3 startAt];
  id v7 = [v5 initWithEvent:v6 andDate:[NSDate dateWithTimeIntervalSinceReferenceDate:]];
  (*((void (**)(CLWaterSubmersionClient *, id))self->_waterSubmersionClient->var0 + 5))(self->_waterSubmersionClient, v7);
}

- (void)onSubmersionMeasurementUpdate:(id)a3
{
  id v5 = [a3 copy];
  id v6 = [(CLSubmersionStateMachine *)self->_submersionStateMachine stateFromDepth:a3 forceSubmersion:0];
  if (v6 != [a3 state])
  {
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_1022D9BD0);
    }
    id v7 = qword_1024191E8;
    if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEBUG))
    {
      id v8 = [a3 state];
      int64_t v9 = [(CLSubmersionStateMachine *)self->_submersionStateMachine type];
      *(_DWORD *)buf = 134218496;
      id v20 = v8;
      __int16 v21 = 2048;
      id v22 = v6;
      __int16 v23 = 2048;
      int64_t v24 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Override client submersion state,fromState,%ld,toState,%ld,clientType,%ld", buf, 0x20u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_1022D9BD0);
      }
      [a3 state];
      [(CLSubmersionStateMachine *)self->_submersionStateMachine type];
      v18 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWaterSubmersionClientLocal onSubmersionMeasurementUpdate:]", "%s\n", v18);
      if (v18 != (char *)buf) {
        free(v18);
      }
    }
    [v5 setState:v6];
  }
  if ([v5 state] != (id)100 && objc_msgSend(v5, "state") && objc_msgSend(v5, "state") != (id)600) {
    [(CLWaterSubmersionClientLocal *)self onSubmersionTemperatureUpdate:v5];
  }
  [v5 startAt];
  double v11 = v10;
  [v5 depth];
  double v13 = v12;
  [v5 pressure];
  double v15 = v14;
  [v5 surfacePressure];
  id v17 = sub_100A0DDD0((uint64_t)[v5 state], v11, v13, v15, v16);
  (*((void (**)(CLWaterSubmersionClient *, id))self->_waterSubmersionClient->var0 + 6))(self->_waterSubmersionClient, v17);
}

- (void)onSubmersionTemperatureUpdate:(id)a3
{
  [a3 startAt];
  double v6 = v5;
  [a3 temperature];
  double v8 = v7;
  [a3 temperatureUncertainty];
  sub_100A0DFC8(v6, v8, v9);
  double v10 = (void (*)(void))*((void *)self->_waterSubmersionClient->var0 + 7);

  v10();
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

@end