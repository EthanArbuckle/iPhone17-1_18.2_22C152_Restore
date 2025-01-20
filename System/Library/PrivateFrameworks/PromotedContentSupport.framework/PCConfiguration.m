@interface PCConfiguration
+ (void)fetchConfigurationForClass:(Class)a3 completion:(id)a4;
@end

@implementation PCConfiguration

+ (void)fetchConfigurationForClass:(Class)a3 completion:(id)a4
{
  v5 = (void (**)(id, void))a4;
  if (v5)
  {
    if ((Class)objc_opt_class() == a3)
    {
      v9 = APLogForCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_220C1C000, v9, OS_LOG_TYPE_ERROR, "Error: Configuration class method should be called from a subclass.", buf, 2u);
      }

      APSimulateCrash();
      v5[2](v5, 0);
    }
    else
    {
      v6 = [MEMORY[0x263F20A80] sharedInstance];
      v7 = [(objc_class *)a3 path];
      v8 = [v6 configurationForPath:v7];

      if (v8)
      {
        ((void (**)(id, void *))v5)[2](v5, v8);
      }
      else
      {
        v10 = objc_alloc_init(PCSupportRequester);
        v11 = NSStringFromClass(a3);
        v12[0] = MEMORY[0x263EF8330];
        v12[1] = 3221225472;
        v12[2] = sub_220C1D2B0;
        v12[3] = &unk_26457BFF8;
        Class v14 = a3;
        v13 = v5;
        [(PCSupportRequester *)v10 fetchConfigurationForClass:v11 completion:v12];
      }
    }
  }
}

@end