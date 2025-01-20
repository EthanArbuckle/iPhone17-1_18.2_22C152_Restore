@interface _PUIDPointerControllerSystemClientState
- (PSDisplay)display;
- (void)setActiveHoverRegion:(id)a3;
- (void)setDisplay:(id)a3;
@end

@implementation _PUIDPointerControllerSystemClientState

- (void)setActiveHoverRegion:(id)a3
{
  id v5 = a3;
  v6 = PSLogCommon();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (a3)
  {
    if (v7)
    {
      v8 = [(_PUIDPointerControllerSystemClientState *)self display];
      *(_DWORD *)buf = 138412290;
      v12 = v8;
      v9 = "updating system hover region on display %@";
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v9, buf, 0xCu);
    }
  }
  else if (v7)
  {
    v8 = [(_PUIDPointerControllerSystemClientState *)self display];
    *(_DWORD *)buf = 138412290;
    v12 = v8;
    v9 = "invalidating system hover region on display %@";
    goto LABEL_6;
  }

  v10.receiver = self;
  v10.super_class = (Class)_PUIDPointerControllerSystemClientState;
  [(_PUIDPointerControllerClientState *)&v10 setActiveHoverRegion:v5];
}

- (PSDisplay)display
{
  return self->_display;
}

- (void)setDisplay:(id)a3
{
}

- (void).cxx_destruct
{
}

@end