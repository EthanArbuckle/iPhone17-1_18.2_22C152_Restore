@interface ICInvitation
+ (NSArray)writableTypeIdentifiersForItemProvider;
- (id)loadDataWithTypeIdentifier:(id)a3 forItemProviderCompletionHandler:(id)a4;
@end

@implementation ICInvitation

+ (NSArray)writableTypeIdentifiersForItemProvider
{
  v2 = [UTTypeURL identifier];
  v5 = v2;
  v3 = +[NSArray arrayWithObjects:&v5 count:1];

  return (NSArray *)v3;
}

- (id)loadDataWithTypeIdentifier:(id)a3 forItemProviderCompletionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [UTTypeURL identifier];
  unsigned int v9 = [v7 isEqual:v8];

  if (v9)
  {
    v10 = [(ICInvitation *)self managedObjectContext];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000ECB08;
    v12[3] = &unk_100625B40;
    v12[4] = self;
    id v13 = v6;
    [v10 performBlockAndWait:v12];
  }
  return 0;
}

@end