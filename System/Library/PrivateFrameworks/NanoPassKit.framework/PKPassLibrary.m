@interface PKPassLibrary
- (id)npkPassWithUniqueID:(id)a3;
- (id)npkPassesOfType:(unint64_t)a3;
- (void)npkSanitizePass:(id)a3;
@end

@implementation PKPassLibrary

- (void)npkSanitizePass:(id)a3
{
  id v3 = a3;
  v4 = [v3 embeddedLocationsArray];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10000B238;
  v13[3] = &unk_10006D060;
  id v5 = v3;
  id v14 = v5;
  [v4 enumerateObjectsUsingBlock:v13];
  [v5 setEmbeddedLocationsArray:v4];
  v6 = [v5 embeddedBeacons];
  v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  v10 = sub_10000B380;
  v11 = &unk_10006D088;
  id v12 = v5;
  id v7 = v5;
  [v6 enumerateObjectsUsingBlock:&v8];
  objc_msgSend(v7, "setEmbeddedBeacons:", v6, v8, v9, v10, v11);
}

- (id)npkPassWithUniqueID:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPassLibrary *)self passWithUniqueID:v4];
  id v6 = objc_alloc((Class)PKFileDataAccessor);
  id v7 = sub_10000B580(v4);

  id v8 = [v6 initWithFileURL:v7 error:0];
  [v5 setDataAccessor:v8];

  [(PKPassLibrary *)self npkSanitizePass:v5];
  return v5;
}

- (id)npkPassesOfType:(unint64_t)a3
{
  id v4 = [(PKPassLibrary *)self passesOfType:a3];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v10 = objc_alloc((Class)PKFileDataAccessor);
        v11 = [v9 uniqueID];
        id v12 = sub_10000B580(v11);
        id v13 = [v10 initWithFileURL:v12 error:0];
        [v9 setDataAccessor:v13];

        [(PKPassLibrary *)self npkSanitizePass:v9];
      }
      id v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }
  return v4;
}

@end