@interface CRSUIDashboardWidgetWindow
- (void)_maps_safeSetFocusableViews:(id)a3;
@end

@implementation CRSUIDashboardWidgetWindow

- (void)_maps_safeSetFocusableViews:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(CRSUIDashboardWidgetWindow *)self invalidated];
  if (qword_101610860 != -1) {
    dispatch_once(&qword_101610860, &stru_1013186D0);
  }
  v6 = (id)qword_101610858;
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v8 = 134349056;
      v9 = self;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}p] Window is invalidated; ignoring -setFocusableViews:",
        (uint8_t *)&v8,
        0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int v8 = 134349056;
      v9 = self;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "[%{public}p] Window is valid; calling -setFocusableViews:",
        (uint8_t *)&v8,
        0xCu);
    }

    [(CRSUIDashboardWidgetWindow *)self setFocusableViews:v4];
  }
}

@end