@interface NTKCFaceDetailDiffableDataSource
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
@end

@implementation NTKCFaceDetailDiffableDataSource

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  v5 = [(UITableViewDiffableDataSource *)self snapshot];
  uint64_t v6 = [v5 sectionIdentifiers];
  v7 = [(id)v6 objectAtIndexedSubscript:a4];

  v8 = objc_msgSend(v7, "ntk_identifier");
  LOBYTE(v6) = [v8 isEqual:@"com.apple.nanotimekit.off"];

  if (v6)
  {
    id v9 = 0;
  }
  else
  {
    v10 = objc_msgSend(v7, "ntk_localizedSectionName");
    if ([v10 length]) {
      id v9 = v10;
    }
    else {
      id v9 = 0;
    }
  }

  return v9;
}

@end