@interface HomeOutlineHiddenViewModel
+ (id)sharedViewModel;
- (BOOL)needsReloadFromPreviousViewModel:(id)a3;
- (UICollectionViewCellRegistration)cellRegistration;
@end

@implementation HomeOutlineHiddenViewModel

+ (id)sharedViewModel
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1008B5D0C;
  block[3] = &unk_1012E63F0;
  block[4] = a1;
  if (qword_10160FDF0 != -1) {
    dispatch_once(&qword_10160FDF0, block);
  }
  v2 = (void *)qword_10160FDE8;

  return v2;
}

- (UICollectionViewCellRegistration)cellRegistration
{
  return (UICollectionViewCellRegistration *)+[HomeOutlineHiddenCellRegistration sharedRegistration];
}

- (BOOL)needsReloadFromPreviousViewModel:(id)a3
{
  return 0;
}

@end