@interface MNDisplayETAInfo
- (void)enumerateLegsWithBlock:(id)a3;
@end

@implementation MNDisplayETAInfo

- (void)enumerateLegsWithBlock:(id)a3
{
  id v4 = a3;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  v10[3] = 0;
  v5 = [(MNDisplayETAInfo *)self legInfos];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1007E91E8;
  v7[3] = &unk_1012F9588;
  v9 = v10;
  id v6 = v4;
  id v8 = v6;
  [v5 enumerateObjectsUsingBlock:v7];

  _Block_object_dispose(v10, 8);
}

@end