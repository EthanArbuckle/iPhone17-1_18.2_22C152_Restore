@interface ICFixPasswordProtectedNotesInSharedFoldersLaunchTask
- (NSPredicate)passwordProtectedNoteInSharedFolderPredicate;
- (NSSet)movedNoteObjectIDs;
- (id)fetchPasswordProtectedNotesInSharedFolders;
- (void)runLaunchTask;
- (void)setMovedNoteObjectIDs:(id)a3;
- (void)setPasswordProtectedNoteInSharedFolderPredicate:(id)a3;
@end

@implementation ICFixPasswordProtectedNotesInSharedFoldersLaunchTask

- (void)runLaunchTask
{
  v3 = [(ICWorkerContextLaunchTask *)self workerContext];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100073024;
  v4[3] = &unk_100625AF0;
  v4[4] = self;
  [v3 performBlockAndWait:v4];
}

- (id)fetchPasswordProtectedNotesInSharedFolders
{
  v3 = [(ICFixPasswordProtectedNotesInSharedFoldersLaunchTask *)self passwordProtectedNoteInSharedFolderPredicate];
  v4 = [(ICWorkerContextLaunchTask *)self workerContext];
  v5 = +[ICNote ic_objectsMatchingPredicate:v3 context:v4];

  return v5;
}

- (NSPredicate)passwordProtectedNoteInSharedFolderPredicate
{
  v2 = +[ICCloudSyncingObject predicateForPasswordProtectedObjects];
  v3 = +[NSPredicate predicateWithFormat:@"folder.serverShareData != nil"];
  v7[0] = v2;
  v7[1] = v3;
  v4 = +[NSArray arrayWithObjects:v7 count:2];
  v5 = +[NSCompoundPredicate andPredicateWithSubpredicates:v4];

  return (NSPredicate *)v5;
}

- (NSSet)movedNoteObjectIDs
{
  return self->_movedNoteObjectIDs;
}

- (void)setMovedNoteObjectIDs:(id)a3
{
}

- (void)setPasswordProtectedNoteInSharedFolderPredicate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passwordProtectedNoteInSharedFolderPredicate, 0);

  objc_storeStrong((id *)&self->_movedNoteObjectIDs, 0);
}

@end