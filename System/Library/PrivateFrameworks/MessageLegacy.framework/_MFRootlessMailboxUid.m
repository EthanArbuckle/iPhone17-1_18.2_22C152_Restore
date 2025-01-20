@interface _MFRootlessMailboxUid
- (id)displayName;
- (id)storeForMailboxUid:(id)a3;
- (id)tildeAbbreviatedPath;
@end

@implementation _MFRootlessMailboxUid

- (id)displayName
{
  v3 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
  id v4 = [(MFMailboxUid *)self name];
  return (id)[v3 displayNameAtPath:v4];
}

- (id)tildeAbbreviatedPath
{
  id v2 = [(MFMailboxUid *)self name];
  return (id)objc_msgSend(v2, "mf_stringByReallyAbbreviatingSharedResourcesDirectoryWithTildeInPath");
}

- (id)storeForMailboxUid:(id)a3
{
  return +[MFLibraryStore storeWithMailbox:a3];
}

@end