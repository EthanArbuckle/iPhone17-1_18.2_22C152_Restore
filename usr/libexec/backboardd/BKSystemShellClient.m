@interface BKSystemShellClient
- (NSString)debugDescription;
- (NSString)description;
- (void)appendDescriptionToStream:(id)a3;
@end

@implementation BKSystemShellClient

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectDate, 0);
  objc_storeStrong((id *)&self->_connection, 0);

  objc_storeStrong((id *)&self->_descriptor, 0);
}

- (void)appendDescriptionToStream:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 hasSuccinctStyle];
  char v6 = v5;
  if (v5) {
    v7 = 0;
  }
  else {
    v7 = self;
  }
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10007C204;
  v12[3] = &unk_1000F8E50;
  id v8 = v4;
  id v13 = v8;
  v14 = self;
  [v8 appendProem:v7 block:v12];
  if ((v6 & 1) == 0)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10007C234;
    v9[3] = &unk_1000F8E50;
    id v10 = v8;
    v11 = self;
    [v10 appendBodySectionWithName:0 block:v9];
  }
}

- (NSString)debugDescription
{
  v3 = +[BSDescriptionStyle debugStyle];
  id v4 = +[BSDescriptionStream descriptionForRootObject:self withStyle:v3];

  return (NSString *)v4;
}

- (NSString)description
{
  return (NSString *)+[BSDescriptionStream descriptionForRootObject:self];
}

@end