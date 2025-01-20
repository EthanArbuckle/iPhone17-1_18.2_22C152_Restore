@interface UIKeyboardManagementLink
- (BOOL)isAvailable;
- (NSString)description;
- (NSString)serviceName;
- (_UIKeyboardArbiter)owner;
- (void)attach:(id)a3;
- (void)connectWithQueue:(id)a3;
- (void)createSceneWithCompletion:(id)a3;
- (void)detach:(id)a3;
- (void)scene:(id)a3 didReceiveActions:(id)a4;
- (void)scene:(id)a3 didUpdateWithDiff:(id)a4 transitionContext:(id)a5 completion:(id)a6;
- (void)setOwner:(id)a3;
- (void)updateSceneSettings;
- (void)workspace:(id)a3 didCreateScene:(id)a4 withTransitionContext:(id)a5 completion:(id)a6;
- (void)workspace:(id)a3 didReceiveActions:(id)a4;
- (void)workspace:(id)a3 willDestroyScene:(id)a4 withTransitionContext:(id)a5 completion:(id)a6;
@end

@implementation UIKeyboardManagementLink

- (NSString)serviceName
{
  return 0;
}

- (NSString)description
{
  v6.receiver = self;
  v6.super_class = (Class)UIKeyboardManagementLink;
  v3 = [(UIKeyboardManagementLink *)&v6 description];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@; workspace = %@; scene = %@>",
    v3,
    self->_workspace,
  v4 = self->_scene);

  return (NSString *)v4;
}

- (BOOL)isAvailable
{
  return self->_scene != 0;
}

- (void)connectWithQueue:(id)a3
{
  id v4 = a3;
  id v8 = +[FBSWorkspaceInitializationOptions optionsWithDelegate:self];
  v5 = +[FBSSerialQueue queueWithDispatchQueue:v4];

  [v8 setCallOutQueue:v5];
  FBSWorkspaceInitialize();
  objc_super v6 = (FBSWorkspace *)objc_claimAutoreleasedReturnValue();
  workspace = self->_workspace;
  self->_workspace = v6;
}

- (void)createSceneWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)FBSMutableSceneClientSettings);
  objc_super v6 = [(UIKeyboardManagementLink *)self owner];
  [v6 updateSceneClientSettings:v5];

  id v7 = objc_alloc_init((Class)FBSWorkspaceSceneRequestOptions);
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2020000000;
  id v8 = (void *)qword_100008A00;
  uint64_t v25 = qword_100008A00;
  if (!qword_100008A00)
  {
    v17 = _NSConcreteStackBlock;
    uint64_t v18 = 3221225472;
    v19 = sub_100002280;
    v20 = &unk_100004228;
    v21 = &v22;
    v9 = sub_1000022D0();
    v23[3] = (uint64_t)dlsym(v9, "_UIKeyboardArbiter_SceneIdentifier");
    qword_100008A00 = *(void *)(v21[1] + 24);
    id v8 = (void *)v23[3];
  }
  _Block_object_dispose(&v22, 8);
  if (v8)
  {
    [v7 setIdentifier:*v8];
    [v7 setInitialClientSettings:v5];
    [v7 setKeyboardScene:1];
    v10 = +[FBSServiceFacilityClient defaultShellEndpoint];
    workspace = self->_workspace;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100001A24;
    v15[3] = &unk_1000041D8;
    id v16 = v4;
    id v12 = v4;
    [(FBSWorkspace *)workspace requestSceneFromEndpoint:v10 withOptions:v7 completion:v15];
  }
  else
  {
    v13 = +[NSAssertionHandler currentHandler];
    v14 = +[NSString stringWithUTF8String:"NSString *get_UIKeyboardArbiter_SceneIdentifier(void)"];
    objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, @"_UIKeyboardManagement.m", 17, @"%s", dlerror());

    __break(1u);
  }
}

- (void)updateSceneSettings
{
  scene = self->_scene;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100001AB8;
  v3[3] = &unk_100004200;
  v3[4] = self;
  [(FBSScene *)scene updateClientSettingsWithBlock:v3];
}

- (void)attach:(id)a3
{
}

- (void)detach:(id)a3
{
}

- (void)workspace:(id)a3 didCreateScene:(id)a4 withTransitionContext:(id)a5 completion:(id)a6
{
  id v10 = a4;
  v11 = (void (**)(id, id))a6;
  id v12 = sub_100001CD0();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v17 = "-[UIKeyboardManagementLink workspace:didCreateScene:withTransitionContext:completion:]";
    __int16 v18 = 2112;
    id v19 = v10;
    _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "%s %@", buf, 0x16u);
  }

  if (self->_scene)
  {
    v15 = +[NSAssertionHandler currentHandler];
    [v15 handleFailureInMethod:a2, self, @"_UIKeyboardManagement.m", 85, @"Invalid parameter not satisfying: %@", @"_scene == nil" object file lineNumber description];
  }
  objc_storeStrong((id *)&self->_scene, a4);
  [(FBSScene *)self->_scene setDelegate:self];
  if (v11)
  {
    id v13 = objc_alloc_init((Class)FBSWorkspaceCreateSceneResponse);
    v11[2](v11, v13);
  }
  v14 = [(UIKeyboardManagementLink *)self owner];
  [v14 activateClients];
}

- (void)workspace:(id)a3 willDestroyScene:(id)a4 withTransitionContext:(id)a5 completion:(id)a6
{
  id v8 = a4;
  v9 = (void (**)(id, id))a6;
  id v10 = sub_100001CD0();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v14 = 136315394;
    v15 = "-[UIKeyboardManagementLink workspace:willDestroyScene:withTransitionContext:completion:]";
    __int16 v16 = 2112;
    id v17 = v8;
    _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%s %@", (uint8_t *)&v14, 0x16u);
  }

  scene = self->_scene;
  self->_scene = 0;

  id v12 = [(UIKeyboardManagementLink *)self owner];
  [v12 attemptConnection];

  if (v9)
  {
    id v13 = objc_alloc_init((Class)FBSWorkspaceDestroySceneResponse);
    v9[2](v9, v13);
  }
}

- (void)workspace:(id)a3 didReceiveActions:(id)a4
{
  id v4 = a4;
  id v5 = sub_100001CD0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 136315394;
    id v7 = "-[UIKeyboardManagementLink workspace:didReceiveActions:]";
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s %@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)scene:(id)a3 didUpdateWithDiff:(id)a4 transitionContext:(id)a5 completion:(id)a6
{
  id v7 = a4;
  __int16 v8 = (void (**)(id, id))a6;
  id v9 = sub_100001CD0();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 136315394;
    id v12 = "-[UIKeyboardManagementLink scene:didUpdateWithDiff:transitionContext:completion:]";
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%s %@", (uint8_t *)&v11, 0x16u);
  }

  if (v8)
  {
    id v10 = objc_alloc_init((Class)FBSWorkspaceSceneUpdateResponse);
    v8[2](v8, v10);
  }
}

- (void)scene:(id)a3 didReceiveActions:(id)a4
{
  id v4 = a4;
  id v5 = sub_100001CD0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 136315394;
    id v7 = "-[UIKeyboardManagementLink scene:didReceiveActions:]";
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s %@", (uint8_t *)&v6, 0x16u);
  }
}

- (_UIKeyboardArbiter)owner
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->owner);
  return (_UIKeyboardArbiter *)WeakRetained;
}

- (void)setOwner:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->owner);
  objc_storeStrong((id *)&self->_scene, 0);
  objc_storeStrong((id *)&self->_workspace, 0);
}

@end