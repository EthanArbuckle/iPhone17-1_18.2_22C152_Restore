@interface WFShortcutBookmarksDescriptor
+ (BOOL)supportsSecureCoding;
- (NSData)bookmarkData;
- (NSString)path;
- (WFShortcutBookmarksDescriptor)initWithCoder:(id)a3;
- (WFShortcutBookmarksDescriptor)initWithWorkflowID:(id)a3 path:(id)a4 bookmarkData:(id)a5;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFShortcutBookmarksDescriptor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_bookmarkData, 0);
}

- (NSString)path
{
  return self->_path;
}

- (NSData)bookmarkData
{
  return self->_bookmarkData;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)WFShortcutBookmarksDescriptor;
  id v4 = a3;
  [(WFShortcutBookmarksDescriptor *)&v7 encodeWithCoder:v4];
  v5 = [(WFShortcutBookmarksDescriptor *)self path];
  [v4 encodeObject:v5 forKey:@"path"];

  v6 = [(WFShortcutBookmarksDescriptor *)self bookmarkData];
  [v4 encodeObject:v6 forKey:@"bookmarkData"];
}

- (WFShortcutBookmarksDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WFShortcutBookmarksDescriptor;
  v5 = [(WFShortcutBookmarksDescriptor *)&v12 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"path"];
    path = v5->_path;
    v5->_path = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bookmarkData"];
    bookmarkData = v5->_bookmarkData;
    v5->_bookmarkData = (NSData *)v8;

    v10 = v5;
  }

  return v5;
}

- (WFShortcutBookmarksDescriptor)initWithWorkflowID:(id)a3 path:(id)a4 bookmarkData:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)WFShortcutBookmarksDescriptor;
  v11 = [(WFShortcutBookmarksDescriptor *)&v15 initWithIdentifier:a3 objectType:7];
  objc_super v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_path, a4);
    objc_storeStrong((id *)&v12->_bookmarkData, a5);
    v13 = v12;
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end