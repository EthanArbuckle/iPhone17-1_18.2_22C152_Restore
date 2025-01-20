@interface ICApplicationTestingHelper
+ (id)sharedHelper;
- (BOOL)launchPostTasksCompleted;
- (ICAccount)testAccount;
- (ICNoteContainer)testEnglishNotesListContainer;
- (ICNoteContainer)testNotesGridContainer;
- (ICNoteContainer)testNotesListContainer;
- (NSString)testNoteIdentifier;
- (id)_testAccountProxy;
- (void)didFinishPostLaunchTasks;
- (void)waitForPostLaunchTasksThenPerformBlock:(id)a3;
@end

@implementation ICApplicationTestingHelper

- (NSString)testNoteIdentifier
{
  v2 = +[ICAppGroupDefaults sharedAppGroupDefaults];
  v3 = [v2 objectForKey:@"PptTestNote"];

  return (NSString *)v3;
}

+ (id)sharedHelper
{
  if (qword_1006AA2B8 != -1) {
    dispatch_once(&qword_1006AA2B8, &stru_100629B68);
  }
  v2 = (void *)qword_1006AA2B0;

  return v2;
}

- (void)didFinishPostLaunchTasks
{
  self->_launchPostTasksCompleted = 1;
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 postNotificationName:@"NotesLaunchPostTasksCompleted" object:self];
}

- (void)waitForPostLaunchTasksThenPerformBlock:(id)a3
{
  id v4 = a3;
  if ([(ICApplicationTestingHelper *)self launchPostTasksCompleted])
  {
    dispatch_time_t v5 = dispatch_time(0, 3000000000);
    dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, v4);
  }
  else
  {
    v6 = +[NSNotificationCenter defaultCenter];
    v7 = +[NSOperationQueue mainQueue];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000EE8A0;
    v9[3] = &unk_100629B90;
    v9[4] = self;
    id v10 = v4;
    id v8 = [v6 addObserverForName:@"NotesLaunchPostTasksCompleted" object:0 queue:v7 usingBlock:v9];
  }
}

- (ICAccount)testAccount
{
  v2 = +[ICNoteContext sharedContext];
  id v3 = [v2 managedObjectContext];
  id v4 = +[ICAccount defaultAccountInContext:v3];

  if (!v4) {
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((testAccount) != nil)", "-[ICApplicationTestingHelper testAccount]", 1, 0, @"Expected non-nil value for '%s'", "testAccount");
  }

  return (ICAccount *)v4;
}

- (id)_testAccountProxy
{
  v2 = [(ICApplicationTestingHelper *)self testAccount];
  id v3 = [v2 accountProxy];
  if (!v3) {
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((allNotesContainer) != nil)", "-[ICApplicationTestingHelper _testAccountProxy]", 1, 0, @"Expected non-nil value for '%s'", "allNotesContainer");
  }

  return v2;
}

- (ICNoteContainer)testNotesListContainer
{
  return (ICNoteContainer *)[(ICApplicationTestingHelper *)self _testAccountProxy];
}

- (ICNoteContainer)testEnglishNotesListContainer
{
  v2 = [(ICApplicationTestingHelper *)self testAccount];
  id v3 = [v2 defaultFolder];

  return (ICNoteContainer *)v3;
}

- (ICNoteContainer)testNotesGridContainer
{
  return [(ICApplicationTestingHelper *)self testEnglishNotesListContainer];
}

- (BOOL)launchPostTasksCompleted
{
  return self->_launchPostTasksCompleted;
}

@end