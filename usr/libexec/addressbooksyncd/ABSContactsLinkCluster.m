@interface ABSContactsLinkCluster
+ (id)null;
- (ABSContactsLinkCluster)initWithContact:(id)a3;
- (ABSContactsLinkCluster)initWithContact_LOCKED:(id)a3;
- (ABSContactsLinkCluster)initWithIdentifier:(id)a3;
- (ABSContactsLinkCluster)initWithIdentifier_LOCKED:(id)a3;
- (ABSContactsLinkCluster)initWithPBStuff:(id)a3 contact:(id)a4;
- (BOOL)haveAllContacts_LOCKED;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToABSContactsLinkCluster:(id)a3;
- (BOOL)isNull;
- (NSMutableDictionary)clusterDictionary;
- (id)description;
- (void)enumerateContacts_LOCKED:(id)a3;
@end

@implementation ABSContactsLinkCluster

- (ABSContactsLinkCluster)initWithPBStuff:(id)a3 contact:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v40.receiver = self;
  v40.super_class = (Class)ABSContactsLinkCluster;
  v8 = [(ABSContactsLinkCluster *)&v40 init];
  if (!v8)
  {
LABEL_23:
    v28 = v8;
    goto LABEL_24;
  }
  v9 = (NSMutableDictionary *)[objc_alloc((Class)NSMutableDictionary) initWithCapacity:[v6 count]];
  cluster = v8->_cluster;
  v8->_cluster = v9;

  if (v6 && [v6 count])
  {
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v11 = v6;
    id v12 = [v11 countByEnumeratingWithState:&v36 objects:v41 count:16];
    if (v12)
    {
      id v13 = v12;
      id v34 = v7;
      id v35 = v6;
      char v14 = 0;
      char v15 = 0;
      uint64_t v16 = *(void *)v37;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v37 != v16) {
            objc_enumerationMutation(v11);
          }
          v18 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          unsigned int v19 = [v18 isImage:v34 v35:v36];
          v14 |= v19;
          uint64_t v20 = v19;
          unsigned int v21 = [v18 isName];
          v15 |= v21;
          if (v21) {
            uint64_t v22 = v20 | 2;
          }
          else {
            uint64_t v22 = v20;
          }
          v23 = +[NSNumber numberWithInteger:v22];
          v24 = v8->_cluster;
          v25 = [v18 toGuid];
          [(NSMutableDictionary *)v24 setObject:v23 forKeyedSubscript:v25];
        }
        id v13 = [v11 countByEnumeratingWithState:&v36 objects:v41 count:16];
      }
      while (v13);

      uint64_t v26 = 2;
      if ((v14 & 1) == 0) {
        uint64_t v26 = 3;
      }
      if (v15) {
        uint64_t v27 = (v14 & 1) == 0;
      }
      else {
        uint64_t v27 = v26;
      }
      id v7 = v34;
      id v6 = v35;
    }
    else
    {

      uint64_t v27 = 3;
    }
    v29 = +[NSNumber numberWithInteger:v27];
    v30 = v8->_cluster;
    v31 = [v7 identifier];
    [(NSMutableDictionary *)v30 setObject:v29 forKeyedSubscript:v31];

    goto LABEL_23;
  }
  v28 = [(id)objc_opt_class() null];
LABEL_24:
  v32 = v28;

  return v32;
}

- (ABSContactsLinkCluster)initWithContact:(id)a3
{
  id v4 = a3;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  unsigned int v19 = sub_100022FA4;
  uint64_t v20 = sub_100022FB4;
  id v21 = 0;
  v5 = +[ABSContactsInterface sharedInstance];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100022FBC;
  v12[3] = &unk_100055568;
  char v15 = &v16;
  id v6 = self;
  id v13 = v6;
  id v7 = v4;
  id v14 = v7;
  [v5 accessSync:v12];

  id v8 = (id)v17[5];
  v9 = v14;
  v10 = (ABSContactsLinkCluster *)v8;

  _Block_object_dispose(&v16, 8);
  return v10;
}

- (ABSContactsLinkCluster)initWithContact_LOCKED:(id)a3
{
  id v4 = [a3 identifier];
  v5 = [(ABSContactsLinkCluster *)self initWithIdentifier_LOCKED:v4];

  return v5;
}

- (ABSContactsLinkCluster)initWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  unsigned int v19 = sub_100022FA4;
  uint64_t v20 = sub_100022FB4;
  id v21 = 0;
  v5 = +[ABSContactsInterface sharedInstance];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000231B0;
  v12[3] = &unk_100055568;
  char v15 = &v16;
  id v6 = self;
  id v13 = v6;
  id v7 = v4;
  id v14 = v7;
  [v5 accessSync:v12];

  id v8 = (id)v17[5];
  v9 = v14;
  v10 = (ABSContactsLinkCluster *)v8;

  _Block_object_dispose(&v16, 8);
  return v10;
}

- (ABSContactsLinkCluster)initWithIdentifier_LOCKED:(id)a3
{
  id v22 = a3;
  v36.receiver = self;
  v36.super_class = (Class)ABSContactsLinkCluster;
  id v4 = [(ABSContactsLinkCluster *)&v36 init];
  if (v4)
  {
    uint64_t v30 = 0;
    v31 = &v30;
    uint64_t v32 = 0x3032000000;
    v33 = sub_100022FA4;
    id v34 = sub_100022FB4;
    id v35 = 0;
    v5 = +[ABSContactsInterface sharedInstance];
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_1000234E4;
    v27[3] = &unk_1000555D8;
    id v28 = v22;
    v29 = &v30;
    [v5 accessAssert:v27];

    id v6 = objc_alloc((Class)NSMutableDictionary);
    id v7 = (NSMutableDictionary *)[v6 initWithCapacity:[v31[5] count]];
    cluster = v4->_cluster;
    v4->_cluster = v7;

    v9 = (void *)v31[5];
    if (v9 && [v9 count])
    {
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v10 = (id)v31[5];
      id v11 = [v10 countByEnumeratingWithState:&v23 objects:v37 count:16];
      if (v11)
      {
        uint64_t v12 = *(void *)v24;
        do
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(void *)v24 != v12) {
              objc_enumerationMutation(v10);
            }
            id v14 = *(void **)(*((void *)&v23 + 1) + 8 * i);
            unsigned int v15 = [v14 isPreferredForName];
            unsigned int v16 = [v14 isPreferredForImage];
            if (v15) {
              uint64_t v17 = 2;
            }
            else {
              uint64_t v17 = 0;
            }
            uint64_t v18 = +[NSNumber numberWithInteger:v17 | v16];
            unsigned int v19 = v4->_cluster;
            uint64_t v20 = [v14 identifier];
            [(NSMutableDictionary *)v19 setObject:v18 forKeyedSubscript:v20];
          }
          id v11 = [v10 countByEnumeratingWithState:&v23 objects:v37 count:16];
        }
        while (v11);
      }
    }
    _Block_object_dispose(&v30, 8);
  }
  return v4;
}

- (BOOL)haveAllContacts_LOCKED
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  int v10 = 0;
  v3 = +[ABSContactsInterface sharedInstance];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100023814;
  v6[3] = &unk_1000555D8;
  v6[4] = self;
  v6[5] = &v7;
  [v3 accessAssert:v6];

  id v4 = (id)*((int *)v8 + 6);
  LOBYTE(self) = [(NSMutableDictionary *)self->_cluster count] == v4;
  _Block_object_dispose(&v7, 8);
  return (char)self;
}

- (void)enumerateContacts_LOCKED:(id)a3
{
  id v4 = a3;
  if (![(ABSContactsLinkCluster *)self isNull] && [(NSMutableDictionary *)self->_cluster count])
  {
    id v5 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableDictionary count](self->_cluster, "count")];
    id v6 = +[ABSContactsInterface sharedInstance];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100023AB4;
    v8[3] = &unk_100055628;
    v8[4] = self;
    id v9 = v5;
    id v10 = v4;
    id v7 = v5;
    [v6 accessAssert:v8];
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    BOOL v5 = [(ABSContactsLinkCluster *)self isEqualToABSContactsLinkCluster:v4];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)isEqualToABSContactsLinkCluster:(id)a3
{
  return [(NSMutableDictionary *)self->_cluster isEqualToDictionary:*((void *)a3 + 1)];
}

- (NSMutableDictionary)clusterDictionary
{
  id v2 = [(NSMutableDictionary *)self->_cluster copy];

  return (NSMutableDictionary *)v2;
}

+ (id)null
{
  if (qword_100069CF8 != -1) {
    dispatch_once(&qword_100069CF8, &stru_100055648);
  }
  id v2 = (void *)qword_100069D00;

  return v2;
}

- (BOOL)isNull
{
  v3 = [(id)objc_opt_class() null];
  LOBYTE(self) = v3 == self;

  return (char)self;
}

- (id)description
{
  if ([(ABSContactsLinkCluster *)self isNull])
  {
    v3 = @"<ABSContactsLinkClusterNullInstance>";
  }
  else
  {
    v3 = +[NSString stringWithFormat:@"<ABSContactsLinkCluster: %p %@>", self, self->_cluster];
  }

  return v3;
}

- (void).cxx_destruct
{
}

@end