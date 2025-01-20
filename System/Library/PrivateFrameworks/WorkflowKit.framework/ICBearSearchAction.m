@interface ICBearSearchAction
- (void)performActionWithInput:(id)a3 parameters:(id)a4 userInterface:(id)a5 successHandler:(id)a6 errorHandler:(id)a7;
@end

@implementation ICBearSearchAction

- (void)performActionWithInput:(id)a3 parameters:(id)a4 userInterface:(id)a5 successHandler:(id)a6 errorHandler:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  v17 = [v15 objectForKey:@"BearTag"];
  v18 = [v15 objectForKey:@"BearTerm"];
  v19 = (void *)[v15 mutableCopy];

  if ([v18 length])
  {
    v20 = @"search";
  }
  else
  {
    [v19 removeObjectForKey:@"BearTag"];
    if (v17) {
      [v19 setObject:v17 forKey:@"BearName"];
    }
    v20 = @"open-tag";
  }
  [v19 setObject:v20 forKey:@"BearAction"];
  v21.receiver = self;
  v21.super_class = (Class)ICBearSearchAction;
  [(ICSchemeAction *)&v21 performActionWithInput:v16 parameters:v19 userInterface:v14 successHandler:v13 errorHandler:v12];
}

@end