BOOL sub_34D0(id a1, NSURL *a2, NSError *a3)
{
  return 1;
}

ABAddressBookRef ABAddressBookCreateWithOptions(CFDictionaryRef options, CFErrorRef *error)
{
  return _ABAddressBookCreateWithOptions(options, error);
}

CFIndex ABAddressBookGetPersonCount(ABAddressBookRef addressBook)
{
  return _ABAddressBookGetPersonCount(addressBook);
}

void CFRelease(CFTypeRef cf)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_populateUsageBundleApps(void *a1, const char *a2, ...)
{
  return [a1 populateUsageBundleApps];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}

id objc_msgSend_usageBundleAppForBundleWithIdentifier_withTotalSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "usageBundleAppForBundleWithIdentifier:withTotalSize:");
}
asedReturnValue();

        v27 = 0u;
        v28 = 0u;
        v25 = 0u;
        v26 = 0u;
        v9 = v8;
        v10 = [v9 countByEnumeratingWithState:&v25 objects:v31 count:16];
        if (v10)
        {
          v11 = v10;
          v12 = *(void *)v26;
          do
          {
            for (i = 0; i != v11; i = (char *)i + 1)
            {
              if (*(void *)v26 != v12) {
                objc_enumerationMutation(v9);
              }
              v14 = *(void **)(*((void *)&v25 + 1) + 8 * i);
              v24 = 0;
              if ([v14 getResourceValue:&v24 forKey:NSURLFileSizeKey error:0])
              {
                v15 = v24;
                self->_totalSize += (unint64_t)[v15 unsignedLongLongValue];
              }
            }
            v11 = [v9 countByEnumeratingWithState:&v25 objects:v31 count:16];
          }
          while (v11);
        }
      }
    }
    CFRelease(v3);
    *(float *)&v16 = (float)self->_totalSize;
    v17 = +[PSUsageBundleApp usageBundleAppForBundleWithIdentifier:@"com.apple.MobileAddressBook" withTotalSize:v16];
    v18 = +[NSBundle bundleForClass:objc_opt_class()];
    v19 = [v18 localizedStringForKey:@"Contacts & Images" value:&stru_4190 table:@"Contacts"];
    v20 = +[PSUsageBundleCategory categoryNamed:v19 withIdentifier:@"/var/mobile/Library/AddressBook/" forUsageBundleApp:v17];

    v30 = v20;
    v21 = +[NSArray arrayWithObjects:&v30 count:1];
    [v17 setCategories:v21];

    v22 = (NSArray *)objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", v17, 0);
    cachedBundleApps = self->_cachedBundleApps;
    self->_cachedBundleApps = v22;
  }
}

- (id)usageBundleApps
{
  cachedBundleApps = self->_cachedBundleApps;
  if (!cachedBundleApps)
  {
    [(ContactsUsage *)self populateUsageBundleApps];
    cachedBundleApps = self->_cachedBundleApps;
  }

  return cachedBundleApps;
}

- (float)sizeForCategory:(id)a3
{
  v3 = +[NSNumber numberWithUnsignedLongLong:self->_totalSize];
  [v3 floatValue];
  float v5 = v4;

  return v5;
}

- (BOOL)allowDeletionForCategory:(id)a3
{
  return 0;
}

- (void).cxx_destruct
{
}

@end