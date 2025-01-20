@interface MPSectionedCollection
- (id)filteredWithSections:(id)a3;
@end

@implementation MPSectionedCollection

- (id)filteredWithSections:(id)a3
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000AD4B4;
  v8[3] = &unk_100FC4000;
  id v9 = a3;
  id v10 = (id)objc_opt_new();
  v11 = self;
  id v4 = v10;
  id v5 = v9;
  [(MPSectionedCollection *)self enumerateSectionsUsingBlock:v8];
  id v6 = [v4 copy];

  return v6;
}

@end