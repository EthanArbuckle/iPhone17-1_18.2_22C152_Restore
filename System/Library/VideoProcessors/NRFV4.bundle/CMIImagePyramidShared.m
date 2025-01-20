@interface CMIImagePyramidShared
+ (id)getSharedInstanceOrRelease:(BOOL)a3;
+ (id)sharedInstance;
+ (void)releaseSharedInstance;
- (id)getShaders:(id)a3;
@end

@implementation CMIImagePyramidShared

- (id)getShaders:(id)a3
{
  id v4 = a3;
  shaders = self->_shaders;
  p_shaders = &self->_shaders;
  v7 = shaders;
  if (!v7)
  {
    v8 = [[CMIImagePyramidShaders alloc] initWithMetal:v4];
    if (v8)
    {
      v7 = v8;
      objc_storeStrong((id *)p_shaders, v8);
    }
    else
    {
      v10 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();

      v7 = 0;
    }
  }

  return v7;
}

+ (id)sharedInstance
{
  return +[CMIImagePyramidShared getSharedInstanceOrRelease:0];
}

+ (void)releaseSharedInstance
{
  id v2 = +[CMIImagePyramidShared getSharedInstanceOrRelease:1];
}

+ (id)getSharedInstanceOrRelease:(BOOL)a3
{
  id v4 = objc_opt_class();
  objc_sync_enter(v4);
  v5 = (void *)getSharedInstanceOrRelease__singleton_16;
  if (a3)
  {
    v6 = 0;
  }
  else
  {
    if (getSharedInstanceOrRelease__singleton_16) {
      goto LABEL_6;
    }
    v6 = objc_alloc_init(CMIImagePyramidShared);
    v5 = (void *)getSharedInstanceOrRelease__singleton_16;
  }
  getSharedInstanceOrRelease__singleton_16 = (uint64_t)v6;

LABEL_6:
  id v7 = (id)getSharedInstanceOrRelease__singleton_16;
  objc_sync_exit(v4);

  return v7;
}

- (void).cxx_destruct
{
}

@end