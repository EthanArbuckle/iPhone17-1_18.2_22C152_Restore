@interface ICHashtag
+ (void)undoablyMarkForDeletion:(BOOL)a3 standardizedContent:(id)a4 account:(id)a5;
@end

@implementation ICHashtag

+ (void)undoablyMarkForDeletion:(BOOL)a3 standardizedContent:(id)a4 account:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = +[NSUndoManager shared];
  v11 = [v10 prepareWithInvocationTarget:a1];
  [v11 undoablyMarkForDeletion:!v6 standardizedContent:v8 account:v9];

  [v9 managedObjectContext];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10011C408;
  v15[3] = &unk_100625B68;
  id v16 = v8;
  id v17 = v9;
  BOOL v19 = v6;
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  id v12 = v18;
  id v13 = v9;
  id v14 = v8;
  [v12 performBlockAndWait:v15];
}

@end