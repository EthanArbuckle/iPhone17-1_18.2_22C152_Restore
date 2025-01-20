@interface PLCoalitionDataObject
- (BOOL)isUIKitApp;
- (NSString)bundleID;
- (NSString)launchdName;
- (NSValue)coalStruct;
- (id)description;
- (unint64_t)coalitionID;
- (void)dealloc;
- (void)setBundleID:(id)a3;
- (void)setCoalStruct:(id)a3;
- (void)setCoalitionID:(unint64_t)a3;
- (void)setIsUIKitApp:(BOOL)a3;
- (void)setLaunchdName:(id)a3;
@end

@implementation PLCoalitionDataObject

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coalStruct, 0);
  objc_storeStrong((id *)&self->_launchdName, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

- (NSString)launchdName
{
  return self->_launchdName;
}

- (BOOL)isUIKitApp
{
  return self->_isUIKitApp;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setLaunchdName:(id)a3
{
  id v6 = a3;
  if ([v6 containsString:@"/"])
  {
    v4 = [v6 lastPathComponent];
  }
  else
  {
    v4 = (NSString *)v6;
  }
  launchdName = self->_launchdName;
  self->_launchdName = v4;
}

- (void)setIsUIKitApp:(BOOL)a3
{
  self->_isUIKitApp = a3;
}

- (void)setCoalitionID:(unint64_t)a3
{
  self->_coalitionID = a3;
}

- (void)setCoalStruct:(id)a3
{
}

- (void)setBundleID:(id)a3
{
}

- (void)dealloc
{
  v3 = [(PLCoalitionDataObject *)self coalStruct];

  if (v3)
  {
    v4 = [(PLCoalitionDataObject *)self coalStruct];
    v5 = (void *)[v4 pointerValue];

    if (v5) {
      free(v5);
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)PLCoalitionDataObject;
  [(PLCoalitionDataObject *)&v6 dealloc];
}

- (NSValue)coalStruct
{
  return (NSValue *)objc_getProperty(self, a2, 32, 1);
}

- (unint64_t)coalitionID
{
  return self->_coalitionID;
}

- (id)description
{
  v3 = NSString;
  unint64_t v4 = [(PLCoalitionDataObject *)self coalitionID];
  v5 = [(PLCoalitionDataObject *)self launchdName];
  objc_super v6 = [(PLCoalitionDataObject *)self bundleID];
  v7 = [v3 stringWithFormat:@"ID: %llu\nLaunchdName: %@\nBundleID: %@\n", v4, v5, v6];

  return v7;
}

@end