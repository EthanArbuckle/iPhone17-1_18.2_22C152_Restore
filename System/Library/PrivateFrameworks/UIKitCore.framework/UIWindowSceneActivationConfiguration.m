@interface UIWindowSceneActivationConfiguration
- (NSUserActivity)userActivity;
- (UITargetedPreview)preview;
- (UIWindowSceneActivationConfiguration)initWithUserActivity:(NSUserActivity *)userActivity;
- (UIWindowSceneActivationRequestOptions)options;
- (_UIWindowSceneActivator)_sceneActivator;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)_animationSource;
- (void)_setAnimationSource:(unint64_t)a3;
- (void)_setSceneActivator:(id)a3;
- (void)setOptions:(UIWindowSceneActivationRequestOptions *)options;
- (void)setPreview:(UITargetedPreview *)preview;
@end

@implementation UIWindowSceneActivationConfiguration

- (UIWindowSceneActivationConfiguration)initWithUserActivity:(NSUserActivity *)userActivity
{
  v5 = userActivity;
  v9.receiver = self;
  v9.super_class = (Class)UIWindowSceneActivationConfiguration;
  v6 = [(UIWindowSceneActivationConfiguration *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_userActivity, userActivity);
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v5 = [(UIWindowSceneActivationConfiguration *)self userActivity];
  v6 = (void *)[v4 initWithUserActivity:v5];

  v7 = [(UIWindowSceneActivationConfiguration *)self options];
  v8 = (void *)[v7 copy];
  [v6 setOptions:v8];

  objc_super v9 = [(UIWindowSceneActivationConfiguration *)self preview];
  v10 = (void *)[v9 copy];
  [v6 setPreview:v10];

  v11 = [(UIWindowSceneActivationConfiguration *)self _sceneActivator];
  [v6 _setSceneActivator:v11];

  objc_msgSend(v6, "_setAnimationSource:", -[UIWindowSceneActivationConfiguration _animationSource](self, "_animationSource"));
  return v6;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = NSString;
  v5 = [(UIWindowSceneActivationConfiguration *)self userActivity];
  v6 = [v5 activityType];
  v7 = [v4 stringWithFormat:@"activityType = %@", v6];
  [v3 addObject:v7];

  v8 = [(UIWindowSceneActivationConfiguration *)self preview];

  if (v8)
  {
    objc_super v9 = NSString;
    v10 = [(UIWindowSceneActivationConfiguration *)self preview];
    v11 = [v9 stringWithFormat:@"preview = %@", v10];
    [v3 addObject:v11];
  }
  v12 = [(UIWindowSceneActivationConfiguration *)self options];

  if (v12)
  {
    v13 = NSString;
    v14 = [(UIWindowSceneActivationConfiguration *)self options];
    v15 = [v13 stringWithFormat:@"options = %@", v14];
    [v3 addObject:v15];
  }
  v16 = NSString;
  v17 = (objc_class *)objc_opt_class();
  v18 = NSStringFromClass(v17);
  v19 = [v3 componentsJoinedByString:@"; "];
  v20 = [v16 stringWithFormat:@"<%@: %p; %@>", v18, self, v19];

  return v20;
}

- (NSUserActivity)userActivity
{
  return self->_userActivity;
}

- (UIWindowSceneActivationRequestOptions)options
{
  return self->_options;
}

- (void)setOptions:(UIWindowSceneActivationRequestOptions *)options
{
}

- (UITargetedPreview)preview
{
  return self->_preview;
}

- (void)setPreview:(UITargetedPreview *)preview
{
}

- (unint64_t)_animationSource
{
  return self->__animationSource;
}

- (void)_setAnimationSource:(unint64_t)a3
{
  self->__animationSource = a3;
}

- (_UIWindowSceneActivator)_sceneActivator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__sceneActivator);
  return (_UIWindowSceneActivator *)WeakRetained;
}

- (void)_setSceneActivator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->__sceneActivator);
  objc_storeStrong((id *)&self->_preview, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_userActivity, 0);
}

@end