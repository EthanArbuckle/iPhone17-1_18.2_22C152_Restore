@interface MapsDropVCardReader
+ (NSArray)readableTypeIdentifiersForItemProvider;
+ (id)objectWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5;
- (NSArray)contacts;
@end

@implementation MapsDropVCardReader

+ (NSArray)readableTypeIdentifiersForItemProvider
{
  v2 = [UTTypeVCard identifier];
  v5 = v2;
  v3 = +[NSArray arrayWithObjects:&v5 count:1];

  return (NSArray *)v3;
}

+ (id)objectWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = [UTTypeVCard identifier];
  unsigned int v11 = [v9 isEqualToString:v10];

  if (v11)
  {
    id v18 = 0;
    v12 = +[CNContactVCardSerialization contactsWithData:v8 error:&v18];
    id v13 = v18;
    v14 = v13;
    if (v13)
    {
      v15 = 0;
      if (a5) {
        *a5 = v13;
      }
    }
    else
    {
      v16 = (id *)objc_alloc_init((Class)objc_opt_class());
      v15 = v16;
      if (a1) {
        objc_storeStrong(v16 + 1, v12);
      }
    }
  }
  else if (a5)
  {
    +[NSError errorWithDomain:NSCocoaErrorDomain code:3328 userInfo:0];
    v15 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (NSArray)contacts
{
  return self->_contacts;
}

- (void).cxx_destruct
{
}

@end