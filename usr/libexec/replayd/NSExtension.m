@interface NSExtension
+ (void)extensionsWithMatchingPointName:(id)a3 activationRule:(id)a4 completion:(id)a5;
+ (void)extensionsWithMatchingPointName:(id)a3 baseIdentifier:(id)a4 activationRule:(id)a5 unwantedActivationRule:(id)a6 completion:(id)a7;
+ (void)extensionsWithMatchingPointName:(id)a3 baseIdentifier:(id)a4 completion:(id)a5;
+ (void)extensionsWithMatchingPointName:(id)a3 baseIdentifier:(id)a4 unwantedActivationRule:(id)a5 completion:(id)a6;
+ (void)extensionsWithMatchingPointName:(id)a3 completion:(id)a4;
+ (void)extensionsWithMatchingPointName:(id)a3 unwantedActivationRule:(id)a4 completion:(id)a5;
- (int64_t)processMode;
@end

@implementation NSExtension

+ (void)extensionsWithMatchingPointName:(id)a3 baseIdentifier:(id)a4 activationRule:(id)a5 unwantedActivationRule:(id)a6 completion:(id)a7
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  id v15 = a3;
  v16 = +[NSMutableArray array];
  uint64_t v30 = NSExtensionPointName;
  id v31 = v15;
  v17 = +[NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
  id v18 = [v17 mutableCopy];

  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10001917C;
  v24[3] = &unk_1000855F8;
  id v25 = v11;
  id v26 = v12;
  id v27 = v13;
  id v28 = v16;
  id v29 = v14;
  id v19 = v14;
  id v20 = v16;
  id v21 = v13;
  id v22 = v12;
  id v23 = v11;
  +[NSExtension extensionsWithMatchingAttributes:v18 completion:v24];
}

+ (void)extensionsWithMatchingPointName:(id)a3 baseIdentifier:(id)a4 completion:(id)a5
{
}

+ (void)extensionsWithMatchingPointName:(id)a3 baseIdentifier:(id)a4 unwantedActivationRule:(id)a5 completion:(id)a6
{
}

+ (void)extensionsWithMatchingPointName:(id)a3 activationRule:(id)a4 completion:(id)a5
{
}

+ (void)extensionsWithMatchingPointName:(id)a3 unwantedActivationRule:(id)a4 completion:(id)a5
{
}

+ (void)extensionsWithMatchingPointName:(id)a3 completion:(id)a4
{
}

- (int64_t)processMode
{
  v2 = [(NSExtension *)self infoDictionary];
  v3 = [v2 objectForKeyedSubscript:@"NSExtension"];
  v4 = [v3 objectForKeyedSubscript:@"RPBroadcastProcessMode"];

  int64_t v5 = [v4 isEqualToString:@"RPBroadcastProcessModeSampleBuffer"];
  return v5;
}

@end