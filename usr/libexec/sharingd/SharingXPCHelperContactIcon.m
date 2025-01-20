@interface SharingXPCHelperContactIcon
+ (BOOL)supportsSecureCoding;
- (CNContact)contact;
- (SharingXPCHelperContactIcon)initWithCoder:(id)a3;
- (SharingXPCHelperContactIcon)initWithContact:(id)a3 icon:(CGImage *)a4 atIndex:(int64_t)a5 cacheLookupKey:(id)a6;
- (SharingXPCHelperContactIcon)initWithContact:(id)a3 iconData:(id)a4 atIndex:(int64_t)a5 cacheLookupKey:(id)a6;
- (id)contactIDs;
- (id)description;
- (int64_t)iconIndex;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SharingXPCHelperContactIcon

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SharingXPCHelperContactIcon)initWithContact:(id)a3 iconData:(id)a4 atIndex:(int64_t)a5 cacheLookupKey:(id)a6
{
  id v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SharingXPCHelperContactIcon;
  v12 = [(SharingXPCHelperImageItem *)&v15 initWithImageTitle:0 imageData:a4 cacheLookupKey:a6];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_contact, a3);
    v13->_iconIndex = a5;
  }

  return v13;
}

- (SharingXPCHelperContactIcon)initWithContact:(id)a3 icon:(CGImage *)a4 atIndex:(int64_t)a5 cacheLookupKey:(id)a6
{
  id v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SharingXPCHelperContactIcon;
  v12 = [(SharingXPCHelperImageItem *)&v15 initWithImageTitle:0 image:a4 cacheLookupKey:a6];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_contact, a3);
    v13->_iconIndex = a5;
  }

  return v13;
}

- (SharingXPCHelperContactIcon)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SharingXPCHelperContactIcon;
  v5 = [(SharingXPCHelperImageItem *)&v8 initWithCoder:v4];
  if (v5)
  {
    objc_opt_class();
    NSDecodeObjectIfPresent();
    id v6 = v4;
    if ([v6 containsValueForKey:@"ici"]) {
      v5->_iconIndex = (int64_t)[v6 decodeIntegerForKey:@"ici"];
    }
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SharingXPCHelperContactIcon;
  [(SharingXPCHelperImageItem *)&v6 encodeWithCoder:v4];
  contact = self->_contact;
  if (contact) {
    [v4 encodeObject:contact forKey:@"cn"];
  }
  [v4 encodeInteger:self->_iconIndex forKey:@"ici"];
}

- (id)contactIDs
{
  v3 = [(SharingXPCHelperContactIcon *)self contact];

  if (!v3)
  {
    id v4 = sharingXPCHelperLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "monogramImagesForMultipleContacts called with nil contact, will use fallback.", v12, 2u);
    }
  }
  v5 = [(SharingXPCHelperContactIcon *)self contact];
  uint64_t v6 = [v5 identifier];
  v7 = (void *)v6;
  objc_super v8 = @"FALLBACK";
  if (v6) {
    objc_super v8 = (__CFString *)v6;
  }
  v9 = v8;

  v13 = v9;
  v10 = +[NSArray arrayWithObjects:&v13 count:1];

  return v10;
}

- (id)description
{
  v2 = [(SharingXPCHelperContactIcon *)self iconData];
  NSAppendPrintF();
  id v3 = 0;

  return v3;
}

- (CNContact)contact
{
  return self->_contact;
}

- (int64_t)iconIndex
{
  return self->_iconIndex;
}

- (void).cxx_destruct
{
}

@end