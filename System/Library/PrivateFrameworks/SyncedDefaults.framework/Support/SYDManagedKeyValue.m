@interface SYDManagedKeyValue
- (id)value;
- (void)setValue:(id)a3;
@end

@implementation SYDManagedKeyValue

- (id)value
{
  v3 = [(SYDManagedKeyValue *)self plistDataValue];

  if (v3)
  {
    v4 = [(SYDManagedKeyValue *)self plistDataValue];
    id v9 = 0;
    v5 = +[NSPropertyListSerialization propertyListWithData:v4 options:0 format:0 error:&v9];
    id v6 = v9;

    if (v6)
    {
      v7 = SYDGetCloudKitLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_100035F00((uint64_t)v6, v7);
      }
    }
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)setValue:(id)a3
{
  if (a3)
  {
    id v9 = 0;
    v4 = +[NSPropertyListSerialization dataWithPropertyList:a3 format:200 options:0 error:&v9];
    id v5 = v9;
    id v6 = v5;
    if (v4) {
      BOOL v7 = v5 == 0;
    }
    else {
      BOOL v7 = 0;
    }
    if (v7)
    {
      [(SYDManagedKeyValue *)self setPlistDataValue:v4];
    }
    else
    {
      v8 = SYDGetCoreDataLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_100035F78((uint64_t)v6, v8);
      }
    }
  }
  else
  {
    -[SYDManagedKeyValue setPlistDataValue:](self, "setPlistDataValue:");
  }
}

@end