@interface BCCloudGlobalMetadataManager
+ (void)fetchMetadataBoolForKey:(id)a3 completion:(id)a4;
+ (void)fetchMetadataStringForKey:(id)a3 completion:(id)a4;
+ (void)updateMetadataBool:(BOOL)a3 forKey:(id)a4 completion:(id)a5;
+ (void)updateMetadataString:(id)a3 forKey:(id)a4 completion:(id)a5;
@end

@implementation BCCloudGlobalMetadataManager

+ (void)fetchMetadataBoolForKey:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = +[BDSCloudGlobalMetadataManager sharedManager];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_42C64;
  v9[3] = &unk_2C5590;
  id v10 = v5;
  id v8 = v5;
  [v7 metadataValueForKey:v6 completion:v9];
}

+ (void)fetchMetadataStringForKey:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[BDSCloudGlobalMetadataManager sharedManager];
  [v7 metadataValueForKey:v6 completion:v5];
}

+ (void)updateMetadataBool:(BOOL)a3 forKey:(id)a4 completion:(id)a5
{
  id v7 = @"N";
  if (a3) {
    id v7 = @"Y";
  }
  id v8 = v7;
  id v9 = a5;
  id v10 = a4;
  id v11 = +[BDSCloudGlobalMetadataManager sharedManager];
  [v11 setMetadataValue:v8 forKey:v10 completion:v9];
}

+ (void)updateMetadataString:(id)a3 forKey:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = +[BDSCloudGlobalMetadataManager sharedManager];
  [v10 setMetadataValue:v9 forKey:v8 completion:v7];
}

@end