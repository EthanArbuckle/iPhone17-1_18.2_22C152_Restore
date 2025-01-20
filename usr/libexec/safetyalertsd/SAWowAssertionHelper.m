@interface SAWowAssertionHelper
- (SAWowAssertionHelper)init;
- (void)assertWoW:(BOOL)a3;
@end

@implementation SAWowAssertionHelper

- (SAWowAssertionHelper)init
{
  self->isAsserted = 0;
  return self;
}

- (void)assertWoW:(BOOL)a3
{
  int v3 = a3;
  int isAsserted = self->isAsserted;
  v6 = SALogObjectGeneral;
  BOOL v7 = os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT);
  if (isAsserted == v3)
  {
    if (v7)
    {
      int v10 = 68289026;
      int v11 = 0;
      __int16 v12 = 2082;
      v13 = "";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#wow,#warning,assertWoW,noChange\"}", (uint8_t *)&v10, 0x12u);
    }
  }
  else
  {
    if (v7)
    {
      int v10 = 68289282;
      int v11 = 0;
      __int16 v12 = 2082;
      v13 = "";
      __int16 v14 = 1026;
      int v15 = v3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#wow,assertWoW,triggered\", \"state\":%{public}hhd}", (uint8_t *)&v10, 0x18u);
    }
    self->int isAsserted = v3;
    v8 = +[CUTWiFiManager sharedInstance];
    v9 = v8;
    if (v3) {
      [v8 addWoWClient:self];
    }
    else {
      [v8 removeWoWClient:self];
    }
  }
}

@end