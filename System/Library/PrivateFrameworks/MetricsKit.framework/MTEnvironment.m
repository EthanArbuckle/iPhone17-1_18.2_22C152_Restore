@interface MTEnvironment
- (BOOL)isAnonymous;
- (MTEnvironmentDelegate)delegate;
- (id)app;
- (id)appVersion;
- (id)capacityData;
- (id)capacityDataAvailable;
- (id)capacityDisk;
- (id)capacitySystem;
- (id)capacitySystemAvailable;
- (id)connectionType;
- (id)cookies;
- (id)dsId;
- (id)environmentBuild;
- (id)environmentDataCenter;
- (id)environmentInstance;
- (id)hardwareFamily;
- (id)hardwareModel;
- (id)hostApp;
- (id)hostAppVersion;
- (id)os;
- (id)osBuildNumber;
- (id)osLanguages;
- (id)osVersion;
- (id)pageUrl;
- (id)parentPageUrl;
- (id)pixelRatio;
- (id)resourceRevNum;
- (id)screenHeight;
- (id)screenWidth;
- (id)storeFrontHeader;
- (id)userAgent;
- (id)windowInnerHeight;
- (id)windowInnerWidth;
- (id)windowOuterHeight;
- (id)windowOuterWidth;
- (void)setDelegate:(id)a3;
@end

@implementation MTEnvironment

- (void)setDelegate:(id)a3
{
  p_delegate = &self->_delegate;
  id v9 = a3;
  id v5 = objc_storeWeak((id *)p_delegate, v9);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v7 = [(MTObject *)self metricsKit];
    id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    [WeakRetained setMetricsKit:v7];
  }
}

- (void).cxx_destruct
{
}

- (BOOL)isAnonymous
{
  v3 = [(MTEnvironment *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 0;
  }
  id v5 = [(MTEnvironment *)self delegate];
  char v6 = [v5 isAnonymous];

  return v6;
}

- (id)app
{
  v3 = [(MTEnvironment *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    v12 = [(MTEnvironment *)self delegate];
    v13 = [v12 app];
  }
  else
  {
    id v14 = MTUndelegatedMethodError((uint64_t)"-[MTEnvironment app]", v5, v6, v7, v8, v9, v10, v11);
    v13 = 0;
  }

  return v13;
}

- (id)appVersion
{
  v3 = [(MTEnvironment *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    v12 = [(MTEnvironment *)self delegate];
    v13 = [v12 appVersion];
  }
  else
  {
    id v14 = MTUndelegatedMethodError((uint64_t)"-[MTEnvironment appVersion]", v5, v6, v7, v8, v9, v10, v11);
    v13 = 0;
  }

  return v13;
}

- (id)capacityData
{
  v3 = [(MTEnvironment *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    v12 = [(MTEnvironment *)self delegate];
    v13 = [v12 capacityData];
  }
  else
  {
    id v14 = MTUndelegatedMethodError((uint64_t)"-[MTEnvironment capacityData]", v5, v6, v7, v8, v9, v10, v11);
    v13 = 0;
  }

  return v13;
}

- (id)capacityDataAvailable
{
  v3 = [(MTEnvironment *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    v12 = [(MTEnvironment *)self delegate];
    v13 = [v12 capacityDataAvailable];
  }
  else
  {
    id v14 = MTUndelegatedMethodError((uint64_t)"-[MTEnvironment capacityDataAvailable]", v5, v6, v7, v8, v9, v10, v11);
    v13 = 0;
  }

  return v13;
}

- (id)capacityDisk
{
  v3 = [(MTEnvironment *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    v12 = [(MTEnvironment *)self delegate];
    v13 = [v12 capacityDisk];
  }
  else
  {
    id v14 = MTUndelegatedMethodError((uint64_t)"-[MTEnvironment capacityDisk]", v5, v6, v7, v8, v9, v10, v11);
    v13 = 0;
  }

  return v13;
}

- (id)capacitySystem
{
  v3 = [(MTEnvironment *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    v12 = [(MTEnvironment *)self delegate];
    v13 = [v12 capacitySystem];
  }
  else
  {
    id v14 = MTUndelegatedMethodError((uint64_t)"-[MTEnvironment capacitySystem]", v5, v6, v7, v8, v9, v10, v11);
    v13 = 0;
  }

  return v13;
}

- (id)capacitySystemAvailable
{
  v3 = [(MTEnvironment *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    v12 = [(MTEnvironment *)self delegate];
    v13 = [v12 capacitySystemAvailable];
  }
  else
  {
    id v14 = MTUndelegatedMethodError((uint64_t)"-[MTEnvironment capacitySystemAvailable]", v5, v6, v7, v8, v9, v10, v11);
    v13 = 0;
  }

  return v13;
}

- (id)connectionType
{
  v3 = [(MTEnvironment *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    v12 = [(MTEnvironment *)self delegate];
    v13 = [v12 connectionType];
  }
  else
  {
    id v14 = MTUndelegatedMethodError((uint64_t)"-[MTEnvironment connectionType]", v5, v6, v7, v8, v9, v10, v11);
    v13 = 0;
  }

  return v13;
}

- (id)cookies
{
  v3 = [(MTEnvironment *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    v12 = [(MTEnvironment *)self delegate];
    v13 = [v12 cookies];
  }
  else
  {
    id v14 = MTUndelegatedMethodError((uint64_t)"-[MTEnvironment cookies]", v5, v6, v7, v8, v9, v10, v11);
    v13 = 0;
  }

  return v13;
}

- (id)dsId
{
  v3 = [(MTEnvironment *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    v12 = [(MTEnvironment *)self delegate];
    v13 = [v12 dsId];
  }
  else
  {
    id v14 = MTUndelegatedMethodError((uint64_t)"-[MTEnvironment dsId]", v5, v6, v7, v8, v9, v10, v11);
    v13 = 0;
  }

  return v13;
}

- (id)environmentBuild
{
  v3 = [(MTEnvironment *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    uint64_t v5 = [(MTEnvironment *)self delegate];
    uint64_t v6 = [v5 environmentBuild];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)environmentDataCenter
{
  v3 = [(MTEnvironment *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    uint64_t v5 = [(MTEnvironment *)self delegate];
    uint64_t v6 = [v5 environmentDataCenter];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)environmentInstance
{
  v3 = [(MTEnvironment *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    uint64_t v5 = [(MTEnvironment *)self delegate];
    uint64_t v6 = [v5 environmentDataCenter];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)hardwareFamily
{
  v3 = [(MTEnvironment *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    v12 = [(MTEnvironment *)self delegate];
    v13 = [v12 hardwareFamily];
  }
  else
  {
    id v14 = MTUndelegatedMethodError((uint64_t)"-[MTEnvironment hardwareFamily]", v5, v6, v7, v8, v9, v10, v11);
    v13 = 0;
  }

  return v13;
}

- (id)hardwareModel
{
  v3 = [(MTEnvironment *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    v12 = [(MTEnvironment *)self delegate];
    v13 = [v12 hardwareModel];
  }
  else
  {
    id v14 = MTUndelegatedMethodError((uint64_t)"-[MTEnvironment hardwareModel]", v5, v6, v7, v8, v9, v10, v11);
    v13 = 0;
  }

  return v13;
}

- (id)hostApp
{
  v3 = [(MTEnvironment *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    v12 = [(MTEnvironment *)self delegate];
    v13 = [v12 hostApp];
  }
  else
  {
    id v14 = MTUndelegatedMethodError((uint64_t)"-[MTEnvironment hostApp]", v5, v6, v7, v8, v9, v10, v11);
    v13 = 0;
  }

  return v13;
}

- (id)hostAppVersion
{
  v3 = [(MTEnvironment *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    uint64_t v5 = [(MTEnvironment *)self delegate];
    uint64_t v6 = [v5 hostAppVersion];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)os
{
  v3 = [(MTEnvironment *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    v12 = [(MTEnvironment *)self delegate];
    v13 = [v12 os];
  }
  else
  {
    id v14 = MTUndelegatedMethodError((uint64_t)"-[MTEnvironment os]", v5, v6, v7, v8, v9, v10, v11);
    v13 = 0;
  }

  return v13;
}

- (id)osBuildNumber
{
  v3 = [(MTEnvironment *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    v12 = [(MTEnvironment *)self delegate];
    v13 = [v12 osBuildNumber];
  }
  else
  {
    id v14 = MTUndelegatedMethodError((uint64_t)"-[MTEnvironment osBuildNumber]", v5, v6, v7, v8, v9, v10, v11);
    v13 = 0;
  }

  return v13;
}

- (id)osLanguages
{
  v3 = [(MTEnvironment *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    v12 = [(MTEnvironment *)self delegate];
    v13 = [v12 osLanguages];
  }
  else
  {
    id v14 = MTUndelegatedMethodError((uint64_t)"-[MTEnvironment osLanguages]", v5, v6, v7, v8, v9, v10, v11);
    v13 = 0;
  }

  return v13;
}

- (id)osVersion
{
  v3 = [(MTEnvironment *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    v12 = [(MTEnvironment *)self delegate];
    v13 = [v12 osVersion];
  }
  else
  {
    id v14 = MTUndelegatedMethodError((uint64_t)"-[MTEnvironment osVersion]", v5, v6, v7, v8, v9, v10, v11);
    v13 = 0;
  }

  return v13;
}

- (id)pageUrl
{
  v3 = [(MTEnvironment *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    v12 = [(MTEnvironment *)self delegate];
    v13 = [v12 pageUrl];
  }
  else
  {
    id v14 = MTUndelegatedMethodError((uint64_t)"-[MTEnvironment pageUrl]", v5, v6, v7, v8, v9, v10, v11);
    v13 = 0;
  }

  return v13;
}

- (id)parentPageUrl
{
  v3 = [(MTEnvironment *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    uint64_t v5 = [(MTEnvironment *)self delegate];
    uint64_t v6 = [v5 parentPageUrl];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)pixelRatio
{
  v3 = [(MTEnvironment *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    v12 = [(MTEnvironment *)self delegate];
    v13 = [v12 pixelRatio];
  }
  else
  {
    id v14 = MTUndelegatedMethodError((uint64_t)"-[MTEnvironment pixelRatio]", v5, v6, v7, v8, v9, v10, v11);
    v13 = 0;
  }

  return v13;
}

- (id)resourceRevNum
{
  v3 = [(MTEnvironment *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    v12 = [(MTEnvironment *)self delegate];
    v13 = [v12 resourceRevNum];
  }
  else
  {
    id v14 = MTUndelegatedMethodError((uint64_t)"-[MTEnvironment resourceRevNum]", v5, v6, v7, v8, v9, v10, v11);
    v13 = 0;
  }

  return v13;
}

- (id)screenHeight
{
  v3 = [(MTEnvironment *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    v12 = [(MTEnvironment *)self delegate];
    v13 = [v12 screenHeight];
  }
  else
  {
    id v14 = MTUndelegatedMethodError((uint64_t)"-[MTEnvironment screenHeight]", v5, v6, v7, v8, v9, v10, v11);
    v13 = 0;
  }

  return v13;
}

- (id)screenWidth
{
  v3 = [(MTEnvironment *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    v12 = [(MTEnvironment *)self delegate];
    v13 = [v12 screenWidth];
  }
  else
  {
    id v14 = MTUndelegatedMethodError((uint64_t)"-[MTEnvironment screenWidth]", v5, v6, v7, v8, v9, v10, v11);
    v13 = 0;
  }

  return v13;
}

- (id)storeFrontHeader
{
  v3 = [(MTEnvironment *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    v12 = [(MTEnvironment *)self delegate];
    v13 = [v12 storeFrontHeader];
  }
  else
  {
    id v14 = MTUndelegatedMethodError((uint64_t)"-[MTEnvironment storeFrontHeader]", v5, v6, v7, v8, v9, v10, v11);
    v13 = 0;
  }

  return v13;
}

- (id)userAgent
{
  v3 = [(MTEnvironment *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    v12 = [(MTEnvironment *)self delegate];
    v13 = [v12 userAgent];
  }
  else
  {
    id v14 = MTUndelegatedMethodError((uint64_t)"-[MTEnvironment userAgent]", v5, v6, v7, v8, v9, v10, v11);
    v13 = 0;
  }

  return v13;
}

- (id)windowInnerHeight
{
  v3 = [(MTEnvironment *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    v12 = [(MTEnvironment *)self delegate];
    v13 = [v12 windowInnerHeight];
  }
  else
  {
    id v14 = MTUndelegatedMethodError((uint64_t)"-[MTEnvironment windowInnerHeight]", v5, v6, v7, v8, v9, v10, v11);
    v13 = 0;
  }

  return v13;
}

- (id)windowInnerWidth
{
  v3 = [(MTEnvironment *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    v12 = [(MTEnvironment *)self delegate];
    v13 = [v12 windowInnerWidth];
  }
  else
  {
    id v14 = MTUndelegatedMethodError((uint64_t)"-[MTEnvironment windowInnerWidth]", v5, v6, v7, v8, v9, v10, v11);
    v13 = 0;
  }

  return v13;
}

- (id)windowOuterHeight
{
  v3 = [(MTEnvironment *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    v12 = [(MTEnvironment *)self delegate];
    v13 = [v12 windowOuterHeight];
  }
  else
  {
    id v14 = MTUndelegatedMethodError((uint64_t)"-[MTEnvironment windowOuterHeight]", v5, v6, v7, v8, v9, v10, v11);
    v13 = 0;
  }

  return v13;
}

- (id)windowOuterWidth
{
  v3 = [(MTEnvironment *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    v12 = [(MTEnvironment *)self delegate];
    v13 = [v12 windowOuterWidth];
  }
  else
  {
    id v14 = MTUndelegatedMethodError((uint64_t)"-[MTEnvironment windowOuterWidth]", v5, v6, v7, v8, v9, v10, v11);
    v13 = 0;
  }

  return v13;
}

- (MTEnvironmentDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MTEnvironmentDelegate *)WeakRetained;
}

@end