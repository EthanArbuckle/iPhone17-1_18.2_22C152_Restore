@interface STConcreteContactStorePrimitives
- (id)numberOfContactsForOpaqueFamilyMember:(id)a3;
@end

@implementation STConcreteContactStorePrimitives

- (id)numberOfContactsForOpaqueFamilyMember:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v15 = +[NSAssertionHandler currentHandler];
    v16 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[STConcreteContactStorePrimitives numberOfContactsForOpaqueFamilyMember:]");
    v17 = (objc_class *)objc_opt_class();
    v18 = NSStringFromClass(v17);
    [v15 handleFailureInFunction:v16, @"STConcreteContactStorePrimitives.m", 30, @"expected FAFamilyMember got %@", v18 file lineNumber description];
  }
  id v4 = v3;
  v5 = +[STLog contactStorePrimitives];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    id v21 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Getting number of contacts for family member: %{private}@", buf, 0xCu);
  }

  v6 = +[CNContactStore storeForFamilyMember:v4];
  id v7 = [objc_alloc((Class)CNContactFetchRequest) initWithKeysToFetch:&__NSArray0__struct];
  id v19 = 0;
  v8 = [v6 contactCountForFetchRequest:v7 error:&v19];
  id v9 = v19;
  v10 = +[STLog contactStorePrimitives];
  v11 = v10;
  if (v8)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138477827;
      id v21 = v8;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Got number of contacts: %{private}@", buf, 0xCu);
    }

    uint64_t v12 = +[STResult success:v8];
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10025BE60((uint64_t)v9, v11);
    }

    uint64_t v12 = +[STResult failure:v9];
  }
  v13 = (void *)v12;

  return v13;
}

@end