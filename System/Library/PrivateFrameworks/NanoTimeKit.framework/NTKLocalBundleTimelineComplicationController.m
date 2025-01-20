@interface NTKLocalBundleTimelineComplicationController
+ (BOOL)_acceptsComplicationType:(unint64_t)a3 family:(int64_t)a4 forDevice:(id)a5;
+ (BOOL)_acceptsComplicationType:(unint64_t)a3 forDevice:(id)a4;
+ (BOOL)acceptsComplication:(id)a3 family:(int64_t)a4 forDevice:(id)a5;
+ (Class)complicationDataSourceClassForComplication:(id)a3 family:(int64_t)a4 device:(id)a5;
+ (Class)dataSourceFromComplication:(id)a3 family:(int64_t)a4 forDevice:(id)a5;
@end

@implementation NTKLocalBundleTimelineComplicationController

+ (BOOL)acceptsComplication:(id)a3 family:(int64_t)a4 forDevice:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if ([v7 complicationType])
  {
    v9 = +[NTKBundleComplicationManager sharedManager];
    BOOL v10 = [v9 dataSourceClassForBundleComplication:v7 withFamily:a4 andDevice:v8 factorInMigration:1] != 0;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

+ (BOOL)_acceptsComplicationType:(unint64_t)a3 family:(int64_t)a4 forDevice:(id)a5
{
  id v7 = a5;
  if (a3 <= 0x30 && ((1 << a3) & 0x1000080000001) != 0)
  {
    BOOL v8 = 0;
  }
  else
  {
    v9 = +[NTKComplication anyComplicationOfType:a3];
    BOOL v10 = +[NTKBundleComplicationManager sharedManager];
    BOOL v8 = [v10 dataSourceClassForBundleComplication:v9 withFamily:a4 andDevice:v7 factorInMigration:1] != 0;
  }
  return v8;
}

+ (Class)dataSourceFromComplication:(id)a3 family:(int64_t)a4 forDevice:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if ([v7 complicationType])
  {
    v9 = +[NTKBundleComplicationManager sharedManager];
    BOOL v10 = [v9 dataSourceClassForBundleComplication:v7 withFamily:a4 andDevice:v8 factorInMigration:1];
  }
  else
  {
    BOOL v10 = 0;
  }

  return (Class)v10;
}

+ (Class)complicationDataSourceClassForComplication:(id)a3 family:(int64_t)a4 device:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  BOOL v10 = +[NTKBundleComplicationManager sharedManager];
  v11 = (void *)[v10 dataSourceClassForBundleComplication:v8 withFamily:a4 andDevice:v9 factorInMigration:1];

  if (v11)
  {
    id v12 = v11;
  }
  else
  {
    v15.receiver = a1;
    v15.super_class = (Class)&OBJC_METACLASS___NTKLocalBundleTimelineComplicationController;
    objc_msgSendSuper2(&v15, sel_complicationDataSourceClassForComplication_family_device_, v8, a4, v9);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = v12;

  return (Class)v13;
}

+ (BOOL)_acceptsComplicationType:(unint64_t)a3 forDevice:(id)a4
{
  return 0;
}

@end