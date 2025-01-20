@interface SBHFakeApplicationPlaceholder
- (NSString)applicationBundleIdentifier;
- (NSString)applicationDisplayName;
- (double)progress;
- (id)icon:(id)a3 imageWithInfo:(SBIconImageInfo *)a4;
- (id)icon:(id)a3 imageWithInfo:(SBIconImageInfo *)a4 traitCollection:(id)a5 options:(unint64_t)a6;
- (int64_t)progressStateForIcon:(id)a3;
- (unint64_t)priorityForIcon:(id)a3;
- (void)setApplicationBundleIdentifier:(id)a3;
- (void)setApplicationDisplayName:(id)a3;
- (void)setProgress:(double)a3;
@end

@implementation SBHFakeApplicationPlaceholder

- (void)setProgress:(double)a3
{
  self->_progress = a3;
  objc_msgSend(MEMORY[0x1E4F28EB8], "sbh_leafIconDataSourceNotificationCenter");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 postNotificationName:@"SBLeafIconDataSourceDidChangeNotification" object:self];
}

- (id)icon:(id)a3 imageWithInfo:(SBIconImageInfo *)a4
{
  double v7 = v6;
  double v8 = v5;
  double v9 = v4;
  v10 = [(SBHFakeApplicationPlaceholder *)self applicationBundleIdentifier];
  v11 = SBHGetApplicationIconImage(v10, 0, v9, v8, v7);

  return v11;
}

- (id)icon:(id)a3 imageWithInfo:(SBIconImageInfo *)a4 traitCollection:(id)a5 options:(unint64_t)a6
{
  int v9 = (int)a5;
  double v10 = v8;
  double v11 = v7;
  double v12 = v6;
  v14 = a4;
  LOBYTE(v9) = SBHIconServicesOptionsForImageOptions(v9);
  v15 = [(SBHFakeApplicationPlaceholder *)self applicationBundleIdentifier];
  v16 = SBHGetApplicationIconImageWithTraitCollection(v15, (uint64_t)v14, v9, v12, v11, v10);

  return v16;
}

- (unint64_t)priorityForIcon:(id)a3
{
  return 2;
}

- (int64_t)progressStateForIcon:(id)a3
{
  return 2;
}

- (NSString)applicationBundleIdentifier
{
  return self->_applicationBundleIdentifier;
}

- (void)setApplicationBundleIdentifier:(id)a3
{
}

- (NSString)applicationDisplayName
{
  return self->_applicationDisplayName;
}

- (void)setApplicationDisplayName:(id)a3
{
}

- (double)progress
{
  return self->_progress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationDisplayName, 0);
  objc_storeStrong((id *)&self->_applicationBundleIdentifier, 0);
}

@end