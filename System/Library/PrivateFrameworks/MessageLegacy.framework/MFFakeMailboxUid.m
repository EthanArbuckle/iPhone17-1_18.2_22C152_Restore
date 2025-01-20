@interface MFFakeMailboxUid
- (BOOL)fakeIsSpecialMailboxUid;
- (BOOL)isStore;
- (MFFakeMailboxUid)initWithAccount:(id)a3 URLString:(id)a4 fullPath:(id)a5;
- (MFFakeMailboxUid)initWithAccount:(id)a3 URLString:(id)a4 fullPath:(id)a5 isSpecial:(BOOL)a6;
- (NSString)displayName;
- (NSString)fakeFullPath;
- (NSString)fakeURLString;
- (id)store;
- (void)setDisplayName:(id)a3;
- (void)setFakeFullPath:(id)a3;
- (void)setFakeIsSpecialMailboxUid:(BOOL)a3;
- (void)setFakeURLString:(id)a3;
@end

@implementation MFFakeMailboxUid

- (MFFakeMailboxUid)initWithAccount:(id)a3 URLString:(id)a4 fullPath:(id)a5
{
  return [(MFFakeMailboxUid *)self initWithAccount:a3 URLString:a4 fullPath:a5 isSpecial:0];
}

- (MFFakeMailboxUid)initWithAccount:(id)a3 URLString:(id)a4 fullPath:(id)a5 isSpecial:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MFFakeMailboxUid;
  v12 = [(MFMailboxUid *)&v15 initWithAccount:a3];
  v13 = v12;
  if (v12)
  {
    [(MFFakeMailboxUid *)v12 setFakeURLString:v10];
    [(MFFakeMailboxUid *)v13 setFakeFullPath:v11];
    [(MFFakeMailboxUid *)v13 setFakeIsSpecialMailboxUid:v6];
  }

  return v13;
}

- (BOOL)isStore
{
  return 1;
}

- (id)store
{
  return 0;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (NSString)fakeFullPath
{
  return self->_fakeFullPath;
}

- (void)setFakeFullPath:(id)a3
{
}

- (NSString)fakeURLString
{
  return self->_fakeURLString;
}

- (void)setFakeURLString:(id)a3
{
}

- (BOOL)fakeIsSpecialMailboxUid
{
  return self->_fakeIsSpecialMailboxUid;
}

- (void)setFakeIsSpecialMailboxUid:(BOOL)a3
{
  self->_fakeIsSpecialMailboxUid = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fakeURLString, 0);
  objc_storeStrong((id *)&self->_fakeFullPath, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

@end