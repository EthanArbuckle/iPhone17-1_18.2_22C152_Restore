@interface SharingXPCHelperGroupContactIcon
+ (BOOL)supportsSecureCoding;
- (NSArray)contacts;
- (SharingXPCHelperGroupContactIcon)initWithCoder:(id)a3;
- (SharingXPCHelperGroupContactIcon)initWithContacts:(id)a3 icon:(CGImage *)a4 atIndex:(int64_t)a5 cacheLookupKey:(id)a6;
- (SharingXPCHelperGroupContactIcon)initWithContacts:(id)a3 iconData:(id)a4 atIndex:(int64_t)a5 cacheLookupKey:(id)a6;
- (id)contactIDs;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SharingXPCHelperGroupContactIcon

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SharingXPCHelperGroupContactIcon)initWithContacts:(id)a3 iconData:(id)a4 atIndex:(int64_t)a5 cacheLookupKey:(id)a6
{
  id v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SharingXPCHelperGroupContactIcon;
  v12 = [(SharingXPCHelperContactIcon *)&v15 initWithContact:0 iconData:a4 atIndex:a5 cacheLookupKey:a6];
  v13 = v12;
  if (v12) {
    objc_storeStrong((id *)&v12->_contacts, a3);
  }

  return v13;
}

- (SharingXPCHelperGroupContactIcon)initWithContacts:(id)a3 icon:(CGImage *)a4 atIndex:(int64_t)a5 cacheLookupKey:(id)a6
{
  id v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SharingXPCHelperGroupContactIcon;
  v12 = [(SharingXPCHelperContactIcon *)&v15 initWithContact:0 icon:a4 atIndex:a5 cacheLookupKey:a6];
  v13 = v12;
  if (v12) {
    objc_storeStrong((id *)&v12->_contacts, a3);
  }

  return v13;
}

- (SharingXPCHelperGroupContactIcon)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SharingXPCHelperGroupContactIcon;
  v5 = [(SharingXPCHelperContactIcon *)&v7 initWithCoder:v4];
  if (v5)
  {
    objc_opt_class();
    NSDecodeNSArrayOfClassIfPresent();
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SharingXPCHelperGroupContactIcon;
  [(SharingXPCHelperContactIcon *)&v6 encodeWithCoder:v4];
  contacts = self->_contacts;
  if (contacts) {
    [v4 encodeObject:contacts forKey:@"SharingXPCHelperGroupContactIcon-Contacts"];
  }
}

- (id)contactIDs
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(SharingXPCHelperGroupContactIcon *)self contacts];
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) identifier];
        [v3 addObject:v9];
      }
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  v10 = [v3 sortedArrayUsingSelector:"compare:"];

  return v10;
}

- (id)description
{
  id v3 = [(SharingXPCHelperContactIcon *)self iconData];
  [(SharingXPCHelperContactIcon *)self iconIndex];
  NSAppendPrintF();
  id v4 = 0;

  return v4;
}

- (NSArray)contacts
{
  return self->_contacts;
}

- (void).cxx_destruct
{
}

@end