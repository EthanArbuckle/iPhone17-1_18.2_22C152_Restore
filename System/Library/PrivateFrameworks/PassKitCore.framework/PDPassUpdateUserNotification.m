@interface PDPassUpdateUserNotification
+ (BOOL)supportsCoalescing;
+ (BOOL)supportsSecureCoding;
- (BOOL)isValid;
- (NSArray)passDiffs;
- (PDPassUpdateUserNotification)initWithCoder:(id)a3;
- (PDPassUpdateUserNotification)initWithPassDiff:(id)a3;
- (PKDiff)primaryPassDiff;
- (id)notificationContentWithDataSource:(id)a3;
- (id)passUniqueIdentifier;
- (unint64_t)coalesceWithExistingUserNotification:(id)a3;
- (unint64_t)notificationType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PDPassUpdateUserNotification

- (PDPassUpdateUserNotification)initWithPassDiff:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = [v4 passUniqueID];
    v7 = [v5 passManifestHash];
    v8 = [v7 hexEncoding];
    v9 = +[NSString stringWithFormat:@"%@-diff %@", v6, v8];

    v14.receiver = self;
    v14.super_class = (Class)PDPassUpdateUserNotification;
    v10 = [(PDUserNotification *)&v14 initWithNotificationIdentifier:v9 forPassUniqueIdentifier:0];
    if (v10)
    {
      v15 = v5;
      uint64_t v11 = +[NSArray arrayWithObjects:&v15 count:1];
      passDiffs = v10->_passDiffs;
      v10->_passDiffs = (NSArray *)v11;
    }
  }
  else
  {

    v10 = 0;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDPassUpdateUserNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PDPassUpdateUserNotification;
  v5 = [(PDUserNotification *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    v7 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v6, objc_opt_class(), 0);
    uint64_t v8 = [v4 decodeObjectOfClasses:v7 forKey:@"passDiffs"];
    passDiffs = v5->_passDiffs;
    v5->_passDiffs = (NSArray *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PDPassUpdateUserNotification;
  id v4 = a3;
  [(PDUserNotification *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_passDiffs, @"passDiffs", v5.receiver, v5.super_class);
}

+ (BOOL)supportsCoalescing
{
  return 1;
}

- (unint64_t)notificationType
{
  return 3;
}

- (BOOL)isValid
{
  v2 = [(PDPassUpdateUserNotification *)self primaryPassDiff];
  BOOL v3 = (uint64_t)[v2 hunkCount] > 0;

  return v3;
}

- (unint64_t)coalesceWithExistingUserNotification:(id)a3
{
  id v4 = a3;
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x2020000000;
  uint64_t v38 = 0;
  if ([v4 notificationType] == (id)3)
  {
    objc_super v5 = [(PDPassUpdateUserNotification *)self passUniqueIdentifier];
    uint64_t v6 = [v4 passUniqueIdentifier];
    unsigned int v7 = [v5 isEqualToString:v6];

    if (v7)
    {
      uint64_t v8 = [(PDPassUpdateUserNotification *)self primaryPassDiff];
      id v9 = v4;
      v10 = [v9 passDiffs];
      id v11 = [v10 mutableCopy];

      v12 = +[NSMutableArray array];
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_10027EF60;
      v28[3] = &unk_100744120;
      v13 = (id *)v9;
      v29 = v13;
      v30 = self;
      id v14 = v11;
      id v31 = v14;
      v34 = &v35;
      id v15 = v8;
      id v32 = v15;
      id v16 = v12;
      id v33 = v16;
      [v15 enumerateHunks:v28];
      if (v36[3])
      {
        objc_storeStrong(v13 + 17, v11);
        v17 = [(PDUserNotification *)self date];
        [v13 setDate:v17];

        objc_msgSend(v13, "setReissueBannerOnUpdate:", -[PDUserNotification reissueBannerOnUpdate](self, "reissueBannerOnUpdate"));
        long long v26 = 0u;
        long long v27 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        id v18 = v16;
        id v19 = [v18 countByEnumeratingWithState:&v24 objects:v39 count:16];
        if (v19)
        {
          uint64_t v20 = *(void *)v25;
          do
          {
            v21 = 0;
            do
            {
              if (*(void *)v25 != v20) {
                objc_enumerationMutation(v18);
              }
              objc_msgSend(v15, "removeHunkForKey:", *(void *)(*((void *)&v24 + 1) + 8 * (void)v21), (void)v24);
              v21 = (char *)v21 + 1;
            }
            while (v19 != v21);
            id v19 = [v18 countByEnumeratingWithState:&v24 objects:v39 count:16];
          }
          while (v19);
        }

        if (![v15 hunkCount]) {
          v36[3] = 2;
        }
      }
    }
  }
  unint64_t v22 = v36[3];
  _Block_object_dispose(&v35, 8);

  return v22;
}

- (id)notificationContentWithDataSource:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)PDPassUpdateUserNotification;
  id v4 = a3;
  objc_super v5 = [(PDUserNotification *)&v15 notificationContentWithDataSource:v4];
  uint64_t v6 = [(PDPassUpdateUserNotification *)self passUniqueIdentifier];
  unsigned int v7 = [v4 passWithUniqueIdentifier:v6];

  uint64_t v8 = [(PDPassUpdateUserNotification *)self primaryPassDiff];
  id v9 = [v7 localizedDescriptionForDiff:v8];

  [v5 setBody:v9];
  if ([v7 style] == (id)4) {
    [v5 setInterruptionLevel:2];
  }
  [(PDUserNotification *)self allowPresentationOverPass];
  id v10 = objc_alloc_init((Class)NSURLComponents);
  [v10 setScheme:@"shoebox"];
  [v10 setHost:PKUserNotificationActionRoutePassUpdate];
  id v11 = [(PDUserNotification *)self notificationIdentifier];
  v12 = +[NSString stringWithFormat:@"/%@", v11];
  [v10 setPath:v12];

  v13 = [v10 URL];
  [v5 setDefaultActionURL:v13];

  return v5;
}

- (PKDiff)primaryPassDiff
{
  return (PKDiff *)[(NSArray *)self->_passDiffs lastObject];
}

- (id)passUniqueIdentifier
{
  v2 = [(PDPassUpdateUserNotification *)self primaryPassDiff];
  BOOL v3 = [v2 passUniqueID];

  return v3;
}

- (NSArray)passDiffs
{
  return self->_passDiffs;
}

- (void).cxx_destruct
{
}

@end