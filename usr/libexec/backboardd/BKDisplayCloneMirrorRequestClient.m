@interface BKDisplayCloneMirrorRequestClient
- (NSString)description;
- (void)appendDescriptionToFormatter:(id)a3;
@end

@implementation BKDisplayCloneMirrorRequestClient

- (void).cxx_destruct
{
}

- (void)appendDescriptionToFormatter:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100049C20;
  v4[3] = &unk_1000F8E50;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  [v3 appendProem:0 block:v4];
}

- (NSString)description
{
  return (NSString *)+[BSDescriptionStream descriptionForRootObject:self];
}

@end