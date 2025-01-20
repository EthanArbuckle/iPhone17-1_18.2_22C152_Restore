@interface BEThemePreviewWKWebView
- (BEThemePreviewWKWebView)initWithFrame:(CGRect)a3 configuration:(id)a4;
- (BEWebProcessControllerProtocol)webProcessPluginProxy;
- (NSMutableSet)registeredFonts;
- (id)_processPluginProxy;
- (void)be_registerFontFamilyForStyleManager:(id)a3 fontFamily:(id)a4;
- (void)setRegisteredFonts:(id)a3;
- (void)setWebProcessPluginProxy:(id)a3;
@end

@implementation BEThemePreviewWKWebView

- (BEThemePreviewWKWebView)initWithFrame:(CGRect)a3 configuration:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)BEThemePreviewWKWebView;
  v4 = -[BEThemePreviewWKWebView initWithFrame:configuration:](&v7, "initWithFrame:configuration:", a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v4)
  {
    v5 = +[NSMutableSet set];
    [(BEThemePreviewWKWebView *)v4 setRegisteredFonts:v5];

    [(BEThemePreviewWKWebView *)v4 _grantAccessToAssetServices];
  }
  return v4;
}

- (id)_processPluginProxy
{
  v3 = [(BEThemePreviewWKWebView *)self webProcessPluginProxy];

  if (!v3)
  {
    v4 = [(BEThemePreviewWKWebView *)self _remoteObjectRegistry];
    v5 = +[_WKRemoteObjectInterface remoteObjectInterfaceWithProtocol:&OBJC_PROTOCOL___BEWebProcessControllerProtocol];
    v6 = [v4 remoteObjectProxyWithInterface:v5];
    [(BEThemePreviewWKWebView *)self setWebProcessPluginProxy:v6];

    if (!v5
      || ([(BEThemePreviewWKWebView *)self webProcessPluginProxy],
          objc_super v7 = objc_claimAutoreleasedReturnValue(),
          v7,
          !v7))
    {
      v8 = _BookEPUBLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&def_7BFC0, v8, OS_LOG_TYPE_ERROR, "Failed to get process plugin/proxy!", v11, 2u);
      }
    }
  }
  v9 = [(BEThemePreviewWKWebView *)self webProcessPluginProxy];

  return v9;
}

- (void)be_registerFontFamilyForStyleManager:(id)a3 fontFamily:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 length])
  {
    if (([v6 isFontPreregistered:v7] & 1) == 0)
    {
      if ([v6 isFontAvailable:v7])
      {
        v8 = [(BEThemePreviewWKWebView *)self registeredFonts];
        unsigned __int8 v9 = [v8 containsObject:v7];

        if ((v9 & 1) == 0)
        {
          v10 = [(BEThemePreviewWKWebView *)self _processPluginProxy];
          if (v10)
          {
            v11 = [(BEThemePreviewWKWebView *)self registeredFonts];
            [v11 addObject:v7];

            v12 = _BookEPUBLog();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              id v18 = v7;
              _os_log_impl(&def_7BFC0, v12, OS_LOG_TYPE_DEFAULT, "Attempting ThemePreview #fontReg of #fontFamily '%{public}@'", buf, 0xCu);
            }

            objc_initWeak((id *)buf, self);
            v14[0] = _NSConcreteStackBlock;
            v14[1] = 3221225472;
            v14[2] = sub_F120;
            v14[3] = &unk_3C0530;
            objc_copyWeak(&v16, (id *)buf);
            id v15 = v7;
            [v10 registerFontFamily:v15 completion:v14];

            objc_destroyWeak(&v16);
            objc_destroyWeak((id *)buf);
          }
          else
          {
            v13 = _BookEPUBLog();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              id v18 = v7;
              _os_log_impl(&def_7BFC0, v13, OS_LOG_TYPE_ERROR, "Failed to get ThemePreview process plugin/proxy! Unable to #fontReg fontFamily:%{public}@", buf, 0xCu);
            }
          }
        }
      }
    }
  }
}

- (BEWebProcessControllerProtocol)webProcessPluginProxy
{
  return self->_webProcessPluginProxy;
}

- (void)setWebProcessPluginProxy:(id)a3
{
}

- (NSMutableSet)registeredFonts
{
  return self->_registeredFonts;
}

- (void)setRegisteredFonts:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registeredFonts, 0);

  objc_storeStrong((id *)&self->_webProcessPluginProxy, 0);
}

@end